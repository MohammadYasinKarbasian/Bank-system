from PIL import Image
import psycopg2
import os
from anytree import Node
from anytree.exporter import DotExporter

TRANSACTION = "6" # Transaction voucherID that we want to investigate
COLOR1 = "green"
COLOR2 = "red"

os.system("")


def get_id(ls):
    return int(ls.split('\n')[0])


def get_concat_h_white(im1, im2):
    dst = Image.new('RGB', (im1.width + im2.width,
                    max(im1.height, im2.height)), (255, 255, 255))
    dst.paste(im1, (0, 0))
    dst.paste(im2, (im1.width, 0))
    return dst


def last_sender_finder(node, all_list):
    sender = []
    for i in all_list:
        if i[2] == node:
            sender.append(i)
    return sender


def last_receiver_finder(id, all_list):
    receiver = []
    for i in all_list:
        if i[1] == id:
            receiver.append(i)
    return receiver


def is_account_from_another_bank(id, cursor):
    cursor.execute(f"select * from deposit d where d.dep_id = {id};")
    output = list(cursor.fetchall())
    if output:
        return 1
    else:
        return 0


def set_color_shape(node):
    attrs = []
    attrs += [f'color={node.color}'] if hasattr(node, 'color') else []
    return ', '.join(attrs)


conn = psycopg2.connect(
    database="bank", user='postgres', password='4444', host='127.0.0.1', port='5432'
)
cursor = conn.cursor()

cursor.execute(f"select * from transaction_details('{TRANSACTION}');")

sender, receiver = list(cursor.fetchall())[0][4:6]

cursor.execute(
    f"select * from transaction_receiver_final_foot_print('{TRANSACTION}');")

receiver_rows = cursor.fetchall()

cursor.execute(
    f"select * from transaction_sender_final_foot_print('{TRANSACTION}');")

sender_rows = cursor.fetchall()


fetch = []
done = []
root = Node(str(sender)+'\n\nSender', color=COLOR1)
fetch.append(root)

while 1:
    if not fetch:
        break
    temp_fetch = []
    for i in fetch:
        if i.name not in done:
            if i.name[0] != 'C' and i.name[0] != 'T':
                senders = last_sender_finder(get_id(i.name), sender_rows)
            else:
                senders = []
            for s in senders:
                if s not in done:
                    cursor.execute(
                        f"select * from transaction_details('{s[0]}');")
                    VoucherId, TrnDate, TrnTime, Amount, SourceDep, DesDep, Branch_ID, Trn_Desc = list(
                        cursor.fetchall())[0]

                    if not s[1]:
                        temp = Node('Cash deposit'+'\n\n'+'details:'+'\n'+VoucherId+'\n'+str(TrnDate)+'\n'+str(TrnTime)+'\n'+str(
                            Amount)+'\n'+str(SourceDep)+'\n'+str(DesDep)+'\n'+str(Branch_ID), parent=i, color=COLOR1)
                    else:
                        if is_account_from_another_bank(s[1], cursor):
                            temp = Node(str(s[1])+'\n\n'+'details:'+'\n'+VoucherId+'\n'+str(TrnDate)+'\n'+str(TrnTime)+'\n'+str(
                                Amount)+'\n'+str(SourceDep)+'\n'+str(DesDep)+'\n'+str(Branch_ID), parent=i, color=COLOR1)
                        else:
                            temp = Node('Transfer from another bank'+'\n\n'+'details:'+'\n'+VoucherId+'\n'+str(TrnDate)+'\n'+str(
                                TrnTime)+'\n'+str(Amount)+'\n'+str(SourceDep)+'\n'+str(DesDep)+'\n'+str(Branch_ID), parent=i, color=COLOR1)
                    temp_fetch.append(temp)
        done.append(i.name)
    fetch = temp_fetch

DotExporter(root, nodeattrfunc=set_color_shape).to_picture("sender.png")

fetch = []
done = []
root = Node(str(receiver)+'\n\nReceiver', color=COLOR2)
fetch.append(root)

while 1:
    if not fetch:
        break
    temp_fetch = []
    for i in fetch:
        if i.name not in done:
            if i.name[0] != 'C' and i.name[0] != 'T':
                receivers = last_receiver_finder(get_id(i.name), receiver_rows)
            else:
                receivers = []
            for s in receivers:
                if s not in done:
                    cursor.execute(
                        f"select * from transaction_details('{s[0]}');")
                    VoucherId, TrnDate, TrnTime, Amount, SourceDep, DesDep, Branch_ID, Trn_Desc = list(
                        cursor.fetchall())[0]
                    if not s[2]:
                        temp = Node('Cash Withdrawal'+'\n\n'+'details:'+'\n'+VoucherId+'\n'+str(TrnDate)+'\n'+str(TrnTime)+'\n'+str(
                            Amount)+'\n'+str(SourceDep)+'\n'+str(DesDep)+'\n'+str(Branch_ID), parent=i, color=COLOR2)
                    else:
                        if is_account_from_another_bank(s[2], cursor):
                            temp = Node(str(s[2])+'\n\n'+'details:'+'\n'+VoucherId+'\n'+str(TrnDate)+'\n'+str(TrnTime)+'\n'+str(
                                Amount)+'\n'+str(SourceDep)+'\n'+str(DesDep)+'\n'+str(Branch_ID), parent=i, color=COLOR2)
                        else:
                            temp = Node('Transfer to another bank'+'\n\n'+'details:'+'\n'+VoucherId+'\n'+str(TrnDate)+'\n'+str(
                                TrnTime)+'\n'+str(Amount)+'\n'+str(SourceDep)+'\n'+str(DesDep)+'\n'+str(Branch_ID), parent=i, color=COLOR2)
                    temp_fetch.append(temp)
        done.append(i.name)
    fetch = temp_fetch

DotExporter(root, nodeattrfunc=set_color_shape).to_picture("receiver.png")


conn.close()

senderImange = Image.open("sender.png")
receiverImange = Image.open("receiver.png")
get_concat_h_white(senderImange, receiverImange).save('result.png')
result = Image.open("result.png")
result.show()
