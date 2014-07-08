module Mandrill
  class Webhooks
    attr_accessor :master

    def initialize(master)
      @master = master
    end

    # Get the list of all webhooks defined on the account
    # @return [Array] the webhooks associated with the account
    #     - [Hash] return[] the individual webhook info
    #         - [Integer] id a unique integer indentifier for the webhook
    #         - [String] url The URL that the event data will be posted to
    #         - [String] description a description of the webhook
    #         - [String] auth_key the key used to requests for this webhook
    #         - [Array] events The message events that will be posted to the hook
    #             - [String] events[] the individual message event (send, hard_bounce, soft_bounce, open, click, spam, unsub, or reject)
    #         - [String] created_at the date and time that the webhook was created as a UTC string in YYYY-MM-DD HH:MM:SS format
    #         - [String] last_sent_at the date and time that the webhook last successfully received events as a UTC string in YYYY-MM-DD HH:MM:SS format
    #         - [Integer] batches_sent the number of event batches that have ever been sent to this webhook
    #         - [Integer] events_sent the total number of events that have ever been sent to this webhook
    #         - [String] last_error if we've ever gotten an error trying to post to this webhook, the last error that we've seen
    def list()
      _params = {}
      return @master.call 'webhooks/list', _params
    end

    # Add a new webhook
    # @param [String] url the URL to POST batches of events
    # @param [String] description an optional description of the webhook
    # @param [Array] events an optional list of events that will be posted to the webhook
    #     - [String] events[] the individual event to listen for
    # @return [Hash] the information saved about the new webhook
    #     - [Integer] id a unique integer indentifier for the webhook
    #     - [String] url The URL that the event data will be posted to
    #     - [String] description a description of the webhook
    #     - [String] auth_key the key used to requests for this webhook
    #     - [Array] events The message events that will be posted to the hook
    #         - [String] events[] the individual message event (send, hard_bounce, soft_bounce, open, click, spam, unsub, or reject)
    #     - [String] created_at the date and time that the webhook was created as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [String] last_sent_at the date and time that the webhook last successfully received events as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [Integer] batches_sent the number of event batches that have ever been sent to this webhook
    #     - [Integer] events_sent the total number of events that have ever been sent to this webhook
    #     - [String] last_error if we've ever gotten an error trying to post to this webhook, the last error that we've seen
    def add(url, description=nil, events=[])
      _params = {:url => url, :description => description, :events => events}
      return @master.call 'webhooks/add', _params
    end

    # Given the ID of an existing webhook, return the data about it
    # @param [Integer] id the unique identifier of a webhook belonging to this account
    # @return [Hash] the information about the webhook
    #     - [Integer] id a unique integer indentifier for the webhook
    #     - [String] url The URL that the event data will be posted to
    #     - [String] description a description of the webhook
    #     - [String] auth_key the key used to requests for this webhook
    #     - [Array] events The message events that will be posted to the hook
    #         - [String] events[] the individual message event (send, hard_bounce, soft_bounce, open, click, spam, unsub, or reject)
    #     - [String] created_at the date and time that the webhook was created as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [String] last_sent_at the date and time that the webhook last successfully received events as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [Integer] batches_sent the number of event batches that have ever been sent to this webhook
    #     - [Integer] events_sent the total number of events that have ever been sent to this webhook
    #     - [String] last_error if we've ever gotten an error trying to post to this webhook, the last error that we've seen
    def info(id)
      _params = {:id => id}
      return @master.call 'webhooks/info', _params
    end

    # Update an existing webhook
    # @param [Integer] id the unique identifier of a webhook belonging to this account
    # @param [String] url the URL to POST batches of events
    # @param [String] description an optional description of the webhook
    # @param [Array] events an optional list of events that will be posted to the webhook
    #     - [String] events[] the individual event to listen for
    # @return [Hash] the information for the updated webhook
    #     - [Integer] id a unique integer indentifier for the webhook
    #     - [String] url The URL that the event data will be posted to
    #     - [String] description a description of the webhook
    #     - [String] auth_key the key used to requests for this webhook
    #     - [Array] events The message events that will be posted to the hook
    #         - [String] events[] the individual message event (send, hard_bounce, soft_bounce, open, click, spam, unsub, or reject)
    #     - [String] created_at the date and time that the webhook was created as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [String] last_sent_at the date and time that the webhook last successfully received events as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [Integer] batches_sent the number of event batches that have ever been sent to this webhook
    #     - [Integer] events_sent the total number of events that have ever been sent to this webhook
    #     - [String] last_error if we've ever gotten an error trying to post to this webhook, the last error that we've seen
    def update(id, url, description=nil, events=[])
      _params = {:id => id, :url => url, :description => description, :events => events}
      return @master.call 'webhooks/update', _params
    end

    # Delete an existing webhook
    # @param [Integer] id the unique identifier of a webhook belonging to this account
    # @return [Hash] the information for the deleted webhook
    #     - [Integer] id a unique integer indentifier for the webhook
    #     - [String] url The URL that the event data will be posted to
    #     - [String] description a description of the webhook
    #     - [String] auth_key the key used to requests for this webhook
    #     - [Array] events The message events that will be posted to the hook
    #         - [String] events[] the individual message event (send, hard_bounce, soft_bounce, open, click, spam, unsub, or reject)
    #     - [String] created_at the date and time that the webhook was created as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [String] last_sent_at the date and time that the webhook last successfully received events as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [Integer] batches_sent the number of event batches that have ever been sent to this webhook
    #     - [Integer] events_sent the total number of events that have ever been sent to this webhook
    #     - [String] last_error if we've ever gotten an error trying to post to this webhook, the last error that we've seen
    def delete(id)
      _params = {:id => id}
      return @master.call 'webhooks/delete', _params
    end

  end
end
