import pandas as pd

def load_job_roles(csv_path):
    return pd.read_csv(csv_path)

def match_skills(resume_text, job_data):
    resume_text = resume_text.lower()
    results = []

    for index, row in job_data.iterrows():
        role = row['Role']
        skills = [s.strip().lower() for s in row['Skills'].split(',')]
        matched = [skill for skill in skills if skill in resume_text]
        score = len(matched) / len(skills) * 100
        results.append((role, score, matched))

    results.sort(key=lambda x: x[1], reverse=True)
    return results
