module AuditedTimeline
  class Audit < Audited::Audit
    delegate :name, to: :user, allow_nil: true, prefix: true

    def auditable_class
      auditable_type.constantize
    end
  end
end
