import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import confusion_matrix,accuracy_score
ds=pd.read_csv("C:\MSc\logReg.csv")
print("Display the First 5 rows of data set")
print(ds.head())
X=ds.iloc[:,:-1].values
print("The content of independent variable are")
print(X)
y=ds.iloc[:,-1].values
print("The content of dependent variable are")
print(y)
X_train,X_test,y_train,y_test=train_test_split(X,y,test_size=0.30)
sc=StandardScaler()
X_train=sc.fit_transform(X_train)
X_test=sc.transform(X_test)
classifier=LogisticRegression()
classifier.fit(X_train,y_train)
y_pred=classifier.predict(X_test)
cm=confusion_matrix(y_test,y_pred)
print("The Result of confusion matrix is given below")
print(cm)
res=accuracy_score(y_test,y_pred)
print("The accuracy of Logistic Regression=",res*100)