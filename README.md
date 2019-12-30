# Bootstrap a new service

1. Copy .github folder to your new repository. You dont have to change anything within the workflow
2. Put all secrets to your Github project (settings->secrets)
- ```GKE_CLUSTER || Kubernetes Cluster name```
- ```GKE_EMAIL || Service Account Mail```
- ```GKE_KEY || base64 encoded Service Accoung JSON```
- ```GKE_PROJECT || Used Google Cloud project```
- ```GKE_ZONE || Used Google Cloud Zoned```
- ```IMAGE || Desired Service/Image name```
3. Paste your Kube Deployment definitions to the Repo's root folder

# What is greate about Github actions?
- Use already uploaded actions is easy and very fast.
- Strong customizing options due to the possibility to write own actions for nearly everthing.
- Built in security storage for deployment secrets with easy access
```
${{ secrets.GKE_PROJECT }}
```
- Its easy, convinient and fast to run multiple tasks at once. For example its as easy like this to build an app with 3 different versions of Java
```
    matrix:
      java: [ '8', '11.0.3', '13' ]
    steps:
    - uses: actions/checkout@v1
    - name: Set up Java ${{ matrix.java }}
      uses: actions/setup-java@v1
      with:
        java-version: ${{ matrix.java }}

```

# What isn't possible at the moment?
- Secrets cant be placed on an org level. You have to define every Secrets per Repository.
```
"This is something that is on our backlog for a future update." 09-11-2019 10:04 AM
https://github.community/t5/GitHub-Actions/Secrets-on-Team-and-Organization-level/td-p/29745
```
- As far as I know there is no possibility to have an internal actions Marketplace at the moment. You probably have to copy the workflows manually.
Maybe its possible with approaching the action like below
```
Example using versioned actions

steps:    
  - uses: actions/setup-node@74bc508 # Reference a specific commit
  - uses: actions/setup-node@v1      # Reference the major version of a release   
  - uses: actions/setup-node@v1.2    # Reference a minor version of a release  
  - uses: actions/setup-node@master  # Reference a branch
Example using a public action

{owner}/{repo}@{ref}

You can specific branch, ref, or SHA in a public GitHub repository.

jobs:
  my_first_job:
    steps:
      - name: My first step
      # Uses the master branch of a public repository
        uses: actions/heroku@master
      # use a specific version tag of a public repository
      - name: My second step
        uses: actions/aws@v2.0.1
Example using a public action in a subdirectory

{owner}/{repo}/{path}@{ref}

A subdirectory in a public GitHub repository at a specific branch, ref, or SHA.

jobs:
  my_first_job:
    steps:
      - name: My first step
        uses: actions/aws/ec2@master
Example using action in the same repository as the workflow

./path/to/dir

The path to the directory that contains the action in your workflow's repository.

jobs:
  my_first_job:
    steps:
      - name: My first step
        uses: ./.github/actions/my-action
```