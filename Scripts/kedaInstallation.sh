# ...existing code...

echo "🔧 Installing KEDA..."
helm repo add kedacore https://kedacore.github.io/charts
helm repo update
kubectl create namespace keda || true
helm upgrade --install keda kedacore/keda --namespace keda -f ../keda/values.yaml 
echo "✅ KEDA installed."

# ...existing code...