# Chapter 2: Server Side

- The purpose of the chapter is to design an app from a high level point of view

## Backend Design
- The app should allow us to upload/download files - preferably media applications
- Additionally, we'll be storing information about the uploaded files and be able to run queries to find files by name and download the applications back to us.
- We'll be using the RESTful API
- This will be done by creating two microservices
    - Uploads/downloads. Needs persistent storage to have place to retreive the data later
    - Quering data. The retrieval service will be the sole service to call out the database.
- See page 37 for basic design of microservice architecture - TODO (add image to repo)


## Database Design
- The database is simple
- Two tables: the media data table, and the comments table linked in a one-to-many relationship
- In page 39 (Fig.2-3) YOu can see the basic design of the database architecture - TODO (add image to repo)
- Instead of a relational table, some enumerations were added for data references that do not change often: media_type, location_type, and media_audience_type
- Although much of this database table is generic, there will be specifics particular with enumeration that use Postgres exclusively.

## RESTful Endpoints
- Through RESTful endpoints our database design and microservice design will communicate with each other.
- This subsection is just to point out the endpoints but it addresses how each endpoint works. 
- The RESTful endpoints are presented in page 40 in table 2-1.

## Deployment 

- In this chapter there's no deployment but in future chapters the future tools will be used for the deployment:
    - Docker: images for our application
    - Kubernetes: To create the deployment environment
    - Helm: for package managing our deployment environments

## Web Framework

- The heart of any modern application is the backend server running our web framework that serves up static and dynamic data as well as updates and queries to the database.

- There are many frameworks. At the time this book was written __Iron__ made most sense and will be used through this chapter.

## Start Up Basic Iron

This section will start with Iron's hello world example, and progressively writing more advance calls until we write in full the application we'll be using

### Hello World

The hello world example using Iron's Rust crate is under the hello-world/ directory

