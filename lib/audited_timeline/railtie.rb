require 'audited_timeline/view_helpers'

module AuditedTimeline
  class Railtie < Rails::Railtie
    initializer 'audited_timeline.view_helpers' do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end
