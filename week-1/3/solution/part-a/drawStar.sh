#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <size> <type>"
    echo "Example: $0 5 t1"
    exit 1
fi

size=$1
type=$2

case "$type" in

    t1)
        for ((i=1; i<=size; i++))
        do
            for ((j=1; j<=size-i; j++))
            do
                echo -n " "
            done

            for ((k=1; k<=i; k++))
            do
                echo -n "*"
            done

            echo
        done
        ;;

    t2)
        for ((i=1; i<=size; i++))
        do
            for ((j=1; j<=i; j++))
            do
                echo -n "*"
            done

            echo
        done
        ;;

    t3)
        for ((i=1; i<=size; i++))
        do
            for ((j=1; j<=size-i; j++))
            do
                echo -n " "
            done

            for ((k=1; k<=2*i-1; k++))
            do
                echo -n "*"
            done

            echo
        done
        ;;

    t4)
        for ((i=size; i>=1; i--))
        do
            for ((j=1; j<=i; j++))
            do
                echo -n "*"
            done

            echo
        done
        ;;

    t5)
        for ((i=size; i>=1; i--))
        do
            for ((j=1; j<=size-i; j++))
            do
                echo -n " "
            done

            for ((k=1; k<=i; k++))
            do
                echo -n "*"
            done

            echo
        done
        ;;

    t6)
        for ((i=size; i>=1; i--))
        do
            for ((j=1; j<=size-i; j++))
            do
                echo -n " "
            done

            for ((k=1; k<=2*i-1; k++))
            do
                echo -n "*"
            done

            echo
        done
        ;;

    t7)
        for ((i=1; i<=size; i++))
        do
            for ((j=1; j<=size-i; j++))
            do
                echo -n " "
            done

            for ((k=1; k<=2*i-1; k++))
            do
                echo -n "*"
            done

            echo
        done

        for ((i=size-1; i>=1; i--))
        do
            for ((j=1; j<=size-i; j++))
            do
                echo -n " "
            done

            for ((k=1; k<=2*i-1; k++))
            do
                echo -n "*"
            done

            echo
        done
        ;;

    *)
        echo "Invalid type"
        echo "Please use t1, t2, t3, t4, t5, t6 or t7"
        exit 1
        ;;

esac