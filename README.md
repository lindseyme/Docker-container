# Docker containerization
Containerization is a lightweight alternative to a virtual machine that involves encapsulating an application in a container with its own operating system. 
I used docker to containerize my simulations checkout. The application uses ReactJs.


## About the simulations checkpoint
The application is about a writing platform called AUTHORS HAVEN where different people express themselves through writing and also get an aundience for the written articles.
The application was written in react/redux.

## Setting up the environment
- Download docker for your machine
```https://www.docker.com/get-started```

- Clone the repository
```https://github.com/lindseyme/Docker-container.git ```
The dockerfile is already in the project folder when it has been cloned.

## Running the application
- Build a docker image
``` docker build -t <imageName> .```

- Run the container on any port of your choice
``` docker run -p 3000:3000 <imageName> ```
Checkout if the container is running locally using your localhost
``` localhost:3000 ``` 
If the application has been containerized successfully, then you can push the image to GCP.

## Pushing the created image to GCP
- Create a kubernetes cluster on GCP.

- Connect to the cluster.

- Push the image created locally to the created cluster

``` docker tag <imageName> eu.gcr.io/<projectID>/<imageName>```

``` docker push eu.gcr.io/<projectID>/<imageName>```

``` eu.gcr.io ``` specifies the region of the registry's storage, hosts the image in the European Union

## Deploying the cluster
- Login to GCP console to deploy the image on the cluster

``` gcloud config set project <projectID> ```

``` gcloud config set compute/zone <zone> ```

- Create a cluster
``` gcloud container clusters create <clusterName> ```

- Fetch the cluster authentication credentials
``` gcloud container clusters get-credentials <clusterName> ```

- Run your deployment
``` kubectl run <instanceName> --image eu.gcr.io/<projectID/imageName> --port 3000 ```

- Expose the service
``` kubectl expose deployment <instanceName> --type LoadBalancer ```

You can access the application on 
``` http://35.189.82.227:3000/ ```

