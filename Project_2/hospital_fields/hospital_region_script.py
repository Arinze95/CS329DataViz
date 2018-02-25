# Author: Brandon Kerbow
# bwkerbow@gmail.com

def main():

    infile = open('hospital_regions_text.txt', 'r')
    for line in infile:
        line = line.strip()
        print('(' + line + '), ', end='')
    infile.close()


main()
