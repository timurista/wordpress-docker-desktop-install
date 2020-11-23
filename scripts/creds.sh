HTTP_PORT=8007
export SERVICE_IP=$(kubectl get svc --namespace default my-wordpress --template "{{ range (index .status.loadBalancer.ingress 0) }}{{.}}{{ end }}")

echo "using localhost..."
echo "==========="
echo "WordPress URL: http://$SERVICE_IP:$HTTP_PORT/"
echo "WordPress Admin URL: http://$SERVICE_IP:$HTTP_PORT/admin"
echo "==========="
echo Username: user
echo Password: $(kubectl get secret --namespace default my-wordpress -o jsonpath="{.data.wordpress-password}" | base64 --decode)
