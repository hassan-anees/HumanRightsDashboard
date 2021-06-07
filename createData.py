import csv
import sys

data = csv.DictReader(open("UyghurData.csv"))
filename = 'camps' + sys.argv[1] + '.csv'
column = sys.argv[1] + '-3'
with open(filename, 'w', newline='') as csv_file:  
    writer = csv.writer(csv_file)
    writer.writerow(['DecimalLong', 'DecimalLat'])
    for row in data:
        for i in range(int(row[column])//1000):
            writer.writerow([row['DecimalLong'], row['DecimalLat']])
csv_file.close()
