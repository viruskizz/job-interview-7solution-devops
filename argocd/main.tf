
resource "helm_release" "argocd" {
  name = "argocd"

  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  create_namespace = true

  values = [file("values/argocd.yaml")]
}

resource "kubernetes_manifest" "app" {
  manifest = yamldecode(file("../manifests/app.yaml"))
}