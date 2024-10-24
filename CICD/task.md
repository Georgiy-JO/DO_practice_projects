# CI/CD bisics

Development of a simple **CI/CD** for a project. Building, testing, deployment.

The russian version of the task can be found in the repository.


## Contents

1. [Theory](#theory)  
    1.1. [CI/CD basics](#ci-cd-basics)  
    1.2. [CI basics](#ci-basics)  
    1.3. [CD basics](#cd-basics)
2. [Tasks](#tasks)  
    2.1. [Setting up the gitlab-runner](#part-1-setting-up-the-gitlab-runner)  
    2.2. [Building](#part-2-building)  
    2.3. [Codestyle test](#part-3-codestyle-test)   
    2.4. [Integration tests](#part-4-integration-tests)  
    2.5. [Deployment stage](#part-5-deployment-stage)  
    2.6. [Notifications](#part-6-notifications)  
4. [Chapter IV](#chapter-iv)

## Theory

### **CI/CD** basics

**CI/CD** is a set of principles and practices that enable more frequent and secure deployment of software changes.

Reasons for using **CI/CD**:
- Team development;
- Long software life cycle;
- Shortened release cycle;
- Difficulties in deployment and testing of large systems;
- Human factor.

**CI/CD** pipeline is a sequence of actions (scripts) for a particular version of the code in the repository, which is started automatically when changes are made.

### **CI** basics

**CI** (Continuous Integration) refers to the integration of individual pieces of application code with each other.
**CI** normally performs two tasks as described below.

- BUILD:
    - Checking if the code is being built at all;
    - Prepare the artifacts for the next stages;
- TEST:
    - Codestyle tests;
    - Unit tests;
    - Integration tests;
    - Other tests you have;
    - Test reports.

### **CD** basics

**CD** (Continuous Delivery) is a continuous integration extension, as it automatically deploys all code changes to the test and/or production environment after the build stage.
**CD** can perform the following tasks.

- PUBLISH (If using a deployment docker):
    - Build container images;
    - Push the images to where they will be taken from for deployment;
- UPDATE CONFIGS:
    - Update configuration on the machines;
- DEPLOY STAGING:
    - Deployment of test environment for manual tests, QA, and other non-automated checks;
    - Can be run manually or automatically if CI stages are passed successfully;
- DEPLOY PRODUCTION:
    - Deploying a new version of the system on "production";
    - This stage better be run manually rather than automatically;
    - If you want, you can set it up for a specific branch of the repository only (master, release, etc.).

## Tasks

As a result of the work you must have two dumps of the virtual machine images described below. 



### Part 1. Setting up the **gitlab-runner**

##### Start *Ubuntu Server 22.04 LTS* virtual machine.
*Be prepared to save a dump of the virtual machine image at the end of the project.*

##### Download and install **gitlab-runner** on the virtual machine.

##### Run **gitlab-runner** and register it for use in the current project (*DO6_CICD*).
- You will need a URL and a token for runner registration, that can be obtained from the task page on the platform.



### Part 2. Building

#### Write a stage for **CI** to build applications from the *C2_SimpleBashUtils* project.

##### In the _gitlab-ci.yml_ file, add a stage to start the building via makefile from the _C2_ project.

##### Save post-build files (artifacts) to a random directory with a 30-day retention period.



### Part 3. Codestyle test

#### Write a stage for **CI** that runs a codestyle script (*clang-format*).

##### If the codefile didn't pass, "fail" the pipeline.

##### In the pipeline, display the output of the *clang-format* utility.



### Part 4. Integration tests

#### Write a stage for **CI** that runs your integration tests from the same project.

##### Run this stage automatically only if the build and codestyle test passes successfully.

##### If tests didn't pass, "fail" the pipeline.

##### In the pipeline, display the output of the succeeded / failed integration tests.



### Part 5. Deployment stage 

##### Start the second virtual machine *Ubuntu Server 22.04 LTS*.

#### Write a stage for **CD** that "deploys" the project on another virtual machine.

##### Run this stage manually, if all the previous stages have passed successfully.

##### Write a bash script which copies the files received after the building (artifacts) into the */usr/local/bin* directory of the second virtual machine using **ssh** and **scp**.

##### In the _gitlab-ci.yml_ file, add a stage to run the script you have written.

##### In case of an error, fail the pipeline.

As a result, you should have applications from a project ready to run on the second virtual machine.

##### Save dumps of virtual machine images.
**P.S. Do not upload dumps to git under any circumstances!**
- Don't forget to run the pipeline with the last commit in the repository.


### Part 6.  Notifications
* [useful notes](/CICD/materials/notifications.md)

##### Set up notifications of successful/unsuccessful pipeline execution via bot named "[your nickname] DO6 CI/CD" in *Telegram*.
- The text of the notification must contain information on the successful passing of both **CI** and **CD** stages.
- The rest of the notification text may be arbitrary.
