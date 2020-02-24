# -*- coding: utf-8 -*

# 指定されたデータサイズでファイルを分割する

import os


def subtract_from_file(filePath, offset, chunkSize):

    readedDataSize = 0
    i = 0
    fileList = []

    # 対象ファイルを開く
    f = open(filePath, "rb")

    # ファイルを読み終わるまで繰り返す
    contentLength = os.path.getsize(filePath)

    # 読み取り位置をシーク
    f.seek(offset)

    # 指定されたデータサイズだけ読み込む
    data = f.read(chunkSize)

    # 分割ファイルを保存
    saveFilePath = filePath + "_chunk"
    with open(saveFilePath, 'wb') as saveFile:
        saveFile.write(data)

    return saveFilePath


subtract_from_file("./secret_modify.zip", 0, 0x17418)