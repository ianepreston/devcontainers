# Development Containers Images

A **development container** is a running [Docker](https://www.docker.com) container with a well-defined tool/runtime stack and its prerequisites. It allows you to use a container as a full-featured development environment which can be used to run an application, to separate tools, libraries, or runtimes needed for working with a codebase, and to aid in continuous integration and testing.

This repository contains a set of **dev container images** which are Docker images built with [dev container features](https://github.com/devcontainers/features).

## Contents
 
- [`src`](src) - Contains reusable dev container images.

## Notes from Ian

After starting this up you have to run `yarn install` before you can do local builds.
Might add this to the devcontainer startup command spec after I see if that breaks anything in CI/CD