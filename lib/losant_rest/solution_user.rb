# The MIT License (MIT)
#
# Copyright (c) 2018 Losant IoT, Inc.
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

  # Class containing all the actions for the Solution User Resource
  class SolutionUser

    def initialize(client)
      @client = client
    end

    # Deletes a solution user
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Organization, all.User, solutionUser.*, or solutionUser.delete.
    #
    # Parameters:
    # *  {string} orgId - ID associated with the organization
    # *  {string} solutionId - ID associated with the solution
    # *  {string} solutionUserId - ID associated with the solution user
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - If solution user was successfully deleted (https://api.losant.com/#/definitions/success)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if solution user was not found (https://api.losant.com/#/definitions/error)
    def delete(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("orgId is required") unless params.has_key?(:orgId)
      raise ArgumentError.new("solutionId is required") unless params.has_key?(:solutionId)
      raise ArgumentError.new("solutionUserId is required") unless params.has_key?(:solutionUserId)

      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/orgs/#{params[:orgId]}/solutions/#{params[:solutionId]}/users/#{params[:solutionUserId]}"

      @client.request(
        method: :delete,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Retrieves information on a solution user
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Organization, all.Organization.read, all.User, all.User.read, solutionUser.*, or solutionUser.get.
    #
    # Parameters:
    # *  {string} orgId - ID associated with the organization
    # *  {string} solutionId - ID associated with the solution
    # *  {string} solutionUserId - ID associated with the solution user
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Solution user information (https://api.losant.com/#/definitions/solutionUser)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if solution user was not found (https://api.losant.com/#/definitions/error)
    def get(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("orgId is required") unless params.has_key?(:orgId)
      raise ArgumentError.new("solutionId is required") unless params.has_key?(:solutionId)
      raise ArgumentError.new("solutionUserId is required") unless params.has_key?(:solutionUserId)

      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/orgs/#{params[:orgId]}/solutions/#{params[:solutionId]}/users/#{params[:solutionUserId]}"

      @client.request(
        method: :get,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

    # Updates information about a solution user
    #
    # Authentication:
    # The client must be configured with a valid api
    # access token to call this action. The token
    # must include at least one of the following scopes:
    # all.Organization, all.User, solutionUser.*, or solutionUser.patch.
    #
    # Parameters:
    # *  {string} orgId - ID associated with the organization
    # *  {string} solutionId - ID associated with the solution
    # *  {string} solutionUserId - ID associated with the solution user
    # *  {hash} solutionUser - Object containing new properties of the solution user (https://api.losant.com/#/definitions/solutionUserPatch)
    # *  {string} losantdomain - Domain scope of request (rarely needed)
    # *  {boolean} _actions - Return resource actions in response
    # *  {boolean} _links - Return resource link in response
    # *  {boolean} _embedded - Return embedded resources in response
    #
    # Responses:
    # *  200 - Updated solution user information (https://api.losant.com/#/definitions/solutionUser)
    #
    # Errors:
    # *  400 - Error if malformed request (https://api.losant.com/#/definitions/error)
    # *  404 - Error if solution user was not found (https://api.losant.com/#/definitions/error)
    def patch(params = {})
      params = Utils.symbolize_hash_keys(params)
      query_params = { _actions: false, _links: true, _embedded: true }
      headers = {}
      body = nil

      raise ArgumentError.new("orgId is required") unless params.has_key?(:orgId)
      raise ArgumentError.new("solutionId is required") unless params.has_key?(:solutionId)
      raise ArgumentError.new("solutionUserId is required") unless params.has_key?(:solutionUserId)
      raise ArgumentError.new("solutionUser is required") unless params.has_key?(:solutionUser)

      body = params[:solutionUser] if params.has_key?(:solutionUser)
      headers[:losantdomain] = params[:losantdomain] if params.has_key?(:losantdomain)
      query_params[:_actions] = params[:_actions] if params.has_key?(:_actions)
      query_params[:_links] = params[:_links] if params.has_key?(:_links)
      query_params[:_embedded] = params[:_embedded] if params.has_key?(:_embedded)

      path = "/orgs/#{params[:orgId]}/solutions/#{params[:solutionId]}/users/#{params[:solutionUserId]}"

      @client.request(
        method: :patch,
        path: path,
        query: query_params,
        headers: headers,
        body: body)
    end

  end
end
