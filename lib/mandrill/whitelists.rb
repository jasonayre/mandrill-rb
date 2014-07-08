module Mandrill
  class Whitelists
    attr_accessor :master

    def initialize(master)
      @master = master
    end

    # Adds an email to your email rejection whitelist. If the address is currently on your blacklist, that blacklist entry will be removed automatically.
    # @param [String] email an email address to add to the whitelist
    # @param [String] comment an optional description of why the email was whitelisted
    # @return [Hash] a status object containing the address and the result of the operation
    #     - [String] email the email address you provided
    #     - [Boolean] added whether the operation succeeded
    def add(email, comment=nil)
      _params = {:email => email, :comment => comment}
      return @master.call 'whitelists/add', _params
    end

    # Retrieves your email rejection whitelist. You can provide an email address or search prefix to limit the results. Returns up to 1000 results.
    # @param [String] email an optional email address or prefix to search by
    # @return [Array] up to 1000 whitelist entries
    #     - [Hash] return[] the information for each whitelist entry
    #         - [String] email the email that is whitelisted
    #         - [String] detail a description of why the email was whitelisted
    #         - [String] created_at when the email was added to the whitelist
    def list(email=nil)
      _params = {:email => email}
      return @master.call 'whitelists/list', _params
    end

    # Removes an email address from the whitelist.
    # @param [String] email the email address to remove from the whitelist
    # @return [Hash] a status object containing the address and whether the deletion succeeded
    #     - [String] email the email address that was removed from the blacklist
    #     - [Boolean] deleted whether the address was deleted successfully
    def delete(email)
      _params = {:email => email}
      return @master.call 'whitelists/delete', _params
    end

  end
end
