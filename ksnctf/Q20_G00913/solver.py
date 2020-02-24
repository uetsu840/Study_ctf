# -*- coding: utf-8 -*-

import crypto
import math


def is_prime(n):
    # nが素数かどうか判定するプログラム
    for p in range(2, int(math.sqrt(n)) + 1):
        if n % p == 0:
            return False # 素数でないならFalseを返す
    return True # 素数ならTrueを返す


def get_prime(str_num, N):
    # 文字列として受け取ったstr_numからN桁の最初の素数を見つけるプログラム
    for i in range(0, len(str_num) - N):
        if is_prime(int(str_num[i : i + N])) is True:
            print(i,'-th,',  str_num[i:i + N] )
            break


str_pi = '3' + str(math.pi)[2:]
get_prime(str_pi, 10)
