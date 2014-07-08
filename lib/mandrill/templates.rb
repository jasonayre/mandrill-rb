module Mandrill
  class Templates
    attr_accessor :master

    def initialize(master)
      @master = master
    end

    # Add a new template
    # @param [String] name the name for the new template - must be unique
    # @param [String] from_email a default sending address for emails sent using this template
    # @param [String] from_name a default from name to be used
    # @param [String] subject a default subject line to be used
    # @param [String] code the HTML code for the template with mc:edit attributes for the editable elements
    # @param [String] text a default text part to be used when sending with this template
    # @param [Boolean] publish set to false to add a draft template without publishing
    # @param [Array] labels an optional array of up to 10 labels to use for filtering templates
    #     - [String] labels[] a single label
    # @return [Hash] the information saved about the new template
    #     - [String] slug the immutable unique code name of the template
    #     - [String] name the name of the template
    #     - [Array] labels the list of labels applied to the template
    #         - [String] labels[] a single label
    #     - [String] code the full HTML code of the template, with mc:edit attributes marking the editable elements - draft version
    #     - [String] subject the subject line of the template, if provided - draft version
    #     - [String] from_email the default sender address for the template, if provided - draft version
    #     - [String] from_name the default sender from name for the template, if provided - draft version
    #     - [String] text the default text part of messages sent with the template, if provided - draft version
    #     - [String] publish_name the same as the template name - kept as a separate field for backwards compatibility
    #     - [String] publish_code the full HTML code of the template, with mc:edit attributes marking the editable elements that are available as published, if it has been published
    #     - [String] publish_subject the subject line of the template, if provided
    #     - [String] publish_from_email the default sender address for the template, if provided
    #     - [String] publish_from_name the default sender from name for the template, if provided
    #     - [String] publish_text the default text part of messages sent with the template, if provided
    #     - [String] published_at the date and time the template was last published as a UTC string in YYYY-MM-DD HH:MM:SS format, or null if it has not been published
    #     - [String] created_at the date and time the template was first created as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [String] updated_at the date and time the template was last modified as a UTC string in YYYY-MM-DD HH:MM:SS format
    def add(name, from_email=nil, from_name=nil, subject=nil, code=nil, text=nil, publish=true, labels=[])
      _params = {:name => name, :from_email => from_email, :from_name => from_name, :subject => subject, :code => code, :text => text, :publish => publish, :labels => labels}
      return @master.call 'templates/add', _params
    end

    # Get the information for an existing template
    # @param [String] name the immutable name of an existing template
    # @return [Hash] the requested template information
    #     - [String] slug the immutable unique code name of the template
    #     - [String] name the name of the template
    #     - [Array] labels the list of labels applied to the template
    #         - [String] labels[] a single label
    #     - [String] code the full HTML code of the template, with mc:edit attributes marking the editable elements - draft version
    #     - [String] subject the subject line of the template, if provided - draft version
    #     - [String] from_email the default sender address for the template, if provided - draft version
    #     - [String] from_name the default sender from name for the template, if provided - draft version
    #     - [String] text the default text part of messages sent with the template, if provided - draft version
    #     - [String] publish_name the same as the template name - kept as a separate field for backwards compatibility
    #     - [String] publish_code the full HTML code of the template, with mc:edit attributes marking the editable elements that are available as published, if it has been published
    #     - [String] publish_subject the subject line of the template, if provided
    #     - [String] publish_from_email the default sender address for the template, if provided
    #     - [String] publish_from_name the default sender from name for the template, if provided
    #     - [String] publish_text the default text part of messages sent with the template, if provided
    #     - [String] published_at the date and time the template was last published as a UTC string in YYYY-MM-DD HH:MM:SS format, or null if it has not been published
    #     - [String] created_at the date and time the template was first created as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [String] updated_at the date and time the template was last modified as a UTC string in YYYY-MM-DD HH:MM:SS format
    def info(name)
      _params = {:name => name}
      return @master.call 'templates/info', _params
    end

    # Update the code for an existing template. If null is provided for any fields, the values will remain unchanged.
    # @param [String] name the immutable name of an existing template
    # @param [String] from_email the new default sending address
    # @param [String] from_name the new default from name
    # @param [String] subject the new default subject line
    # @param [String] code the new code for the template
    # @param [String] text the new default text part to be used
    # @param [Boolean] publish set to false to update the draft version of the template without publishing
    # @param [Array] labels an optional array of up to 10 labels to use for filtering templates
    #     - [String] labels[] a single label
    # @return [Hash] the template that was updated
    #     - [String] slug the immutable unique code name of the template
    #     - [String] name the name of the template
    #     - [Array] labels the list of labels applied to the template
    #         - [String] labels[] a single label
    #     - [String] code the full HTML code of the template, with mc:edit attributes marking the editable elements - draft version
    #     - [String] subject the subject line of the template, if provided - draft version
    #     - [String] from_email the default sender address for the template, if provided - draft version
    #     - [String] from_name the default sender from name for the template, if provided - draft version
    #     - [String] text the default text part of messages sent with the template, if provided - draft version
    #     - [String] publish_name the same as the template name - kept as a separate field for backwards compatibility
    #     - [String] publish_code the full HTML code of the template, with mc:edit attributes marking the editable elements that are available as published, if it has been published
    #     - [String] publish_subject the subject line of the template, if provided
    #     - [String] publish_from_email the default sender address for the template, if provided
    #     - [String] publish_from_name the default sender from name for the template, if provided
    #     - [String] publish_text the default text part of messages sent with the template, if provided
    #     - [String] published_at the date and time the template was last published as a UTC string in YYYY-MM-DD HH:MM:SS format, or null if it has not been published
    #     - [String] created_at the date and time the template was first created as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [String] updated_at the date and time the template was last modified as a UTC string in YYYY-MM-DD HH:MM:SS format
    def update(name, from_email=nil, from_name=nil, subject=nil, code=nil, text=nil, publish=true, labels=nil)
      _params = {:name => name, :from_email => from_email, :from_name => from_name, :subject => subject, :code => code, :text => text, :publish => publish, :labels => labels}
      return @master.call 'templates/update', _params
    end

    # Publish the content for the template. Any new messages sent using this template will start using the content that was previously in draft.
    # @param [String] name the immutable name of an existing template
    # @return [Hash] the template that was published
    #     - [String] slug the immutable unique code name of the template
    #     - [String] name the name of the template
    #     - [Array] labels the list of labels applied to the template
    #         - [String] labels[] a single label
    #     - [String] code the full HTML code of the template, with mc:edit attributes marking the editable elements - draft version
    #     - [String] subject the subject line of the template, if provided - draft version
    #     - [String] from_email the default sender address for the template, if provided - draft version
    #     - [String] from_name the default sender from name for the template, if provided - draft version
    #     - [String] text the default text part of messages sent with the template, if provided - draft version
    #     - [String] publish_name the same as the template name - kept as a separate field for backwards compatibility
    #     - [String] publish_code the full HTML code of the template, with mc:edit attributes marking the editable elements that are available as published, if it has been published
    #     - [String] publish_subject the subject line of the template, if provided
    #     - [String] publish_from_email the default sender address for the template, if provided
    #     - [String] publish_from_name the default sender from name for the template, if provided
    #     - [String] publish_text the default text part of messages sent with the template, if provided
    #     - [String] published_at the date and time the template was last published as a UTC string in YYYY-MM-DD HH:MM:SS format, or null if it has not been published
    #     - [String] created_at the date and time the template was first created as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [String] updated_at the date and time the template was last modified as a UTC string in YYYY-MM-DD HH:MM:SS format
    def publish(name)
      _params = {:name => name}
      return @master.call 'templates/publish', _params
    end

    # Delete a template
    # @param [String] name the immutable name of an existing template
    # @return [Hash] the template that was deleted
    #     - [String] slug the immutable unique code name of the template
    #     - [String] name the name of the template
    #     - [Array] labels the list of labels applied to the template
    #         - [String] labels[] a single label
    #     - [String] code the full HTML code of the template, with mc:edit attributes marking the editable elements - draft version
    #     - [String] subject the subject line of the template, if provided - draft version
    #     - [String] from_email the default sender address for the template, if provided - draft version
    #     - [String] from_name the default sender from name for the template, if provided - draft version
    #     - [String] text the default text part of messages sent with the template, if provided - draft version
    #     - [String] publish_name the same as the template name - kept as a separate field for backwards compatibility
    #     - [String] publish_code the full HTML code of the template, with mc:edit attributes marking the editable elements that are available as published, if it has been published
    #     - [String] publish_subject the subject line of the template, if provided
    #     - [String] publish_from_email the default sender address for the template, if provided
    #     - [String] publish_from_name the default sender from name for the template, if provided
    #     - [String] publish_text the default text part of messages sent with the template, if provided
    #     - [String] published_at the date and time the template was last published as a UTC string in YYYY-MM-DD HH:MM:SS format, or null if it has not been published
    #     - [String] created_at the date and time the template was first created as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [String] updated_at the date and time the template was last modified as a UTC string in YYYY-MM-DD HH:MM:SS format
    def delete(name)
      _params = {:name => name}
      return @master.call 'templates/delete', _params
    end

    # Return a list of all the templates available to this user
    # @param [String] label an optional label to filter the templates
    # @return [Array] an array of structs with information about each template
    #     - [Hash] return[] the information on each template in the account
    #         - [String] slug the immutable unique code name of the template
    #         - [String] name the name of the template
    #         - [Array] labels the list of labels applied to the template
    #             - [String] labels[] a single label
    #         - [String] code the full HTML code of the template, with mc:edit attributes marking the editable elements - draft version
    #         - [String] subject the subject line of the template, if provided - draft version
    #         - [String] from_email the default sender address for the template, if provided - draft version
    #         - [String] from_name the default sender from name for the template, if provided - draft version
    #         - [String] text the default text part of messages sent with the template, if provided - draft version
    #         - [String] publish_name the same as the template name - kept as a separate field for backwards compatibility
    #         - [String] publish_code the full HTML code of the template, with mc:edit attributes marking the editable elements that are available as published, if it has been published
    #         - [String] publish_subject the subject line of the template, if provided
    #         - [String] publish_from_email the default sender address for the template, if provided
    #         - [String] publish_from_name the default sender from name for the template, if provided
    #         - [String] publish_text the default text part of messages sent with the template, if provided
    #         - [String] published_at the date and time the template was last published as a UTC string in YYYY-MM-DD HH:MM:SS format, or null if it has not been published
    #         - [String] created_at the date and time the template was first created as a UTC string in YYYY-MM-DD HH:MM:SS format
    #         - [String] updated_at the date and time the template was last modified as a UTC string in YYYY-MM-DD HH:MM:SS format
    def list(label=nil)
      _params = {:label => label}
      return @master.call 'templates/list', _params
    end

    # Return the recent history (hourly stats for the last 30 days) for a template
    # @param [String] name the name of an existing template
    # @return [Array] the array of history information
    #     - [Hash] return[] the stats for a single hour
    #         - [String] time the hour as a UTC date string in YYYY-MM-DD HH:MM:SS format
    #         - [Integer] sent the number of emails that were sent during the hour
    #         - [Integer] hard_bounces the number of emails that hard bounced during the hour
    #         - [Integer] soft_bounces the number of emails that soft bounced during the hour
    #         - [Integer] rejects the number of emails that were rejected during the hour
    #         - [Integer] complaints the number of spam complaints received during the hour
    #         - [Integer] opens the number of emails opened during the hour
    #         - [Integer] unique_opens the number of unique opens generated by messages sent during the hour
    #         - [Integer] clicks the number of tracked URLs clicked during the hour
    #         - [Integer] unique_clicks the number of unique clicks generated by messages sent during the hour
    def time_series(name)
      _params = {:name => name}
      return @master.call 'templates/time-series', _params
    end

    # Inject content and optionally merge fields into a template, returning the HTML that results
    # @param [String] template_name the immutable name of a template that exists in the user's account
    # @param [Array] template_content an array of template content to render.  Each item in the array should be a struct with two keys - name: the name of the content block to set the content for, and content: the actual content to put into the block
    #     - [Hash] template_content[] the injection of a single piece of content into a single editable region
    #         - [String] name the name of the mc:edit editable region to inject into
    #         - [String] content the content to inject
    # @param [Array] merge_vars optional merge variables to use for injecting merge field content.  If this is not provided, no merge fields will be replaced.
    #     - [Hash] merge_vars[] a single merge variable
    #         - [String] name the merge variable's name. Merge variable names are case-insensitive and may not start with _
    #         - [String] content the merge variable's content
    # @return [Hash] the result of rendering the given template with the content and merge field values injected
    #     - [String] html the rendered HTML as a string
    def render(template_name, template_content, merge_vars=nil)
      _params = {:template_name => template_name, :template_content => template_content, :merge_vars => merge_vars}
      return @master.call 'templates/render', _params
    end

  end
end
