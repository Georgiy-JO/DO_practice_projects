FUNC_SUCCESS=0
FUNC_FAIL=0
COUNTER=0
DIFF=""

cp tests/test_1.txt test_1.txt
cp tests/test_3.md test_3.md
cp tests/test_ultimate_1.txt test_ultimate_1.txt
cp tests/maskfile_2.txt maskfile_2.txt

declare -a flags=(
"-i"
"-v"
"-c"
"-n"
# "-h"
"-s"
"-o"
)

declare -a flags2=(
# "-l"
)

declare -a files=(
"test_1.txt"
"test_1.txt test_3.md"
#"test_1.txt test_3.md test_ultimate_1.txt"
)

declare -a commline=(
"OPT FILE"
)             

function testing()
{
    str=$(echo $@ | sed "s/OPT/$options/")
    str=$(echo $str | sed -e "s/FILE/$file/g")
    ./s21_grep $str > s21_grep_testing.log
    grep $str > grep_testing.log
    DIFF="$(diff -s s21_grep_testing.log grep_testing.log)"
    (( COUNTER++ ))
    if [ "$DIFF" == "Files s21_grep_testing.log and grep_testing.log are identical" ]
    then
        (( FUNC_SUCCESS++ ))
        echo "(ノ*°▽°*) $str --> SUCCESS $COUNTER"
    else
        (( FUNC_FAIL++ ))
        echo "(ノ*°▽°*) $str --> FAIL $COUNTER"
    fi
    rm s21_grep_testing.log grep_testing.log
}

for opt1 in "${flags[@]}"
do
   for file in "${files[@]}"
        do
            options=" $opt1 -e hell -e world -f maskfile_2.txt"
            testing $commline
        done
done

for opt1 in "${flags[@]}"
do
   for file in "${files[@]}"
        do
            options=" $opt1 -e hell -e world"
            testing $commline
        done
done

for opt1 in "${flags[@]}"
do
    for opt2 in "${flags[@]}"
    do
        if [ $opt1 != $opt2 ]
        then
            for file in "${files[@]}"
            do
                options="$opt1 $opt2 -e hell -e world -f maskfile_2.txt"
                testing $commline
            done
        fi
    done
done

for opt1 in "${flags[@]}"
do
    for opt2 in "${flags[@]}"
    do
        if [ $opt1 != $opt2 ]
        then
            for file in "${files[@]}"
            do
                options="$opt1 $opt2 -e hell -e world"
                testing $commline
            done
        fi
    done
done

for opt1 in "${flags[@]}"
do
    for opt2 in "${flags[@]}"
    do
        for opt3 in "${flags[@]}"
        do
            if [ $opt1 != $opt2 ] && [ $opt1 != $opt3 ] \
            && [ $opt2 != $opt3 ] 
            then
                for file in "${files[@]}"
                do
                    options="$opt1 $opt2 $opt3 -e hell -e world -f maskfile_2.txt"
                    testing $commline
                done
            fi
        done
    done
done

for opt1 in "${flags[@]}"
do
    for opt2 in "${flags[@]}"
    do
        for opt3 in "${flags[@]}"
        do
            if [ $opt1 != $opt2 ] && [ $opt1 != $opt3 ] \
            && [ $opt2 != $opt3 ] 
            then
                for file in "${files[@]}"
                do
                    options="$opt1 $opt2 $opt3 -e hell -e world"
                    testing $commline
                done
            fi
        done
    done
done

for opt1 in "${flags2[@]}"
do
    for opt2 in "${flags[@]}"
    do
        for opt3 in "${flags[@]}"
        do
            for opt4 in "${flags[@]}"
            do
                if [ $opt1 != $opt2 ] && [ $opt1 != $opt3 ] \
                && [ $opt1 != $opt4 ] && [ $opt2 != $opt3 ] \
                && [ $opt2 != $opt4 ] && [ $opt3 != $opt4 ]
                then
                    for file in "${files[@]}"
                    do
                        options="$opt1 $opt2 $opt3 $opt4 -e hell -e world -f maskfile_2.txt"

                        testing $commline
                    done
                fi
            done
        done
    done
done

for opt1 in "${flags2[@]}"
do
    for opt2 in "${flags[@]}"
    do
        for opt3 in "${flags[@]}"
        do
            for opt4 in "${flags[@]}"
            do
                if [ $opt1 != $opt2 ] && [ $opt1 != $opt3 ] \
                && [ $opt1 != $opt4 ] && [ $opt2 != $opt3 ] \
                && [ $opt2 != $opt4 ] && [ $opt3 != $opt4 ]
                then
                    for file in "${files[@]}"
                    do
                        options="$opt1 $opt2 $opt3 $opt4 -e hell -e world"
                        testing $commline
                    done
                fi
            done
        done
    done
done

rm test_1.txt
rm test_3.md
rm test_ultimate_1.txt
rm maskfile_2.txt
echo "FAIL: $FUNC_FAIL"
echo "SUCCESS: $FUNC_SUCCESS"
echo "ALL: $COUNTER"
