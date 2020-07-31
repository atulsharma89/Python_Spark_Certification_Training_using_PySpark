
###############
Running program through spark submit steps
###############

Step1: Create code and place in src/main/scala folder

Step2: create build.sbt file as shown below:

name := "HdfsTest"

version := "1.0"

scalaVersion := "2.11.7"

libraryDependencies += "org.apache.spark" %% "spark-streaming" % "2.1.0"

libraryDependencies += "org.apache.spark" %% "spark-core" % "2.1.0"

libraryDependencies += "org.apache.spark" %% "spark-sql" % "2.1.0"



Step3: Execute the sbt command to create the class jars


(base) MacBook-Pro-106:mysparkproject atul595525$ sbt package
[info] Updated file /Users/atul595525/Desktop/mysparkproject/project/build.properties: set sbt.version to 0.13.17
[info] Loading project definition from /Users/atul595525/Desktop/mysparkproject/project
[info] Updating {file:/Users/atul595525/Desktop/mysparkproject/project/}mysparkproject-build...
[info] Resolving org.fusesource.jansi#jansi;1.4 ...
[info] Done updating.
[info] Set current project to HdfsTest (in build file:/Users/atul595525/Desktop/mysparkproject/)
[info] Updating {file:/Users/atul595525/Desktop/mysparkproject/}mysparkproject...
[info] Resolving jline#jline;2.12.1 ...
[info] Done updating.
[warn] Found version conflict(s) in library dependencies; some are suspected to be binary incompatible:
[warn] 
[warn] 	* commons-net:commons-net:2.2 is selected over 3.1
[warn] 	    +- org.apache.spark:spark-core_2.11:2.1.0             (depends on 3.1)
[warn] 	    +- org.apache.hadoop:hadoop-common:2.2.0              (depends on 3.1)
[warn] 
[warn] 	* com.google.guava:guava:14.0.1 is selected over 11.0.2
[warn] 	    +- org.apache.curator:curator-recipes:2.4.0           (depends on 11.0.2)
[warn] 	    +- org.apache.curator:curator-client:2.4.0            (depends on 11.0.2)
[warn] 	    +- org.apache.hadoop:hadoop-hdfs:2.2.0                (depends on 11.0.2)
[warn] 	    +- org.apache.curator:curator-framework:2.4.0         (depends on 11.0.2)
[warn] 	    +- org.apache.hadoop:hadoop-common:2.2.0              (depends on 11.0.2)
[warn] 
[warn] Run 'evicted' to see detailed eviction warnings
[info] Compiling 1 Scala source to /Users/atul595525/Desktop/mysparkproject/target/scala-2.11/classes...
[info] Packaging /Users/atul595525/Desktop/mysparkproject/target/scala-2.11/hdfstest_2.11-1.0.jar ...
[info] Done packaging.
[success] Total time: 9 s, completed Jun 18, 2020 3:21:59 PM
(base) MacBook-Pro-106:mysparkproject atul595525$ 
(base) MacBook-Pro-106:mysparkproject atul595525$ 
(base) MacBook-Pro-106:mysparkproject atul595525$ 


Step 4: run the prgram through spark submit


spark-submit --class "SimpleApp" --master local[4] /Users/atul595525/Desktop/mysparkproject/target/scala-2.11/simpleapp_2.11-1.0.jar


LOGS:
=====

Using Spark's default log4j profile: org/apache/spark/log4j-defaults.properties
20/06/18 15:46:51 INFO SparkContext: Running Spark version 2.1.0
20/06/18 15:46:51 WARN NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
20/06/18 15:46:51 INFO SecurityManager: Changing view acls to: atul595525
20/06/18 15:46:51 INFO SecurityManager: Changing modify acls to: atul595525
20/06/18 15:46:51 INFO SecurityManager: Changing view acls groups to: 
20/06/18 15:46:51 INFO SecurityManager: Changing modify acls groups to: 
20/06/18 15:46:51 INFO SecurityManager: SecurityManager: authentication disabled; ui acls disabled; users  with view permissions: Set(atul595525); groups with view permissions: Set(); users  with modify permissions: Set(atul595525); groups with modify permissions: Set()
20/06/18 15:46:52 INFO Utils: Successfully started service 'sparkDriver' on port 54226.
20/06/18 15:46:52 INFO SparkEnv: Registering MapOutputTracker
20/06/18 15:46:52 INFO SparkEnv: Registering BlockManagerMaster
20/06/18 15:46:52 INFO BlockManagerMasterEndpoint: Using org.apache.spark.storage.DefaultTopologyMapper for getting topology information
20/06/18 15:46:52 INFO BlockManagerMasterEndpoint: BlockManagerMasterEndpoint up
20/06/18 15:46:52 INFO DiskBlockManager: Created local directory at /private/var/folders/5n/plkx587s0kj_92g0r6z1vvq40000gn/T/blockmgr-147511f7-da0a-4f87-8590-fd0483133ee7
20/06/18 15:46:52 INFO MemoryStore: MemoryStore started with capacity 366.3 MB
20/06/18 15:46:52 INFO SparkEnv: Registering OutputCommitCoordinator
20/06/18 15:46:52 INFO Utils: Successfully started service 'SparkUI' on port 4040.
20/06/18 15:46:52 INFO SparkUI: Bound SparkUI to 0.0.0.0, and started at http://192.168.0.17:4040
20/06/18 15:46:52 INFO SparkContext: Added JAR file:/Users/atul595525/Desktop/mysparkproject/target/scala-2.11/simpleapp_2.11-1.0.jar at spark://192.168.0.17:54226/jars/simpleapp_2.11-1.0.jar with timestamp 1592520412631
20/06/18 15:46:52 INFO Executor: Starting executor ID driver on host localhost
20/06/18 15:46:52 INFO Utils: Successfully started service 'org.apache.spark.network.netty.NettyBlockTransferService' on port 54227.
20/06/18 15:46:52 INFO NettyBlockTransferService: Server created on 192.168.0.17:54227
20/06/18 15:46:52 INFO BlockManager: Using org.apache.spark.storage.RandomBlockReplicationPolicy for block replication policy
20/06/18 15:46:52 INFO BlockManagerMaster: Registering BlockManager BlockManagerId(driver, 192.168.0.17, 54227, None)
20/06/18 15:46:52 INFO BlockManagerMasterEndpoint: Registering block manager 192.168.0.17:54227 with 366.3 MB RAM, BlockManagerId(driver, 192.168.0.17, 54227, None)
20/06/18 15:46:52 INFO BlockManagerMaster: Registered BlockManager BlockManagerId(driver, 192.168.0.17, 54227, None)
20/06/18 15:46:52 INFO BlockManager: Initialized BlockManager: BlockManagerId(driver, 192.168.0.17, 54227, None)
20/06/18 15:46:53 INFO MemoryStore: Block broadcast_0 stored as values in memory (estimated size 236.5 KB, free 366.1 MB)
20/06/18 15:46:53 INFO MemoryStore: Block broadcast_0_piece0 stored as bytes in memory (estimated size 22.9 KB, free 366.0 MB)
20/06/18 15:46:53 INFO BlockManagerInfo: Added broadcast_0_piece0 in memory on 192.168.0.17:54227 (size: 22.9 KB, free: 366.3 MB)
20/06/18 15:46:53 INFO SparkContext: Created broadcast 0 from textFile at SimpleApp.scala:10
20/06/18 15:46:54 INFO FileInputFormat: Total input paths to process : 1
20/06/18 15:46:54 INFO SparkContext: Starting job: count at SimpleApp.scala:11
20/06/18 15:46:54 INFO DAGScheduler: Got job 0 (count at SimpleApp.scala:11) with 2 output partitions
20/06/18 15:46:54 INFO DAGScheduler: Final stage: ResultStage 0 (count at SimpleApp.scala:11)
20/06/18 15:46:54 INFO DAGScheduler: Parents of final stage: List()
20/06/18 15:46:54 INFO DAGScheduler: Missing parents: List()
20/06/18 15:46:54 INFO DAGScheduler: Submitting ResultStage 0 (MapPartitionsRDD[2] at filter at SimpleApp.scala:11), which has no missing parents
20/06/18 15:46:54 INFO MemoryStore: Block broadcast_1 stored as values in memory (estimated size 3.3 KB, free 366.0 MB)
20/06/18 15:46:54 INFO MemoryStore: Block broadcast_1_piece0 stored as bytes in memory (estimated size 2006.0 B, free 366.0 MB)
20/06/18 15:46:54 INFO BlockManagerInfo: Added broadcast_1_piece0 in memory on 192.168.0.17:54227 (size: 2006.0 B, free: 366.3 MB)
20/06/18 15:46:54 INFO SparkContext: Created broadcast 1 from broadcast at DAGScheduler.scala:996
20/06/18 15:46:54 INFO DAGScheduler: Submitting 2 missing tasks from ResultStage 0 (MapPartitionsRDD[2] at filter at SimpleApp.scala:11)
20/06/18 15:46:54 INFO TaskSchedulerImpl: Adding task set 0.0 with 2 tasks
20/06/18 15:46:54 INFO TaskSetManager: Starting task 0.0 in stage 0.0 (TID 0, localhost, executor driver, partition 0, ANY, 5977 bytes)
20/06/18 15:46:54 INFO TaskSetManager: Starting task 1.0 in stage 0.0 (TID 1, localhost, executor driver, partition 1, ANY, 5977 bytes)
20/06/18 15:46:54 INFO Executor: Running task 1.0 in stage 0.0 (TID 1)
20/06/18 15:46:54 INFO Executor: Running task 0.0 in stage 0.0 (TID 0)
20/06/18 15:46:54 INFO Executor: Fetching spark://192.168.0.17:54226/jars/simpleapp_2.11-1.0.jar with timestamp 1592520412631
20/06/18 15:46:54 INFO TransportClientFactory: Successfully created connection to /192.168.0.17:54226 after 42 ms (0 ms spent in bootstraps)
20/06/18 15:46:54 INFO Utils: Fetching spark://192.168.0.17:54226/jars/simpleapp_2.11-1.0.jar to /private/var/folders/5n/plkx587s0kj_92g0r6z1vvq40000gn/T/spark-405d6aae-5053-4209-9539-35e5d102ba42/userFiles-a0e1d94f-cd1e-40a5-ab2d-f83b47e099be/fetchFileTemp7236340219700496483.tmp
20/06/18 15:46:54 INFO Executor: Adding file:/private/var/folders/5n/plkx587s0kj_92g0r6z1vvq40000gn/T/spark-405d6aae-5053-4209-9539-35e5d102ba42/userFiles-a0e1d94f-cd1e-40a5-ab2d-f83b47e099be/simpleapp_2.11-1.0.jar to class loader
20/06/18 15:46:54 INFO HadoopRDD: Input split: hdfs://localhost:54310/user/spark-demo/sample.txt:0+16
20/06/18 15:46:54 INFO HadoopRDD: Input split: hdfs://localhost:54310/user/spark-demo/sample.txt:16+16
20/06/18 15:46:54 INFO deprecation: mapred.tip.id is deprecated. Instead, use mapreduce.task.id
20/06/18 15:46:54 INFO deprecation: mapred.task.id is deprecated. Instead, use mapreduce.task.attempt.id
20/06/18 15:46:54 INFO deprecation: mapred.task.is.map is deprecated. Instead, use mapreduce.task.ismap
20/06/18 15:46:54 INFO deprecation: mapred.task.partition is deprecated. Instead, use mapreduce.task.partition
20/06/18 15:46:54 INFO deprecation: mapred.job.id is deprecated. Instead, use mapreduce.job.id
20/06/18 15:46:54 INFO MemoryStore: Block rdd_1_1 stored as values in memory (estimated size 96.0 B, free 366.0 MB)
20/06/18 15:46:54 INFO MemoryStore: Block rdd_1_0 stored as values in memory (estimated size 96.0 B, free 366.0 MB)
20/06/18 15:46:54 INFO BlockManagerInfo: Added rdd_1_1 in memory on 192.168.0.17:54227 (size: 96.0 B, free: 366.3 MB)
20/06/18 15:46:54 INFO BlockManagerInfo: Added rdd_1_0 in memory on 192.168.0.17:54227 (size: 96.0 B, free: 366.3 MB)
20/06/18 15:46:54 INFO Executor: Finished task 1.0 in stage 0.0 (TID 1). 1918 bytes result sent to driver
20/06/18 15:46:54 INFO Executor: Finished task 0.0 in stage 0.0 (TID 0). 1918 bytes result sent to driver
20/06/18 15:46:54 INFO TaskSetManager: Finished task 0.0 in stage 0.0 (TID 0) in 371 ms on localhost (executor driver) (1/2)
20/06/18 15:46:54 INFO TaskSetManager: Finished task 1.0 in stage 0.0 (TID 1) in 340 ms on localhost (executor driver) (2/2)
20/06/18 15:46:54 INFO TaskSchedulerImpl: Removed TaskSet 0.0, whose tasks have all completed, from pool 
20/06/18 15:46:54 INFO DAGScheduler: ResultStage 0 (count at SimpleApp.scala:11) finished in 0.400 s
20/06/18 15:46:54 INFO DAGScheduler: Job 0 finished: count at SimpleApp.scala:11, took 0.541614 s
20/06/18 15:46:54 INFO SparkContext: Starting job: count at SimpleApp.scala:12
20/06/18 15:46:54 INFO DAGScheduler: Got job 1 (count at SimpleApp.scala:12) with 2 output partitions
20/06/18 15:46:54 INFO DAGScheduler: Final stage: ResultStage 1 (count at SimpleApp.scala:12)
20/06/18 15:46:54 INFO DAGScheduler: Parents of final stage: List()
20/06/18 15:46:54 INFO DAGScheduler: Missing parents: List()
20/06/18 15:46:54 INFO DAGScheduler: Submitting ResultStage 1 (MapPartitionsRDD[3] at filter at SimpleApp.scala:12), which has no missing parents
20/06/18 15:46:54 INFO MemoryStore: Block broadcast_2 stored as values in memory (estimated size 3.3 KB, free 366.0 MB)
20/06/18 15:46:54 INFO MemoryStore: Block broadcast_2_piece0 stored as bytes in memory (estimated size 2008.0 B, free 366.0 MB)
20/06/18 15:46:54 INFO BlockManagerInfo: Added broadcast_2_piece0 in memory on 192.168.0.17:54227 (size: 2008.0 B, free: 366.3 MB)
20/06/18 15:46:54 INFO SparkContext: Created broadcast 2 from broadcast at DAGScheduler.scala:996
20/06/18 15:46:54 INFO DAGScheduler: Submitting 2 missing tasks from ResultStage 1 (MapPartitionsRDD[3] at filter at SimpleApp.scala:12)
20/06/18 15:46:54 INFO TaskSchedulerImpl: Adding task set 1.0 with 2 tasks
20/06/18 15:46:54 INFO TaskSetManager: Starting task 0.0 in stage 1.0 (TID 2, localhost, executor driver, partition 0, PROCESS_LOCAL, 5977 bytes)
20/06/18 15:46:54 INFO TaskSetManager: Starting task 1.0 in stage 1.0 (TID 3, localhost, executor driver, partition 1, PROCESS_LOCAL, 5977 bytes)
20/06/18 15:46:54 INFO Executor: Running task 1.0 in stage 1.0 (TID 3)
20/06/18 15:46:54 INFO Executor: Running task 0.0 in stage 1.0 (TID 2)
20/06/18 15:46:54 INFO BlockManager: Found block rdd_1_0 locally
20/06/18 15:46:54 INFO BlockManager: Found block rdd_1_1 locally
20/06/18 15:46:54 INFO Executor: Finished task 1.0 in stage 1.0 (TID 3). 1210 bytes result sent to driver
20/06/18 15:46:54 INFO Executor: Finished task 0.0 in stage 1.0 (TID 2). 1210 bytes result sent to driver
20/06/18 15:46:54 INFO TaskSetManager: Finished task 1.0 in stage 1.0 (TID 3) in 8 ms on localhost (executor driver) (1/2)
20/06/18 15:46:54 INFO TaskSetManager: Finished task 0.0 in stage 1.0 (TID 2) in 11 ms on localhost (executor driver) (2/2)
20/06/18 15:46:54 INFO TaskSchedulerImpl: Removed TaskSet 1.0, whose tasks have all completed, from pool 
20/06/18 15:46:54 INFO DAGScheduler: ResultStage 1 (count at SimpleApp.scala:12) finished in 0.012 s
20/06/18 15:46:54 INFO DAGScheduler: Job 1 finished: count at SimpleApp.scala:12, took 0.021761 s
Lines with a: 1, Lines with b: 0
20/06/18 15:46:54 INFO SparkContext: Invoking stop() from shutdown hook
20/06/18 15:46:54 INFO SparkUI: Stopped Spark web UI at http://192.168.0.17:4040
20/06/18 15:46:54 INFO MapOutputTrackerMasterEndpoint: MapOutputTrackerMasterEndpoint stopped!
20/06/18 15:46:54 INFO MemoryStore: MemoryStore cleared
20/06/18 15:46:54 INFO BlockManager: BlockManager stopped
20/06/18 15:46:54 INFO BlockManagerMaster: BlockManagerMaster stopped
20/06/18 15:46:54 INFO OutputCommitCoordinator$OutputCommitCoordinatorEndpoint: OutputCommitCoordinator stopped!
20/06/18 15:46:54 INFO SparkContext: Successfully stopped SparkContext
20/06/18 15:46:54 INFO ShutdownHookManager: Shutdown hook called
20/06/18 15:46:54 INFO ShutdownHookManager: Deleting directory /private/var/folders/5n/plkx587s0kj_92g0r6z1vvq40000gn/T/spark-405d6aae-5053-4209-9539-35e5d102ba42
(base) MacBook-Pro-106:scala-2.11 atul595525$ 




#########
sample file
##########

(base) MacBook-Pro-106:scala-2.11 atul595525$ hdfs dfs -cat /user/spark-demo/sample.txt
20/06/18 15:48:48 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
atul,20,engineer
nidhi,29,doctor



Output:
======

Lines with a: 1, Lines with b: 0

#https://medium.com/@eric.ch.day/spark-scala-hive-sql-simple-tests-54afacdcc418





#################
Task 2: trying similar example with Pyspark
##################


(base) MacBook-Pro-106:examples atul595525$ hdfs dfs -cat /user/spark_demo/sample.txt
20/06/18 16:03:05 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
Atul and Nidhi are husband wife
Nidhi is a very good human being.
Atul Loves Nidhi.
Nidhi is the best wife on earth.(base) MacBook-Pro-106:examples atul595525$ 
(base) MacBook-Pro-106:examples atul595525$ 



/Users/atul595525/Desktop/mysparkproject/word_count.py



[edureka@localhost Desktop]$ spark-submit word_count.py
20/06/19 08:54:00 INFO spark.SparkContext: Running Spark version 1.5.2
20/06/19 08:54:00 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
20/06/19 08:54:00 WARN util.Utils: Your hostname, localhost.localdomain resolves to a loopback address: 127.0.0.1; using 10.0.2.15 instead (on interface eth0)
20/06/19 08:54:00 WARN util.Utils: Set SPARK_LOCAL_IP if you need to bind to another address
20/06/19 08:54:00 INFO spark.SecurityManager: Changing view acls to: edureka
20/06/19 08:54:00 INFO spark.SecurityManager: Changing modify acls to: edureka
20/06/19 08:54:00 INFO spark.SecurityManager: SecurityManager: authentication disabled; ui acls disabled; users with view permissions: Set(edureka); users with modify permissions: Set(edureka)
20/06/19 08:54:01 INFO slf4j.Slf4jLogger: Slf4jLogger started
20/06/19 08:54:01 INFO Remoting: Starting remoting
20/06/19 08:54:01 INFO Remoting: Remoting started; listening on addresses :[akka.tcp://sparkDriver@10.0.2.15:37950]
20/06/19 08:54:01 INFO util.Utils: Successfully started service 'sparkDriver' on port 37950.
20/06/19 08:54:01 INFO spark.SparkEnv: Registering MapOutputTracker
20/06/19 08:54:01 INFO spark.SparkEnv: Registering BlockManagerMaster
20/06/19 08:54:01 INFO storage.DiskBlockManager: Created local directory at /tmp/blockmgr-e2b6861e-ad53-4604-8a5d-eda753b4bd72
20/06/19 08:54:01 INFO storage.MemoryStore: MemoryStore started with capacity 534.5 MB
20/06/19 08:54:01 INFO spark.HttpFileServer: HTTP File server directory is /tmp/spark-483649c0-c9aa-4b9c-a609-455af8789454/httpd-700c1d0a-04c0-4251-a381-2ee0100fc7b6
20/06/19 08:54:01 INFO spark.HttpServer: Starting HTTP Server
20/06/19 08:54:01 INFO server.Server: jetty-8.y.z-SNAPSHOT
20/06/19 08:54:01 INFO server.AbstractConnector: Started SocketConnector@0.0.0.0:60266
20/06/19 08:54:01 INFO util.Utils: Successfully started service 'HTTP file server' on port 60266.
20/06/19 08:54:01 INFO spark.SparkEnv: Registering OutputCommitCoordinator
20/06/19 08:54:01 INFO server.Server: jetty-8.y.z-SNAPSHOT
20/06/19 08:54:01 WARN component.AbstractLifeCycle: FAILED SelectChannelConnector@0.0.0.0:4040: java.net.BindException: Address already in use
java.net.BindException: Address already in use
	at sun.nio.ch.Net.bind0(Native Method)
	at sun.nio.ch.Net.bind(Net.java:444)
	at sun.nio.ch.Net.bind(Net.java:436)
	at sun.nio.ch.ServerSocketChannelImpl.bind(ServerSocketChannelImpl.java:214)
	at sun.nio.ch.ServerSocketAdaptor.bind(ServerSocketAdaptor.java:74)
	at org.spark-project.jetty.server.nio.SelectChannelConnector.open(SelectChannelConnector.java:187)
	at org.spark-project.jetty.server.AbstractConnector.doStart(AbstractConnector.java:316)
	at org.spark-project.jetty.server.nio.SelectChannelConnector.doStart(SelectChannelConnector.java:265)
	at org.spark-project.jetty.util.component.AbstractLifeCycle.start(AbstractLifeCycle.java:64)
	at org.spark-project.jetty.server.Server.doStart(Server.java:293)
	at org.spark-project.jetty.util.component.AbstractLifeCycle.start(AbstractLifeCycle.java:64)
	at org.apache.spark.ui.JettyUtils$.org$apache$spark$ui$JettyUtils$$connect$1(JettyUtils.scala:236)
	at org.apache.spark.ui.JettyUtils$$anonfun$3.apply(JettyUtils.scala:246)
	at org.apache.spark.ui.JettyUtils$$anonfun$3.apply(JettyUtils.scala:246)
	at org.apache.spark.util.Utils$$anonfun$startServiceOnPort$1.apply$mcVI$sp(Utils.scala:1920)
	at scala.collection.immutable.Range.foreach$mVc$sp(Range.scala:141)
	at org.apache.spark.util.Utils$.startServiceOnPort(Utils.scala:1911)
	at org.apache.spark.ui.JettyUtils$.startJettyServer(JettyUtils.scala:246)
	at org.apache.spark.ui.WebUI.bind(WebUI.scala:136)
	at org.apache.spark.SparkContext$$anonfun$13.apply(SparkContext.scala:474)
	at org.apache.spark.SparkContext$$anonfun$13.apply(SparkContext.scala:474)
	at scala.Option.foreach(Option.scala:236)
	at org.apache.spark.SparkContext.<init>(SparkContext.scala:474)
	at org.apache.spark.api.java.JavaSparkContext.<init>(JavaSparkContext.scala:61)
	at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)
	at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:57)
	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
	at py4j.reflection.MethodInvoker.invoke(MethodInvoker.java:234)
	at py4j.reflection.ReflectionEngine.invoke(ReflectionEngine.java:379)
	at py4j.Gateway.invoke(Gateway.java:214)
	at py4j.commands.ConstructorCommand.invokeConstructor(ConstructorCommand.java:79)
	at py4j.commands.ConstructorCommand.execute(ConstructorCommand.java:68)
	at py4j.GatewayConnection.run(GatewayConnection.java:207)
	at java.lang.Thread.run(Thread.java:745)
20/06/19 08:54:01 WARN component.AbstractLifeCycle: FAILED org.spark-project.jetty.server.Server@1c0974: java.net.BindException: Address already in use
java.net.BindException: Address already in use
	at sun.nio.ch.Net.bind0(Native Method)
	at sun.nio.ch.Net.bind(Net.java:444)
	at sun.nio.ch.Net.bind(Net.java:436)
	at sun.nio.ch.ServerSocketChannelImpl.bind(ServerSocketChannelImpl.java:214)
	at sun.nio.ch.ServerSocketAdaptor.bind(ServerSocketAdaptor.java:74)
	at org.spark-project.jetty.server.nio.SelectChannelConnector.open(SelectChannelConnector.java:187)
	at org.spark-project.jetty.server.AbstractConnector.doStart(AbstractConnector.java:316)
	at org.spark-project.jetty.server.nio.SelectChannelConnector.doStart(SelectChannelConnector.java:265)
	at org.spark-project.jetty.util.component.AbstractLifeCycle.start(AbstractLifeCycle.java:64)
	at org.spark-project.jetty.server.Server.doStart(Server.java:293)
	at org.spark-project.jetty.util.component.AbstractLifeCycle.start(AbstractLifeCycle.java:64)
	at org.apache.spark.ui.JettyUtils$.org$apache$spark$ui$JettyUtils$$connect$1(JettyUtils.scala:236)
	at org.apache.spark.ui.JettyUtils$$anonfun$3.apply(JettyUtils.scala:246)
	at org.apache.spark.ui.JettyUtils$$anonfun$3.apply(JettyUtils.scala:246)
	at org.apache.spark.util.Utils$$anonfun$startServiceOnPort$1.apply$mcVI$sp(Utils.scala:1920)
	at scala.collection.immutable.Range.foreach$mVc$sp(Range.scala:141)
	at org.apache.spark.util.Utils$.startServiceOnPort(Utils.scala:1911)
	at org.apache.spark.ui.JettyUtils$.startJettyServer(JettyUtils.scala:246)
	at org.apache.spark.ui.WebUI.bind(WebUI.scala:136)
	at org.apache.spark.SparkContext$$anonfun$13.apply(SparkContext.scala:474)
	at org.apache.spark.SparkContext$$anonfun$13.apply(SparkContext.scala:474)
	at scala.Option.foreach(Option.scala:236)
	at org.apache.spark.SparkContext.<init>(SparkContext.scala:474)
	at org.apache.spark.api.java.JavaSparkContext.<init>(JavaSparkContext.scala:61)
	at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)
	at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:57)
	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
	at py4j.reflection.MethodInvoker.invoke(MethodInvoker.java:234)
	at py4j.reflection.ReflectionEngine.invoke(ReflectionEngine.java:379)
	at py4j.Gateway.invoke(Gateway.java:214)
	at py4j.commands.ConstructorCommand.invokeConstructor(ConstructorCommand.java:79)
	at py4j.commands.ConstructorCommand.execute(ConstructorCommand.java:68)
	at py4j.GatewayConnection.run(GatewayConnection.java:207)
	at java.lang.Thread.run(Thread.java:745)
20/06/19 08:54:01 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/stages/stage/kill,null}
20/06/19 08:54:01 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/api,null}
20/06/19 08:54:01 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/,null}
20/06/19 08:54:01 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/static,null}
20/06/19 08:54:01 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/executors/threadDump/json,null}
20/06/19 08:54:01 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/executors/threadDump,null}
20/06/19 08:54:01 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/executors/json,null}
20/06/19 08:54:01 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/executors,null}
20/06/19 08:54:01 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/environment/json,null}
20/06/19 08:54:01 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/environment,null}
20/06/19 08:54:01 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/storage/rdd/json,null}
20/06/19 08:54:01 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/storage/rdd,null}
20/06/19 08:54:01 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/storage/json,null}
20/06/19 08:54:01 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/storage,null}
20/06/19 08:54:01 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/stages/pool/json,null}
20/06/19 08:54:01 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/stages/pool,null}
20/06/19 08:54:01 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/stages/stage/json,null}
20/06/19 08:54:01 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/stages/stage,null}
20/06/19 08:54:01 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/stages/json,null}
20/06/19 08:54:01 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/stages,null}
20/06/19 08:54:01 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/jobs/job/json,null}
20/06/19 08:54:01 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/jobs/job,null}
20/06/19 08:54:01 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/jobs/json,null}
20/06/19 08:54:01 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/jobs,null}
20/06/19 08:54:01 WARN util.Utils: Service 'SparkUI' could not bind on port 4040. Attempting port 4041.
20/06/19 08:54:01 INFO server.Server: jetty-8.y.z-SNAPSHOT
20/06/19 08:54:01 INFO server.AbstractConnector: Started SelectChannelConnector@0.0.0.0:4041
20/06/19 08:54:01 INFO util.Utils: Successfully started service 'SparkUI' on port 4041.
20/06/19 08:54:01 INFO ui.SparkUI: Started SparkUI at http://10.0.2.15:4041
20/06/19 08:54:02 INFO util.Utils: Copying /home/edureka/Desktop/word_count.py to /tmp/spark-483649c0-c9aa-4b9c-a609-455af8789454/userFiles-2cf168fb-a7d7-4830-8414-ebe95bbf040f/word_count.py
20/06/19 08:54:02 INFO spark.SparkContext: Added file file:/home/edureka/Desktop/word_count.py at file:/home/edureka/Desktop/word_count.py with timestamp 1592537042002
20/06/19 08:54:02 WARN metrics.MetricsSystem: Using default name DAGScheduler for source because spark.app.id is not set.
20/06/19 08:54:02 INFO executor.Executor: Starting executor ID driver on host localhost
20/06/19 08:54:02 INFO util.Utils: Successfully started service 'org.apache.spark.network.netty.NettyBlockTransferService' on port 55562.
20/06/19 08:54:02 INFO netty.NettyBlockTransferService: Server created on 55562
20/06/19 08:54:02 INFO storage.BlockManagerMaster: Trying to register BlockManager
20/06/19 08:54:02 INFO storage.BlockManagerMasterEndpoint: Registering block manager localhost:55562 with 534.5 MB RAM, BlockManagerId(driver, localhost, 55562)
20/06/19 08:54:02 INFO storage.BlockManagerMaster: Registered BlockManager
20/06/19 08:54:02 WARN util.SizeEstimator: Failed to check whether UseCompressedOops is set; assuming yes
20/06/19 08:54:02 INFO storage.MemoryStore: ensureFreeSpace(141816) called with curMem=0, maxMem=560497950
20/06/19 08:54:02 INFO storage.MemoryStore: Block broadcast_0 stored as values in memory (estimated size 138.5 KB, free 534.4 MB)
20/06/19 08:54:02 INFO storage.MemoryStore: ensureFreeSpace(14469) called with curMem=141816, maxMem=560497950
20/06/19 08:54:02 INFO storage.MemoryStore: Block broadcast_0_piece0 stored as bytes in memory (estimated size 14.1 KB, free 534.4 MB)
20/06/19 08:54:02 INFO storage.BlockManagerInfo: Added broadcast_0_piece0 in memory on localhost:55562 (size: 14.1 KB, free: 534.5 MB)
20/06/19 08:54:02 INFO spark.SparkContext: Created broadcast 0 from textFile at NativeMethodAccessorImpl.java:-2
20/06/19 08:54:03 INFO mapred.FileInputFormat: Total input paths to process : 1
20/06/19 08:54:03 INFO Configuration.deprecation: mapred.tip.id is deprecated. Instead, use mapreduce.task.id
20/06/19 08:54:03 INFO Configuration.deprecation: mapred.task.id is deprecated. Instead, use mapreduce.task.attempt.id
20/06/19 08:54:03 INFO Configuration.deprecation: mapred.task.is.map is deprecated. Instead, use mapreduce.task.ismap
20/06/19 08:54:03 INFO Configuration.deprecation: mapred.task.partition is deprecated. Instead, use mapreduce.task.partition
20/06/19 08:54:03 INFO Configuration.deprecation: mapred.job.id is deprecated. Instead, use mapreduce.job.id
20/06/19 08:54:03 INFO spark.SparkContext: Starting job: saveAsTextFile at NativeMethodAccessorImpl.java:-2
20/06/19 08:54:03 INFO scheduler.DAGScheduler: Registering RDD 3 (reduceByKey at /home/edureka/Desktop/word_count.py:17)
20/06/19 08:54:03 INFO scheduler.DAGScheduler: Got job 0 (saveAsTextFile at NativeMethodAccessorImpl.java:-2) with 1 output partitions
20/06/19 08:54:03 INFO scheduler.DAGScheduler: Final stage: ResultStage 1(saveAsTextFile at NativeMethodAccessorImpl.java:-2)
20/06/19 08:54:03 INFO scheduler.DAGScheduler: Parents of final stage: List(ShuffleMapStage 0)
20/06/19 08:54:03 INFO scheduler.DAGScheduler: Missing parents: List(ShuffleMapStage 0)
20/06/19 08:54:03 INFO scheduler.DAGScheduler: Submitting ShuffleMapStage 0 (PairwiseRDD[3] at reduceByKey at /home/edureka/Desktop/word_count.py:17), which has no missing parents
20/06/19 08:54:03 INFO storage.MemoryStore: ensureFreeSpace(8368) called with curMem=156285, maxMem=560497950
20/06/19 08:54:03 INFO storage.MemoryStore: Block broadcast_1 stored as values in memory (estimated size 8.2 KB, free 534.4 MB)
20/06/19 08:54:03 INFO storage.MemoryStore: ensureFreeSpace(5242) called with curMem=164653, maxMem=560497950
20/06/19 08:54:03 INFO storage.MemoryStore: Block broadcast_1_piece0 stored as bytes in memory (estimated size 5.1 KB, free 534.4 MB)
20/06/19 08:54:03 INFO storage.BlockManagerInfo: Added broadcast_1_piece0 in memory on localhost:55562 (size: 5.1 KB, free: 534.5 MB)
20/06/19 08:54:03 INFO spark.SparkContext: Created broadcast 1 from broadcast at DAGScheduler.scala:861
20/06/19 08:54:03 INFO scheduler.DAGScheduler: Submitting 1 missing tasks from ShuffleMapStage 0 (PairwiseRDD[3] at reduceByKey at /home/edureka/Desktop/word_count.py:17)
20/06/19 08:54:03 INFO scheduler.TaskSchedulerImpl: Adding task set 0.0 with 1 tasks
20/06/19 08:54:03 INFO scheduler.TaskSetManager: Starting task 0.0 in stage 0.0 (TID 0, localhost, PROCESS_LOCAL, 2196 bytes)
20/06/19 08:54:03 INFO executor.Executor: Running task 0.0 in stage 0.0 (TID 0)
20/06/19 08:54:03 INFO executor.Executor: Fetching file:/home/edureka/Desktop/word_count.py with timestamp 1592537042002
20/06/19 08:54:03 INFO util.Utils: /home/edureka/Desktop/word_count.py has been previously copied to /tmp/spark-483649c0-c9aa-4b9c-a609-455af8789454/userFiles-2cf168fb-a7d7-4830-8414-ebe95bbf040f/word_count.py
20/06/19 08:54:03 INFO rdd.HadoopRDD: Input split: hdfs://localhost:8020/user/spark_demo/sample.txt:0+77
20/06/19 08:54:04 INFO python.PythonRunner: Times: total = 253, boot = 193, init = 55, finish = 5
20/06/19 08:54:04 INFO executor.Executor: Finished task 0.0 in stage 0.0 (TID 0). 2317 bytes result sent to driver
20/06/19 08:54:04 INFO scheduler.DAGScheduler: ShuffleMapStage 0 (reduceByKey at /home/edureka/Desktop/word_count.py:17) finished in 0.466 s
20/06/19 08:54:04 INFO scheduler.TaskSetManager: Finished task 0.0 in stage 0.0 (TID 0) in 439 ms on localhost (1/1)
20/06/19 08:54:04 INFO scheduler.TaskSchedulerImpl: Removed TaskSet 0.0, whose tasks have all completed, from pool 
20/06/19 08:54:04 INFO scheduler.DAGScheduler: looking for newly runnable stages
20/06/19 08:54:04 INFO scheduler.DAGScheduler: running: Set()
20/06/19 08:54:04 INFO scheduler.DAGScheduler: waiting: Set(ResultStage 1)
20/06/19 08:54:04 INFO scheduler.DAGScheduler: failed: Set()
20/06/19 08:54:04 INFO scheduler.DAGScheduler: Missing parents for ResultStage 1: List()
20/06/19 08:54:04 INFO scheduler.DAGScheduler: Submitting ResultStage 1 (MapPartitionsRDD[8] at saveAsTextFile at NativeMethodAccessorImpl.java:-2), which is now runnable
20/06/19 08:54:04 INFO storage.MemoryStore: ensureFreeSpace(99624) called with curMem=169895, maxMem=560497950
20/06/19 08:54:04 INFO storage.MemoryStore: Block broadcast_2 stored as values in memory (estimated size 97.3 KB, free 534.3 MB)
20/06/19 08:54:04 INFO storage.MemoryStore: ensureFreeSpace(34445) called with curMem=269519, maxMem=560497950
20/06/19 08:54:04 INFO storage.MemoryStore: Block broadcast_2_piece0 stored as bytes in memory (estimated size 33.6 KB, free 534.2 MB)
20/06/19 08:54:04 INFO storage.BlockManagerInfo: Added broadcast_2_piece0 in memory on localhost:55562 (size: 33.6 KB, free: 534.5 MB)
20/06/19 08:54:04 INFO spark.SparkContext: Created broadcast 2 from broadcast at DAGScheduler.scala:861
20/06/19 08:54:04 INFO scheduler.DAGScheduler: Submitting 1 missing tasks from ResultStage 1 (MapPartitionsRDD[8] at saveAsTextFile at NativeMethodAccessorImpl.java:-2)
20/06/19 08:54:04 INFO scheduler.TaskSchedulerImpl: Adding task set 1.0 with 1 tasks
20/06/19 08:54:04 INFO scheduler.TaskSetManager: Starting task 0.0 in stage 1.0 (TID 1, localhost, PROCESS_LOCAL, 1951 bytes)
20/06/19 08:54:04 INFO executor.Executor: Running task 0.0 in stage 1.0 (TID 1)
20/06/19 08:54:04 INFO Configuration.deprecation: mapred.output.dir is deprecated. Instead, use mapreduce.output.fileoutputformat.outputdir
20/06/19 08:54:04 INFO Configuration.deprecation: mapred.output.key.class is deprecated. Instead, use mapreduce.job.output.key.class
20/06/19 08:54:04 INFO Configuration.deprecation: mapred.output.value.class is deprecated. Instead, use mapreduce.job.output.value.class
20/06/19 08:54:04 INFO Configuration.deprecation: mapred.working.dir is deprecated. Instead, use mapreduce.job.working.dir
20/06/19 08:54:04 INFO storage.ShuffleBlockFetcherIterator: Getting 1 non-empty blocks out of 1 blocks
20/06/19 08:54:04 INFO storage.ShuffleBlockFetcherIterator: Started 0 remote fetches in 7 ms
20/06/19 08:54:04 INFO python.PythonRunner: Times: total = 42, boot = -231, init = 272, finish = 1
20/06/19 08:54:04 INFO output.FileOutputCommitter: Saved output of task 'attempt_202006190854_0001_m_000000_1' to hdfs://localhost:8020/user/spark_demo/output/_temporary/0/task_202006190854_0001_m_000000
20/06/19 08:54:04 INFO mapred.SparkHadoopMapRedUtil: attempt_202006190854_0001_m_000000_1: Committed
20/06/19 08:54:04 INFO executor.Executor: Finished task 0.0 in stage 1.0 (TID 1). 1229 bytes result sent to driver
20/06/19 08:54:04 INFO scheduler.DAGScheduler: ResultStage 1 (saveAsTextFile at NativeMethodAccessorImpl.java:-2) finished in 0.261 s
20/06/19 08:54:04 INFO scheduler.TaskSetManager: Finished task 0.0 in stage 1.0 (TID 1) in 270 ms on localhost (1/1)
20/06/19 08:54:04 INFO scheduler.TaskSchedulerImpl: Removed TaskSet 1.0, whose tasks have all completed, from pool 
20/06/19 08:54:04 INFO scheduler.DAGScheduler: Job 0 finished: saveAsTextFile at NativeMethodAccessorImpl.java:-2, took 0.933165 s
local-1592537042082
20/06/19 08:54:04 INFO spark.SparkContext: Invoking stop() from shutdown hook
20/06/19 08:54:04 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/metrics/json,null}
20/06/19 08:54:04 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/stages/stage/kill,null}
20/06/19 08:54:04 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/api,null}
20/06/19 08:54:04 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/,null}
20/06/19 08:54:04 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/static,null}
20/06/19 08:54:04 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/executors/threadDump/json,null}
20/06/19 08:54:04 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/executors/threadDump,null}
20/06/19 08:54:04 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/executors/json,null}
20/06/19 08:54:04 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/executors,null}
20/06/19 08:54:04 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/environment/json,null}
20/06/19 08:54:04 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/environment,null}
20/06/19 08:54:04 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/storage/rdd/json,null}
20/06/19 08:54:04 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/storage/rdd,null}
20/06/19 08:54:04 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/storage/json,null}
20/06/19 08:54:04 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/storage,null}
20/06/19 08:54:04 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/stages/pool/json,null}
20/06/19 08:54:04 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/stages/pool,null}
20/06/19 08:54:04 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/stages/stage/json,null}
20/06/19 08:54:04 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/stages/stage,null}
20/06/19 08:54:04 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/stages/json,null}
20/06/19 08:54:04 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/stages,null}
20/06/19 08:54:04 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/jobs/job/json,null}
20/06/19 08:54:04 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/jobs/job,null}
20/06/19 08:54:04 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/jobs/json,null}
20/06/19 08:54:04 INFO handler.ContextHandler: stopped o.s.j.s.ServletContextHandler{/jobs,null}
20/06/19 08:54:04 INFO ui.SparkUI: Stopped Spark web UI at http://10.0.2.15:4041
20/06/19 08:54:04 INFO scheduler.DAGScheduler: Stopping DAGScheduler
20/06/19 08:54:04 INFO spark.MapOutputTrackerMasterEndpoint: MapOutputTrackerMasterEndpoint stopped!
20/06/19 08:54:04 INFO storage.MemoryStore: MemoryStore cleared
20/06/19 08:54:04 INFO storage.BlockManager: BlockManager stopped
20/06/19 08:54:04 INFO storage.BlockManagerMaster: BlockManagerMaster stopped
20/06/19 08:54:04 INFO scheduler.OutputCommitCoordinator$OutputCommitCoordinatorEndpoint: OutputCommitCoordinator stopped!
20/06/19 08:54:04 INFO spark.SparkContext: Successfully stopped SparkContext
20/06/19 08:54:04 INFO util.ShutdownHookManager: Shutdown hook called
20/06/19 08:54:04 INFO remote.RemoteActorRefProvider$RemotingTerminator: Shutting down remote daemon.
20/06/19 08:54:04 INFO remote.RemoteActorRefProvider$RemotingTerminator: Remote daemon shut down; proceeding with flushing remote transports.
20/06/19 08:54:04 INFO util.ShutdownHookManager: Deleting directory /tmp/spark-483649c0-c9aa-4b9c-a609-455af8789454/pyspark-2484a39c-83da-49a0-b147-4f38df51b4f0
20/06/19 08:54:04 INFO util.ShutdownHookManager: Deleting directory /tmp/spark-483649c0-c9aa-4b9c-a609-455af8789454
[edureka@localhost Desktop]$ 
[edureka@localhost Desktop]$ 
[edureka@localhost Desktop]$ 
[edureka@localhost Desktop]$ 
[edureka@localhost Desktop]$ hdfs dfs -ls /user/spark_demo/output
20/06/19 08:56:26 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
Found 2 items
-rw-r--r--   1 edureka supergroup          0 2020-06-19 08:54 /user/spark_demo/output/_SUCCESS
-rw-r--r--   1 edureka supergroup        162 2020-06-19 08:54 /user/spark_demo/output/part-00000
[edureka@localhost Desktop]$ 
[edureka@localhost Desktop]$ 

###########
VALIDATION
###########

[edureka@localhost Desktop]$ hdfs dfs -cat /user/spark_demo/output/part-00000
20/06/19 08:56:43 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
(u'and', 1)
(u'boy', 1)
(u'nidhi', 2)
(u'good', 1)
(u'wife', 1)
(u'of', 1)
(u'is', 2)
(u'baby', 1)
(u'a', 1)
(u'have', 1)
(u'ameya', 1)
(u'girl', 1)
(u'atul', 3)
[edureka@localhost Desktop]$ 




#############
task 3 import data from mysql to hdfs
#############

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




(base) MacBook-Pro-106:bin atul595525$ sqoop import --connect jdbc:mysql://localhost/product --table Employee --username testuser --password atul -m 1 --target-dir '/user/sqoop_output'
Warning: /Users/atul595525/Desktop/sqoop-1.4.7.bin__hadoop-2.6.0/../hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /Users/atul595525/Desktop/sqoop-1.4.7.bin__hadoop-2.6.0/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /Users/atul595525/Desktop/sqoop-1.4.7.bin__hadoop-2.6.0/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /Users/atul595525/Desktop/sqoop-1.4.7.bin__hadoop-2.6.0/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
20/06/18 17:38:10 INFO sqoop.Sqoop: Running Sqoop version: 1.4.7
20/06/18 17:38:10 WARN tool.BaseSqoopTool: Setting your password on the command-line is insecure. Consider using -P instead.
20/06/18 17:38:10 INFO manager.MySQLManager: Preparing to use a MySQL streaming resultset.
20/06/18 17:38:10 INFO tool.CodeGenTool: Beginning code generation
Thu Jun 18 17:38:10 PDT 2020 WARN: Establishing SSL connection without server's identity verification is not recommended. According to MySQL 5.5.45+, 5.6.26+ and 5.7.6+ requirements SSL connection must be established by default if explicit option isn't set. For compliance with existing applications not using SSL the verifyServerCertificate property is set to 'false'. You need either to explicitly disable SSL by setting useSSL=false, or set useSSL=true and provide truststore for server certificate verification.
20/06/18 17:38:11 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `Employee` AS t LIMIT 1
20/06/18 17:38:11 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `Employee` AS t LIMIT 1
20/06/18 17:38:11 INFO orm.CompilationManager: HADOOP_MAPRED_HOME is /Users/atul595525/Desktop/hadoop-2.6.0
Note: /tmp/sqoop-atul595525/compile/fd69c6eee2c1e735ab4a1aca29686bca/Employee.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
20/06/18 17:38:11 INFO orm.CompilationManager: Writing jar file: /tmp/sqoop-atul595525/compile/fd69c6eee2c1e735ab4a1aca29686bca/Employee.jar
20/06/18 17:38:12 WARN manager.MySQLManager: It looks like you are importing from mysql.
20/06/18 17:38:12 WARN manager.MySQLManager: This transfer can be faster! Use the --direct
20/06/18 17:38:12 WARN manager.MySQLManager: option to exercise a MySQL-specific fast path.
20/06/18 17:38:12 INFO manager.MySQLManager: Setting zero DATETIME behavior to convertToNull (mysql)
20/06/18 17:38:12 INFO mapreduce.ImportJobBase: Beginning import of Employee
20/06/18 17:38:12 INFO Configuration.deprecation: mapred.job.tracker is deprecated. Instead, use mapreduce.jobtracker.address
20/06/18 17:38:12 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
20/06/18 17:38:12 INFO Configuration.deprecation: mapred.jar is deprecated. Instead, use mapreduce.job.jar
20/06/18 17:38:12 INFO Configuration.deprecation: mapred.map.tasks is deprecated. Instead, use mapreduce.job.maps
20/06/18 17:38:12 INFO client.RMProxy: Connecting to ResourceManager at /0.0.0.0:8032
20/06/18 17:38:12 ERROR tool.ImportTool: Import failed: org.apache.hadoop.mapred.FileAlreadyExistsException: Output directory hdfs://localhost:54310/user/sqoop_output already exists
	at org.apache.hadoop.mapreduce.lib.output.FileOutputFormat.checkOutputSpecs(FileOutputFormat.java:146)
	at org.apache.hadoop.mapreduce.JobSubmitter.checkSpecs(JobSubmitter.java:562)
	at org.apache.hadoop.mapreduce.JobSubmitter.submitJobInternal(JobSubmitter.java:432)
	at org.apache.hadoop.mapreduce.Job$10.run(Job.java:1296)
	at org.apache.hadoop.mapreduce.Job$10.run(Job.java:1293)
	at java.security.AccessController.doPrivileged(Native Method)
	at javax.security.auth.Subject.doAs(Subject.java:422)
	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1628)
	at org.apache.hadoop.mapreduce.Job.submit(Job.java:1293)
	at org.apache.hadoop.mapreduce.Job.waitForCompletion(Job.java:1314)
	at org.apache.sqoop.mapreduce.ImportJobBase.doSubmitJob(ImportJobBase.java:200)
	at org.apache.sqoop.mapreduce.ImportJobBase.runJob(ImportJobBase.java:173)
	at org.apache.sqoop.mapreduce.ImportJobBase.runImport(ImportJobBase.java:270)
	at org.apache.sqoop.manager.SqlManager.importTable(SqlManager.java:692)
	at org.apache.sqoop.manager.MySQLManager.importTable(MySQLManager.java:127)
	at org.apache.sqoop.tool.ImportTool.importTable(ImportTool.java:520)
	at org.apache.sqoop.tool.ImportTool.run(ImportTool.java:628)
	at org.apache.sqoop.Sqoop.run(Sqoop.java:147)
	at org.apache.hadoop.util.ToolRunner.run(ToolRunner.java:70)
	at org.apache.sqoop.Sqoop.runSqoop(Sqoop.java:183)
	at org.apache.sqoop.Sqoop.runTool(Sqoop.java:234)
	at org.apache.sqoop.Sqoop.runTool(Sqoop.java:243)
	at org.apache.sqoop.Sqoop.main(Sqoop.java:252)

(base) MacBook-Pro-106:bin atul595525$ 
(base) MacBook-Pro-106:bin atul595525$ 
(base) MacBook-Pro-106:bin atul595525$ hdfs dfs -rm -r /user/sqoop_output
20/06/18 17:38:40 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
20/06/18 17:38:40 INFO fs.TrashPolicyDefault: Namenode trash configuration: Deletion interval = 0 minutes, Emptier interval = 0 minutes.
Deleted /user/sqoop_output
(base) MacBook-Pro-106:bin atul595525$ 
(base) MacBook-Pro-106:bin atul595525$ 
(base) MacBook-Pro-106:bin atul595525$ 
(base) MacBook-Pro-106:bin atul595525$ sqoop import --connect jdbc:mysql://localhost/product --table Employee --username testuser --password atul -m 1 --target-dir '/user/sqoop_output'
Warning: /Users/atul595525/Desktop/sqoop-1.4.7.bin__hadoop-2.6.0/../hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /Users/atul595525/Desktop/sqoop-1.4.7.bin__hadoop-2.6.0/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /Users/atul595525/Desktop/sqoop-1.4.7.bin__hadoop-2.6.0/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /Users/atul595525/Desktop/sqoop-1.4.7.bin__hadoop-2.6.0/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
20/06/18 17:38:46 INFO sqoop.Sqoop: Running Sqoop version: 1.4.7
20/06/18 17:38:46 WARN tool.BaseSqoopTool: Setting your password on the command-line is insecure. Consider using -P instead.
20/06/18 17:38:46 INFO manager.MySQLManager: Preparing to use a MySQL streaming resultset.
20/06/18 17:38:46 INFO tool.CodeGenTool: Beginning code generation
Thu Jun 18 17:38:46 PDT 2020 WARN: Establishing SSL connection without server's identity verification is not recommended. According to MySQL 5.5.45+, 5.6.26+ and 5.7.6+ requirements SSL connection must be established by default if explicit option isn't set. For compliance with existing applications not using SSL the verifyServerCertificate property is set to 'false'. You need either to explicitly disable SSL by setting useSSL=false, or set useSSL=true and provide truststore for server certificate verification.
20/06/18 17:38:46 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `Employee` AS t LIMIT 1
20/06/18 17:38:46 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `Employee` AS t LIMIT 1
20/06/18 17:38:46 INFO orm.CompilationManager: HADOOP_MAPRED_HOME is /Users/atul595525/Desktop/hadoop-2.6.0
Note: /tmp/sqoop-atul595525/compile/15c4cdb200d86e70af4a3b6228bcc6dd/Employee.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
20/06/18 17:38:47 INFO orm.CompilationManager: Writing jar file: /tmp/sqoop-atul595525/compile/15c4cdb200d86e70af4a3b6228bcc6dd/Employee.jar
20/06/18 17:38:47 WARN manager.MySQLManager: It looks like you are importing from mysql.
20/06/18 17:38:47 WARN manager.MySQLManager: This transfer can be faster! Use the --direct
20/06/18 17:38:47 WARN manager.MySQLManager: option to exercise a MySQL-specific fast path.
20/06/18 17:38:47 INFO manager.MySQLManager: Setting zero DATETIME behavior to convertToNull (mysql)
20/06/18 17:38:47 INFO mapreduce.ImportJobBase: Beginning import of Employee
20/06/18 17:38:47 INFO Configuration.deprecation: mapred.job.tracker is deprecated. Instead, use mapreduce.jobtracker.address
20/06/18 17:38:47 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
20/06/18 17:38:47 INFO Configuration.deprecation: mapred.jar is deprecated. Instead, use mapreduce.job.jar
20/06/18 17:38:48 INFO Configuration.deprecation: mapred.map.tasks is deprecated. Instead, use mapreduce.job.maps
20/06/18 17:38:48 INFO client.RMProxy: Connecting to ResourceManager at /0.0.0.0:8032
Thu Jun 18 17:38:50 PDT 2020 WARN: Establishing SSL connection without server's identity verification is not recommended. According to MySQL 5.5.45+, 5.6.26+ and 5.7.6+ requirements SSL connection must be established by default if explicit option isn't set. For compliance with existing applications not using SSL the verifyServerCertificate property is set to 'false'. You need either to explicitly disable SSL by setting useSSL=false, or set useSSL=true and provide truststore for server certificate verification.
20/06/18 17:38:50 INFO db.DBInputFormat: Using read commited transaction isolation
20/06/18 17:38:50 INFO mapreduce.JobSubmitter: number of splits:1
20/06/18 17:38:50 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1592509712833_0006
20/06/18 17:38:50 INFO impl.YarnClientImpl: Submitted application application_1592509712833_0006
20/06/18 17:38:50 INFO mapreduce.Job: The url to track the job: http://MacBook-Pro-106.local:8088/proxy/application_1592509712833_0006/
20/06/18 17:38:50 INFO mapreduce.Job: Running job: job_1592509712833_0006
20/06/18 17:38:57 INFO mapreduce.Job: Job job_1592509712833_0006 running in uber mode : false
20/06/18 17:38:57 INFO mapreduce.Job:  map 0% reduce 0%
20/06/18 17:39:02 INFO mapreduce.Job:  map 100% reduce 0%
20/06/18 17:39:02 INFO mapreduce.Job: Job job_1592509712833_0006 completed successfully
20/06/18 17:39:02 INFO mapreduce.Job: Counters: 30
	File System Counters
		FILE: Number of bytes read=0
		FILE: Number of bytes written=127806
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=87
		HDFS: Number of bytes written=26
		HDFS: Number of read operations=4
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=2
	Job Counters 
		Launched map tasks=1
		Other local map tasks=1
		Total time spent by all maps in occupied slots (ms)=2530
		Total time spent by all reduces in occupied slots (ms)=0
		Total time spent by all map tasks (ms)=2530
		Total vcore-seconds taken by all map tasks=2530
		Total megabyte-seconds taken by all map tasks=2590720
	Map-Reduce Framework
		Map input records=2
		Map output records=2
		Input split bytes=87
		Spilled Records=0
		Failed Shuffles=0
		Merged Map outputs=0
		GC time elapsed (ms)=41
		CPU time spent (ms)=0
		Physical memory (bytes) snapshot=0
		Virtual memory (bytes) snapshot=0
		Total committed heap usage (bytes)=147324928
	File Input Format Counters 
		Bytes Read=0
	File Output Format Counters 
		Bytes Written=26
20/06/18 17:39:02 INFO mapreduce.ImportJobBase: Transferred 26 bytes in 14.5505 seconds (1.7869 bytes/sec)
20/06/18 17:39:02 INFO mapreduce.ImportJobBase: Retrieved 2 records.



validation:
===========


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




##############
sqoop import with where clause
##############

sqoop import --connect jdbc:mysql://localhost/product --table Employee --username testuser --password atul -m 1 --where "firstname ='Vineet'" --target-dir '/user/sqoop_output_where'



validation:
===========

(base) MacBook-Pro-106:bin atul595525$ hdfs dfs -cat /user/sqoop_output_where/part-m-00000
20/06/18 17:46:53 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
Vineet,Chaturvedi
(base) MacBook-Pro-106:bin atul595525$ 
(base) MacBook-Pro-106:bin atul595525$ 




#############
sqoop incremental import
##############

mysql> select * From employee1;
+------+--------+
| ID   | SALARY |
+------+--------+
|    1 |    100 |
|    2 |    200 |
|    3 |    300 |
+------+--------+
3 rows in set (0.00 sec)



sqoop import --connect jdbc:mysql://localhost/product --table employee1 --username testuser --password atul -m 1 --incremental append --check-column ID  --last-value 1 --target-dir '/user/sqoop_output_incremental'




validation:
===========

(base) MacBook-Pro-106:bin atul595525$  hdfs dfs -cat /user/sqoop_output_incremental/part-m-00000
20/06/18 18:02:36 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
2,200
3,300
(base) MacBook-Pro-106:bin atul595525$ 




##############
EXPORTING DATA FROM HDFS TO MYSQL
##############

The files inside HDFS must have the same format as that of MySQL table, to enable the mapping of the data.
Refer the screenshot below to see two files which are ready to be mapped inside MySQL.


Creating table in mysql
=======================

CREATE TABLE employee2 (ID int(11),SALARY int(11));



Export the input.txt and input2.txt file from HDFS to MySQL
============================================================


sqoop export \
  --table employee2 \
  --connect "jdbc:mysql://localhost/product" \
  --username testuser \
  --password atul \
  --export-dir "/user/sqoop_output_incremental" \
  --columns "ID,SALARY"





Warning: /Users/atul595525/Desktop/sqoop-1.4.7.bin__hadoop-2.6.0/../hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /Users/atul595525/Desktop/sqoop-1.4.7.bin__hadoop-2.6.0/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /Users/atul595525/Desktop/sqoop-1.4.7.bin__hadoop-2.6.0/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /Users/atul595525/Desktop/sqoop-1.4.7.bin__hadoop-2.6.0/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
20/06/18 19:20:43 INFO sqoop.Sqoop: Running Sqoop version: 1.4.7
20/06/18 19:20:43 WARN tool.BaseSqoopTool: Setting your password on the command-line is insecure. Consider using -P instead.
20/06/18 19:20:43 INFO manager.MySQLManager: Preparing to use a MySQL streaming resultset.
20/06/18 19:20:43 INFO tool.CodeGenTool: Beginning code generation
Thu Jun 18 19:20:43 PDT 2020 WARN: Establishing SSL connection without server's identity verification is not recommended. According to MySQL 5.5.45+, 5.6.26+ and 5.7.6+ requirements SSL connection must be established by default if explicit option isn't set. For compliance with existing applications not using SSL the verifyServerCertificate property is set to 'false'. You need either to explicitly disable SSL by setting useSSL=false, or set useSSL=true and provide truststore for server certificate verification.
20/06/18 19:20:44 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `employee2` AS t LIMIT 1
20/06/18 19:20:44 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `employee2` AS t LIMIT 1
20/06/18 19:20:44 INFO orm.CompilationManager: HADOOP_MAPRED_HOME is /Users/atul595525/Desktop/hadoop-2.6.0
Note: /tmp/sqoop-atul595525/compile/3377e3f58e092891e07f86adbb9ed1e1/employee2.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
20/06/18 19:20:45 INFO orm.CompilationManager: Writing jar file: /tmp/sqoop-atul595525/compile/3377e3f58e092891e07f86adbb9ed1e1/employee2.jar
20/06/18 19:20:45 INFO mapreduce.ExportJobBase: Beginning export of employee2
20/06/18 19:20:45 INFO Configuration.deprecation: mapred.job.tracker is deprecated. Instead, use mapreduce.jobtracker.address
20/06/18 19:20:45 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
20/06/18 19:20:46 INFO Configuration.deprecation: mapred.jar is deprecated. Instead, use mapreduce.job.jar
20/06/18 19:20:46 INFO Configuration.deprecation: mapred.reduce.tasks.speculative.execution is deprecated. Instead, use mapreduce.reduce.speculative
20/06/18 19:20:46 INFO Configuration.deprecation: mapred.map.tasks.speculative.execution is deprecated. Instead, use mapreduce.map.speculative
20/06/18 19:20:46 INFO Configuration.deprecation: mapred.map.tasks is deprecated. Instead, use mapreduce.job.maps
20/06/18 19:20:46 INFO client.RMProxy: Connecting to ResourceManager at /0.0.0.0:8032
20/06/18 19:20:48 INFO input.FileInputFormat: Total input paths to process : 1
20/06/18 19:20:48 INFO input.FileInputFormat: Total input paths to process : 1
20/06/18 19:20:48 INFO mapreduce.JobSubmitter: number of splits:4
20/06/18 19:20:48 INFO Configuration.deprecation: mapred.map.tasks.speculative.execution is deprecated. Instead, use mapreduce.map.speculative
20/06/18 19:20:48 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1592509712833_0009
20/06/18 19:20:48 INFO impl.YarnClientImpl: Submitted application application_1592509712833_0009
20/06/18 19:20:48 INFO mapreduce.Job: The url to track the job: http://MacBook-Pro-106.local:8088/proxy/application_1592509712833_0009/
20/06/18 19:20:48 INFO mapreduce.Job: Running job: job_1592509712833_0009
20/06/18 19:20:55 INFO mapreduce.Job: Job job_1592509712833_0009 running in uber mode : false
20/06/18 19:20:55 INFO mapreduce.Job:  map 0% reduce 0%
20/06/18 19:21:01 INFO mapreduce.Job:  map 100% reduce 0%
20/06/18 19:21:02 INFO mapreduce.Job: Job job_1592509712833_0009 completed successfully
20/06/18 19:21:02 INFO mapreduce.Job: Counters: 30
	File System Counters
		FILE: Number of bytes read=0
		FILE: Number of bytes written=510568
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=626
		HDFS: Number of bytes written=0
		HDFS: Number of read operations=16
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=0
	Job Counters 
		Launched map tasks=4
		Data-local map tasks=4
		Total time spent by all maps in occupied slots (ms)=16450
		Total time spent by all reduces in occupied slots (ms)=0
		Total time spent by all map tasks (ms)=16450
		Total vcore-seconds taken by all map tasks=16450
		Total megabyte-seconds taken by all map tasks=16844800
	Map-Reduce Framework
		Map input records=2
		Map output records=2
		Input split bytes=584
		Spilled Records=0
		Failed Shuffles=0
		Merged Map outputs=0
		GC time elapsed (ms)=261
		CPU time spent (ms)=0
		Physical memory (bytes) snapshot=0
		Virtual memory (bytes) snapshot=0
		Total committed heap usage (bytes)=587202560
	File Input Format Counters 
		Bytes Read=0
	File Output Format Counters 
		Bytes Written=0
20/06/18 19:21:02 INFO mapreduce.ExportJobBase: Transferred 626 bytes in 16.4165 seconds (38.1325 bytes/sec)
20/06/18 19:21:02 INFO mapreduce.ExportJobBase: Exported 2 records.
(base) MacBook-Pro-106:bin atul595525$ 


Where: -m denotes the number of mapper you want to run
NOTE: The target table must exist in MySQL.
To obtain a filtered map, we can use the following option:
–input-fields-terminated-by '/t' –MySQL-delimiters 
Where ‘/t’ denotes tab.

–-input-fields-terminated-by ','

sqoop export \
  --table result \
  --connect "jdbc:mysql://quickstart.cloudera:3306/<database_name>" \
  --username <user> \
  --password <pass> \
  --export-dir "/user/cloudera/dataset/mainfolder" \
  --columns "variable_1,variable_2,variable_3,variable_4"
  
  
Advanced export commands

--input-fields-terminated-by '\0001' is an option you set when exporting from Hive, since the default field delimiter is ASCII value 1 there.
--input-null-string and input-null-non-string to recode from the corresponding values to NULL in the database.




#############
validation
##############

mysql> select * from employee2;
+------+--------+
| ID   | SALARY |
+------+--------+
|    2 |    200 |
|    3 |    300 |
+------+--------+
2 rows in set (0.00 sec)



###########
export with additional options
###########

sqoop export \
  --table employee2 \
  --connect "jdbc:mysql://localhost/product" \
  --username testuser \
  --password atul \
  --export-dir "/user/sqoop_output_incremental" \
  --columns "ID,SALARY"
  --input-fields-terminated-by ','




Warning: /Users/atul595525/Desktop/sqoop-1.4.7.bin__hadoop-2.6.0/../hbase does not exist! HBase imports will fail.
Please set $HBASE_HOME to the root of your HBase installation.
Warning: /Users/atul595525/Desktop/sqoop-1.4.7.bin__hadoop-2.6.0/../hcatalog does not exist! HCatalog jobs will fail.
Please set $HCAT_HOME to the root of your HCatalog installation.
Warning: /Users/atul595525/Desktop/sqoop-1.4.7.bin__hadoop-2.6.0/../accumulo does not exist! Accumulo imports will fail.
Please set $ACCUMULO_HOME to the root of your Accumulo installation.
Warning: /Users/atul595525/Desktop/sqoop-1.4.7.bin__hadoop-2.6.0/../zookeeper does not exist! Accumulo imports will fail.
Please set $ZOOKEEPER_HOME to the root of your Zookeeper installation.
20/06/18 19:24:15 INFO sqoop.Sqoop: Running Sqoop version: 1.4.7
20/06/18 19:24:15 WARN tool.BaseSqoopTool: Setting your password on the command-line is insecure. Consider using -P instead.
20/06/18 19:24:15 INFO manager.MySQLManager: Preparing to use a MySQL streaming resultset.
20/06/18 19:24:15 INFO tool.CodeGenTool: Beginning code generation
Thu Jun 18 19:24:15 PDT 2020 WARN: Establishing SSL connection without server's identity verification is not recommended. According to MySQL 5.5.45+, 5.6.26+ and 5.7.6+ requirements SSL connection must be established by default if explicit option isn't set. For compliance with existing applications not using SSL the verifyServerCertificate property is set to 'false'. You need either to explicitly disable SSL by setting useSSL=false, or set useSSL=true and provide truststore for server certificate verification.
20/06/18 19:24:16 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `employee2` AS t LIMIT 1
20/06/18 19:24:16 INFO manager.SqlManager: Executing SQL statement: SELECT t.* FROM `employee2` AS t LIMIT 1
20/06/18 19:24:16 INFO orm.CompilationManager: HADOOP_MAPRED_HOME is /Users/atul595525/Desktop/hadoop-2.6.0
Note: /tmp/sqoop-atul595525/compile/a2df06e4d1a0182cc6f2d00cf4482ca1/employee2.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
20/06/18 19:24:17 INFO orm.CompilationManager: Writing jar file: /tmp/sqoop-atul595525/compile/a2df06e4d1a0182cc6f2d00cf4482ca1/employee2.jar
20/06/18 19:24:17 INFO mapreduce.ExportJobBase: Beginning export of employee2
20/06/18 19:24:17 INFO Configuration.deprecation: mapred.job.tracker is deprecated. Instead, use mapreduce.jobtracker.address
20/06/18 19:24:17 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
20/06/18 19:24:17 INFO Configuration.deprecation: mapred.jar is deprecated. Instead, use mapreduce.job.jar
20/06/18 19:24:17 INFO Configuration.deprecation: mapred.reduce.tasks.speculative.execution is deprecated. Instead, use mapreduce.reduce.speculative
20/06/18 19:24:17 INFO Configuration.deprecation: mapred.map.tasks.speculative.execution is deprecated. Instead, use mapreduce.map.speculative
20/06/18 19:24:17 INFO Configuration.deprecation: mapred.map.tasks is deprecated. Instead, use mapreduce.job.maps
20/06/18 19:24:17 INFO client.RMProxy: Connecting to ResourceManager at /0.0.0.0:8032
20/06/18 19:24:18 INFO input.FileInputFormat: Total input paths to process : 1
20/06/18 19:24:18 INFO input.FileInputFormat: Total input paths to process : 1





mysql> delete from employee2;
Query OK, 2 rows affected (0.01 sec)

mysql> 
mysql> 
mysql> 
mysql> select * from employee2;
+------+--------+
| ID   | SALARY |
+------+--------+
|    3 |    300 |
|    2 |    200 |
+------+--------+
2 rows in set (0.00 sec)





###########
##########


'''
20/06/14 19:57:57 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
(u'and', 1)
(u'a', 1)
(u'Nidhi.', 1)
(u'Loves', 1)
(u'very', 1)
(u'is', 2)
(u'best', 1)
(u'human', 1)
(u'Atul', 2)
(u'the', 1)
(u'earth.', 1)
(u'husband', 1)
(base) MacBook-Pro-106:Desktop atul595525$ 
(base) MacBook-Pro-106:Desktop atul595525$ hadoop fs -cat /user/spark_demo/output/part-00001
20/06/14 19:58:14 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
(u'on', 1)
(u'good', 1)
(u'Nidhi', 3)
(u'wife', 2)
(u'being.', 1)
(u'are', 1)




