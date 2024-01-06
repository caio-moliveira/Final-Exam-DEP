# Final-Exam-DEP
Final Exam 
 









### Subject: Data Exploration & Preparation




### Lecturer:  Dr. Muhammad Iqbal










Caio Machado de Oliveira
ID: 2020351








 January/2024

Declaration 
			
By submitting this assessment, I confirm that I have read the CCT policy on Academic Misconduct and understand the implications of submitting work that is not my own or does not appropriately reference material taken from a third party or other sources. I declare it to be my work and that all material from third parties has been appropriately referenced. I further confirm that this work has not previously been submitted for assessment by myself or someone else in CCT College Dublin or any other higher education institution.
































Contents
Question 1	4
Question 2	7
Reference	11

 
## Question 1

#### a) Refer to the income attribute of the 10 customers in Table 2.1, before pre-processing.
#### i) Find the mean income before pre-processing. 
The mean income before pre-processing is approximately $1,082,349.8.
 ![image](https://github.com/caio-moliveira/Final-Exam-DEP/assets/150807759/b37c65e4-9482-41f9-9629-072b0374b541)

#### ii) What does this number actually mean? 
This number represents the average income of all the customers listed in Table 2.1 before any data cleaning or processing is done. It's the sum of all income values divided by the number of income entries. This figure provides a central tendency of the income data but may be heavily influenced by outliers or incorrect data entries, as it seems quite high for an individual income.

#### iii) Now, calculate the mean income for the three values left after pre-processing. Does this value have a meaning? 
Pre-processing involves cleaning and preparing any type of data for analysis and it might differ from case to case what to consider depending on the data provided. 
I have done an exploratory analysis removing all rows containing outliers such high and low incomes (including negative), missing values. 
Is important to highlight that in some cases, the values can be filled with means, medians and modes. 

Follow the analyse below:
 ![image](https://github.com/caio-moliveira/Final-Exam-DEP/assets/150807759/e29bd28e-62ff-4460-9770-8349a9e6e184)
![image](https://github.com/caio-moliveira/Final-Exam-DEP/assets/150807759/4746c447-7b40-4dfc-8927-c4bc86166748)

 
Although the result makes sense, the data has been reduced considerable which might not provide a clear analysis of the problem. 
Following up with the question which asks to calculate the mean of the “three values left after pre-processing”. The only value I could consider for this analysis as there was no specific criteria, is stored in the Customer ID C0002, replacing any negative value with their positive counterparts.
 

Follow the result after pre-processing. 
 ![image](https://github.com/caio-moliveira/Final-Exam-DEP/assets/150807759/cf03210d-5884-406e-ac22-18c3aead857a)


#### Explain why post codes should be considered text variables rather than numeric. 

Post codes vary significantly by country, with some including both letters and numbers, such as in the UK, Canada, and Ireland, while others use only numbers, like Brazil. For instance, in Ireland, post codes like D01, D02, and D03 contain both letters and numbers, with each code representing a specific geographical area. In Brazil, although post codes consist exclusively of numbers, the sequence and arrangement of these numbers are crucial, as they indicate specific regions. This diversity underscores the importance of treating post codes as text variables in data processing to preserve their meaning and structure fully.

#### Identify which columns are suitable for the categorical data types in the Table 2.1 and provide the appropriate encoding scheme to replace the variables with numeric data. 

Gender: Since genders are different categories, this column is usually categorical.
Marital Status: The various marital statuses shown in this column are also categorized.
In order to assign an unique integer to the categorical column we can use “Label Encoding” or “One-Hote Encoding”. I have chosen Label Encoding and this is the following result:

![image](https://github.com/caio-moliveira/Final-Exam-DEP/assets/150807759/403cb653-839c-41c8-b943-de0e744a91c1)

 
After applying the model to the dataset, you should be able to see that the model takes in consideration the missing values in the Gender column, assigning 1 to these missing values. This might cause skewing on the analysis and make more important the exploratory analysis before applying any model.

#### Explain why a birth date variable would be preferred to an age variable in a database based on the presence of data attribute in Table 2.1. 

Knowing the birth date provides a more precise and accurate calculation of age over time. Let's assume the data was collected two years ago. If the variable contains the exact age at that time, you would need to apply a specific method to update the age for the entire column. However, with the birth date, you can calculate the current age directly, ensuring accuracy and eliminating the need for periodic updates to the age data. This approach simplifies data maintenance and enhances the reliability of age-related information in the database.

#### Explain why it is not recommended, as a strategy for dealing with missing data, to simply omit the records or fields with missing values from the analysis. Briefly explain your answer.

Dealing with missing data can be very challenging. It is crucial to understand the dataset you are working on to appropriately clean and preprocess the data. As mentioned earlier, each dataset is unique and requires careful consideration when deciding on imputation strategies, such as using the mean, median, or mode. Similarly, applying models to categorical data requires equal attention, as seen in previous discussions. Omitting data can lead to skewed results and incorrect analyses. 

In practical scenarios, such inaccuracies can result in substantial financial costs and consume significant time to rectify. Therefore, understanding the company culture, the timing of data collection, the individuals responsible for collecting the data, and the context of the data are all essential factors in making informed decisions about handling missing data. This comprehensive understanding helps ensure accurate and reliable data analysis.


## Question 2


#### Explain the purpose and need for data exploration and preparation within data analytics projects. Use illustrations to justify your answer

Understanding the relationships, content, and structure of the data is necessary for data exploration. It involves finding anomalies, analysing statistics, and displaying patterns or trends (Wickham & Grolemund, 2017). Histograms and scatter plots, for example, might show distribution patterns or correlations between variables, which can direct more investigation (Heiberger & Neuwirth, 2009).

Cleaning and modifying data to make it more suitable for analysis is part of the data preparation process. It includes feature scaling, dimensionality reduction, encoding categorical variables, managing missing data, and fixing mistakes. (Pyle, 1999). This stage makes sure that the data input into the models is correct, full, and structured correctly, which produces results that are easier to read and more dependable (Brownlee, 2020).

In every data analytics project, these two processes are essential because they provide the framework for all further analysis and decision-making.


#### Choose a relevant encoding technique to transform the categorical data to numeric format. 

![image](https://github.com/caio-moliveira/Final-Exam-DEP/assets/150807759/8db050b1-2db0-41d1-b94a-84dcc995cc58)
 

#### Formulate the questions for EDA (Exploratory Data Analysis) and perform EDA based on the data provided and address the issues to understand the impact of rain, temperature, snow and other factors on the traffic volume.

The traffic volume peaks twice a day, usually during the morning and evening rush hours. Around 7-8 AM is when the first peak happens, and around 4-5 PM is when the bigger second peak occurs. This pattern represents typical workday commutes since many people leave for work in the morning and go home in the evening.

Early in the morning is when traffic is at its lowest, and as the day goes on, it gradually increases.

There is an evident shift in the traffic pattern. When it comes to traffic, the morning spike starts later and doesn't significantly vary in volume until lunchtime.

Compared to weekdays, there is a less noticeable peak in the afternoon, suggesting a more evenly distributed distribution of travel throughout the day, perhaps as a result of different leisure and non-work-related activities.


![Rplot](https://github.com/caio-moliveira/Final-Exam-DEP/assets/150807759/ace017a1-afdb-4c89-adef-3d5cc6f0d84d)


Certain weather conditions, such as "clouds" and "haze," show a close clustering of traffic volumes, suggesting that traffic behaviour is comparatively stable in these conditions. Rain and snow, on the other hand, exhibit more fluctuation, suggesting that travel volume is more inconsistent during these weather conditions as you can see below:


![Boxplot](https://github.com/caio-moliveira/Final-Exam-DEP/assets/150807759/93609cb7-4b42-40b7-9457-f4fb2056a363)

 

#### Analyse the benefits and drawbacks for feature selection and extraction techniques. Which features are important from the provided dataset? (Feature Selection Method)

In order to decrease dimensionality, enhance model performance, and guarantee quicker and more effective computing, feature selection and extraction are crucial. Among the feature selection techniques are the filter, wrapper, and embedding techniques. Filter approaches use statistical tests to analyze characteristics (Guyon & Elisseeff, 2003), While embedded techniques incorporate feature selection into the model training process, wrapper approaches utilize particular machine learning models to determine the significance of features. (Kuhn & Johnson, 2013). 

Feature selection may be time-consuming, especially for wrapper approaches, and can result in information loss even while it reduces overfitting and improves the interpretability of the model. The data is transformed into a lower-dimensional space via feature extraction techniques like PCA, which can aid in noise reduction and visualization but may provide less interpretable features (James, Witten, Hastie, & Tibshirani, 2013). 

You may think about utilizing Lasso regression for linear correlations or feature importance from tree-based models for a practical application on the given dataset taking traffic volume into account. These techniques can aid in determining the elements of time, weather, and other accessible factors that have the greatest impact on traffic volumes.



#### Prepare the data for the machine learning model after encoding and feature selection, predict traffic volume using the machine learning model for regression.


RMSE (Root Mean Squared Error) - 1.945817e+03
MAE (Mean Absolute Error) - 1.695819e+03
R-squared - 5.246665e-02   


RMSE measures the average magnitude of the error between the predicted traffic volume and the actual traffic volume.

It's expressed in the same units as the traffic volume itself (in this case, likely vehicles or similar units).

A lower RMSE indicates a better fit. Here, the RMSE is approximately 1945.817, meaning that, on average, the model's predictions are about 1945.817 units away from the actual traffic volumes.

MAE measures the average magnitude of the errors in a set of predictions, without considering their direction (i.e., it treats underpredictions and overpredictions equally).

RMSE (1945.817) and MAE (1695.819) are quite large, suggesting that the model may have significant prediction errors on average. This could mean the model isn't capturing all the necessary factors influencing traffic volume, or the problem is inherently difficult to predict with the available data.

The R-squared (5.2%) is low, indicating that the model explains only a small fraction of the variance in traffic volume. This further suggests that the model might need additional relevant features, more sophisticated feature engineering, or a different modelling approach to better capture the patterns in traffic volume.

These numbers don't predict the traffic volume themselves; rather, they evaluate how well the model's predictions match the actual observed traffic volumes. They provide insight into the accuracy and reliability of the model's predictions, helping you understand the model's performance and where it might need improvement.



































Reference

1.	Guyon, I., & Elisseeff, A. (2003). An introduction to variable and feature selection. Journal of Machine Learning Research, 3, 1157-1182. 

2.	James, G., Witten, D., Hastie, T., & Tibshirani, R. 

3.	(2013). An Introduction to Statistical Learning. Springer. 

4.	Kuhn, M., & Johnson, K. (2013). Applied Predictive Modelling. Springer.

5.	Wickham, H., & Grolemund, G. (2017). R for Data Science: Import, Tidy, Transform, Visualize, and Model Data. O'Reilly Media.

6.	Heiberger, R. M., & Neuwirth, E. (2009). R Through Excel: A Spreadsheet Interface for Statistics, Data Analysis, and Graphics. Springer.

7.	Pyle, D. (1999). Data Preparation for Data Mining. Morgan Kaufmann Publishers.

8.	Brownlee, J. (2020). Data Preparation for Machine Learning: Data Cleaning, Feature Selection, and Data Transforms in Python. Machine Learning Mastery.

























