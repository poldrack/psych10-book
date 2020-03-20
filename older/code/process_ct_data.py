import pandas

data=pandas.read_csv('CT-clean.csv')
dataSmall=data.filter(['driver_race','search_conducted'], axis=1)
dataSmall=dataSmall.loc[dataSmall.driver_race.isin(['White','Black'])]
dataSmall.to_csv('CT_data_cleaned.csv')
