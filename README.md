# docker-eks-kubectl

Container with everything needed to make kubectl work with eks.

## Usage 
```
 docker run --rm -v $(pwd):/data ~/.kube/config:/root/.kube/config -e AWS_ACCESS_KEY_ID=CHANGEME -e AWS_SECRET_ACCESS_KEY=CHANGEME eks-kubectl:latest <sub commands>
```

You need to set your AWS_ACCESS_KEY and your AWS_SECRET_ACCESS_KEY. 

NB : You can generate you kubectl config file using this command `aws eks --region <region> update-kubeconfig --name <clustername>`
