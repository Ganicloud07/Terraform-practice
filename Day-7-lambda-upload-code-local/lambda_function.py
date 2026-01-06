import pymysql
import os

def lambda_handler(event, context):
    try:
        connection = pymysql.connect(
            host=os.environ["DB_PROXY_ENDPOINT"],
            user=os.environ["DB_USER"],
            database=os.environ["DB_NAME"],
            connect_timeout=5
        )

        with connection.cursor() as cursor:
            cursor.execute("SELECT 1;")
            result = cursor.fetchone()

        connection.close()

        return {
            "statusCode": 200,
            "body": f"Connected successfully: {result}"
        }

    except Exception as e:
        return {
            "statusCode": 500,
            "body": str(e)
        }
