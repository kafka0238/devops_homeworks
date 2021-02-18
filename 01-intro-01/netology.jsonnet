// Александр

local k =(import 'ksonnet-util/kausal.libsonnet');

{
    _config:: {
        name: 'Sasha',
        namespace: std.extVar('qbec.io/defaultNs'),

        containet: {
            requests: { cpu: '10m', memory: '100Mi' },
            limits: { cpu: '200m', memory: '200Mi' },
        },
    },

    local serviceAccount = k.core.v1.serviceAccount,

    serviceAccount:
        serviceAccount.new($._confige.name) +
        serviceAccount.mixin.metadata.withNamespace($._config.namespace),
}