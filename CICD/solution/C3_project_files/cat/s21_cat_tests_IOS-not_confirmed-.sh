FUNC_SUCCESS=0
FUNC_FAIL=0
COUNTER=0
DIFF=""

cp tests/test_2.md test_2.md
cp tests/test_3_1.sh test_3_1.sh 
cp tests/test_ultimate_1.txt test_ultimate_1.txt

declare -a flags=(
"-b"
"-v"
"-n"
"-s"
)

declare -a flags2=(
"-e"
"-t"
)

declare -a flags3=(
# "-b"
# "-n"
)

declare -a files=(
"test_2.md test_3_1.sh"
"test_2.md test_3_1.sh test_ultimate_1.txt"
)

declare -a files2=(
"test_2.md"
)


declare -a commline=(
"OPT FILE"
)             

function testing()
{
    str=$(echo $@ | sed "s/OPT/$options/")
    str=$(echo $str | sed -e "s/FILE/$file/g")
    ./s21_cat $str > s21_cat_testing.log
    cat $str > cat_testing.log
    DIFF="$(diff -s s21_cat_testing.log cat_testing.log)"
    (( COUNTER++ ))
    if [ "$DIFF" == "Files s21_cat_testing.log and cat_testing.log are identical" ]
    then
        (( FUNC_SUCCESS++ ))
        echo "(ノ*°▽°*) $str --> SUCCESS $COUNTER"
    else
        (( FUNC_FAIL++ ))
        echo "(ノ*°▽°*) $str --> FAIL $COUNTER"
    fi
    rm s21_cat_testing.log cat_testing.log
}

for opt1 in "${flags2[@]}"
do
   for file in "${files[@]}"
        do
            options=" $opt1"
            testing $commline
        done
done

for opt1 in "${flags[@]}"
do
   for file in "${files[@]}"
        do
            options=" $opt1 "
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
                options="$opt1 $opt2 "
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
                options="$opt1 $opt2"
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
                    options="$opt1 $opt2 $opt3 "
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
                    options="$opt1 $opt2 $opt3 "
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
            for opt4 in "${flags[@]}"
            do
                if [ $opt1 != $opt2 ] && [ $opt1 != $opt3 ] \
                && [ $opt1 != $opt4 ] && [ $opt2 != $opt3 ] \
                && [ $opt2 != $opt4 ] && [ $opt3 != $opt4 ]
                then
                    for file in "${files[@]}"
                    do
                        options="$opt1 $opt2 $opt3 $opt4 "

                        testing $commline
                    done
                fi
            done
        done
    done
done

for opt1 in "${flags[@]}"
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
                        options="$opt1 $opt2 $opt3 $opt4 "
                        testing $commline
                    done
                fi
            done
        done
    done
done

for opt1 in "${flags3[@]}"
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
                    for file in "${files2[@]}"
                    do
                        options="$opt1 $opt2 $opt3 $opt4 "
                        testing $commline
                    done
                fi
            done
        done
    done
done

rm test_2.md
rm test_3_1.sh
rm test_ultimate_1.txt
echo "FAIL: $FUNC_FAIL"
echo "SUCCESS: $FUNC_SUCCESS"
echo "ALL: $COUNTER"
