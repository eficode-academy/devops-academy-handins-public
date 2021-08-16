# Kubernetes Hand-in

Welcome to the Kubernetes hand-in!

In this hand-in you will be creating Kubernetes configuration files for a small microserivce application.
Then you will deploy your configuration to a Kubernetes cluster in order to find a secret string that is returned from an endpoint on the application.

## Automatic Checker

First of all you must put your **SDU email address** in to the `kubernetes/student.txt` file.
This is used to match your hand-in back to you.

Each exercise has files associated with it that you must modify, these are located in either the `kubernetes_yaml` or `secret` directories in `devops-academy-handins-public/kubernetes`.

**If you do not use the template, your hand-in will not be graded!**

In the `devops-academy-handins-public/kubernetes` directory you will find the `check.sh` script which you can use to check the correctness of your submission.

You use the checker by calling the script `bash check.sh --exercise1` to check exercise 1, use `--exercise2` for exercise 2, and so on.
`--all` will check all exercises and give you an overall score.

After solving the exercises you will be submitting the Kubernetes yaml and secret files that you have modified.

## Submitting the Hand-in

When you are ready to submit your hand-in, use the `zip.sh` script in the `kubernetes` directory to create a zip file that has the structure that the automatic checker expects.

Run the script with:

```sh
bash zip.sh
```

This will produce a file named `kubernetes-<your-email>.zip` which is what you hand in.

**If you submit your hand-in any other way, it will not be graded!**

---

# Exercise 1. Application Deployment

We will be deploying a microservice application consisting of three different services, `a`, `b` and `c`.
The `a` application acts as the "frontend" providing and API that you can query, and it will communicate with the `b` and `c` services.

Your task is to create a Kubernetes deployment file for each of the services.

Use the provided template files in `devops-academy-handins-public/kubernetes/kubernetes_yaml`.
Your three deployments should be in the files `deployment-a.yaml`, `deployment-b.yaml` and `deployment-c`.

## Tasks:

- Create three Kubernetes deployments:
  - The deployments must use their respective images: `eficodeacademy/devopsacademyX` where `X is one of [a b c]`.
    - The images are already built and pushed to docker hub, so you just have to create the Kubernetes deployments, using the images.
  - The name of the deployments must be `deployment-X` where `X is one of [a b c]`
  - The deployments must have the label `app: deployment-X` where `X is one of [a b c]`
  - The replicaset selector must match the label `app: deployment-X` where `X is one of [a b c]`
  - Pods created from the deployment must have the label `app: deployment-X` where `X is one of [a b c]`
  - The container in the pod must have the name `devopsacademyX` where `X is one of [a b c]`

## Checker

Use: `bash check.sh --exercise1` to check your solution.

# Exercise 2: Service Discovery

In order to networking and service discovery for the services in our application we will be using Kubernetes `services`.

you must create a three different service configurations, one for each of your deployments.

Use the provided template files in `devops-academy-handins-public/kubernetes/kubernetes_yaml`.
Your three deployments should be in the files `service-a.yaml`, `service-b.yaml` and `service-c`.

## Tasks:

- Create three Kubernetes services:

  - The name of the services must be `service-X` where `X is one of [a b c]`
  - The service must have the label `app: deployment-X` where `X is one of [a b c]`
  - The service selector must match the label `app: deployment-X` where `X is one of [a b c]`
  - The service must listen on port `5000` and forward traffic to port `5000`
  - The service must use the protocol `TCP`.
  - `service a` must be of type `NodePort` and `service b` and `service c` must be of type `ClusterIP`.

## Checker

Use: `bash check.sh --exercise2` to check your solution.

# Exercise 3: Environment Configuration

In order to provide environment specific configuration for our application, we will use a `configmap` to provide a key for the `c service`.

Therefore you must create a configmap object and mount the key from the configmap to the pods created from the `c deployment`.

Use the provided template files in `devops-academy-handins-public/kubernetes/kubernetes_yaml`.
Your configmap should be in the file `configmap-c.yaml`.
You must modify the `deployment-c.yaml` to load the key from the configmap.

## Tasks:

- Create a configmap configuration:
  - The name of the configmap must be: `deployment-c-configmap`
  - The configmap must contain a data point with the key `KEY` and the value `'123456789012345678901234'`.
- Modify the `deployment-c.yaml` to set an environment variable from the configmap:
  - Add an environment variable named `KEY`.
  - The value of the environment variable must be loaded from a reference to the configmap-c data point named `KEY`.

## Checker

Use: `bash check.sh --exercise3` to check your solution.

# Exercise4: Deploy the application and get the secret

Now that you have all of the objects needed to deploy your application to Kubernetes, we will deploy it to a cluster.
Once deployed, we will query an endpoint, if the configuration is correct, it will return a hash of string, that will let you verify that everything is correctly deployed.

You can deploy the application to the cluster provided, that you used for doing the Kubernetes-katas, or you can run it locally with, e.g. [kind](https://kind.sigs.k8s.io/) or [minikube](https://minikube.sigs.k8s.io/docs/).

The result of querying the endpoint must be put in the `secret/secret.txt` file.

## Tasks:

- Deploy your Kubernetes yaml to a cluster.
- Access the endpoint of `service-a`, and make a HTTP request to the path `/ihopeitworks`.
- Put the response in the `secret/secret.txt` file.

(If you use `curl` to make the HTTP request it might print a `%` to indicate the end of the response body, you should not include this in the `secret.txt` file.)

## Checker

Use: `bash check.sh --exercise4` to check your solution.
