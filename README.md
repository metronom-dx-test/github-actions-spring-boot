# Bootstrap a new service

1. Copy .github to your new repository. You dont have to change anything within the workflow
2. Put all secrets to your Github project (settings->secrets)
- GKE_CLUSTER || Kubernetes Cluster name
- GKE_EMAIL || Service Account Mail
- GKE_KEY || base64 encoded Service Accoung JSON
- GKE_PROJECT || Used Google Cloud project
- GKE_ZONE || Used Google Cloud Zoned
- IMAGE || Desired Service/Image name
3. Paste your Kube Deployment definitions to the Repo's root folder

# What isn't possible at the moment?
- Secrets cant be placed on an org level. You have to define every Secrets per Repository.
- As far as I know there is no possibility to have an internal actions Marketplace at the moment. You probably have to copy the workflows manually
