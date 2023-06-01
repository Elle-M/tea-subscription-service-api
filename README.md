<h1 align="center">Tea Subscription Service API Documentation</h1>

---

---

## Table of Contents
- [Product Overview](#product-overview)
- [Features](#Features)
- [API Documentation](#api-documentation)
- [Built With](#built-with)
- [Technologies Used](#technologies-used)
- [Database Schema](#database-schema)
- [Endpoints](#end-points)
- [Running the Test Suit](#running-the-test-suit)
- [Getting Started](#getting-started)
- [Author](#author)

## Product Overview

The Tea Subscription Service API is a Ruby on Rails-based application that allows customers to subscribe to tea subscriptions. This API provides endpoints to manage customer information and subscriptions, enabling users to create, update, retrieve, and delete relevant data.

## Features

The API offers the following features:

* Customer Management: Create, update, and delete customer information, including their first name, last name, email, and address.
* Tea Management: Create, update, and delete tea details, such as the title, description, temperature, and brew time.
* Subscription Management: Subscribe customers to tea subscriptions, cancel subscriptions, and retrieve a customer's active and cancelled subscriptions.
* Flexible Subscription Options: Define custom subscription frequencies to accommodate various customer preferences.
* RESTful API Design: Follows REST principles for clear and intuitive API endpoints.
* Data Validation: Validate input data to ensure accuracy and consistency.
* Error Handling: Handle errors gracefully and provide meaningful error responses.
* Test-Driven Development: Includes comprehensive unit tests to ensure code quality and maintainability.

## API Documentation

### Base URL

The base URL for accessing the API is https://example.com/api/v1/

## Built With

![Ruby on Rails](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)

## Technologies Used

The Tea Subscription Service API is built using the following technologies:

* Ruby 3.1.1
* Ruby on Rails 7.0
* PostgreSQL (database)
* RSpec (testing framework)
* JSON (data interchange format)
* RESTful principles

## Database Schema

<img width="830" alt="tea" src="https://github.com/Elle-M/tea-subscription-service-apis/assets/113124260/ec87af03-c30a-4ec0-a899-e77ae10532e1">


## Endpoints

---

### Customers

---
<br>

<details>
  <summary>Get Customer Information</summary><br>
  
  Description: 
    
  Retrieves information about a specific customer.
  
  Endpoint:
  
  ```JS
  GET /api/v1/customers/:id
  ```
  
  Params: 

  | Name | Requirement | Type | Description |
  | ----- | ----------- | -----| -------------- | 
  | `id` | Required | integer | The ID of the customer.
 
  <br>

  Response: 

  | Result | Status |
  | ------- | ------| 
  | `Success` | 200 |
  | `Failure`| 400 |


  ```JSON
{
    "id": 2,
    "first_name": "Jane",
    "last_name": "Smith",
    "email": "jane.smith@example.com",
    "address": "444 Sunny Street",
    "created_at": "2023-06-01T17:51:04.749Z",
    "updated_at": "2023-06-01T17:51:04.749Z"
}
  ```
 </details>

<br>

<details>
  <summary>Update Customer</summary><br>
  
 Description: 
    
 Updates the information of a specific customer.
  
  Endpoint:
  
  ```JS
  PUT /api/v1/customers/:id
  ```
  
  Params: 

  | Name | Requirement | Type | Description |
  | ----- | ----------- | -----| -------------- | 
  | `id` | Required | integer | The ID of the customer.
  | `first_name` | Required | string | The updated first name of the customer.
  | `last_name ` | Required | string | The updated last name of the customer.
  | `email` | Required | string |The updated email address of the customer.
  | `address` | Required | string | The updated address of the customer.

  <br>

  Response: 

  | Result | Status |
  | ------- | ------| 
  | `Success` | 200 |
  | `Failure`| 400 |


  ```JSON
{
    "id": 1,
    "first_name": "John",
    "last_name": "Doe",
    "email": "johndoe@example.com",
    "address": "123 Main St",
    "created_at": "2023-06-01T01:17:16.912Z",
    "updated_at": "2023-06-01T01:17:16.912Z"
}
  ```
 </details>
 
<br>

<details>
  <summary>Delete Customer</summary><br>
  

 Description: 
    
 Deletes a specific customer.
  
  Endpoint:
  
  ```JS
  DELETE /api/v1/customers/:id
  ```
  
  Params: 

  | Name | Requirement | Type | Description |
  | ----- | ----------- | -----| -------------- | 
  | `id` | Required | integer | The ID of the customer.
 
  <br>

  Response: 

  | Result | Status |
  | ------- | ------| 
  | `No Content`| 404 |


  ```JSON
{
    "id": 1,
    "first_name": "John",
    "last_name": "Doe",
    "email": "johndoe@example.com",
    "address": "123 Main St",
    "created_at": "2023-06-01T01:17:16.912Z",
    "updated_at": "2023-06-01T01:17:16.912Z"
}
  ```
 </details>
 
 <br>

---

### Customer Subsciptions

---

<br>

<details>
  <summary>Get Customer Subscriptions</summary><br>
  

Description: 
    
Retrieves information about a specific customer.
  
  Endpoint:
  
  ```JS
  GET /api/v1/customers/:customer_id/subscriptions
  ```
  
  Params: 

  | Name | Requirement | Type | Description |
  | ----- | ----------- | -----| -------------- | 
  | `customer_id` | Required | integer | The ID of the customer.
 

  <br>

  Response: 

  | Result | Status |
  | ------- | ------| 
  | `Success` | 200 |
  | `Failure`| 400 |


  ```JSON
[
    {
      "id": 1,
      "title": "Monthly Subscription",
      "price": 19,
      "status": "active",
      "frequency": "monthly",
      "created_at": "2023-06-01T02:03:22.477Z",
      "updated_at": "2023-06-01T02:03:22.477Z",
      "tea_id": 1,
      "customer_id": 1,
      "deleted_at": null
    },
  
    {
      "id": 3,
      "title": "Two Week Subscription",
      "price": 14,
      "status": "active",
      "frequency": "two week",
      "created_at": "2023-06-01T17:29:44.564Z",
      "updated_at": "2023-06-01T17:29:44.564Z",
      "tea_id": 2,
      "customer_id": 1,
      "deleted_at": null
    }
  
    {
      "id": 2,
      "title": "Two Week Subscription",
      "price": 14,
      "status": "active",
      "frequency": "Two Week",
      "created_at": "2023-06-01T17:23:48.202Z",
      "updated_at": "2023-06-01T17:23:48.202Z",
      "tea_id": 2,
      "customer_id": 1,
      "deleted_at": "2023-06-01T17:32:00.051Z"
    }

]
  ```
 </details>
 
 <br>

<details>
  <summary>Create Customer Subscriptions</summary><br>
  
 Description: 
    
 Retrieves information about a specific customer.
  
  Endpoint:
  
  ```JS
  GET /api/v1/customers/:customer_id/subscriptions
  ```
  
  Params: 

  | Name | Requirement | Type | Description |
  | ----- | ----------- | -----| -------------- | 
  | `customer_id` | Required | integer | The ID of the customer.
  | `tea_id` | Required | integer | The ID of the tea for the subscription.
  | `title` | Required | string | The title of the subscription.
  | `price | Required | string | The price of the subscription.
  | `status | Required | string | The status of the subscription (active or cancelled).
  | `frequency` | Required | string | The frequency of the subscription.
 

  <br>

  Response: 

  | Result | Status |
  | ------- | ------| 
  | `Success` | 200 |
  | `Failure`| 400 |


  ```JSON
{
    "id": 1,
    "customer_id": 1,
    "tea_id": 1,
    "title": "Two Week Subscription",
    "price": 14.99,
    "status": "active",
    "frequency": "Two Week",
    "created_at": "2023-05-30T12:00:00Z",
    "updated_at": "2023-05-30T12:30:00Z"
}

  ```
 </details>
 
 <br>
 
 
<details>
  <summary>Delete Subscription</summary><br>
  
 Description: 
    
 Deletes a specific subscription.
  
  Endpoint:
  
  ```JS
  DELETE /api/v1/customers/:customer_id/subscriptions/:id
  ```
  
  Params: 

  | Name | Requirement | Type | Description |
  | ----- | ----------- | -----| -------------- | 
  | `customer_id` | Required | integer | The ID of the customer.
  | `id` | Required | integer | The ID of the subscription.
 

  <br>

  Response: 

  | Result | Status |
  | ------- | ------| 
  | `No Content`| 404 |

 </details>
 
 <br>


---

## Getting Started

To set up the Tea Subscription Service API locally, follow these steps:

1. `Clone the repository from GitHub.`
1. `Install Ruby 3.1.1 and PostgreSQL on your local machine.`
1. `Install the required dependencies using Bundler.`
1. `Set up the database by running database migrations.`
1. `Optionally, seed the database with sample data.`
1. `Start the Rails server.`
1. `Access the API endpoints using a suitable API client (e.g., cURL, Postman).`
1. `Refer to the project's README file for detailed instructions on installation, configuration, and usage.`

 ## Running the Test Suite
 
 To run the test suite for Tea Subscription Service API locally, follow these steps:
 
1. `Navigate to desired directory`
1. `Run cd tea-subscription-service-apis`
1. `Run bundle`
1. `Run rails db:{create,migrate}`
1. `Run bundle exec rspec`


 ## Author
 
 **Elle Majors** | [Github](https://github.com/Elle-M) | [LinkedIn](https://www.linkedin.com/in/ellemajors) |
