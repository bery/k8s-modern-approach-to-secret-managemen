module "external_secrets" {
  source  = "cloudposse/helm-release/aws"
  version = "0.7.0"

  name = "external-secrets"

  repository    = "https://charts.external-secrets.io"
  chart         = "external-secrets"
  chart_version = "0.7.0"

  create_namespace     = true
  kubernetes_namespace = "external-secrets"

  atomic                      = true
  cleanup_on_fail             = true
  timeout                     = 300
  wait                        = true
  eks_cluster_oidc_issuer_url = module.eks.cluster_oidc_issuer_url

  set = [
    {
    name = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = module.external_secrets_irsa_role.iam_role_arn
    type = "string"
    },
    {
      name = "prometheus.enabled"
      value = "true"
      type = "string"
    }
  ]
}

module "argocd" {
  source  = "cloudposse/helm-release/aws"
  version = "0.7.0"

  name = "argo-cd"

  repository    = "https://argoproj.github.io/argo-helm"
  chart         = "argo-cd"
  chart_version = "5.33.4"

  create_namespace     = true
  kubernetes_namespace = "argo-cd"

  atomic                      = true
  cleanup_on_fail             = true
  timeout                     = 300
  wait                        = true
  eks_cluster_oidc_issuer_url = module.eks.cluster_oidc_issuer_url

}
