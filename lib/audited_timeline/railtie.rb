require 'audited_timeline/view_helpers'

module AuditedTimeline
  class Engine < Rails::Engine
    initializer 'audited_timeline.view_helpers' do
      ActionView::Base.send :include, ViewHelpers
    end

    initializer 'audited_timeline.add_view_paths', after: :add_view_paths do
      ActiveSupport.on_load(:action_controller) do
        append_view_path "#{Gem.loaded_specs['audited-timeline'].full_gem_path}/app/views"
      end
    end
  end
end
