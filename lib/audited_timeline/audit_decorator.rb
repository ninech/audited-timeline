require 'draper'

module AuditedTimeline
  class AuditDecorator < ::Draper::Decorator
    delegate_all

    def human_audited_changes
      human_changes = {}
      audited_changes.each_pair do |field, value|
        value = [value].flatten
        if field.end_with?('_id')
          human_changes[field] = value.map { |v| object_name_by_field_and_value(field, v) }
        else
          human_changes[field] = value.map { |v| human_value(field, v) }
        end
      end
      human_changes
    end

    def audited_title
      [
        auditable_type.constantize.model_name.human,
        object_name_by_type_and_value(auditable_type, auditable_id)
      ].join(' ')
    end

    private

    def human_value(field, value)
      return I18n.t('audited_timeline.yes') if value == true
      return I18n.t('audited_timeline.no') if value == false
      if enum_values(field)
        return I18n.t("#{audited_class.table_name.singularize}.#{field}.#{enum_value(field, value)}")
      end
      value
    end

    def object_name_by_field_and_value(field, value)
      return nil unless value
      begin
        obj= associated_class_name(auditable_type, field).unscoped.find(value)
        "#{obj} (#{value})"
      rescue
        "unknown (#{value})"
      end
    end

    def object_name_by_type_and_value(type, value)
      return nil unless value
      begin
        type.constantize.unscoped.find(value)
      rescue
        nil
      end
    end

    def enum_value(field, value)
      if value.kind_of?(Integer)
        enum_values(field).key(value)
      else
        value
      end
    end

    def enum_values(field)
      audited_class.send(field.pluralize) if audited_class.respond_to?(field.pluralize)
    end

    def audited_class
      object.auditable.class
    end

    def associated_class_name(model, associated_field)
      association = associated_field.sub('_id', '').to_sym
      model.constantize.reflect_on_association(association).class_name.constantize
    end
  end
end
