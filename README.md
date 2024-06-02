# <p align="center">Representative Example of SQL Experience</p>

### __NOTE: My SQL experience is now far better represented in the repository titled "Pre-VT Checklist." Check the .cls files titled "QueryBuilder.cls" and "SubStringBuilder.cls" for a comprehensive view of my use of SQL.__

## Description
### Overview
I use SQL every day in my current role. This is a representative example for a significant portion of what I do.

This query is used to pull data from a legacy database for comparison against data which was migrated to a new database. I designed it to pull data from the legacy tables in the same order as the new table they're mapped to in order to facilitate side-by-side comparison in Microsoft Excel.

### What I Learned
The coolest part of this query is the double inner join on the same table. The system has a version table to track the latest version of various objects and I needed to perform an inner join on this version table with two separate tables to ensure all objects I pulled were the most current version. I can't exactly remember the problem I encountered, but the query either wouldn't run, returned no results, or otherwise didn't return the full suite of results I needed. To circumvent this issue, my boss gave me one simple trick that SQL engineers don't want you to know: I can give the table two different aliases to perform the joins without error. It's a simple trick, but I __love__ _elegance_ and I can see this approach being very useful in the future.

### Why I'm showcasing this Work
I use SQL every day in my current role. Many of the queries I run are smaller and serve to answer specific questions, but a significant portion of the queries I build look like this one. This query captures most of the basics that I use in my daily work. 

## Features
See [Overview](#Overview)

## How to Use
### Software Requirements
* Toad for Oracle
* LabWare LIMS V5

### Instructions
1. Ensure you're connected to the appropriate LabWare LIMS database in the Toad for Oracle IDE.
2. Run the query.

## Technologies
* __SQL:__ SQL is the most popular language for communicating with a database, but more importantly it's the language that my team uses for our project.
