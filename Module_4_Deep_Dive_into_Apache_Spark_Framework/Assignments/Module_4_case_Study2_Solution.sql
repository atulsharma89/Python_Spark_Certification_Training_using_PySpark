############
Task 1
#############

1. Verify the cluster health including HDFS and Spark


(base) MacBook-Pro-106:Desktop atul595525$ hdfs fsck /user
20/06/19 15:22:07 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
Connecting to namenode via http://localhost:50070
FSCK started by atul595525 (auth:SIMPLE) from /127.0.0.1 for path /user at Fri Jun 19 15:22:08 PDT 2020
.................
/user/spark_demo/output/part-00000:  Under replicated BP-106687497-172.16.251.230-1558137576192:blk_1073742028_1204. Target Replicas is 3 but found 1 replica(s).
.
/user/spark_demo/output/part-00001:  Under replicated BP-106687497-172.16.251.230-1558137576192:blk_1073742027_1203. Target Replicas is 3 but found 1 replica(s).
........Status: HEALTHY
 Total size:	1605 B
 Total dirs:	25
 Total files:	26
 Total symlinks:		0
 Total blocks (validated):	21 (avg. block size 76 B)
 Minimally replicated blocks:	21 (100.0 %)
 Over-replicated blocks:	0 (0.0 %)
 Under-replicated blocks:	2 (9.523809 %)
 Mis-replicated blocks:		0 (0.0 %)
 Default replication factor:	1
 Average block replication:	1.0
 Corrupt blocks:		0
 Missing replicas:		4 (16.0 %)
 Number of data-nodes:		1
 Number of racks:		1
FSCK ended at Fri Jun 19 15:22:08 PDT 2020 in 13 milliseconds


The filesystem under path '/user' is HEALTHY
(base) MacBook-Pro-106:Desktop atul595525$ 





########
Task 2
########

2. Test the spark environment by executing the spark’s sort.py example.

sample file which was given as input:

(base) MacBook-Pro-106:Desktop atul595525$ hdfs dfs -cat /user/spark_demo/sort_file.txt
20/06/19 16:37:39 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
10 40 5 20 19 11 13 89 32


Program:
========

from __future__ import print_function

import sys

from pyspark.sql import SparkSession


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: sort <file>", file=sys.stderr)
        sys.exit(-1)

    spark = SparkSession\
        .builder\
        .appName("PythonSort")\
        .getOrCreate()

    lines = spark.read.text(sys.argv[1]).rdd.map(lambda r: r[0])
    sortedCount = lines.flatMap(lambda x: x.split(' ')) \
        .map(lambda x: (int(x), 1)) \
        .sortByKey()
    # This is just a demo on how to bring all the sorted data back to a single node.
    # In reality, we wouldn't want to collect all the data to the driver node.
    output = sortedCount.collect()
    for (num, unitcount) in output:
        print(num)

    spark.stop()
    


Output:
=====

/Users/atul595525/PycharmProjects/New_pyspark_project/venv/bin/python /Users/atul595525/PycharmProjects/New_pyspark_project/sort.py hdfs://localhost:54310/user/spark_demo/sort_file.txt
Using Spark's default log4j profile: org/apache/spark/log4j-defaults.properties
Setting default log level to "WARN".
To adjust logging level use sc.setLogLevel(newLevel). For SparkR, use setLogLevel(newLevel).
20/06/19 14:50:58 WARN NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
/Users/atul595525/Desktop/spark-2.1.0-bin-hadoop2.7/python/lib/pyspark.zip/pyspark/shuffle.py:58: UserWarning: Please install psutil to have better support with spilling
5
10
11
13
19
20
32
40
89

Process finished with exit code 0


###########
Task 3
###########

3. Try to implement the same example in scala and perform spark-submit.




##########
task 4
##########

4. Analyze the behavior of spark application on Spark web UI

Done


#########
Task 5
#########

5. Add custom logs in your application and re-execute the application. Once executed check the Spark logs.

Done

##########
Task 6
###########

6. Transfer complete dataset from RDBMS to HDFS


sqoop export --connect jdbc:mysql://localhost/product --table employee --username testuser --password atul -m 1 --export-dir 'studentdir'



data in my sql table:
====================

mysql> select * From Employee;
+-----------+------------+
| firstname | lastname   |
+-----------+------------+
| Vineet    | Chaturvedi |
| Abhi      | Kr         |
+-----------+------------+
2 rows in set (0.00 sec)


###########
Task 7
###########

7. Validate the loaded data by comparing the statistics of data both in source and HDFS



validation:
===========


data in my sql table:
====================

mysql> select * From Employee;
+-----------+------------+
| firstname | lastname   |
+-----------+------------+
| Vineet    | Chaturvedi |
| Abhi      | Kr         |
+-----------+------------+
2 rows in set (0.00 sec)




(base) MacBook-Pro-106:bin atul595525$ hdfs dfs -ls /user/sqoop_output/part-m-00000
20/06/18 17:40:17 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
-rw-r--r--   1 atul595525 supergroup         26 2020-06-18 17:39 /user/sqoop_output/part-m-00000
(base) MacBook-Pro-106:bin atul595525$ 
(base) MacBook-Pro-106:bin atul595525$ 
(base) MacBook-Pro-106:bin atul595525$ hdfs dfs -cat /user/sqoop_output/part-m-00000
20/06/18 17:40:29 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
Vineet,Chaturvedi
Abhi,Kr
(base) MacBook-Pro-106:bin atul595525$ 



############
Task 8
############

8. Create a new directory in HDFS named cheeses and load only rows where aisle is "specialty cheeses"





CREATE TABLE aisle (aisle_id int(11),aisle char(250));

mysql> select count(*) From aisle;
+----------+
| count(*) |
+----------+
|      134 |
+----------+
1 row in set (0.01 sec)

(base) MacBook-Pro-106:Desktop atul595525$ hdfs dfs -mkdir /user/spark_demo/cheeses
20/06/19 16:55:56 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
(base) MacBook-Pro-106:Desktop atul595525$ 



(base) MacBook-Pro-106:Desktop atul595525$ hdfs dfs rm -r /user/spark_demo/cheeses
rm: Unknown command
Did you mean -rm?  This command begins with a dash.
(base) MacBook-Pro-106:Desktop atul595525$ hdfs dfs -rm -r /user/spark_demo/cheeses
20/06/19 16:58:37 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
20/06/19 16:58:38 INFO fs.TrashPolicyDefault: Namenode trash configuration: Deletion interval = 0 minutes, Emptier interval = 0 minutes.
Deleted /user/spark_demo/cheeses
(base) MacBook-Pro-106:Desktop atul595525$ 




(base) MacBook-Pro-106:bin atul595525$ sqoop import --connect jdbc:mysql://localhost/product --table aisle --username testuser --password atul -m 1 --where "aisle ='specialty cheeses'" --target-dir '/user/spark_demo/cheeses'
Warning: /Users/atul595525/Desktop/sqoop-1.4.7.bin__hadoop-2.6.0/../hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /Users/atul595525/Desktop/sqoop-1.4.7.bin__hadoop-2.6.0/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /Users/atul595525/Desktop/sqoop-1.4.7.bin__hadoop-2.6.0/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /Users/atul595525/Desktop/sqoop-1.4.7.bin__hadoop-2.6.0/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
20/06/19 16:58:52 INFO sqoop.Sqoop: Running Sqoop version: 1.4.7
20/06/19 16:58:52 WARN tool.BaseSqoopTool: Setting your password on the command-line is insecure. Consider using -P instead.
20/06/19 16:58:52 INFO manager.MySQLManager: Preparing to use a MySQL streaming resultset.
20/06/19 16:58:52 INFO tool.CodeGenTool: Beginning code generation
Fri Jun 19 16:58:52 PDT 2020 WARN: Establishing SSL connection without server's identity verification is not recommended. According to MySQL 5.5.45+, 5.6.26+ and 5.7.6+ requirements SSL connection must be established by default if explicit option isn't set. For compliance with existing applications not using SSL the verifyServerCertificate property is set to 'false'. You need either to explicitly disable SSL by setting useSSL=false, or set useSSL=true and provide truststore for server certificate verification.
20/06/19 16:58:53 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `aisle` AS t LIMIT 1
20/06/19 16:58:53 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `aisle` AS t LIMIT 1
20/06/19 16:58:53 INFO orm.CompilationManager: HADOOP_MAPRED_HOME is /Users/atul595525/Desktop/hadoop-2.6.0
Note: /tmp/sqoop-atul595525/compile/56c01f04bad5146b2645c9fce080a5f4/aisle.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
20/06/19 16:58:53 INFO orm.CompilationManager: Writing jar file: /tmp/sqoop-atul595525/compile/56c01f04bad5146b2645c9fce080a5f4/aisle.jar
20/06/19 16:58:53 WARN manager.MySQLManager: It looks like you are importing from mysql.
20/06/19 16:58:53 WARN manager.MySQLManager: This transfer can be faster! Use the --direct
20/06/19 16:58:53 WARN manager.MySQLManager: option to exercise a MySQL-specific fast path.
20/06/19 16:58:53 INFO manager.MySQLManager: Setting zero DATETIME behavior to convertToNull (mysql)
20/06/19 16:58:53 INFO mapreduce.ImportJobBase: Beginning import of aisle
20/06/19 16:58:53 INFO Configuration.deprecation: mapred.job.tracker is deprecated. Instead, use mapreduce.jobtracker.address
20/06/19 16:58:53 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
20/06/19 16:58:53 INFO Configuration.deprecation: mapred.jar is deprecated. Instead, use mapreduce.job.jar
20/06/19 16:58:54 INFO Configuration.deprecation: mapred.map.tasks is deprecated. Instead, use mapreduce.job.maps
20/06/19 16:58:54 INFO client.RMProxy: Connecting to ResourceManager at /0.0.0.0:8032
Fri Jun 19 16:58:56 PDT 2020 WARN: Establishing SSL connection without server's identity verification is not recommended. According to MySQL 5.5.45+, 5.6.26+ and 5.7.6+ requirements SSL connection must be established by default if explicit option isn't set. For compliance with existing applications not using SSL the verifyServerCertificate property is set to 'false'. You need either to explicitly disable SSL by setting useSSL=false, or set useSSL=true and provide truststore for server certificate verification.
20/06/19 16:58:56 INFO db.DBInputFormat: Using read commited transaction isolation
20/06/19 16:58:56 INFO mapreduce.JobSubmitter: number of splits:1
20/06/19 16:58:56 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1592509712833_0011
20/06/19 16:58:56 INFO impl.YarnClientImpl: Submitted application application_1592509712833_0011
20/06/19 16:58:56 INFO mapreduce.Job: The url to track the job: http://MacBook-Pro-106.local:8088/proxy/application_1592509712833_0011/
20/06/19 16:58:56 INFO mapreduce.Job: Running job: job_1592509712833_0011
20/06/19 16:59:04 INFO mapreduce.Job: Job job_1592509712833_0011 running in uber mode : false
20/06/19 16:59:04 INFO mapreduce.Job:  map 0% reduce 0%
20/06/19 16:59:09 INFO mapreduce.Job:  map 100% reduce 0%
20/06/19 16:59:09 INFO mapreduce.Job: Job job_1592509712833_0011 completed successfully
20/06/19 16:59:09 INFO mapreduce.Job: Counters: 30
	File System Counters
		FILE: Number of bytes read=0
		FILE: Number of bytes written=127962
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=87
		HDFS: Number of bytes written=20
		HDFS: Number of read operations=4
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=2
	Job Counters 
		Launched map tasks=1
		Other local map tasks=1
		Total time spent by all maps in occupied slots (ms)=2372
		Total time spent by all reduces in occupied slots (ms)=0
		Total time spent by all map tasks (ms)=2372
		Total vcore-seconds taken by all map tasks=2372
		Total megabyte-seconds taken by all map tasks=2428928
	Map-Reduce Framework
		Map input records=1
		Map output records=1
		Input split bytes=87
		Spilled Records=0
		Failed Shuffles=0
		Merged Map outputs=0
		GC time elapsed (ms)=40
		CPU time spent (ms)=0
		Physical memory (bytes) snapshot=0
		Virtual memory (bytes) snapshot=0
		Total committed heap usage (bytes)=148373504
	File Input Format Counters 
		Bytes Read=0
	File Output Format Counters 
		Bytes Written=20
20/06/19 16:59:09 INFO mapreduce.ImportJobBase: Transferred 20 bytes in 15.6121 seconds (1.2811 bytes/sec)
20/06/19 16:59:09 INFO mapreduce.ImportJobBase: Retrieved 1 records.




###########
VALIDATION
###########


(base) MacBook-Pro-106:Desktop atul595525$ hdfs dfs -cat /user/spark_demo/cheeses/part-m-00000
20/06/19 17:03:25 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
2,specialty cheeses
(base) MacBook-Pro-106:Desktop atul595525$ 
(base) MacBook-Pro-106:Desktop atul595525$ 
(base) MacBook-Pro-106:Desktop atul595525$ 



################
task 9
################


9. update “specialty cheeses” to “specialty cheese” and transfer only updated rows in the above-created directory.


UPDATE aisle 
SET aisle = 'specialty cheese' 
WHERE aisle = 'specialty cheeses';


mysql> select * From aisle where aisle='specialty cheese' ;
+----------+------------------+
| aisle_id | aisle            |
+----------+------------------+
|        2 | specialty cheese |
+----------+------------------+
1 row in set (0.00 sec)



   

sqoop export \
  --table aisle \
  --connect "jdbc:mysql://localhost/product" \
  --username testuser \
  --password atul \
  --export-dir "/user/sqoop_output_incremental" \
  --columns "ID,SALARY"



sqoop import --connect jdbc:mysql://localhost/product --table aisle --username testuser --password atul -m 1 --incremental append --check-column 'aisle'  --last-value 'specialty cheeses' --target-dir '/user/spark_demo/cheeses'



(base) MacBook-Pro-106:bin atul595525$ sqoop import --connect jdbc:mysql://localhost/product --table aisle --username testuser --password atul -m 1 --incremental append --check-column aisle  --last-value 'specialty cheeses' --target-dir '/user/spark_demo/cheeses'
Warning: /Users/atul595525/Desktop/sqoop-1.4.7.bin__hadoop-2.6.0/../hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /Users/atul595525/Desktop/sqoop-1.4.7.bin__hadoop-2.6.0/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /Users/atul595525/Desktop/sqoop-1.4.7.bin__hadoop-2.6.0/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /Users/atul595525/Desktop/sqoop-1.4.7.bin__hadoop-2.6.0/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
20/06/19 17:19:53 INFO sqoop.Sqoop: Running Sqoop version: 1.4.7
20/06/19 17:19:53 WARN tool.BaseSqoopTool: Setting your password on the command-line is insecure. Consider using -P instead.
20/06/19 17:19:53 INFO manager.MySQLManager: Preparing to use a MySQL streaming resultset.
20/06/19 17:19:53 INFO tool.CodeGenTool: Beginning code generation
Fri Jun 19 17:19:53 PDT 2020 WARN: Establishing SSL connection without server's identity verification is not recommended. According to MySQL 5.5.45+, 5.6.26+ and 5.7.6+ requirements SSL connection must be established by default if explicit option isn't set. For compliance with existing applications not using SSL the verifyServerCertificate property is set to 'false'. You need either to explicitly disable SSL by setting useSSL=false, or set useSSL=true and provide truststore for server certificate verification.
20/06/19 17:19:54 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `aisle` AS t LIMIT 1
20/06/19 17:19:54 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `aisle` AS t LIMIT 1
20/06/19 17:19:54 INFO orm.CompilationManager: HADOOP_MAPRED_HOME is /Users/atul595525/Desktop/hadoop-2.6.0
Note: /tmp/sqoop-atul595525/compile/c3314372de3be73694cbd43fe2d53a89/aisle.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
20/06/19 17:19:55 INFO orm.CompilationManager: Writing jar file: /tmp/sqoop-atul595525/compile/c3314372de3be73694cbd43fe2d53a89/aisle.jar
20/06/19 17:19:55 INFO tool.ImportTool: Maximal id query for free form incremental import: SELECT MAX(`aisle`) FROM `aisle`
20/06/19 17:19:55 ERROR tool.ImportTool: Import failed: Character column (aisle) can not be used to determine which rows to incrementally import.


