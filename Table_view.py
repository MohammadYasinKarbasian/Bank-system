import psycopg2
import os

os.system("")

class style():
    BLACK = '\033[30m'
    RED = '\033[31m'
    GREEN = '\033[32m'
    YELLOW = '\033[33m'
    BLUE = '\033[34m'
    MAGENTA = '\033[35m'
    CYAN = '\033[36m'
    WHITE = '\033[37m'
    UNDERLINE = '\033[4m'
    RESET = '\033[0m'

conn = psycopg2.connect(
    database="bank", user='postgres', password='4444', host='127.0.0.1', port='5432'
)
cursor = conn.cursor()
cursor.execute("select * from transaction_final_foot_print('6');")
rows = cursor.fetchall()

print(style.YELLOW + "-------------------------------------------------")
print(style.YELLOW + '|' + style.MAGENTA + f'{"Voucher ID":<15}'+style.YELLOW + '|' + style.MAGENTA +
      f'{"Source":<15}'+style.YELLOW + '|' + style.MAGENTA + f'{"Destination":<15}'+style.YELLOW + '|')
print(style.YELLOW + "-------------------------------------------------")

for counter in range(len(rows)):
    rows[counter] = list(rows[counter])
    for iterator in range(3):
        if rows[counter][iterator] == None:
            rows[counter][iterator] = 'NULL'
    print(style.YELLOW + '|' + style.CYAN + f'{rows[counter][0]:<15}'+style.YELLOW + '|' + style.CYAN +
          f'{rows[counter][1]:<15}'+style.YELLOW + '|' + style.CYAN + f'{rows[counter][2]:<15}'+style.YELLOW + '|')
    print(style.YELLOW + "-------------------------------------------------")

conn.close()