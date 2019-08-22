## Description
Codedeployer is a small library that helps deploying any application or codebase to groups of ec2 instances through AWS Codedeploy.
The deploy process needs pre-configuration on the AWS side, so ask your nearest ops.

The deployment works like this:
- an archive is created containing the codebase and a special `appspec.yml` file needed by Codedeploy
- this archive is uploaded to S3
- a series of calls is made to the Codedeploy API to initiate deployments
- all ec2 instance with the Codedeployer agent installed continuously poll Codedeploy and start the deployment the we initiated

This process shifts the deployment from a push system like Idephix or Deployer that requires ssh access to machines in order to rsync the code, to a poll system where the instances are notified of a new deployment request by the agent and download the application archive, running all the configured scripts to complete the deployment.

## Installation and usage
1. Run `composer require mriva/codedeployer`
2. Run `bin/deploy --setup`
3. Create directories named as deployment groups
4. Add scripts inside deployment groups directories
5. Compile `config.php`
6. Run `bin/deploy`

**Point 1** and **2** are self explanatory.

**Point 3** requires you to create a directory under `deploy/hook-script` for each instance group you want to deploy to.
For example, if you wish to deploy to `admin` and `frontend` instances, the tree will look like this:

```
deploy/
└── hook-scripts/
    ├── ec2-admin/
    └── ec2-frontend/
```
Currently available instance groups are:
- `ec2-admin`
- `ec2-frontend`
- `ec2-reports`
- `ec2-sandbox`
- `ec2-website`

**Point 4** requires you to populate the directories from point 3.
AWS Codedeploy offers various hooks during the process, here we use two of them:
- `AfterInstall`
- `ApplicationStart`

`AfterInstall` is the first hook available and we use it to actually copy all the code to the real target directory.

`ApplicationStart` is meant to run any command needed to have the application up again after the new code is copied. This is just a convention, you might also put all the code in `AfterInstall` for simplicity.

For more information on AWS Codedeploy hooks see: https://docs.aws.amazon.com/codedeploy/latest/userguide/reference-appspec-file-structure-hooks.html#appspec-hooks-server

We create script in those directories named after these hooks, so assuming you go for the easy version with just `AfterInstall`, your tree should look like this:

```
deploy/
└── hook-scripts/
    ├── ec2-admin/
    │   └── AfterInstall.sh
    └── ec2-frontend/
        └── AfterInstall.sh

```

these script will be run by the main `hook-wrapper.sh` which is defined as the main hook in `appspec.yml`

**Point 5** only requires you to compile a few application related options, the file should be self explanatory as well.

## TODO
- refactor config.php with some other form of configuration
- write Codedeploy new activation (app + groups) through CLI skipping web console
- sanity checks
