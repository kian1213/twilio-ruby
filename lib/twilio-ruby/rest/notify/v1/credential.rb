##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

module Twilio
  module REST
    class Notify < Domain
      class V1 < Version
        ##
        # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
        class CredentialList < ListResource
          ##
          # Initialize the CredentialList
          # @param [Version] version Version that contains the resource
          # @return [CredentialList] CredentialList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/Credentials"
          end

          ##
          # Lists CredentialInstance records from the API as a list.
          # Unlike stream(), this operation is eager and will load `limit` records into
          # memory before returning.
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit.  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records.  If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Array] Array of up to limit results
          def list(limit: nil, page_size: nil)
            self.stream(limit: limit, page_size: page_size).entries
          end

          ##
          # Streams CredentialInstance records from the API as an Enumerable.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit. Default is no limit.
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records. If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Enumerable] Enumerable that will yield up to limit results
          def stream(limit: nil, page_size: nil)
            limits = @version.read_limits(limit, page_size)

            page = self.page(page_size: limits[:page_size], )

            @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
          end

          ##
          # When passed a block, yields CredentialInstance records from the API.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          def each
            limits = @version.read_limits

            page = self.page(page_size: limits[:page_size], )

            @version.stream(page,
                            limit: limits[:limit],
                            page_limit: limits[:page_limit]).each {|x| yield x}
          end

          ##
          # Retrieve a single page of CredentialInstance records from the API.
          # Request is executed immediately.
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          # @return [Page] Page of CredentialInstance
          def page(page_token: :unset, page_number: :unset, page_size: :unset)
            params = Twilio::Values.of({
                'PageToken' => page_token,
                'Page' => page_number,
                'PageSize' => page_size,
            })
            response = @version.page(
                'GET',
                @uri,
                params
            )
            CredentialPage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of CredentialInstance records from the API.
          # Request is executed immediately.
          # @param [String] target_url API-generated URL for the requested results page
          # @return [Page] Page of CredentialInstance
          def get_page(target_url)
            response = @version.domain.request(
                'GET',
                target_url
            )
            CredentialPage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of CredentialInstance records from the API.
          # Request is executed immediately.
          # @param [credential.PushService] type Credential type, one of "gcm", "fcm", or
          #   "apn"
          # @param [String] friendly_name Friendly name for stored credential
          # @param [String] certificate [APN only] URL encoded representation of the
          #   certificate. Strip everything outside of the headers, e.g. `-----BEGIN
          #   CERTIFICATE-----MIIFnTCCBIWgAwIBAgIIAjy9H849+E8wDQYJKoZIhvcNAQEFBQAwgZYxCzAJBgNV.....A==-----END CERTIFICATE-----`
          # @param [String] private_key [APN only] URL encoded representation of the private
          #   key. Strip everything outside of the headers, e.g. `-----BEGIN RSA PRIVATE
          #   KEY-----MIIEpQIBAAKCAQEAuyf/lNrH9ck8DmNyo3fGgvCI1l9s+cmBY3WIz+cUDqmxiieR\n.-----END RSA PRIVATE KEY-----`
          # @param [Boolean] sandbox [APN only] use this credential for sending to
          #   production or sandbox APNs (string `true` or `false`)
          # @param [String] api_key [GCM only] This is the "Server key" of your project from
          #   Firebase console under Settings / Cloud messaging. Yes, you can use the server
          #   key from the Firebase console for GCM.
          # @param [String] secret [FCM only] This is the "Server key" of your project from
          #   Firebase console under Settings / Cloud messaging.
          # @return [CredentialInstance] Newly created CredentialInstance
          def create(type: nil, friendly_name: :unset, certificate: :unset, private_key: :unset, sandbox: :unset, api_key: :unset, secret: :unset)
            data = Twilio::Values.of({
                'Type' => type,
                'FriendlyName' => friendly_name,
                'Certificate' => certificate,
                'PrivateKey' => private_key,
                'Sandbox' => sandbox,
                'ApiKey' => api_key,
                'Secret' => secret,
            })

            payload = @version.create(
                'POST',
                @uri,
                data: data
            )

            CredentialInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Notify.V1.CredentialList>'
          end
        end

        ##
        # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
        class CredentialPage < Page
          ##
          # Initialize the CredentialPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [CredentialPage] CredentialPage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of CredentialInstance
          # @param [Hash] payload Payload response from the API
          # @return [CredentialInstance] CredentialInstance
          def get_instance(payload)
            CredentialInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Notify.V1.CredentialPage>'
          end
        end

        ##
        # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
        class CredentialContext < InstanceContext
          ##
          # Initialize the CredentialContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid The sid
          # @return [CredentialContext] CredentialContext
          def initialize(version, sid)
            super(version)

            # Path Solution
            @solution = {sid: sid, }
            @uri = "/Credentials/#{@solution[:sid]}"
          end

          ##
          # Fetch a CredentialInstance
          # @return [CredentialInstance] Fetched CredentialInstance
          def fetch
            params = Twilio::Values.of({})

            payload = @version.fetch(
                'GET',
                @uri,
                params,
            )

            CredentialInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Update the CredentialInstance
          # @param [String] friendly_name Friendly name for stored credential
          # @param [String] certificate [APN only] URL encoded representation of the
          #   certificate. Strip everything outside of the headers, e.g. `-----BEGIN
          #   CERTIFICATE-----MIIFnTCCBIWgAwIBAgIIAjy9H849+E8wDQYJKoZIhvcNAQEFBQAwgZYxCzAJBgNV.....A==-----END CERTIFICATE-----`
          # @param [String] private_key [APN only] URL encoded representation of the private
          #   key. Strip everything outside of the headers, e.g. `-----BEGIN RSA PRIVATE
          #   KEY-----MIIEpQIBAAKCAQEAuyf/lNrH9ck8DmNyo3fGgvCI1l9s+cmBY3WIz+cUDqmxiieR\n.-----END RSA PRIVATE KEY-----`
          # @param [Boolean] sandbox [APN only] use this credential for sending to
          #   production or sandbox APNs (string `true` or `false`)
          # @param [String] api_key [GCM only] This is the "Server key" of your project from
          #   Firebase console under Settings / Cloud messaging. Yes, you can use the server
          #   key from the Firebase console for GCM.
          # @param [String] secret [FCM only] This is the "Server key" of your project from
          #   Firebase console under Settings / Cloud messaging.
          # @return [CredentialInstance] Updated CredentialInstance
          def update(friendly_name: :unset, certificate: :unset, private_key: :unset, sandbox: :unset, api_key: :unset, secret: :unset)
            data = Twilio::Values.of({
                'FriendlyName' => friendly_name,
                'Certificate' => certificate,
                'PrivateKey' => private_key,
                'Sandbox' => sandbox,
                'ApiKey' => api_key,
                'Secret' => secret,
            })

            payload = @version.update(
                'POST',
                @uri,
                data: data,
            )

            CredentialInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Deletes the CredentialInstance
          # @return [Boolean] true if delete succeeds, true otherwise
          def delete
            @version.delete('delete', @uri)
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Notify.V1.CredentialContext #{context}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Notify.V1.CredentialContext #{context}>"
          end
        end

        ##
        # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
        class CredentialInstance < InstanceResource
          ##
          # Initialize the CredentialInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid The sid
          # @return [CredentialInstance] CredentialInstance
          def initialize(version, payload, sid: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'sid' => payload['sid'],
                'account_sid' => payload['account_sid'],
                'friendly_name' => payload['friendly_name'],
                'type' => payload['type'],
                'sandbox' => payload['sandbox'],
                'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                'url' => payload['url'],
            }

            # Context
            @instance_context = nil
            @params = {'sid' => sid || @properties['sid'], }
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [CredentialContext] CredentialContext for this CredentialInstance
          def context
            unless @instance_context
              @instance_context = CredentialContext.new(@version, @params['sid'], )
            end
            @instance_context
          end

          ##
          # @return [String] The sid
          def sid
            @properties['sid']
          end

          ##
          # @return [String] The account_sid
          def account_sid
            @properties['account_sid']
          end

          ##
          # @return [String] Friendly name for stored credential
          def friendly_name
            @properties['friendly_name']
          end

          ##
          # @return [credential.PushService] Credential type, one of "gcm", "fcm", or "apn"
          def type
            @properties['type']
          end

          ##
          # @return [String] [APN only] use this credential for sending to production or sandbox APNs
          def sandbox
            @properties['sandbox']
          end

          ##
          # @return [Time] The date_created
          def date_created
            @properties['date_created']
          end

          ##
          # @return [Time] The date_updated
          def date_updated
            @properties['date_updated']
          end

          ##
          # @return [String] The url
          def url
            @properties['url']
          end

          ##
          # Fetch a CredentialInstance
          # @return [CredentialInstance] Fetched CredentialInstance
          def fetch
            context.fetch
          end

          ##
          # Update the CredentialInstance
          # @param [String] friendly_name Friendly name for stored credential
          # @param [String] certificate [APN only] URL encoded representation of the
          #   certificate. Strip everything outside of the headers, e.g. `-----BEGIN
          #   CERTIFICATE-----MIIFnTCCBIWgAwIBAgIIAjy9H849+E8wDQYJKoZIhvcNAQEFBQAwgZYxCzAJBgNV.....A==-----END CERTIFICATE-----`
          # @param [String] private_key [APN only] URL encoded representation of the private
          #   key. Strip everything outside of the headers, e.g. `-----BEGIN RSA PRIVATE
          #   KEY-----MIIEpQIBAAKCAQEAuyf/lNrH9ck8DmNyo3fGgvCI1l9s+cmBY3WIz+cUDqmxiieR\n.-----END RSA PRIVATE KEY-----`
          # @param [Boolean] sandbox [APN only] use this credential for sending to
          #   production or sandbox APNs (string `true` or `false`)
          # @param [String] api_key [GCM only] This is the "Server key" of your project from
          #   Firebase console under Settings / Cloud messaging. Yes, you can use the server
          #   key from the Firebase console for GCM.
          # @param [String] secret [FCM only] This is the "Server key" of your project from
          #   Firebase console under Settings / Cloud messaging.
          # @return [CredentialInstance] Updated CredentialInstance
          def update(friendly_name: :unset, certificate: :unset, private_key: :unset, sandbox: :unset, api_key: :unset, secret: :unset)
            context.update(
                friendly_name: friendly_name,
                certificate: certificate,
                private_key: private_key,
                sandbox: sandbox,
                api_key: api_key,
                secret: secret,
            )
          end

          ##
          # Deletes the CredentialInstance
          # @return [Boolean] true if delete succeeds, true otherwise
          def delete
            context.delete
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Notify.V1.CredentialInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Notify.V1.CredentialInstance #{values}>"
          end
        end
      end
    end
  end
end