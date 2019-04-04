# docker-eks-kubectl

Container with everything needed to make kubectl work with eks.

## Usage 
```
 docker run --rm -v $(pwd):/data -e AWS_ACCESS_KEY_ID=CHANGEME -e AWS_SECRET_ACCESS_KEY=CHANGEME eks-kubectl:test --kubeconfig /data/.kube/config get svc
```

You must set the kubeconfig path because kubectl will search by default in ~/.kube/config
You also need to set your AWS_ACCESS_KEY and your AWS_SECRET_ACCESS_KEY. 

NB : You can generate you kubectl config file using this command `aws eks --region <region> update-kubeconfig --name <clustername>`
