sudo usermod -aG docker azureuser
sudo chmod 666 /var/run/docker.sock


W5sSLIgv4vzf1FjA


znvhcxtmdp2j6uhw3rjckowv7s5upnsmfch6sbvi66vajntng72q


kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl edit svc argocd-server -n argocd

kubectl get secrets argocd-initial-admin-secret -n argocd -o yaml




kubectl create secret docker-registry acrsecret --docker-server=acrdevopsfinal.azurecr.io --docker-username=acrdevopsfinal --docker-password=aVQwFlpALYXq9F0CmHqeGPTF1GlI4+8Q/lq4oF7WW7+ACRCUFH8B





nmgmq7o2zgcl622snqpm57s6jrtj7jqr7pzvylvze52dgj4rksma