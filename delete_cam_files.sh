#!/bin/bash
declare -A var_output
_output=$(find /home/petery/cam1 -mtime +7 -delete > /home/petery/delete_cam_files-$(date +%Y-%m-%d).log 2>&1)
check_date() {
	if [ -z "$_output" ]; then
		var_date=$(date +%Y-%m-%d)
		echo "JOB Completed $var_date no files found" >> //home/petery/delete_cam_files-$(date +%Y-%m-%d).log
	fi
}
#_output=$(find /home/petery/cam1 -mtime +7 -delete > /home/petery/delete_cam_files-$(date +%Y-%m-%d).log 2>&1)
check_date
_output=$(find /home/petery/cam2 -mtime +7 -delete >> /home/petery/delete_cam_files-$(date +%Y-%m-%d).log 2>&1)
check_date
_output=$(find /home/petery/cam3 -mtime +7 -delete >> /home/petery/delete_cam_files-$(date +Y-%m-%d).log 2>&1)
check_date
#echo "$_output"
#if [ -z "$_output" ]
#then
#	var_date=$(date +%Y-%m-%d)
#	echo "JOB COMPLETED $date_and_time no files found" > /home/petery/delete1_cam_files-$(date +%Y-%m-%d).log
#fi
#
#_output=$(find /home/petery/cam2 -mtime +7 -delete >> /home/petery/delete_cam_files-$(date +%Y-%m-%d).log 2>&1)
#
#f1()
#{
#	echo "Hi"
#	if [ -z "$_output" ]
#	then
#		var_date=$(date +%Y-%m-%d)
#		echo "JOB COMPLETED $var_date no files found" >> /home/petery/delete_cam_files-$(date +%Y-%m-%d).log
#	fi			
#}
#find /home/petery/cam3 -mtime +7 -delete >> /home/petery/delete_cam_files-$(date +%Y-%m-%d).log 2>&1
