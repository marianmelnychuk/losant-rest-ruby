# Flow Versions Actions

Details on the various actions that can be performed on the
Flow Versions resource, including the expected
parameters and the potential responses.

##### Contents

*   [Get](#get)
*   [Post](#post)

<br/>

## Get

Returns the flow versions for a flow

```ruby
result = client.flow_versions.get(
  applicationId: my_application_id,
  flowId: my_flow_id)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, flowVersions.*, or flowVersions.get.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| applicationId | string | Y | ID associated with the application |  | 575ec8687ae143cd83dc4a97 |
| flowId | string | Y | ID associated with the flow |  | 575ed18f7ae143cd83dc4aa6 |
| sortField | string | N | Field to sort the results by. Accepted values are: version, id, creationDate, lastUpdated | version | version |
| sortDirection | string | N | Direction to sort the results by. Accepted values are: asc, desc | asc | asc |
| page | string | N | Which page of results to return | 0 | 0 |
| perPage | string | N | How many items to return per page | 1000 | 10 |
| filterField | string | N | Field to filter the results by. Blank or not provided means no filtering. Accepted values are: version |  | version |
| filter | string | N | Filter to apply against the filtered field. Supports globbing. Blank or not provided means no filtering. |  | my*version |
| includeCustomNodes | string | N | If the result of the request should also include the details of any custom nodes referenced by the returned workflows | false | true |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Workflow Versions](_schemas.md#workflow-versions) | Collection of flow versions |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if flow was not found |

<br/>

## Post

Create or replace a flow version for a flow

```ruby
result = client.flow_versions.post(
  applicationId: my_application_id,
  flowId: my_flow_id,
  flowVersion: my_flow_version)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Application, all.Organization, all.User, flowVersions.*, or flowVersions.post.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| applicationId | string | Y | ID associated with the application |  | 575ec8687ae143cd83dc4a97 |
| flowId | string | Y | ID associated with the flow |  | 575ed18f7ae143cd83dc4aa6 |
| flowVersion | [Workflow Version Post](_schemas.md#workflow-version-post) | Y | New flow version information |  | [Workflow Version Post Example](_schemas.md#workflow-version-post-example) |
| includeCustomNodes | string | N | If the result of the request should also include the details of any custom nodes referenced by the returned workflows | false | true |
| allowReplacement | string | N | Allow replacement of an existing flow version with same version name | false | true |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [Workflow Version](_schemas.md#workflow-version) | Successfully created flow version |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if flow was not found |
