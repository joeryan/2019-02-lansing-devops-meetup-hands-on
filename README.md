# Lansing DevOps Meetup - Hands-on Workshop

## Summary

This was begun from an Azure DevOps Project template for a Node JS app. The app itself will not be anything exciting.

## Usage

There are two node projects (Applications and Tests), an ARM template, and helper scripts. Descriptions of each are below.

### Node Application

To start the app locally, you should be able to just change to the `Application` directory and executing the following:

```bash
cd Application
npm install
npm run start:debug
```

If you find the debugging output to be too much, you can just run `npm run start`. Once the app has started, you can reach it at [http://localhost:3000](http://localhost:3000)

### Node Tests

There are both Unit Tests and Functional Tests. The unit tests run against a localhost server on port 4000 and can be run to output to the console, or to create JUnit output as a file.  Typically, for local development you would want to run the unit tests with console output and in a CI environment, you would want the JUnit output. Functional tests run against a running instance of the app. For local development you would most likely run against the app running at http://localhost:3000 while the functional tests that run as part of the deployment process run against the URL for the deployed environment.

#### Unit tests with console output

```bash
cd Tests
npm install
npm run unittest
```

#### Unit tests with JUnit output

```bash
cd Tests
npm install
npm run unittest:report
```

#### Functional tests with console output

```bash
cd Tests
npm install
npm run functionaltest
```

#### Functional tests with JUnit output

```bash
cd Tests
npm install
npm run functionaltest:report
```

## ARM Templates

The ARM template will be used to create an App Service in Azure.

## Helper Scripts

The `scripts` folder has scripts that can help with the CI/CD pipeline.