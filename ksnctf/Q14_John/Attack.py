import hashlib
import re
import base64
import passlib.hash

with open('./PasswordList.txt') as f:
    s = f.read()

    password_all_users = s.split('\n')

    for password_user in password_all_users:
        password_elem = password_user.split('$')
        print(password_elem)
        print(password_user)

        with open('./Dictionary.txt') as d:
            line = d.readline().strip()
            while line:
                print("-")
                seed_str = password_elem[2] + line
#                print(seed_str)
                hashed = passlib.hash.sha512_crypt.hash(line, salt=password_elem[2])
                print(hashed)
                hashed_elem = hashed.split('$')

                if hashed_elem[3] == password_elem[3]:
                    print("HIT", hashed_elem[3], password_elem[3], line)


                digest = hashlib.sha512(seed_str.encode("utf-8")).digest()
#                print(digest)
                hash = base64.b64encode(digest)
                print(hash)
#               print("--")
                line = d.readline().strip()

            print('--')
