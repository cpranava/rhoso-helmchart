# RHOSO Template/Values Key Audit

Summary: zero-missing=24, with-missing=0, total-missing-keys=0

## dns

| Category | Keys |
|---|---|
| Top-level service keys | enabled, template |
| Template-level keys | replicas |
| Map-instance keys | — |
| Explicit keys | enabled, template, template.externalEndpoints, template.extraSpec, template.networkAttachments, template.nodeSelector, template.options, template.override, template.replicas, template.resources, template.topologyRef |
| Nested toYaml coverage points | template, template.externalEndpoints, template.extraSpec, template.networkAttachments, template.nodeSelector, template.options, template.override, template.resources, template.topologyRef |
| Missing keys | None |

## galera

| Category | Keys |
|---|---|
| Top-level service keys | enabled, templates |
| Template-level keys | — |
| Map-instance keys | replicas, storageRequest, storageClass |
| Explicit keys | enabled, templates, templates.<instance>.containerImage, templates.<instance>.extraSpec, templates.<instance>.nodeSelector, templates.<instance>.replicas, templates.<instance>.resources, templates.<instance>.secret, templates.<instance>.storageClass, templates.<instance>.storageRequest, templates.<instance>.tls, templates.<instance>.topologyRef |
| Nested toYaml coverage points | templates.<instance>.extraSpec, templates.<instance>.nodeSelector, templates.<instance>.resources, templates.<instance>.tls, templates.<instance>.topologyRef |
| Missing keys | None |
| Notes | Map-based service: coverage evaluated against templates.<instance> keys from sample instance in values file. |

## rabbitmq

| Category | Keys |
|---|---|
| Top-level service keys | enabled, templates |
| Template-level keys | — |
| Map-instance keys | replicas |
| Explicit keys | enabled, templates, templates.<instance>.additionalConfig, templates.<instance>.advancedConfig, templates.<instance>.extraSpec, templates.<instance>.nodeSelector, templates.<instance>.override, templates.<instance>.replicas, templates.<instance>.resources, templates.<instance>.tls, templates.<instance>.topologyRef |
| Nested toYaml coverage points | templates, templates.<instance>.extraSpec, templates.<instance>.nodeSelector, templates.<instance>.override, templates.<instance>.resources, templates.<instance>.tls, templates.<instance>.topologyRef |
| Missing keys | None |
| Notes | Map-based service: coverage evaluated against templates.<instance> keys from sample instance in values file. |

## memcached

| Category | Keys |
|---|---|
| Top-level service keys | enabled, templates |
| Template-level keys | — |
| Map-instance keys | replicas |
| Explicit keys | enabled, templates, templates.<instance>.extraSpec, templates.<instance>.maxMemoryMB, templates.<instance>.nodeSelector, templates.<instance>.replicas, templates.<instance>.resources, templates.<instance>.tls, templates.<instance>.topologyRef |
| Nested toYaml coverage points | templates.<instance>.extraSpec, templates.<instance>.nodeSelector, templates.<instance>.resources, templates.<instance>.tls, templates.<instance>.topologyRef |
| Missing keys | None |
| Notes | Map-based service: coverage evaluated against templates.<instance> keys from sample instance in values file. |

## keystone

| Category | Keys |
|---|---|
| Top-level service keys | enabled, apiOverride, template |
| Template-level keys | replicas, databaseInstance, memcachedInstance, secret |
| Map-instance keys | — |
| Explicit keys | apiOverride, applicationCredential, enabled, template, template.customServiceConfig, template.databaseAccount, template.databaseInstance, template.defaultConfigOverwrite, template.extraSpec, template.memcachedInstance, template.networkAttachments, template.nodeSelector, template.override, template.replicas, template.resources, template.secret, template.serviceAccount, template.tls, template.topologyRef |
| Nested toYaml coverage points | apiOverride, applicationCredential, template, template.defaultConfigOverwrite, template.extraSpec, template.networkAttachments, template.nodeSelector, template.override, template.resources, template.tls, template.topologyRef |
| Missing keys | None |

## placement

| Category | Keys |
|---|---|
| Top-level service keys | enabled, apiOverride, template |
| Template-level keys | replicas, databaseInstance, secret |
| Map-instance keys | — |
| Explicit keys | apiOverride, applicationCredential, enabled, template, template.customServiceConfig, template.databaseAccount, template.databaseInstance, template.defaultConfigOverwrite, template.extraSpec, template.memcachedInstance, template.networkAttachments, template.nodeSelector, template.override, template.replicas, template.resources, template.secret, template.serviceAccount, template.tls, template.topologyRef |
| Nested toYaml coverage points | apiOverride, applicationCredential, template, template.defaultConfigOverwrite, template.extraSpec, template.networkAttachments, template.nodeSelector, template.override, template.resources, template.tls, template.topologyRef |
| Missing keys | None |

## glance

| Category | Keys |
|---|---|
| Top-level service keys | enabled, apiOverrides, template |
| Template-level keys | storageRequest, databaseInstance, memcachedInstance, secret, keystoneEndpoint, imageCache, glanceAPIs |
| Map-instance keys | — |
| Explicit keys | apiOverrides, applicationCredential, enabled, template, template.customServiceConfig, template.databaseAccount, template.databaseInstance, template.extraSpec, template.glanceAPIs, template.imageCache, template.keystoneEndpoint, template.memcachedInstance, template.networkAttachments, template.nodeSelector, template.resources, template.secret, template.serviceAccount, template.storageClass, template.storageRequest, template.tls, template.topologyRef, uniquePodNames |
| Nested toYaml coverage points | apiOverrides, applicationCredential, template.extraSpec, template.glanceAPIs, template.imageCache, template.networkAttachments, template.nodeSelector, template.resources, template.tls, template.topologyRef |
| Missing keys | None |

## cinder

| Category | Keys |
|---|---|
| Top-level service keys | enabled, apiOverride, template |
| Template-level keys | databaseInstance, memcachedInstance, secret, cinderAPI, cinderScheduler, cinderBackup |
| Map-instance keys | — |
| Explicit keys | apiOverride, applicationCredential, enabled, template, template.cinderAPI, template.cinderBackup, template.cinderScheduler, template.cinderVolumes, template.customServiceConfig, template.databaseAccount, template.databaseInstance, template.extraSpec, template.memcachedInstance, template.nodeSelector, template.rabbitMqClusterName, template.secret, template.serviceAccount, template.tls, template.topologyRef, uniquePodNames |
| Nested toYaml coverage points | apiOverride, applicationCredential, template, template.cinderAPI, template.cinderBackup, template.cinderScheduler, template.cinderVolumes, template.extraSpec, template.nodeSelector, template.tls, template.topologyRef |
| Missing keys | None |

## ovn

| Category | Keys |
|---|---|
| Top-level service keys | enabled, template |
| Template-level keys | ovnDBCluster, ovnNorthd, ovnController |
| Map-instance keys | dbType, replicas, storageRequest |
| Explicit keys | enabled, template, template.externalIDS, template.extraSpec, template.networkAttachments, template.nicMappings, template.nodeSelector, template.ovnController, template.ovnDBCluster, template.ovnDBCluster.<instance>.dbType, template.ovnDBCluster.<instance>.extraSpec, template.ovnDBCluster.<instance>.networkAttachments, template.ovnDBCluster.<instance>.nodeSelector, template.ovnDBCluster.<instance>.replicas, template.ovnDBCluster.<instance>.storageClass, template.ovnDBCluster.<instance>.storageRequest, template.ovnDBCluster.<instance>.topologyRef, template.ovnNorthd, template.replicas, template.resources, template.topologyRef |
| Nested toYaml coverage points | template, template.externalIDS, template.extraSpec, template.networkAttachments, template.nicMappings, template.nodeSelector, template.ovnController, template.ovnDBCluster.<instance>.extraSpec, template.ovnDBCluster.<instance>.networkAttachments, template.ovnDBCluster.<instance>.nodeSelector, template.ovnDBCluster.<instance>.topologyRef, template.ovnNorthd, template.resources, template.topologyRef |
| Missing keys | None |
| Notes | Hybrid map-based structure: template.ovnDBCluster.<instance> plus explicit ovnNorthd/ovnController blocks. |

## neutron

| Category | Keys |
|---|---|
| Top-level service keys | enabled, apiOverride, template |
| Template-level keys | replicas, databaseInstance, memcachedInstance, secret |
| Map-instance keys | — |
| Explicit keys | apiOverride, applicationCredential, enabled, template, template.customServiceConfig, template.databaseAccount, template.databaseInstance, template.extraSpec, template.memcachedInstance, template.networkAttachments, template.nodeSelector, template.override, template.rabbitMqClusterName, template.replicas, template.resources, template.secret, template.serviceAccount, template.tls, template.topologyRef |
| Nested toYaml coverage points | apiOverride, applicationCredential, template, template.extraSpec, template.networkAttachments, template.nodeSelector, template.override, template.resources, template.tls, template.topologyRef |
| Missing keys | None |

## nova

| Category | Keys |
|---|---|
| Top-level service keys | enabled, apiOverride, template |
| Template-level keys | apiDatabaseInstance, secret, novaAPI, novaScheduler, novaMetadata, cellTemplates |
| Map-instance keys | — |
| Explicit keys | apiOverride, applicationCredential, cellOverride, enabled, template, template.apiDatabaseInstance, template.cellTemplates, template.customServiceConfig, template.extraSpec, template.memcachedInstance, template.networkAttachments, template.nodeSelector, template.novaAPI, template.novaMetadata, template.novaScheduler, template.override, template.rabbitMqClusterName, template.replicas, template.resources, template.secret, template.serviceAccount, template.tls, template.topologyRef |
| Nested toYaml coverage points | apiOverride, applicationCredential, cellOverride, template, template.cellTemplates, template.extraSpec, template.networkAttachments, template.nodeSelector, template.novaAPI, template.novaMetadata, template.novaScheduler, template.override, template.resources, template.tls, template.topologyRef |
| Missing keys | None |

## heat

| Category | Keys |
|---|---|
| Top-level service keys | enabled, apiOverride, cnfAPIOverride, template |
| Template-level keys | databaseInstance, memcachedInstance, secret, heatAPI, heatCfnAPI, heatEngine |
| Map-instance keys | — |
| Explicit keys | apiOverride, applicationCredential, cnfAPIOverride, enabled, template, template.customServiceConfig, template.databaseAccount, template.databaseInstance, template.extraSpec, template.heatAPI, template.heatCfnAPI, template.heatEngine, template.memcachedInstance, template.networkAttachments, template.nodeSelector, template.override, template.rabbitMqClusterName, template.replicas, template.resources, template.secret, template.serviceAccount, template.tls, template.topologyRef |
| Nested toYaml coverage points | apiOverride, applicationCredential, cnfAPIOverride, template, template.extraSpec, template.heatAPI, template.heatCfnAPI, template.heatEngine, template.networkAttachments, template.nodeSelector, template.override, template.resources, template.tls, template.topologyRef |
| Missing keys | None |

## ironic

| Category | Keys |
|---|---|
| Top-level service keys | enabled, apiOverride, inspectorOverride, template |
| Template-level keys | databaseInstance, secret, storageClass, ironicAPI, ironicConductors, ironicInspector, ironicNeutronAgent |
| Map-instance keys | — |
| Explicit keys | apiOverride, applicationCredential, enabled, inspectorOverride, template, template.customServiceConfig, template.databaseAccount, template.databaseInstance, template.extraSpec, template.ironicAPI, template.ironicConductors, template.ironicInspector, template.ironicNeutronAgent, template.memcachedInstance, template.networkAttachments, template.nodeSelector, template.rabbitMqClusterName, template.rpcTransport, template.secret, template.serviceAccount, template.standalone, template.storageClass, template.tls, template.topologyRef |
| Nested toYaml coverage points | apiOverride, applicationCredential, inspectorOverride, template.extraSpec, template.ironicAPI, template.ironicConductors, template.ironicInspector, template.ironicNeutronAgent, template.networkAttachments, template.nodeSelector, template.tls, template.topologyRef |
| Missing keys | None |

## manila

| Category | Keys |
|---|---|
| Top-level service keys | enabled, apiOverride, template |
| Template-level keys | databaseInstance, memcachedInstance, manilaAPI, manilaScheduler |
| Map-instance keys | — |
| Explicit keys | apiOverride, applicationCredential, enabled, template, template.customServiceConfig, template.databaseAccount, template.databaseInstance, template.extraSpec, template.manilaAPI, template.manilaScheduler, template.manilaShares, template.memcachedInstance, template.nodeSelector, template.rabbitMqClusterName, template.secret, template.serviceAccount, template.tls, template.topologyRef |
| Nested toYaml coverage points | apiOverride, applicationCredential, template, template.extraSpec, template.manilaAPI, template.manilaScheduler, template.manilaShares, template.nodeSelector, template.tls, template.topologyRef |
| Missing keys | None |

## horizon

| Category | Keys |
|---|---|
| Top-level service keys | enabled, apiOverride, template |
| Template-level keys | replicas, secret, memcachedInstance |
| Map-instance keys | — |
| Explicit keys | apiOverride, enabled, template, template.customServiceConfig, template.defaultConfigOverwrite, template.extraSpec, template.memcachedInstance, template.networkAttachments, template.nodeSelector, template.preserveJobs, template.replicas, template.resources, template.secret, template.tls, template.topologyRef |
| Nested toYaml coverage points | apiOverride, template, template.defaultConfigOverwrite, template.extraSpec, template.networkAttachments, template.nodeSelector, template.resources, template.tls, template.topologyRef |
| Missing keys | None |

## telemetry

| Category | Keys |
|---|---|
| Top-level service keys | enabled, template |
| Template-level keys | ceilometer, autoscaling, metricStorage, logging, cloudkitty |
| Map-instance keys | — |
| Explicit keys | alertmanagerOverride, aodhApiOverride, applicationCredentialAodh, applicationCredentialCeilometer, applicationCredentialCloudKitty, cloudKittyApiOverride, enabled, prometheusOverride, template, template.autoscaling, template.ceilometer, template.cloudkitty, template.customServiceConfig, template.enabled, template.extraSpec, template.logging, template.metricStorage, template.networkAttachments, template.nodeSelector, template.resources, template.secret, template.topologyRef |
| Nested toYaml coverage points | alertmanagerOverride, aodhApiOverride, applicationCredentialAodh, applicationCredentialCeilometer, applicationCredentialCloudKitty, cloudKittyApiOverride, prometheusOverride, template, template.autoscaling, template.ceilometer, template.cloudkitty, template.extraSpec, template.logging, template.metricStorage, template.networkAttachments, template.nodeSelector, template.resources, template.topologyRef |
| Missing keys | None |

## swift

| Category | Keys |
|---|---|
| Top-level service keys | enabled, proxyOverride, template |
| Template-level keys | storageClass, memcachedInstance, swiftRing, swiftStorage, swiftProxy |
| Map-instance keys | — |
| Explicit keys | applicationCredential, enabled, proxyOverride, template, template.extraSpec, template.memcachedInstance, template.networkAttachments, template.nodeSelector, template.ringConfigMaps, template.storageClass, template.swiftProxy, template.swiftRing, template.swiftStorage, template.tls, template.topologyRef |
| Nested toYaml coverage points | applicationCredential, proxyOverride, template, template.extraSpec, template.networkAttachments, template.nodeSelector, template.ringConfigMaps, template.swiftProxy, template.swiftRing, template.swiftStorage, template.tls, template.topologyRef |
| Missing keys | None |

## octavia

| Category | Keys |
|---|---|
| Top-level service keys | enabled, apiOverride, template |
| Template-level keys | databaseInstance, secret, octaviaNetworkAttachment, apacheContainerImage, octaviaAPI, octaviaHousekeeping, octaviaHealthManager, octaviaWorker, lbMgmtNetwork |
| Map-instance keys | — |
| Explicit keys | apiOverride, applicationCredential, enabled, template, template.amphoraImageContainerImage, template.apacheContainerImage, template.apiTimeout, template.customServiceConfig, template.databaseAccount, template.databaseInstance, template.extraSpec, template.lbMgmtNetwork, template.memcachedInstance, template.nodeSelector, template.octaviaAPI, template.octaviaHealthManager, template.octaviaHousekeeping, template.octaviaNetworkAttachment, template.octaviaRsyslog, template.octaviaWorker, template.persistenceDatabaseAccount, template.rabbitMqClusterName, template.redisServiceName, template.secret, template.serviceAccount, template.tenantName, template.tls, template.topologyRef |
| Nested toYaml coverage points | apiOverride, applicationCredential, template, template.extraSpec, template.lbMgmtNetwork, template.nodeSelector, template.octaviaAPI, template.octaviaHealthManager, template.octaviaHousekeeping, template.octaviaRsyslog, template.octaviaWorker, template.tls, template.topologyRef |
| Missing keys | None |

## designate

| Category | Keys |
|---|---|
| Top-level service keys | enabled, apiOverride, template |
| Template-level keys | databaseInstance, secret, designateAPI, designateCentral, designateWorker, designateMdns, designateProducer, designateBackendbind9, designateUnbound |
| Map-instance keys | — |
| Explicit keys | apiOverride, applicationCredential, enabled, template, template.backendType, template.customServiceConfig, template.databaseAccount, template.databaseInstance, template.designateAPI, template.designateBackendbind9, template.designateCentral, template.designateMdns, template.designateProducer, template.designateUnbound, template.designateWorker, template.extraSpec, template.memcachedInstance, template.networkAttachments, template.nodeSelector, template.nsRecords, template.rabbitMqClusterName, template.redisServiceName, template.secret, template.serviceAccount, template.tls, template.topologyRef |
| Nested toYaml coverage points | apiOverride, applicationCredential, template, template.designateAPI, template.designateBackendbind9, template.designateCentral, template.designateMdns, template.designateProducer, template.designateUnbound, template.designateWorker, template.extraSpec, template.networkAttachments, template.nodeSelector, template.nsRecords, template.tls, template.topologyRef |
| Missing keys | None |

## barbican

| Category | Keys |
|---|---|
| Top-level service keys | enabled, apiOverride, template |
| Template-level keys | databaseInstance, serviceAccount, barbicanAPI, barbicanWorker, barbicanKeystoneListener |
| Map-instance keys | — |
| Explicit keys | apiOverride, applicationCredential, enabled, template, template.apiTimeout, template.barbicanAPI, template.barbicanKeystoneListener, template.barbicanWorker, template.customServiceConfig, template.databaseAccount, template.databaseInstance, template.extraSpec, template.memcachedInstance, template.networkAttachments, template.nodeSelector, template.rabbitMqClusterName, template.secret, template.serviceAccount, template.tls, template.topologyRef |
| Nested toYaml coverage points | apiOverride, applicationCredential, template, template.barbicanAPI, template.barbicanKeystoneListener, template.barbicanWorker, template.extraSpec, template.networkAttachments, template.nodeSelector, template.tls, template.topologyRef |
| Missing keys | None |

## redis

| Category | Keys |
|---|---|
| Top-level service keys | enabled, templates |
| Template-level keys | — |
| Map-instance keys | replicas |
| Explicit keys | enabled, templates, templates.<instance>.extraSpec, templates.<instance>.nodeSelector, templates.<instance>.replicas, templates.<instance>.resources, templates.<instance>.sentinelResources, templates.<instance>.tls, templates.<instance>.topologyRef |
| Nested toYaml coverage points | templates, templates.<instance>.extraSpec, templates.<instance>.nodeSelector, templates.<instance>.resources, templates.<instance>.sentinelResources, templates.<instance>.tls, templates.<instance>.topologyRef |
| Missing keys | None |
| Notes | Map-based service: coverage evaluated against templates.<instance> keys from sample instance in values file. |

## watcher

| Category | Keys |
|---|---|
| Top-level service keys | enabled, apiOverride, template |
| Template-level keys | databaseInstance, apiServiceTemplate, applierServiceTemplate, decisionengineServiceTemplate |
| Map-instance keys | — |
| Explicit keys | apiOverride, applicationCredential, enabled, template, template.apiServiceTemplate, template.applierServiceTemplate, template.customServiceConfig, template.databaseAccount, template.databaseInstance, template.dbPurge, template.decisionengineServiceTemplate, template.extraSpec, template.memcachedInstance, template.nodeSelector, template.rabbitMqClusterName, template.secret, template.serviceAccount, template.tls, template.topologyRef |
| Nested toYaml coverage points | apiOverride, applicationCredential, template, template.apiServiceTemplate, template.applierServiceTemplate, template.dbPurge, template.decisionengineServiceTemplate, template.extraSpec, template.nodeSelector, template.tls, template.topologyRef |
| Missing keys | None |

## openstackclient

| Category | Keys |
|---|---|
| Top-level service keys | template |
| Template-level keys | openStackConfigMap, openStackConfigSecret |
| Map-instance keys | — |
| Explicit keys | template.caBundleSecretName, template.env, template.extraSpec, template.nodeSelector, template.openStackConfigMap, template.openStackConfigSecret, template.topologyRef |
| Nested toYaml coverage points | template.env, template.extraSpec, template.nodeSelector, template.topologyRef |
| Missing keys | None |
| Notes | No enabled flag by design (always deployed by operator). |

## tls

| Category | Keys |
|---|---|
| Top-level service keys | ingress, podLevel |
| Template-level keys | — |
| Map-instance keys | — |
| Explicit keys | — |
| Nested toYaml coverage points | <service-root> (.Values.tls via toYaml) |
| Missing keys | None |
| Notes | tls is rendered via full toYaml passthrough at service root. |
