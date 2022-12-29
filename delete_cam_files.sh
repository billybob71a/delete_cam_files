#!/bin/bash
declare -A var_output


check_date() {
	echo "Hi there $1 how are you"
	if [ -z "$1" ]; then
		var_date=$(date +%Y-%m-%d)
		echo "Hello $2 cam number "
		echo "The $2 JOB has been Completed $var_date no files found" >> //home/petery/delete_cam_files-$(date +%Y-%m-%d).log
	fi
}

cameras=("cam1" "cam2" "cam3")
for cams in ${!cameras[@]}; do
	echo "Under cam ${cameras[$cams]}" >> /home/petery/delete_cam_files-$(date +%Y-%m-%d).log
	_output[$cams]+=$(find /home/petery/${cameras[$cams]} -mtime +5 )
	_output_arr=($(echo ${_output[$cams]} | awk 'NR>0' RS=' '))
	len=${#_output_arr[@]}
	echo "There were ${len} files found which require deletion" >> /home/petery/delete_cam_files-$(date +%Y-%m-%d).log
	for i in ${!_output_arr[@]}; do
		echo ${_output_arr[$i]} >> /home/petery/delete_cam_files-$(date +%Y-%m-%d).log
		if [[ ${_output_arr[$i]} == *jpg ]] || [[ ${_output_arr[$i]} == *mp4 ]] ; then
			rm ${_output_arr[$i]}
		else
			rmdir ${_output_arr[$i]};
		fi
	done  
	check_date ${_output[$cams]} ${cameras[$cams]}
done
# _output=$(find /home/petery/cam1 -mtime +7 -delete > /home/petery/delete_cam_files-$(date +%Y-%m-%d).log 2>&1)
# _output=$(find /home/petery/cam1 -mtime +7 -delete > /home/petery/delete_cam_files-$(date +%Y-%m-%d).log 2>&1)
#check_date
# _output=$(find /home/petery/cam2 -mtime +7 -delete >> /home/petery/delete_cam_files-$(date +%Y-%m-%d).log 2>&1)
# check_date
# _output=$(find /home/petery/cam3 -mtime +7 -delete >> /home/petery/delete_cam_files-$(date +Y-%m-%d).log 2>&1)
# check_date
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
