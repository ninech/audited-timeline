module AuditedTimeline
  module ViewHelpers
    def audited_timeline_action_icon(audit)
      case audit.action
      when 'create'
        fa_icon 'plus-circle', class: 'action create'
      when 'update'
        fa_icon 'pencil', class: 'action update'
      when 'destroy'
        fa_icon 'trash-o', class: 'action destroy'
      end
    end

    def audited_timeline_gravatar_url(email)
      email_hash = Digest::MD5.hexdigest(email.to_s)
      "https://www.gravatar.com/avatar/#{email_hash}"
    end

    def audited_timeline_user_gravatar(user, options = {})
      options.reverse_merge! class: 'avatar', alt: user.to_s, size: '48x48'
      image_tag audited_timeline_gravatar_url(user.email), options
    end

    def audited_timeline_partial_for(audit)
      "audits/#{audit.auditable_type.underscore}.#{audit.action}"
    end
  end
end
