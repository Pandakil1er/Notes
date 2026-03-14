# Chapter 1: Scale from Zero to Millions of Users

[](https://github.com/liquidslr/system-design-notes/tree/main/01.%20Scaling#chapter-1-scale-from-zero-to-millions-of-users)

## Introduction

[](https://github.com/liquidslr/system-design-notes/tree/main/01.%20Scaling#introduction)

Scaling a system to support millions of users is a complex, iterative journey requiring refinement and optimization. This chapter outlines how to begin with a single server setup and scale the architecture step by step to handle millions of users.

---

## Section 1: Single Server Setup

[](https://github.com/liquidslr/system-design-notes/tree/main/01.%20Scaling#section-1-single-server-setup)

Initially, all components (web app, database, cache) run on a single server.

[![](https://github.com/liquidslr/system-design-notes/raw/main/01.%20Scaling/images/single-server.png)](https://github.com/liquidslr/system-design-notes/blob/main/01.%20Scaling/images/single-server.png)

### Request Flow

[](https://github.com/liquidslr/system-design-notes/tree/main/01.%20Scaling#request-flow)

1. Users access the application via domain names (e.g., `api.mysite.com`), resolved to IP addresses using DNS.
2. IP address of the web-server is returned to the browser or mobile app.
3. HTTP requests are sent to the web server, which returns HTML or JSON responses.

### Traffic Sources

[](https://github.com/liquidslr/system-design-notes/tree/main/01.%20Scaling#traffic-sources)

1. **Web Applications:** Use server-side languages (e.g., Python, Java) for business logic and client-side languages (e.g., JavaScript, HTML) for presentation.
2. **Mobile Applications:** Communicate with the web server using HTTP and JSON for lightweight data exchange.

---

## Section 2: Database Separation

[](https://github.com/liquidslr/system-design-notes/tree/main/01.%20Scaling#section-2-database-separation)

As the user base grows, the database is moved to a dedicated server to allow independent scaling of web and database tiers.

[![](https://github.com/liquidslr/system-design-notes/raw/main/01.%20Scaling/images/database.png)](https://github.com/liquidslr/system-design-notes/blob/main/01.%20Scaling/images/database.png)

### Database Choices

[](https://github.com/liquidslr/system-design-notes/tree/main/01.%20Scaling#database-choices)

1. **Relational Databases (SQL):** Structured data stored in tables. Examples: MySQL, PostgreSQL.
2. **Non-Relational Databases (NoSQL):** Suitable for unstructured data or low-latency requirements. Categories include:
    - Key-Value Stores
    - Graph Databases
    - Column Stores
    - Document Stores

- Non-relational databases might be the right choice if:
    - application requires super-low latency.
    - data is unstructured, or there is no relational data.
    - only need to serialize and deserialize data (JSON, XML, YAML, etc.).
    - need to store a massive amount of data.

---

## Section 3: Vertical vs Horizontal Scaling

[](https://github.com/liquidslr/system-design-notes/tree/main/01.%20Scaling#section-3-vertical-vs-horizontal-scaling)

### Vertical Scaling

[](https://github.com/liquidslr/system-design-notes/tree/main/01.%20Scaling#vertical-scaling)

- Adds more resources (CPU, RAM) to existing servers.
- Limited by hardware constraints and lacks redundancy.

### Horizontal Scaling

[](https://github.com/liquidslr/system-design-notes/tree/main/01.%20Scaling#horizontal-scaling)

- Adds more servers to the pool, making it more suitable for large-scale systems.
- A load balancer is used to handle the request routing between the servers.

---

## Section 4: Load Balancer

[](https://github.com/liquidslr/system-design-notes/tree/main/01.%20Scaling#section-4-load-balancer)

[![](https://github.com/liquidslr/system-design-notes/raw/main/01.%20Scaling/images/load-balancer.png)](https://github.com/liquidslr/system-design-notes/blob/main/01.%20Scaling/images/load-balancer.png)

A **load balancer** distributes traffic among multiple servers. Benefits include:

1. Redundancy: If a server goes offline, traffic is rerouted.
    - If server 1 goes offline, all the traffic will be routed to server 2.
2. Scalability: Easily add servers to handle traffic spikes.
    - If the website traffic grows rapidly, subsequent servers can be added to handle the additional traffic.

---

## Section 5: Database Replication

[](https://github.com/liquidslr/system-design-notes/tree/main/01.%20Scaling#section-5-database-replication)

[![](https://github.com/liquidslr/system-design-notes/raw/main/01.%20Scaling/images/database-replication.png)](https://github.com/liquidslr/system-design-notes/blob/main/01.%20Scaling/images/database-replication.png)

### Master-Slave Model

[](https://github.com/liquidslr/system-design-notes/tree/main/01.%20Scaling#master-slave-model)

- **Master Database:** Handles write operations.
    - All the data-modifying commands like insert, delete, or update must be sent to the master database.
- **Slave Databases:** Handle read operations, improving performance and reliability.
    - Since the ratio of reads to writes is higher is most applications; thus, the number of slave databases in a system is usually larger than the number of master databases.

### Benefits

[](https://github.com/liquidslr/system-design-notes/tree/main/01.%20Scaling#benefits)

1. Improved performance through parallel read operations.
2. High availability and data reliability through redundancy.

### Failure Handling

[](https://github.com/liquidslr/system-design-notes/tree/main/01.%20Scaling#failure-handling)

- If only one slave database is available and it goes offline, read operations will be directed to the master database temporarily.
- In case multiple slave databases are available, read operations are redirected to other healthy slave databases and a new server will replace the old one.
- If the master database goes offline, a slave database will be promoted to be the new master.
- In production system the chosen slave database might not be up to date, hence data needs to be updated by running data recovery scripts (methods like multi-masters and circular replication could help).

---

## Section 6: Caching

[](https://github.com/liquidslr/system-design-notes/tree/main/01.%20Scaling#section-6-caching)

A **cache** stores frequently accessed data in memory to reduce database load. The cache tier is a temporary data store layer, much faster than the database.

[![](https://github.com/liquidslr/system-design-notes/raw/main/01.%20Scaling/images/cache.png)](https://github.com/liquidslr/system-design-notes/blob/main/01.%20Scaling/images/cache.png)

### Caching considerations

[](https://github.com/liquidslr/system-design-notes/tree/main/01.%20Scaling#caching-considerations)

1. **Use case**: Consider using cache when data is read frequently but modified infrequently.
2. **Expiration Policies:** Once cached data is expired, it is removed from the cache. When there is no expiration policy, cached data will be stored in the memory permanently.
3. **Consistency:** This means keeping the data store and the cache in sync. Inconsistency can happen because data-modifying operations on the data store and cache are not in a single transaction.
4. **Mitigating failures**: A single cache server represents a potential single point of failure, multiple cache servers across different data centers are recommended to avoid SPOF.
5. **Eviction Policies:**: Once the cache is full, items need to be evicted to free up memory. LRU is the most popular cache eviction policy.

---

## Section 7: Content Delivery Network (CDN)

[](https://github.com/liquidslr/system-design-notes/tree/main/01.%20Scaling#section-7-content-delivery-network-cdn)

A **CDN** improves load times by caching static content (images, CSS, JavaScript) on geographically distributed servers.

[![](https://github.com/liquidslr/system-design-notes/raw/main/01.%20Scaling/images/cdn.png)](https://github.com/liquidslr/system-design-notes/blob/main/01.%20Scaling/images/cdn.png)

### Workflow

[](https://github.com/liquidslr/system-design-notes/tree/main/01.%20Scaling#workflow)

1. User requests content from the nearest CDN server.
2. If unavailable, content is fetched from the origin server and cached.

### CDN considerations

[](https://github.com/liquidslr/system-design-notes/tree/main/01.%20Scaling#cdn-considerations)

1. **Cost:** CDNs are run by third-party providers which charge for data transfers in and out of the CDN.
2. **Cache Expiry:** The cache expiry time should neither be too long nor too short.
3. **CDN fallback:** If there is a temporary CDN outage, clients should be able to detect the problem and request resources from the origin.
4. **Invalidating files:** If files are updated the cache should be invalidated to point to the updated files.

---

## Section 8: Stateless Web Tier

[](https://github.com/liquidslr/system-design-notes/tree/main/01.%20Scaling#section-8-stateless-web-tier)

By moving session data to a shared datastore, web servers become stateless. This allows:

1. Easier horizontal scaling.
2. Auto-scaling based on traffic.

[![](https://github.com/liquidslr/system-design-notes/raw/main/01.%20Scaling/images/stateless.png)](https://github.com/liquidslr/system-design-notes/blob/main/01.%20Scaling/images/stateless.png)

---

## Section 9: Multi-Data Center Setup

[](https://github.com/liquidslr/system-design-notes/tree/main/01.%20Scaling#section-9-multi-data-center-setup)

Deploying across multiple data centers improves availability and reduces latency. Strategies include:

[![](https://github.com/liquidslr/system-design-notes/raw/main/01.%20Scaling/images/data-center.png)](https://github.com/liquidslr/system-design-notes/blob/main/01.%20Scaling/images/data-center.png)

1. **GeoDNS Routing:** Direct users to the nearest data center.
2. **Data Replication:** Synchronize data across centers to prevent inconsistencies.

### Key considerations

[](https://github.com/liquidslr/system-design-notes/tree/main/01.%20Scaling#key-considerations)

- **Traffic redirection:** Effective tools are needed to direct traffic to the correct data center.
- **Data synchronization:** A common strategy is to replicate data across multiple data centers.
- **Test and deployment:** Automated deployment tools are vital to keep services consistent through all the data centers.

---

## Section 10: Message Queue

[](https://github.com/liquidslr/system-design-notes/tree/main/01.%20Scaling#section-10-message-queue)

A **message queue** is a durable component, stored in memory, that supports asynchronous communication. It serves as a buffer and distributes asynchronous requests.

[![](https://github.com/liquidslr/system-design-notes/raw/main/01.%20Scaling/images/message-queue.png)](https://github.com/liquidslr/system-design-notes/blob/main/01.%20Scaling/images/message-queue.png)

- Input services, called producers/publishers, create messages, and publish them to a message queue.
- Other services called consumers/subscribers, connect to the queue, and perform actions defined by the messages.

---

## Section 11: Logging, Metrics, and Automation

[](https://github.com/liquidslr/system-design-notes/tree/main/01.%20Scaling#section-11-logging-metrics-and-automation)

[![](https://github.com/liquidslr/system-design-notes/raw/main/01.%20Scaling/images/logging.png)](https://github.com/liquidslr/system-design-notes/blob/main/01.%20Scaling/images/logging.png)

### Importance

[](https://github.com/liquidslr/system-design-notes/tree/main/01.%20Scaling#importance)

1. **Logging:** Tracks errors and system health.
2. **Metrics:** Provides insights into performance and user activity.
3. **Automation:** Streamlines testing, deployment, and scaling.

---

## Section 12: Database Scaling

[](https://github.com/liquidslr/system-design-notes/tree/main/01.%20Scaling#section-12-database-scaling)

### Vertical Scaling

[](https://github.com/liquidslr/system-design-notes/tree/main/01.%20Scaling#vertical-scaling-1)

- Adds hardware resources but has physical and cost limitations.
- Has multiple drawbacks:
    - Greater risk of single point of failures.
    - Overall cost of vertical scaling is high

### Horizontal Scaling (Sharding)

[](https://github.com/liquidslr/system-design-notes/tree/main/01.%20Scaling#horizontal-scaling-sharding)

[![](https://github.com/liquidslr/system-design-notes/raw/main/01.%20Scaling/images/horizontal-scaling.png)](https://github.com/liquidslr/system-design-notes/blob/main/01.%20Scaling/images/horizontal-scaling.png)

- Divides data across multiple shards using keys (e.g., `user_id`).
    - Sharding separates large databases into smaller, more easily managed parts called shards.
    - Each shard shares the same schema, though the actual data on each shard is unique to the shard.
- Sharding key is critical when implementing a sharding strategy. When choosing a sharding key it is important to choose a key that can evenly distribute data.

#### Challenges

[](https://github.com/liquidslr/system-design-notes/tree/main/01.%20Scaling#challenges)

1. **Resharding data:** Resharding data is needed when:
    
    - Single shard could no longer hold more data due to rapid growth.
    - Certain shards might experience shard exhaustion faster than others due to uneven data distribution.
    - Consistent Hashing is used to overcome these problems
2. **Celebrity problem:** Excessive access to a specific shard could cause server overload.
    
    - To solve this problem, we may need to allocate a shard for each celebrity.
3. **Join and de-normalization:** Once a database has been sharded across multiple servers, it is hard to perform join operations across database shards.
    
    - A common workaround is to de-normalize the database so that queries can be performed in a single table.

---

## Conclusion

[](https://github.com/liquidslr/system-design-notes/tree/main/01.%20Scaling#conclusion)

### Key Takeaways

[](https://github.com/liquidslr/system-design-notes/tree/main/01.%20Scaling#key-takeaways)

1. Keep the web tier stateless.
2. Build redundancy at every tier.
3. Use caching and CDNs to optimize performance.
4. Scale the data tier with sharding.
5. Decouple components for flexibility.

This chapter provides a solid foundation for building scalable systems that can handle millions of users.


# Chapter 2: Back-of-the-Envelope Estimation

[](https://github.com/liquidslr/system-design-notes/blob/main/02.%20Back%20Of%20the%20Envelope%20Estimation/Readme.md#chapter-2-back-of-the-envelope-estimation)

## Introduction

[](https://github.com/liquidslr/system-design-notes/blob/main/02.%20Back%20Of%20the%20Envelope%20Estimation/Readme.md#introduction)

Back-of-the-envelope estimation is a crucial skill in system design interviews. It involves making quick, rough calculations to assess system capacity or performance. According to Jeff Dean, Google Senior Fellow, these estimates help evaluate whether designs meet requirements through thought experiments and common performance benchmarks.

This chapter covers key concepts, methodologies, and examples to build proficiency in scalability and estimation.

---

## Section 1: Key Concepts

[](https://github.com/liquidslr/system-design-notes/blob/main/02.%20Back%20Of%20the%20Envelope%20Estimation/Readme.md#section-1-key-concepts)

### Power of Two

[](https://github.com/liquidslr/system-design-notes/blob/main/02.%20Back%20Of%20the%20Envelope%20Estimation/Readme.md#power-of-two)

Understanding data volume in terms of powers of two is fundamental:

[![power-of-two](https://github.com/liquidslr/system-design-notes/raw/main/02.%20Back%20Of%20the%20Envelope%20Estimation/images/power-of-two.png)](https://github.com/liquidslr/system-design-notes/blob/main/02.%20Back%20Of%20the%20Envelope%20Estimation/images/power-of-two.png)

This knowledge helps in performing accurate storage and bandwidth calculations.

---

### Latency Numbers Every Programmer Should Know

[](https://github.com/liquidslr/system-design-notes/blob/main/02.%20Back%20Of%20the%20Envelope%20Estimation/Readme.md#latency-numbers-every-programmer-should-know)

Latency numbers represent the time taken for various operations in computing systems. These provide insights into relative performance:

|Operation|Latency (2020)|
|---|---|
|L1 Cache Access|0.5 ns|
|L2 Cache Access|7 ns|
|Main Memory Access|100 ns|
|SSD Random Read|150 µs|
|HDD Random Seek|10 ms|
|Round-Trip in Data Center|500 µs|
|Inter-Region Data Center|150 ms|

**Key Insights:**

- Memory is fast, disk is slow.
- Avoid disk seeks whenever possible.
- Compress data before transmitting over the internet to save bandwidth.

---

### Availability Numbers

[](https://github.com/liquidslr/system-design-notes/blob/main/02.%20Back%20Of%20the%20Envelope%20Estimation/Readme.md#availability-numbers)

High availability (HA) ensures minimal downtime. Availability is expressed in **nines**:

- **99% (Two Nines):** ~3.65 days/year of downtime
- **99.9% (Three Nines):** ~8.8 hours/year of downtime
- **99.99% (Four Nines):** ~52 minutes/year of downtime
- **99.999% (Five Nines):** ~5.3 minutes/year of downtime
- **99.9999% (Six Nines):** ~31.56 seconds/year of downtime

Cloud providers like Amazon, Google, and Microsoft aim for SLAs (Service Level Agreements) of **99.9% or higher**.

---

## Section 2: Example Estimation - Twitter QPS and Storage Requirements

[](https://github.com/liquidslr/system-design-notes/blob/main/02.%20Back%20Of%20the%20Envelope%20Estimation/Readme.md#section-2-example-estimation---twitter-qps-and-storage-requirements)

### Assumptions

[](https://github.com/liquidslr/system-design-notes/blob/main/02.%20Back%20Of%20the%20Envelope%20Estimation/Readme.md#assumptions)

- **300 million monthly active users (MAU).**
- **50% daily active users (DAU).**
- **Average tweets/user/day:** 2.
- **10% of tweets contain media.**
- **Data retention:** 5 years.

### Estimations

[](https://github.com/liquidslr/system-design-notes/blob/main/02.%20Back%20Of%20the%20Envelope%20Estimation/Readme.md#estimations)

1. **Query Per Second (QPS):**
    
    - DAU = ( 300M x 50% = 150M )
    - Tweets QPS = ( 150M x 2 tweets / 24 hour / 3600 seconds = ~3500 )
    - Peak QPS = ( 2 x 3500 = ~7000 )
2. **Media Storage:**
    
    - **Tweet Size Components:**
        - `tweet_id`: 64 bytes
        - `text`: 140 bytes
        - `media`: 1 MB
    - **Daily Media Storage:** ( 150M x 2 x 10% x 1MB = 30TB per day )
    - **5-Year Storage:** ( 30TB x 365 x 5 = ~55PB )

---

## Section 3: Tips for Effective Estimation

[](https://github.com/liquidslr/system-design-notes/blob/main/02.%20Back%20Of%20the%20Envelope%20Estimation/Readme.md#section-3-tips-for-effective-estimation)

### 1. Rounding and Approximation

[](https://github.com/liquidslr/system-design-notes/blob/main/02.%20Back%20Of%20the%20Envelope%20Estimation/Readme.md#1-rounding-and-approximation)

Precision is not critical; focus on the process. Simplify complex calculations using round numbers. For example:

- ( 99987 / 9.1 ) can be approximated as ( 100,000 / 10 = 10,000 ).

### 2. Write Down Assumptions

[](https://github.com/liquidslr/system-design-notes/blob/main/02.%20Back%20Of%20the%20Envelope%20Estimation/Readme.md#2-write-down-assumptions)

Document assumptions clearly for future reference.

### 3. Label Units

[](https://github.com/liquidslr/system-design-notes/blob/main/02.%20Back%20Of%20the%20Envelope%20Estimation/Readme.md#3-label-units)

Avoid ambiguity by labeling units (e.g., `5 MB` instead of `5`).

### 4. Common Estimation Scenarios

[](https://github.com/liquidslr/system-design-notes/blob/main/02.%20Back%20Of%20the%20Envelope%20Estimation/Readme.md#4-common-estimation-scenarios)

- **QPS (Queries Per Second):** Measure traffic intensity.
- **Peak QPS:** Account for traffic spikes.
- **Storage Requirements:** Estimate total data needs.
- **Cache Requirements:** Evaluate memory requirements for caching.
- **Number of Servers:** Calculate hardware needs based on workload.

# Chapter 3: A Framework for System Design Interviews

[](https://github.com/liquidslr/system-design-notes/blob/main/03.%20System%20Design%20Framework/Readme.md#chapter-3-a-framework-for-system-design-interviews)

## Introduction

[](https://github.com/liquidslr/system-design-notes/blob/main/03.%20System%20Design%20Framework/Readme.md#introduction)

System design interviews are a key part of the hiring process, simulating real-life problem-solving scenarios. These interviews evaluate not just technical skills but also collaboration, communication, and the ability to handle ambiguous requirements.

This chapter introduces a **4-step framework** for navigating system design interviews effectively.

---

## Step 1: Understand the Problem and Establish Design Scope

[](https://github.com/liquidslr/system-design-notes/blob/main/03.%20System%20Design%20Framework/Readme.md#step-1-understand-the-problem-and-establish-design-scope)

### Key Objectives

[](https://github.com/liquidslr/system-design-notes/blob/main/03.%20System%20Design%20Framework/Readme.md#key-objectives)

- Clarify requirements and assumptions.
- Avoid jumping into solutions prematurely.
- Showcase critical thinking by asking good questions.

### Approach

[](https://github.com/liquidslr/system-design-notes/blob/main/03.%20System%20Design%20Framework/Readme.md#approach)

- **Ask Clarifying Questions:**
    
    - What are the most important features?
    - What scale does the system need to handle?
    - Are we building for web, mobile, or both?
    - Are there existing technologies or constraints?
- **Document Assumptions:** Write assumptions on a whiteboard or paper for reference.
    

### Example

[](https://github.com/liquidslr/system-design-notes/blob/main/03.%20System%20Design%20Framework/Readme.md#example)

**Problem:** Design a news feed system.  
**Questions:**

- Is it a mobile app, web app, or both?
- How many friends can a user have?
- Should the feed include images and videos?
- Is the feed sorted by reverse chronological order?

---

## Step 2: Propose High-Level Design and Get Buy-In

[](https://github.com/liquidslr/system-design-notes/blob/main/03.%20System%20Design%20Framework/Readme.md#step-2-propose-high-level-design-and-get-buy-in)

### Key Objectives

[](https://github.com/liquidslr/system-design-notes/blob/main/03.%20System%20Design%20Framework/Readme.md#key-objectives-1)

- Develop a high-level architecture.
- Collaborate with the interviewer to refine the design.

### Approach

[](https://github.com/liquidslr/system-design-notes/blob/main/03.%20System%20Design%20Framework/Readme.md#approach-1)

- **Draft a Blueprint:**
    
    - Use box diagrams for key components (e.g., clients, APIs, databases, caches, CDNs).
    - Treat the interviewer as a teammate to refine the design.
- **Perform Back-of-the-Envelope Calculations:**
    
    - Ensure the design can handle the scale constraints.
- **Walk Through Use Cases:** Identify edge cases and validate design assumptions.
    

### Example

[](https://github.com/liquidslr/system-design-notes/blob/main/03.%20System%20Design%20Framework/Readme.md#example-1)

For a news feed system, divide the design into:

1. **Feed Publishing Flow:** Writing posts into databases and populating friends' feeds.
2. **Feed Retrieval Flow:** Aggregating and displaying friends' posts in reverse chronological order.

---

## Step 3: Design Deep Dive

[](https://github.com/liquidslr/system-design-notes/blob/main/03.%20System%20Design%20Framework/Readme.md#step-3-design-deep-dive)

### Key Objectives

[](https://github.com/liquidslr/system-design-notes/blob/main/03.%20System%20Design%20Framework/Readme.md#key-objectives-2)

- Dive into critical components.
- Showcase depth of understanding and adaptability.

### Approach

[](https://github.com/liquidslr/system-design-notes/blob/main/03.%20System%20Design%20Framework/Readme.md#approach-2)

- **Prioritize Key Components:** Focus on areas most relevant to the problem.
- **Discuss Bottlenecks:** Identify potential performance issues and propose solutions.
- **Balance Detail:** Avoid over-engineering or unnecessary deep dives.

### Example Topics

[](https://github.com/liquidslr/system-design-notes/blob/main/03.%20System%20Design%20Framework/Readme.md#example-topics)

- **URL Shortener:** Focus on hash function design.
- **Chat System:** Explore latency reduction and online/offline status handling.
- **News Feed System:** Examine feed publishing and retrieval processes.

---

## Step 4: Wrap-Up

[](https://github.com/liquidslr/system-design-notes/blob/main/03.%20System%20Design%20Framework/Readme.md#step-4-wrap-up)

### Key Objectives

[](https://github.com/liquidslr/system-design-notes/blob/main/03.%20System%20Design%20Framework/Readme.md#key-objectives-3)

- Highlight areas for improvement.
- Recap the design and discuss follow-ups.

### Approach

[](https://github.com/liquidslr/system-design-notes/blob/main/03.%20System%20Design%20Framework/Readme.md#approach-3)

- **Identify Bottlenecks:** Discuss potential limitations and scaling strategies.
- **Summarize Design:** Recap major design decisions and trade-offs.
- **Propose Enhancements:**
    - How to scale from 1 million to 10 million users.
    - Error handling for server failures or network issues.

---

## Best Practices

[](https://github.com/liquidslr/system-design-notes/blob/main/03.%20System%20Design%20Framework/Readme.md#best-practices)

### Dos

[](https://github.com/liquidslr/system-design-notes/blob/main/03.%20System%20Design%20Framework/Readme.md#dos)

- **Ask Questions:** Clarify ambiguities before diving into solutions.
- **Communicate:** Share your thought process with the interviewer.
- **Iterate with the Interviewer:** Treat them as a collaborator.
- **Show Flexibility:** Suggest alternative approaches and refine your design.
- **Focus on Critical Components:** Prioritize key parts of the system.

### Don’ts

[](https://github.com/liquidslr/system-design-notes/blob/main/03.%20System%20Design%20Framework/Readme.md#donts)

- **Avoid Premature Solutions:** Don’t design before understanding the requirements.
- **Don’t Go Silent:** Communicate regularly during the process.
- **Avoid Over-Engineering:** Focus on practical, scalable solutions.

---

## Time Management

[](https://github.com/liquidslr/system-design-notes/blob/main/03.%20System%20Design%20Framework/Readme.md#time-management)

### Suggested Time Allocation (for 45-Minute Interviews):

[](https://github.com/liquidslr/system-design-notes/blob/main/03.%20System%20Design%20Framework/Readme.md#suggested-time-allocation-for-45-minute-interviews)

1. **Understand Problem and Scope:** 3–10 minutes
2. **High-Level Design and Buy-In:** 10–15 minutes
3. **Deep Dive:** 10–25 minutes
4. **Wrap-Up:** 3–5 minutes

# Chapter 4: Design a Rate Limiter

[](https://github.com/liquidslr/system-design-notes/tree/main/04.%20Rate%20Limiter#chapter-4-design-a-rate-limiter)

## Introduction

[](https://github.com/liquidslr/system-design-notes/tree/main/04.%20Rate%20Limiter#introduction)

This chapter explores the design and implementation of a rate limiter—a system component used to control traffic rates sent by clients or services. Rate limiters are crucial for preventing abuse, reducing costs, and ensuring the stability of server resources. Examples of their use include limiting posts, account creations, and reward claims.

## Benefits of Rate Limiting

[](https://github.com/liquidslr/system-design-notes/tree/main/04.%20Rate%20Limiter#benefits-of-rate-limiting)

- **Preventing DoS Attacks:** Blocking excess calls to avoid resource starvation.
- **Cost Reduction:** Limiting unnecessary requests to reduce server expenses.
- **Preventing Overloads:** Filtering out excessive requests to stabilize server performance.

## Step 1: Understanding the Problem

[](https://github.com/liquidslr/system-design-notes/tree/main/04.%20Rate%20Limiter#step-1-understanding-the-problem)

### Key Features

[](https://github.com/liquidslr/system-design-notes/tree/main/04.%20Rate%20Limiter#key-features)

- Server-side API rate limiter.
- Support for multiple throttle rules.
- Handle large-scale systems in distributed environments.
- Option for a standalone service or application-level code.
- Inform users when throttled.

### Requirements

[](https://github.com/liquidslr/system-design-notes/tree/main/04.%20Rate%20Limiter#requirements)

- Accurate request throttling.
- Minimal latency.
- Low memory usage.
- Distributed capability.
- Clear exception handling.
- High fault tolerance.

## Step 2: High-Level Design

[](https://github.com/liquidslr/system-design-notes/tree/main/04.%20Rate%20Limiter#step-2-high-level-design)

### Placement Options

[](https://github.com/liquidslr/system-design-notes/tree/main/04.%20Rate%20Limiter#placement-options)

[![Rate Limiting Middleware Architecture](https://github.com/liquidslr/system-design-notes/raw/main/04.%20Rate%20Limiter/images/rate_limiter_architecture.png)](https://github.com/liquidslr/system-design-notes/blob/main/04.%20Rate%20Limiter/images/rate_limiter_architecture.png)

1. **Client-Side Implementation:** Unreliable due to potential misuse.
2. **Server-Side Implementation:** Preferred for control and reliability.
3. **Middleware (API Gateway):** A flexible option for integrated rate limiting.

### Guidelines for Placement

[](https://github.com/liquidslr/system-design-notes/tree/main/04.%20Rate%20Limiter#guidelines-for-placement)

- Evaluate current tech stack and choose efficient options.
- Select appropriate algorithms based on business needs.
- Use an API gateway if microservices are employed.
- Opt for commercial solutions if resources are limited.

## Step 3: Rate Limiting Algorithms

[](https://github.com/liquidslr/system-design-notes/tree/main/04.%20Rate%20Limiter#step-3-rate-limiting-algorithms)

### 1. Token Bucket

[](https://github.com/liquidslr/system-design-notes/tree/main/04.%20Rate%20Limiter#1-token-bucket)

[![Token Bucket Algorithm](https://github.com/liquidslr/system-design-notes/raw/main/04.%20Rate%20Limiter/images/token-bucket.png)](https://github.com/liquidslr/system-design-notes/blob/main/04.%20Rate%20Limiter/images/token-bucket.png)

- **Description:** Tokens are added to a bucket at a fixed rate; each request consumes a token.
- **Parameters:** Bucket size and refill rate.
- **Pros:** Easy to implement, memory-efficient, supports traffic bursts.
- **Cons:** Requires careful parameter tuning.

### 2. Leaking Bucket

[](https://github.com/liquidslr/system-design-notes/tree/main/04.%20Rate%20Limiter#2-leaking-bucket)

[![Leaking Bucket Algorithm](https://github.com/liquidslr/system-design-notes/raw/main/04.%20Rate%20Limiter/images/leaking-bucket.png)](https://github.com/liquidslr/system-design-notes/blob/main/04.%20Rate%20Limiter/images/leaking-bucket.png)

- **Description:** Processes requests at a fixed rate using a FIFO queue.
    
- **Pros:** Memory-efficient, stable outflow rate.
    
- **Cons:** Traffic bursts may delay recent requests.
    
    Example: [https://github.com/uber-go/ratelimit](https://github.com/uber-go/ratelimit)
    

### 3. Fixed Window Counter

[](https://github.com/liquidslr/system-design-notes/tree/main/04.%20Rate%20Limiter#3-fixed-window-counter)

[![Fixed Window Counter](https://github.com/liquidslr/system-design-notes/raw/main/04.%20Rate%20Limiter/images/fixed-window-counter.png)](https://github.com/liquidslr/system-design-notes/blob/main/04.%20Rate%20Limiter/images/fixed-window-counter.png)

- **Description:** Divides time into fixed intervals and uses counters to limit requests.
    
- **Pros:** Simple, efficient for specific use cases.
    
- **Cons:** Traffic spikes at window edges can exceed limits.
    
- Sudden burst of traffic at the edges of time windows could cause more requests than allowed quota to go through.
    
    [![Fixed Window Issue](https://github.com/liquidslr/system-design-notes/raw/main/04.%20Rate%20Limiter/images/fixed-window-issue.png)](https://github.com/liquidslr/system-design-notes/blob/main/04.%20Rate%20Limiter/images/fixed-window-issue.png)

### 4. Sliding Window Log

[](https://github.com/liquidslr/system-design-notes/tree/main/04.%20Rate%20Limiter#4-sliding-window-log)

[![Sliding Window Log](https://github.com/liquidslr/system-design-notes/raw/main/04.%20Rate%20Limiter/images/sliding-window-log.png)](https://github.com/liquidslr/system-design-notes/blob/main/04.%20Rate%20Limiter/images/sliding-window-log.png)

- **Description:** Tracks timestamps to allow a rolling time window.
- **Pros:** Accurate rate limiting.
- **Cons:** High memory consumption.

### 5. Sliding Window Counter

[](https://github.com/liquidslr/system-design-notes/tree/main/04.%20Rate%20Limiter#5-sliding-window-counter)

[![Fixed Window Counter](https://github.com/liquidslr/system-design-notes/raw/main/04.%20Rate%20Limiter/images/sliding-window-counter.png)](https://github.com/liquidslr/system-design-notes/blob/main/04.%20Rate%20Limiter/images/sliding-window-counter.png)

- **Description:** Combines fixed window and sliding log methods for smoothing spikes.
- **Pros:** Memory-efficient, handles traffic bursts.
- **Cons:** Approximation may not be perfectly strict.

## High-Level Architecture

[](https://github.com/liquidslr/system-design-notes/tree/main/04.%20Rate%20Limiter#high-level-architecture)

[![Architecture](https://github.com/liquidslr/system-design-notes/raw/main/04.%20Rate%20Limiter/images/architecture.png)](https://github.com/liquidslr/system-design-notes/blob/main/04.%20Rate%20Limiter/images/architecture.png)

- **Data Storage:** Use in-memory caching (e.g., Redis) for fast counter operations.
- **Steps:**
    1. Client sends request to middleware.
    2. Middleware checks counters in Redis.
    3. Request is processed or rejected based on limits.

## Advanced Considerations

[](https://github.com/liquidslr/system-design-notes/tree/main/04.%20Rate%20Limiter#advanced-considerations)

### Distributed Environments

[](https://github.com/liquidslr/system-design-notes/tree/main/04.%20Rate%20Limiter#distributed-environments)

- **Challenges:** Race conditions, synchronization issues.
- **Solutions:** Use locks, Lua scripts, or sorted sets in Redis. Employ centralized data stores for synchronization.

### Performance Optimizations

[](https://github.com/liquidslr/system-design-notes/tree/main/04.%20Rate%20Limiter#performance-optimizations)

- Multi-data center setups for reduced latency.
- Eventual consistency models for synchronization.

### Monitoring

[](https://github.com/liquidslr/system-design-notes/tree/main/04.%20Rate%20Limiter#monitoring)

- Regular analytics to ensure algorithm effectiveness and adjust rules as needed.
# Chapter 5: Design Consistent Hashing

[](https://github.com/liquidslr/system-design-notes/tree/main/05.%20Consistent%20Hashing#chapter-5-design-consistent-hashing)

## Introduction

[](https://github.com/liquidslr/system-design-notes/tree/main/05.%20Consistent%20Hashing#introduction)

This chapter explores consistent hashing, a technique essential for achieving horizontal scaling by efficiently distributing requests and data across servers. It minimizes data redistribution when servers are added or removed and ensures an even distribution of data to mitigate issues like server hotspots.

## The Rehashing Problem

[](https://github.com/liquidslr/system-design-notes/tree/main/05.%20Consistent%20Hashing#the-rehashing-problem)

### Explanation

[](https://github.com/liquidslr/system-design-notes/tree/main/05.%20Consistent%20Hashing#explanation)

In traditional hashing methods, such as `serverIndex = hash(key) % N`, data redistribution becomes problematic when the number of servers changes. For example:

- Removing a server causes most keys to be reassigned, leading to cache misses.
    
- Adding a server results in unnecessary key redistributions.
    
    [![Server hashing](https://github.com/liquidslr/system-design-notes/raw/main/05.%20Consistent%20Hashing/images/server-hashing.png)](https://github.com/liquidslr/system-design-notes/blob/main/05.%20Consistent%20Hashing/images/server-hashing.png)
- This approach works well when the size of the server pool is fixed. However, problems arise when new servers are added, or existing servers are removed.
    
    [![Server hashing Miss](https://github.com/liquidslr/system-design-notes/raw/main/05.%20Consistent%20Hashing/images/server-hashing-miss.png)](https://github.com/liquidslr/system-design-notes/blob/main/05.%20Consistent%20Hashing/images/server-hashing-miss.png)

### Key Issue

[](https://github.com/liquidslr/system-design-notes/tree/main/05.%20Consistent%20Hashing#key-issue)

Redistribution of most keys when server count changes causes inefficiency and overload.

## Consistent Hashing

[](https://github.com/liquidslr/system-design-notes/tree/main/05.%20Consistent%20Hashing#consistent-hashing)

### Definition

[](https://github.com/liquidslr/system-design-notes/tree/main/05.%20Consistent%20Hashing#definition)

Consistent hashing ensures that only a fraction of keys are remapped when servers are added or removed. This minimizes disruptions and enhances scalability.

### Key Concepts

[](https://github.com/liquidslr/system-design-notes/tree/main/05.%20Consistent%20Hashing#key-concepts)

1. **Hash Space and Ring:** The hash space forms a continuous ring, with hash values distributed from `0` to `2^160-1` (e.g., using hash function like SHA-1). By connecting both ends we get a ring.
    
    [![Hash Ring](https://github.com/liquidslr/system-design-notes/raw/main/05.%20Consistent%20Hashing/images/hash-ring.png)](https://github.com/liquidslr/system-design-notes/blob/main/05.%20Consistent%20Hashing/images/hash-ring.png)
    

- Using the same hash function f, we map servers based on server IP or name onto the ring.
    
    [![Server Ring](https://github.com/liquidslr/system-design-notes/raw/main/05.%20Consistent%20Hashing/images/server-ring.png)](https://github.com/liquidslr/system-design-notes/blob/main/05.%20Consistent%20Hashing/images/server-ring.png)
    

1. **Server Lookup**

- A key's server is determined by traversing clockwise on the ring until a server is found.
    
    [![Server Lookup](https://github.com/liquidslr/system-design-notes/raw/main/05.%20Consistent%20Hashing/images/server-lookup.png)](https://github.com/liquidslr/system-design-notes/blob/main/05.%20Consistent%20Hashing/images/server-lookup.png)
    

2. **Adding and Removing Servers**

- Adding a server redistributes only nearby keys. Only a fraction of keys are redistributed to the new server.
    
    [![Adding Server](https://github.com/liquidslr/system-design-notes/raw/main/05.%20Consistent%20Hashing/images/adding-server.png)](https://github.com/liquidslr/system-design-notes/blob/main/05.%20Consistent%20Hashing/images/adding-server.png)
    
- Removing a server affects only the keys in its range. Only keys from the removed server are reassigned to the next server clockwise.
    
    [![Removing Server](https://github.com/liquidslr/system-design-notes/raw/main/05.%20Consistent%20Hashing/images/removing-server.png)](https://github.com/liquidslr/system-design-notes/blob/main/05.%20Consistent%20Hashing/images/removing-server.png)
    

## Challenges and Solutions

[](https://github.com/liquidslr/system-design-notes/tree/main/05.%20Consistent%20Hashing#challenges-and-solutions)

### Two Issues in Basic Approach

[](https://github.com/liquidslr/system-design-notes/tree/main/05.%20Consistent%20Hashing#two-issues-in-basic-approach)

1. **Uneven Partition Sizes:** Servers may have unequal data partitions.
2. **Non-uniform Key Distribution:** Some servers may receive significantly more keys than others.

### Solution: Virtual Nodes

[](https://github.com/liquidslr/system-design-notes/tree/main/05.%20Consistent%20Hashing#solution-virtual-nodes)

- Each server is represented by multiple virtual nodes on the ring uniformly distrubuted on the ring.
    
- Virtual nodes improve key distribution and balance load. As the number of virtual nodes increases, the distribution of keys becomes more balanced. This is because the standard deviation gets smaller with more virtual nodes, leading to balanced data distribution.
    
    [![Virtual Nodes](https://github.com/liquidslr/system-design-notes/raw/main/05.%20Consistent%20Hashing/images/virtual-nodes.png)](https://github.com/liquidslr/system-design-notes/blob/main/05.%20Consistent%20Hashing/images/virtual-nodes.png)
    

## Affected Keys

[](https://github.com/liquidslr/system-design-notes/tree/main/05.%20Consistent%20Hashing#affected-keys)

When servers are added or removed:

- **Added Server:** Affected keys are those between the new server and its predecessor. In the following example server 4 is added onto the ring. The affected range starts from s4 (newly added node) and moves anticlockwise around the ring until a server is found (s3). Thus, keys located between s3 and s4 need to be redistributed to s4.
    
    [![Server Addition](https://github.com/liquidslr/system-design-notes/raw/main/05.%20Consistent%20Hashing/images/server-addition.png)](https://github.com/liquidslr/system-design-notes/blob/main/05.%20Consistent%20Hashing/images/server-addition.png)
    
- **Removed Server:** Affected keys are those between the removed server and its predecessor. In the following example when a server (s1) is removed, the affected range starts from s1 (removed node) and moves anticlockwise around the ring until a server is found (s0). Thus, keys located between s0 and s1 must be redistributed to s2.
    
    [![Server Removed](https://github.com/liquidslr/system-design-notes/raw/main/05.%20Consistent%20Hashing/images/server-removed.png)](https://github.com/liquidslr/system-design-notes/blob/main/05.%20Consistent%20Hashing/images/server-removed.png)
    

## Benefits of Consistent Hashing

[](https://github.com/liquidslr/system-design-notes/tree/main/05.%20Consistent%20Hashing#benefits-of-consistent-hashing)

- **Minimized Redistribution:** Only a fraction of keys are reassigned.
- **Scalability:** Enables horizontal scaling.
- **Mitigates Hotspots:** Balances data distribution to avoid server overload.

## Real-World Applications

[](https://github.com/liquidslr/system-design-notes/tree/main/05.%20Consistent%20Hashing#real-world-applications)

- Amazon Dynamo DB
- Apache Cassandra
- Discord
- Akamai CDN
- Maglev Load Balancer


# Chapter 6: Design a Key-Value Store
# Chapter 7: Design a Unique ID Generator in Distributed Systems
# Chapter 8: Design a URL Shortener
# Chapter 9: Design a Web Crawler
# Chapter 10: Design a Notification System

[](https://github.com/liquidslr/system-design-notes/tree/main/10.%20Notification%20System#chapter-10-design-a-notification-system)

## Introduction

[](https://github.com/liquidslr/system-design-notes/tree/main/10.%20Notification%20System#introduction)

A **notification system** is essential for modern applications, providing timely updates like product notifications, events, offers, and alerts. Notifications can be sent through:

1. **Push notifications** (mobile or desktop),
2. **SMS messages**, and
3. **Emails**.

The chapter focuses on designing a scalable system capable of sending millions of notifications daily.

---

## Step 1: Understanding the Problem

[](https://github.com/liquidslr/system-design-notes/tree/main/10.%20Notification%20System#step-1-understanding-the-problem)

### Requirements

[](https://github.com/liquidslr/system-design-notes/tree/main/10.%20Notification%20System#requirements)

- **Notification Types:** Push notifications, SMS, and Emails.
- **Delivery:** Soft real-time system with minimal delays.
- **Platforms:** iOS, Android, and desktop.
- **Triggers:** Notifications can be triggered by client applications or scheduled on servers.
- **Scale:**
    - **Push Notifications:** 10 million/day,
    - **SMS:** 1 million/day,
    - **Emails:** 5 million/day.
- **Opt-out Support:** Users can disable specific notification types.

---

## Step 2: High-Level Design

[](https://github.com/liquidslr/system-design-notes/tree/main/10.%20Notification%20System#step-2-high-level-design)

### Components

[](https://github.com/liquidslr/system-design-notes/tree/main/10.%20Notification%20System#components)

1. **Notification Types:**
    
    - **iOS Push Notifications:** Use **Apple Push Notification Service (APNS)**.
    - **Android Push Notifications:** Use **Firebase Cloud Messaging (FCM)**.
    - **SMS Messages:** Third-party services like Twilio or Nexmo.
    - **Emails:** Commercial email services like SendGrid or Mailchimp.
2. **Contact Info Gathering:**
    
    [![Contact Info Gathering](https://github.com/liquidslr/system-design-notes/raw/main/10.%20Notification%20System/images/contact-info-gathering.png)](https://github.com/liquidslr/system-design-notes/blob/main/10.%20Notification%20System/images/contact-info-gathering.png)
    
    - Collect device tokens, phone numbers, or email addresses during app installation or signup.
    - Store contact info in the database:
        - **Device Tokens Table:** For push notifications.
        - **User Table:** For emails and phone numbers.
3. **Notification Sending Flow:**
    
    [![High Level Design](https://github.com/liquidslr/system-design-notes/raw/main/10.%20Notification%20System/images/high-level-design.png)](https://github.com/liquidslr/system-design-notes/blob/main/10.%20Notification%20System/images/high-level-design.png)
    
    - **Trigger Services:**
        - Generate events to initiate notifications (e.g., billing reminders, shipping updates).
        - A service can be a micro-service, a cron job, or a distributed system that triggers notification sending events.
    - **Notification Server:**
        - Provide APIs for services to send notifications.
        - Carry out basic validations to verify emails, phone numbers.
        - Query the database or cache to fetch data needed to render a notification.
    - **Third-Party Services:** Deliver notifications to users.

### Challenges in Initial Design

[](https://github.com/liquidslr/system-design-notes/tree/main/10.%20Notification%20System#challenges-in-initial-design)

- **Single Point of Failure (SPOF):** One notification server can crash the entire system.
- **Scalability Issues:** Hard to scale databases, caches, and processing components independently.
- **Performance Bottlenecks:** High resource demands for sending notifications.

### Improved Design

[](https://github.com/liquidslr/system-design-notes/tree/main/10.%20Notification%20System#improved-design)

[![Improved Design](https://github.com/liquidslr/system-design-notes/raw/main/10.%20Notification%20System/images/improved-design.png)](https://github.com/liquidslr/system-design-notes/blob/main/10.%20Notification%20System/images/improved-design.png)

- Move databases and caches out of the notification server.
- Introduce **horizontal scaling** with multiple notification servers.
- Use **message queues** to decouple system components.
    - Message queues serve as buffers when high volumes of notifications are to be sent out.
- Add workers that pull notification events from message queues and send them to corresponding third party services.

---

## Step 3: Design Deep Dive

[](https://github.com/liquidslr/system-design-notes/tree/main/10.%20Notification%20System#step-3-design-deep-dive)

### Reliability

[](https://github.com/liquidslr/system-design-notes/tree/main/10.%20Notification%20System#reliability)

1. **Prevent Data Loss:**
    
    [![Data Loss](https://github.com/liquidslr/system-design-notes/raw/main/10.%20Notification%20System/images/data-loss.png)](https://github.com/liquidslr/system-design-notes/blob/main/10.%20Notification%20System/images/data-loss.png)
    
    - Persist notification data in a database and implement a retry mechanism.
    - The Notification log database is included for data persistence.
2. **Deduplication:**
    
    - Check event IDs to avoid sending duplicate notifications.
    - When a notification event first arrives, check if it is seen before by checking the event ID. If seen before discard it, otherwise send out the notification.

### Additional Components

[](https://github.com/liquidslr/system-design-notes/tree/main/10.%20Notification%20System#additional-components)

[![Events Tracking](https://github.com/liquidslr/system-design-notes/raw/main/10.%20Notification%20System/images/events-tracking.png)](https://github.com/liquidslr/system-design-notes/blob/main/10.%20Notification%20System/images/events-tracking.png)

1. **Notification Templates:** Preformatted templates for consistent and efficient notifications.
2. **Notification Settings:**
    - Users can opt-in or opt-out for specific channels (push, SMS, or email).
    - Stored in a dedicated notification settings table.
3. **Rate Limiting:** Cap the frequency of notifications sent to users.
4. **Retry Mechanism:** Retry sending notifications if third-party services fail.
5. **Monitoring Queues:** Track queued notifications to scale workers dynamically.
6. **Event Tracking:** Collect metrics like open rate, click rate, and engagement.

### Security

[](https://github.com/liquidslr/system-design-notes/tree/main/10.%20Notification%20System#security)

- Use **AppKey** and **AppSecret** to authenticate and secure APIs for push notifications.

### Notification Flow

[](https://github.com/liquidslr/system-design-notes/tree/main/10.%20Notification%20System#notification-flow)

[![Updated Design](https://github.com/liquidslr/system-design-notes/raw/main/10.%20Notification%20System/images/updated-design.png)](https://github.com/liquidslr/system-design-notes/blob/main/10.%20Notification%20System/images/updated-design.png)

1. Trigger services call APIs to send notifications.
2. Notification servers validate requests and fetch metadata from caches or databases.
3. Notification events are sent to message queues.
4. Workers process events and interact with third-party services.
5. Third-party services deliver notifications to users.

---

## Key Optimizations

[](https://github.com/liquidslr/system-design-notes/tree/main/10.%20Notification%20System#key-optimizations)

1. **Horizontal Scaling:** Add more notification servers for load distribution.
2. **Message Queues:** Decouple processing to handle high volumes.
3. **Caching:** Reduce latency by caching frequently accessed data.
4. **Distributed Crawling:** Optimize message delivery geographically for better performance.