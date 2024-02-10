cd old/
for d in ./* ; do
    echo "$d"
    task=${d%????}
    task="${task:2}"
    task_str=$(sed 's/_/ /g' <<< "$task")
    new_d=new_$task.mp4
    echo $new_d $task_str
    ffmpeg -i $d -vf "drawtext=text='2x':fontfile=/Library/Fonts/Arial\ Unicode.ttf:fontsize=16:fontcolor=white:x=170:y=12" -codec:a copy ../out.mp4
    ffmpeg -i ../out.mp4 -filter:v "setpts=PTS/2,fps=30" $new_d
    rm ../out.mp4
done

