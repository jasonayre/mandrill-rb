module Mandrill
  class Rejects
    attr_accessor :master

    def initialize(master)
      @master = master
    end

    # Adds an email to your email rejection blacklist. Addresses that you add manually will never expire and there is no reputation penalty for removing them from your blacklist. Attempting to blacklist an address that has been whitelisted will have no effect.
    # @param [String] email an email address to block
    # @param [String] comment an optional comment describing the rejection
    # @param [String] subaccount an optional unique identifier for the subaccount to limit the blacklist entry
    # @return [Hash] a status object containing the address and the result of the operation
    #     - [String] email the email address you provided
    #     - [Boolean] added whether the operation succeeded
    def add(email, comment=nil, subaccount=nil)
      _params = {:email => email, :comment => comment, :subaccount => subaccount}
      return @master.call 'rejects/add', _params
    end

    # Retrieves your email rejection blacklist. You can provide an email address to limit the results. Returns up to 1000 results. By default, entries that have expired are excluded from the results; set include_expired to true to include them.
    # @param [String] email an optional email address to search by
    # @param [Boolean] include_expired whether to include rejections that have already expired.
    # @param [String] subaccount an optional unique identifier for the subaccount to limit the blacklist
    # @return [Array] Up to 1000 rejection entries
    #     - [Hash] return[] the information for each rejection blacklist entry
    #         - [String] email the email that is blocked
    #         - [String] reason the type of event (hard-bounce, soft-bounce, spam, unsub, custom) that caused this rejection
    #         - [String] detail extended details about the event, such as the SMTP diagnostic for bounces or the comment for manually-created rejections
    #         - [String] created_at when the email was added to the blacklist
    #         - [String] last_event_at the timestamp of the most recent event that either created or renewed this rejection
    #         - [String] expires_at when the blacklist entry will expire (this may be in the past)
    #         - [Boolean] expired whether the blacklist entry has expired
    #         - [Hash] sender the sender that this blacklist entry applies to, or null if none.
    #             - [String] address the sender's email address
    #             - [String] created_at the date and time that the sender was first seen by Mandrill as a UTC date string in YYYY-MM-DD HH:MM:SS format
    #             - [Integer] sent the total number of messages sent by this sender
    #             - [Integer] hard_bounces the total number of hard bounces by messages by this sender
    #             - [Integer] soft_bounces the total number of soft bounces by messages by this sender
    #             - [Integer] rejects the total number of rejected messages by this sender
    #             - [Integer] complaints the total number of spam complaints received for messages by this sender
    #             - [Integer] unsubs the total number of unsubscribe requests received for messages by this sender
    #             - [Integer] opens the total number of times messages by this sender have been opened
    #             - [Integer] clicks the total number of times tracked URLs in messages by this sender have been clicked
    #             - [Integer] unique_opens the number of unique opens for emails sent for this sender
    #             - [Integer] unique_clicks the number of unique clicks for emails sent for this sender
    #         - [String] subaccount the subaccount that this blacklist entry applies to, or null if none.
    def list(email=nil, include_expired=false, subaccount=nil)
      _params = {:email => email, :include_expired => include_expired, :subaccount => subaccount}
      return @master.call 'rejects/list', _params
    end

    # Deletes an email rejection. There is no limit to how many rejections you can remove from your blacklist, but keep in mind that each deletion has an affect on your reputation.
    # @param [String] email an email address
    # @param [String] subaccount an optional unique identifier for the subaccount to limit the blacklist deletion
    # @return [Hash] a status object containing the address and whether the deletion succeeded.
    #     - [String] email the email address that was removed from the blacklist
    #     - [Boolean] deleted whether the address was deleted successfully.
    #     - [String] subaccount the subaccount blacklist that the address was removed from, if any
    def delete(email, subaccount=nil)
      _params = {:email => email, :subaccount => subaccount}
      return @master.call 'rejects/delete', _params
    end

  end
end
