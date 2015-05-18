# Audited Timeline

This gem provides a frontend to the [audited](https://github.com/collectiveidea/audited) gem.

![Screenshot](https://raw.githubusercontent.com/ninech/audited-timeline/master/images/screenshot.png?token=AAHmGTc4OGjO-QUvWWENxW-aR7QQu0Q2ks5VYuTjwA%3D%3D)

## Setup

Add the gem to your `Gemfile` and run `bundle install`.

```ruby
gem 'audited-timeline'
```

## Usage

### Rendering the timeline

Render the `audited_timeline/list` partial and provide it the audits to be
rendered:

```erb
<%= render 'audited_timeline/list', audits: @my_object.audits %>
```

### Rendering associated audits

To ease rendering a timeline which includes associated audits, there is a
`AuditedTimeline::AuditedConcern`. Include it in your model along with `audited` and
`has_associated_audits`:

```ruby
class MyObject < ActiveRecord::Base
  include AuditedTimeline::AuditedConcern
  audited
  has_associated_audits
end
```

### Overriding an audit diff

It is possible to easily override an audit diff.

In development environment, each audit which has been rendered with the default
partial contains a HTML comment which points you to the partial you would have
to create.

```html
<div class="audited-timeline-body">
  <!-- create partial audits/lvm/volume.create to override this table -->
  <h1>Object</h1>
  <table class="diff">
   ...
  </table>
</div>
```

In this case, create in your application `app/views/audits/lvm/_volume.create.html.erb`
to override this audit type.

audited-timeline will provide a locale called `audit` to your partial.
