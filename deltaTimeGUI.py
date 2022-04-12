import tkinter as tk

def decimalTobinary(number,toSize):
    twok = bin(number)
    padded = str(twok)
    padded = padded[2:len(padded)]
    for i in range(toSize - len(padded)):
        padded = "0" + padded

    return padded
# print("25to 8",decimalTobinary(25,8))

def firstBit_ReplaceOne(num):
    a = decimalTobinary(num,8)

    a = a[1:len(a)]
    # print("diyiwei",a)
    a_addOne = "1" + a
    # print("diyiwei+1",a_addOne)
    aTo_ten = int(a_addOne,2)

    return aTo_ten
# print(firstBit_ReplaceOne(25))

def decimal_deltaTimeHex(number):
    num = number
    Str = " "
    if num >= 128 * 128 * 128 * 128:
        Str = "delta-timeは4Byteを超えたらダメ"
    elif num>=0 and num<=127:
        a = "%02X" % (num)
        Str = "00"+" "+a
    elif num > 127 and num <= 128 * 127 + 127:
        zhenshu = num/128.0
        shang = int(zhenshu)
        yu = num%128
        aTo_Decimal = firstBit_ReplaceOne(shang)
        aTo_Hex = "%02X" % (aTo_Decimal)
        bTo_Hex = "%02X" % (yu)
        kk = aTo_Hex +" "+ bTo_Hex
        Str = kk
    elif num > 128 * 127+127 and num <= 128 * 128 * 127+128 * 127+127:
        zhenshu = num / (128.0 * 128.0)
        shang1 = int(zhenshu)
        yuF = num % (128 * 128)
        shang2 = int(yuF / 128.0)
        c = yuF % 128
        aTo_Decimal = firstBit_ReplaceOne(shang1)
        aTo_Hex = "%02X" % (aTo_Decimal)
        bTo_Decimal = firstBit_ReplaceOne(shang2)
        bTo_Hex = "%02X" % (bTo_Decimal)
        cTo_Hex = "%02X" % (c)
        kk = aTo_Hex +" "+ bTo_Hex +" "+ cTo_Hex
        Str = kk
    elif num > 128 * 128 * 127+128 * 127+127 and num <= 128 * 128 * 128 * 127+128 * 128 * 127+128 * 127+127:
        zhenshu = num / (128.0 * 128.0 * 128.0)
        shang1 = int(zhenshu) # 求商，去掉所有小数位
        yuF = num % (128 * 128 * 128)
        shang2 = int(yuF / (128.0 * 128))
        yuG = yuF % (128 * 128)
        shang3 = int(yuG / 128.0)
        d = yuG % (128)
        aTo_Decimal = firstBit_ReplaceOne(shang1)
        aTo_Hex = "%02X" % (aTo_Decimal)
        bTo_Decimal = firstBit_ReplaceOne(shang2)
        bTo_Hex = "%02X" % (bTo_Decimal)
        cTo_Decimal = firstBit_ReplaceOne(shang3)
        cTo_Hex = "%02X" % (cTo_Decimal)
        dTo_Hex ="%02X" % (d)
        kk = aTo_Hex +" "+ bTo_Hex +" "+cTo_Hex +" "+ dTo_Hex
        Str = kk
    else: print("数字範囲の対象外です。")

    return Str
def decimal_Hex(number):
    num = number
    hexStr = " "
    if num >= 128 * 128 * 128 * 128:
        hexStr = "16進数は4Byteを超えたらダメ"
    elif num >= 0 and num <= 127:
        a = "%02X" % (num)
        hexStr = "00" + " " + a
    elif num > 127 and num <= 128 * 127 + 127:
        hh = "%04X" % (num)
        hexStr = hh[:2]+" "+hh[2:4]
    elif num > 128 * 127 + 127 and num <= 128 * 128 * 127 + 128 * 127 + 127:
        hh = "%06X" % (num)
        hexStr = hh[:2] + " " + hh[2:4]+ " " + hh[4:6]
    elif num > 128 * 128 * 127 + 128 * 127 + 127 and num <= 128 * 128 * 128 * 127 + 128 * 128 * 127 + 128 * 127 + 127:
        hh = "%08X" % (num)
        hexStr = hh[:2] + " " + hh[2:4] + " " + hh[4:6]+ " " + hh[6:8]
    else:
        print("数字範囲の対象外です。")
    return hexStr

# print("finalis 480 ass",decimal_deltaTimeHex(480))
# --------------------------------------------------
def main():
    def caluculateMIDIdeltaTime():
        # 10進数の値を取得
        decimal = decimalTextBox.get()

        # 変数：MIDIデルタタイムの値
        midiDeltaTime = decimal_deltaTimeHex(int(decimal))

        # 変数：普通の16進数
        hexadecimal = decimal_Hex(int(decimal))

        # MIDIデルタタイムの値を削除 + 計算して表示
        midiDeltaTimeTextBox.delete(0, tk.END)
        midiDeltaTimeTextBox.insert(tk.END, midiDeltaTime)

        # 普通の16進数の値を削除 + 計算して表示
        hexadecimalTextBox.delete(0, tk.END)
        hexadecimalTextBox.insert(tk.END, hexadecimal)

    def clearTextInput():
        decimalTextBox.delete(0, tk.END)
        midiDeltaTimeTextBox.delete(0, tk.END)
        hexadecimalTextBox.delete(0, tk.END)

    app = tk.Tk()
    app.title("MIDI デルタタイム計算機")
    app.geometry("300x480")
    app.configure(bg="gray68") #背景の色

    labelDecimal = tk.Label(app, text="10進数を入力",fg="black", bg="light blue")
    labelDecimal.place(x=50, y=30)
    decimalTextBox = tk.Entry(app, width=10, justify="center", fg="black", bg="white")
    decimalTextBox.place(x=50, y=60)
    btnRead = tk.Button(app, text="削除", command=clearTextInput)
    btnRead.place(x=155, y=60)

    calculateButton = tk.Button(app, text="MIDIデルタタイムを計算", fg="red", command=caluculateMIDIdeltaTime)
    calculateButton.place(x=50, y=130)


    labelMIDIdeltaTime = tk.Label(app, text="MIDIデルタタイムの16進数", fg="black", bg="DarkSeaGreen1")
    labelMIDIdeltaTime.place(x=50, y=220)
    midiDeltaTimeTextBox = tk.Entry(app, width=21, justify="center", fg="black", bg="white")
    midiDeltaTimeTextBox.place(x=50, y=250)

    labelHexadecimal = tk.Label(app, text="通常の16進数", fg="black", bg="pink")
    labelHexadecimal.place(x=50, y=300)
    hexadecimalTextBox = tk.Entry(app, width=21, justify="center", fg="black", bg="white")
    hexadecimalTextBox.place(x=50, y=330)

    app.mainloop()

if __name__ == "__main__":
    main()