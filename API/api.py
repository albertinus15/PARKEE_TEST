import requests
import pandas as pd

def get_universities_data(country):

    url = f'http://universities.hipolabs.com/search?country={country}'

    response = requests.get(url)
    data = response.json()

    df = pd.DataFrame(data)

    df = df[['name', 'web_pages', 'country', 'domains', 'state-province']]

    df.columns = ['Name', 'Web pages', 'Country', 'Domains', 'State Province']

    df = df[df['State Province'].notna()]
    
    return df

country = input("Masukkan nama negara (misalnya: United States): ")

universities_df = get_universities_data(country)

print(universities_df)

