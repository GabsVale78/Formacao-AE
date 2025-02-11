# 📋  Project Description

Project developed from Adventure Works ERP data with the purpose of implementing an MDS (Modern Data Stack) infrastructure and building strategic dashboards that support decision-making in multiple areas of the company. Based on good development practices and code style, going through versioning and documentation.

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=LinkedIn&logoColor=white)](https://www.linkedin.com/in/gabrielvale78/)  ![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)  ![DBT](https://img.shields.io/badge/DBT-FF6949?style=for-the-badge&logo=DBT&logoColor=FF6949&labelColor=FFFFFF&color=FF6949) ![SQL](https://img.shields.io/badge/SQL-0B74C9?style=for-the-badge&logo=SQL&logoColor=#0B74C9&labelColor=FFFFFF&color=FF0000) ![Snowflake](https://img.shields.io/badge/SnowFlake-E44C30?style=for-the-badge&logo=snowflake&logoColor=31B6E9&labelColor=FFFFFF&color=FFFFFF) ![Git](https://img.shields.io/badge/GIT-E44C30?style=for-the-badge&logo=git&logoColor=white) ![Figma](https://img.shields.io/badge/Figma-26272F?style=for-the-badge&logo=figma&logoColor=9B5CF2)

# 🔍 Project Objectives

-> Data Centralization - Build a data warehouse to consolidate and organize company data into a single source.

-> Strategic Visualization - Create dashboards that provide insights to support business and operational decisions.

-> Data-Driven Culture - Empower teams in data-driven decision-making, encouraging the construction of a data-driven culture throughout the organization.

# 📐 Project Structure (ELT)

* Data Collection and Integration

To centralize and organize the project's code, GitHub was used as the main repository. This approach facilitates versioning and collaborative management, allowing control and accessibility for all phases of development.

* Data Warehouse (DW) Storage

Data storage and processing were carried out in Snowflake. A columnar, scalable, and high-performance cloud data warehouse that allows resources to be adjusted automatically as demand changes, easily integrating with analytical tools. With simplified management, support for structured and semi-structured data, advanced security, and a pay-as-you-go model, it facilitates analysis and secure data sharing, offering great flexibility for companies seeking to modernize their data infrastructure.

* Data Transformation

After storage in Snowflake, the raw data was transformed using dbt, which allows data to be organized, cleaned, and modeled efficiently. This transformation stage is fundamental, as it prepares the data for analysis, creating fact and dimension tables, performing aggregations, and creating intermediate metrics. In addition, dbt was used to document the source tables, create staging tables, and calculate essential metrics. Storing Transformed Data in Snowflake After being transformed, the data was stored again in Snowflake, already structured and ready for consumption. This optimized storage ensures fast queries and allows visualization tools to access the data efficiently.

* Data Visualization

Data visualization was performed in Power BI, a robust business intelligence tool, ideal for creating interactive dashboards and intuitive reports. Power BI facilitates data-based decision-making, making the insights extracted from the pipeline accessible and useful for the company's teams.

* Advantages of the Modern Data Stack (MDS)

This pipeline was developed following the philosophy of the Modern Data Stack (MDS), offering flexibility, scalability, and autonomy. Each stage of the pipeline can be adapted to the company's needs, optimizing costs and infrastructure. This allows for specific adjustments without the need for complete restructurings.
 
# 🔬 Post Project Recommendations

**Considerations**

The second quarter of 2014 closed with a notorious loss of sales since the average ticket does not come close to the historical average, with the best month of the quarter being May with 62% of the historical average ($3.5k), followed by the worst month of the company with an average ticket of ($52.2) incredible 1.48% of the historical average!

There was a sharp decrease in the number of products contained in each purchase order, pointing to a cycle of tightening in the company's financial sector. The cause of the financial loss is due to the fact that the core product (Bikes) was not sold throughout the month of June, which raises an alert in the commercial sector, where it will be necessary to revisit strategies and offer discounts so that the next month has a sign of improvement and resumption in sales.

**Continuous Monitoring and Adjustments**

Maintaining a routine of monitoring the impact of sales strategies and promotions through dashboards and reports is essential. Adjusting tactics based on results and feedback from the areas involved will ensure that the company remains agile and efficient in its operations and commercial strategies.

**Training in BI and Data Analysis**

To maximize the return on investment in BI and data analysis tools, it is crucial to train Adventure Works teams in the use of these technologies. This training will allow employees to make more informed decisions based on the insights generated, fully using the visualization and analysis tools to improve decision-making in commercial areas and other strategic fronts of the company.


# 👀 Visualization of the results of this project

| ⚙️⛓️ Concept Diagram | 🎲📊 Visualization Versioning in Power BI|
| --- | :---: |
|[Concept-Diagram-AdventureWorks.pdf](https://github.com/user-attachments/files/18740651/concept-diagram-AdventureWorks.pdf) | [Dashboard-AdventureWorks.PBIP](https://github.com/GabsVale78/Dashboard-AdventureWorks)|
