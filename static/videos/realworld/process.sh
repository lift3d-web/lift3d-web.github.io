cd old/
for d in ./* ; do
    echo "$d"
    task=${d%????}
    task="${task:2}"
    task_str=$(sed 's/_/ /g' <<< "$task")
    new_d=new_$task.mp4
    echo $new_d $task_str
    ffmpeg -i $d -vf "drawtext=text=$task_str:fontfile=/Library/Fonts/Arial\ Unicode.ttf:fontsize=65:fontcolor=white:x=12:y=12" -codec:a copy ../out.mp4
    ffmpeg -i ../out.mp4 -vf "scale=432:360" $new_d
    rm ../out.mp4
done

