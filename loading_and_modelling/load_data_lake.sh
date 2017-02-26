ssh -i "ucb3.pem" root@ec2-54-86-43-90.compute-1.amazonaws.com
mount -t ext4 /dev/xvdf /data
/root/start-hadoop.sh
/data/start_postgres.sh
su - w205
hdfs dfs -mkdir /user/w205/hospital_compare

wget https://data.medicare.gov/views/bg9k-emty/files/Nqcy71p9Ss2RSBWDmP77H1DQXcyacr2khotGbDHHW_s?content_type=application%2Fzip%3B%20charset3Dbinary&filename=Hospital_Revised_Flatfiles.zip
mv "Nqcy71p9Ss2RSBWDmP77H1DQXcyacr2khotGbDHHW_s?content_type=application%2Fzip; charset3Dbinary" Hospital_Revised_Flatfiles.zip
unzip Hospital_Revised_Flatfiles.zip

hdfs dfs -mkdir /user/w205/hospital_compare/general_hospital_information
hdfs dfs -mkdir /user/w205/hospital_compare/procedure_timely_effective
hdfs dfs -mkdir /user/w205/hospital_compare/procedure_readmissions
hdfs dfs -mkdir /user/w205/hospital_compare/measure_date
hdfs dfs -mkdir /user/w205/hospital_compare/survey_response_data

mv "Hospital General Information.csv"  general_hospital_information.csv
mv "Timely and Effective Care - Hospital.csv"  procedure_timely_effective.csv
mv "Readmissions and Deaths - Hospital.csv"  procedure_readmissions.csv
mv "Measure Dates.csv"  measure_date.csv
mv "hvbp_hcahps_05_28_2015.csv"  survey_response_data.csv

tail -n +2 general_hospital_information.csv > general_hospital_information_reduced.csv
tail -n +2 procedure_timely_effective.csv > procedure_timely_effective_reduced.csv
tail -n +2 procedure_readmissions.csv > procedure_readmissions_reduced.csv
tail -n +2 measure_date.csv > measure_date_reduced.csv
tail -n +2 survey_response_data.csv > survey_response_data_reduced.csv

hdfs dfs -put general_hospital_information_reduced.csv /user/w205/hospital_compare/general_hospital_information
hdfs dfs -put procedure_timely_effective_reduced.csv /user/w205/hospital_compare/procedure_timely_effective
hdfs dfs -put procedure_readmissions_reduced.csv /user/w205/hospital_compare/procedure_readmissions
hdfs dfs -put measure_date_reduced.csv /user/w205/hospital_compare/measure_date
hdfs dfs -put survey_response_data_reduced.csv /user/w205/hospital_compare/survey_response_data

