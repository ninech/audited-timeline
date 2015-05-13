module AuditedTimeline
  class Audit < Audited.audit_class
    delegate :name, to: :user, allow_nil: true, prefix: true

    def auditable_class
      auditable_type.constantize
    end
  end
end
