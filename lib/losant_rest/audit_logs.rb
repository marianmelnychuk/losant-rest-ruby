# The MIT License (MIT)
#
# Copyright (c) 2020 Losant IoT, Inc.
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

require "json"

module LosantRest

  # Class containing all the actions for the Audit Logs Resource
  class AuditLogs

    def initialize(client)
      @client = client
    end

    # Returns the audit logs for the organization
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Organization, all.Organization.read, all.User, all.User.read, auditLogs.*, or auditLogs.get.
    #
    # Parameters:
    # *  {string} orgId - ID associated with the organization
    # *  {string} sortField - Field to sort the results by. Accepted values are: creationDate, responseStatus, actorName
    # *  {string} sortDirection - Direction to sort the results by. Accepted values are: asc, desc
    # *  {string} page - Which page of results to return
    # *  {string} perPage - How many items to return per page
    # *  {string} start - Start of time range for audit log query
    # *  {string} end - End of time range for audit log query
    # *  {hash} auditLogFilter - Filters for the audit log query (https://api.losant.com/#/definitions/auditLogFilter)
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Collection of audit logs (https://api.losant.com/#/definitions/auditLogs)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if organization was not found (https://api.losant.com/#/definitions/error)
    def get(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("orgId is required") unless params.has_key?(:orgId)

      query_params[:sortField] = params[:sortField] if params.has_key?(:sortField)
      query_params[:sortDirection] = params[:sortDirection] if params.has_key?(:sortDirection)
      query_params[:page] = params[:page] if params.has_key?(:page)
      query_params[:perPage] = params[:perPage] if params.has_key?(:perPage)
      query_params[:start] = params[:start] if params.has_key?(:start)
      query_params[:end] = params[:end] if params.has_key?(:end)
      query_params[:auditLogFilter] = params[:auditLogFilter] if params.has_key?(:auditLogFilter)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/orgs/#{params[:orgId]}/audit-logs"

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

  end
end
