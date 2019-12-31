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
- Right now it isn't possible to use selfwritten actions from private repos, unless they're stored in the same repo.
If you want to use your own actions, make sure to set repo access to public and specify them like this
```
    steps:
    - name: Use public selfwritten action
      uses: metronom-dx-test/hello-world-action@master
      with:
        who-to-greet: 'Metronom'
```
```
ORG_NAME/REPO_NAME/TAG_OR_BRANCH
```
- Right now there is no marketplace like thing for orgs. It's on the roadmap, but likely not shipped in the foreseeable futures.