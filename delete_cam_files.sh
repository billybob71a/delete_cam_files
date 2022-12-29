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
	_output_files_arr=($(echo ${_output[$cams]} | awk 'NR>0' RS=' '))
	len=${#_output_arr[@]}
	echo "There were ${len} files found which require deletion" >> /home/petery/delete_cam_files-$(date +%Y-%m-%d).log
	for i in ${_output_files_arr[@]}; do
		echo "${i}" >> /home/petery/delete_cam_files-$(date +%Y-%m-%d).log
		if [[ ${i} == *jpg ]] || [[ ${i} == *mp4 ]] ; then
			rm ${i}
		else
			rmdir ${i};
		fi
	done
	_output_empty_dir[$cams]=$(find /home/petery/${cameras[$cams]} -type d -empty)
	_output_empty_dir_arr=($(echo ${_output_empty_dir[$cams]} | awk 'NR>0' RS=' '))
	len_dir=${#_output_empty_dir_arr[@]}
	echo "There were ${len_dir} directory found which require deletion" >> /home/petery/delete_cam_files-$(date +%Y-%m-%d).log
	for j in ${_output_empty_dir_arr[@]}; do
		echo "below ${cameras[$cams]} " >> /home/petery/delete_cam_files-$(date +%Y-%m-%d).log
		echo "the directory that requires deletion is ${j}" >> /home/petery/delete_cam_files-$(date +%Y-%m-%d).log
		rmdir ${j}
	done
	check_date ${_output[$cams]} ${cameras[$cams]}
done
