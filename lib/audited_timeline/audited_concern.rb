module AuditedTimeline
  module AuditedConcern
    extend ActiveSupport::Concern

    def all_audits
      AuditedTimeline::Audit.where(id: audit_ids + associated_audit_ids).reorder('created_at asc')
    end
  end
end
