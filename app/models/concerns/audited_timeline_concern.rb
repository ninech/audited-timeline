module AuditedTimelineConcern
  extend ActiveSupport::Concern

  def all_audits
    Audit.where(id: audit_ids + associated_audit_ids).reorder('created_at asc')
  end
end
