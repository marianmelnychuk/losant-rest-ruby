# Edge Deployments Actions

Details on the various actions that can be performed on the
Edge Deployments resource, including the expected
parameters and the potential responses.

##### Contents

*   [Get](#get)
*   [Release](#release)
*   [Remove](#remove)
*   [Replace](#replace)

<br/>

## Get

Returns the edge deployments for an application

```ruby
result = client.edge_deployments.get(applicationId: my_application_id)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, edgeDeployments.*, or edgeDeployments.get.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| applicationId | string | Y | ID associated with the application |  | 575ec8687ae143cd83dc4a97 |
| sortField | string | N | Field to sort the results by. Accepted values are: id, deviceId, flowId, desiredVersion, currentVersion, creationDate, lastUpdated | lastUpdated | creationDate |
| sortDirection | string | N | Direction to sort the results by. Accepted values are: asc, desc | asc | asc |
| page | string | N | Which page of results to return | 0 | 0 |
| perPage | string | N | How many items to return per page | 1000 | 10 |
| deviceId | string | N | Filter deployments to the given Device ID |  | 575ecf887ae143cd83dc4aa2 |
| version | string | N | Filter deployments to the given Workflow Version (matches against both current and desired) |  | myFlowVersion |
| filterEmpty | undefined | N | Filter out deployments where both the current and desired version are null. |  | true |
| flowId | string | N | Filter deployments to the given Workflow ID |  | 575ed18f7ae143cd83dc4aa6 |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Edge Deployments](_schemas.md#edge-deployments) | Collection of edge deployments |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if application was not found |

<br/>

## Release

Deploy an edge workflow version to one or more edge devices. Version can be blank, if removal is desired.

```ruby
result = client.edge_deployments.release(
  applicationId: my_application_id,
  deployment: my_deployment)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Application, all.Organization, all.User, edgeDeployments.*, or edgeDeployments.release.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| applicationId | string | Y | ID associated with the application |  | 575ec8687ae143cd83dc4a97 |
| deployment | [Edge Deployment Release](_schemas.md#edge-deployment-release) | Y | Deployment release information |  | [Edge Deployment Release Example](_schemas.md#edge-deployment-release-example) |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [Success](_schemas.md#success) | If deployment release has been initiated successfully |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if application was not found |

<br/>

## Remove

Remove all edge deployments from a device, remove all edge deployments of a workflow, or remove a specific workflow from a specific device

```ruby
result = client.edge_deployments.remove(
  applicationId: my_application_id,
  deployment: my_deployment)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Application, all.Organization, all.User, edgeDeployments.*, or edgeDeployments.remove.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| applicationId | string | Y | ID associated with the application |  | 575ec8687ae143cd83dc4a97 |
| deployment | [Edge Deployment Remove](_schemas.md#edge-deployment-remove) | Y | Deployment removal information |  | [Edge Deployment Remove Example](_schemas.md#edge-deployment-remove-example) |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [Success](_schemas.md#success) | If deployment removal has been initiated successfully |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if application was not found |

<br/>

## Replace

Replace deployments of an edge workflow version with a new version. New version can be blank, if removal is desired.

```ruby
result = client.edge_deployments.replace(
  applicationId: my_application_id,
  deployment: my_deployment)

puts result
```

#### Authentication
The client must be configured with a valid api access token to call this
action. The token must include at least one of the following scopes:
all.Application, all.Organization, all.User, edgeDeployments.*, or edgeDeployments.replace.

#### Available Parameters

| Name | Type | Required | Description | Default | Example |
| ---- | ---- | -------- | ----------- | ------- | ------- |
| applicationId | string | Y | ID associated with the application |  | 575ec8687ae143cd83dc4a97 |
| deployment | [Edge Deployment Replace](_schemas.md#edge-deployment-replace) | Y | Deployment replacement information |  | [Edge Deployment Replace Example](_schemas.md#edge-deployment-replace-example) |
| losantdomain | string | N | Domain scope of request (rarely needed) |  | example.com |

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [Success](_schemas.md#success) | If deployment replacement has been initiated successfully |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](_schemas.md#error) | Error if malformed request |
| 404 | [Error](_schemas.md#error) | Error if application was not found |
