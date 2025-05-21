import boto3
import json
import os

def get_secret(secret_name, region_name='ap-south-1'):
    aws_access_key_id = os.getenv("AWS_ACCESS_KEY_ID")
    aws_secret_access_key = os.getenv("AWS_SECRET_ACCESS_KEY")
    
    session = boto3.session.Session(
        aws_access_key_id=aws_access_key_id,
        aws_secret_access_key=aws_secret_access_key,
        region_name=region_name
    )

    client = session.client(service_name='secretsmanager')
    
    try:
        response = client.get_secret_value(SecretId=secret_name)
        secret_string = response.get('SecretString')
        return json.loads(secret_string)
    except Exception as e:
        raise RuntimeError(f"Error fetching secret {secret_name}: {str(e)}")
