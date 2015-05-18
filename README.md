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
<%= render 'audited_timeline/list', audits: @user.all_audits %>
```

### Add CSS Styles

Include `audited-timeline` in your `application.scss`:

```sass
@import "audited-timeline";
```

### Rendering associated audits

To ease rendering a timeline which includes associated audits, there is a
`AuditedTimeline::AuditedConcern`. Include it in your model along with `audited` and
`has_associated_audits`:

```ruby
class User < ActiveRecord::Base
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
  <!-- create partial audits/user.create to override this table -->
  <h1>User</h1>
  <table class="diff">
   ...
  </table>
</div>
```

In this case, create in your application `app/views/audits/_user.create.html.erb`
to override this audit type.

audited-timeline will provide a locale called `audit` to your partial.

### Readable object names

audited-timeline will simply call `#to_s` on your model name. To prevent having
`#<User:0x007fe2e8a25f58>` in your timeline, define `#to_s` on your `User`
model:

```ruby
class User < ActiveRecord::Base
  alias_attribute :to_s, :fullname
end
```
