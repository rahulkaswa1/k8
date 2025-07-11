echo "🔧 Installing argoCD..."
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update
kubectl create namespace argocd || true
helm upgrade --install argocd argo/argocd-apps --namespace argocd --wait 
echo "✅ argoCD installed."