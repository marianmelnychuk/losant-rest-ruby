# The MIT License (MIT)
#
# Copyright (c) 2017 Losant IoT, Inc.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

module LosantRest

  # Class containing all the actions for the Webhooks Resource
  class Webhooks

    def initialize(client)
      @client = client
    end

    # Returns the webhooks for an application
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {string} sortField - Field to sort the results by. Accepted values are: name, id, creationDate
    # *  {string} sortDirection - Direction to sort the results by. Accepted values are: asc, desc
    # *  {string} page - Which page of results to return
    # *  {string} perPage - How many items to return per page
    # *  {string} filterField - Field to filter the results by. Blank or not provided means no filtering. Accepted values are: name
    # *  {string} filter - Filter to apply against the filtered field. Supports globbing. Blank or not provided means no filtering.
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Collection of webhooks (https://api.losant.com/#/definitions/webhooks)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if application was not found (https://api.losant.com/#/definitions/error)
    def get(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)

      query_params[:sortField] = params[:sortField] if params.has_key?(:sortField)
      query_params[:sortDirection] = params[:sortDirection] if params.has_key?(:sortDirection)
      query_params[:page] = params[:page] if params.has_key?(:page)
      query_params[:perPage] = params[:perPage] if params.has_key?(:perPage)
      query_params[:filterField] = params[:filterField] if params.has_key?(:filterField)
      query_params[:filter] = params[:filter] if params.has_key?(:filter)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/webhooks"

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Create a new webhook for an application
    #
    # Parameters:
    # *  {string} applicationId - ID associated with the application
    # *  {hash} webhook - New webhook information (https://api.losant.com/#/definitions/webhookPost)
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  201 - Successfully created webhook (https://api.losant.com/#/definitions/webhook)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if application was not found (https://api.losant.com/#/definitions/error)
    def post(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("applicationId is required") unless params.has_key?(:applicationId)
      raise ArgumentError.new("webhook is required") unless params.has_key?(:webhook)

      body = params[:webhook] if params.has_key?(:webhook)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/applications/#{params[:applicationId]}/webhooks"

      @client.request(
        method: :post,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

  end
end
