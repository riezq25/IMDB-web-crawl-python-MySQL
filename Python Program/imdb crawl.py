import bs4
import requests
import mysql.connector
from datetime import datetime

from mysql.connector import Error


imdb_db = mysql.connector.connect(
    host="localhost",
    user="root",
    passwd="",
    database="web_crawl"
)

imdb_cursor = imdb_db.cursor()


def insertMovieSQL(type, id_item, id_movie):
    try:
        sql = ""

        if(type == "aktor"):
            sql = "INSERT INTO `imdb_movie_cast` (`id_cast`, `id_movie`) VALUES (%s, %s)"
        elif(type == "genre"):
            sql = "INSERT INTO `imdb_movie_genre` (`id_genre`, `id_movie`) VALUES (%s, %s)"
        elif(type == "sutradara"):
            sql = "INSERT INTO `imdb_movie_director` (`id_director`, `id_movie`) VALUES (%s, %s)"

        val = (id_item, id_movie)
        imdb_cursor.execute(sql, val)
        imdb_db.commit()

    except Error as error:
        print(error)


def cekMovieSQL(type, id_item, id_movie):
    try:
        sql = ""
        if(type == "aktor"):
            sql = "SELECT * FROM imdb_movie_cast WHERE id_cast = %s AND id_movie = %s"

        elif(type == "sutradara"):
            sql = "SELECT * FROM imdb_movie_director WHERE id_director = %s AND id_movie = %s"

        elif(type == "genre"):
            sql = "SELECT * FROM imdb_movie_genre WHERE id_genre = %s AND id_movie = %s"

        val = (id_item, id_movie)
        imdb_cursor.execute(sql, val)
        result = imdb_cursor.fetchone()
        return result
    except Error as error:
        print(error)


def insertIMDB(type, id_item, nama_item, link_item):
    try:
        sql = ""
        if(type == "aktor"):
            sql = "INSERT INTO `imdb_cast` (`id_cast`, `nama_cast`, `link_cast`) VALUES (%s, %s, %s)"
        elif(type == "sutradara"):
            sql = "INSERT INTO `imdb_director` (`id_director`, `nama_director`, `link_director`) VALUES (%s, %s, %s)"

        val = (id_item, nama_item, link_item)
        imdb_cursor.execute(sql, val)
        imdb_db.commit()
        print(nama_item, "inserted.")

    except Error as error:
        print(error)


def verifikasiMovie(type_item, id_item, id_movie):
    if(cekMovieSQL(type_item, id_item, id_movie) == None):
        insertMovieSQL(type_item, id_item, id_movie)


def checkInsertIMDB(type_item, item, id_movie):
    for i in range(0, len(item)):
        # print(aktor[i]['nama_aktor']).
        if(type_item == "aktor"):
            id_item = item[i]['id_aktor']
            nama_item = item[i]['nama_aktor']
            link_item = item[i]['link_aktor']
        elif(type_item == "sutradara"):
            id_item = item[i]['id_sutradara']
            nama_item = item[i]['nama_sutradara']
            link_item = item[i]['link_sutradara']

        if(checkItemIMDB(type_item, id_item, nama_item) == None):
            insertIMDB(type_item, id_item, nama_item, link_item)
        verifikasiMovie(type_item, id_item, id_movie)


def checkInsertGenre(genre, id_movie):
    for i in range(0, len(genre)):
        a=genre[i].strip()
        if(checkGenreIMDB(a) == None):
            insertGenreIMDB(a)
            #checkInsertGenre(b, id_movie)
        verifikasiMovie("genre", checkGenreIMDB(a)[0], id_movie)


def insertGenreIMDB(genre):
    try:

        sql = "INSERT INTO `imdb_genre` (`nama_genre`) VALUES (%s)"
        val = (genre,)
        imdb_cursor.execute(sql, val)
        imdb_db.commit()
        print(genre, "inserted.")

    except Error as error:
        print(error)


def checkItemIMDB(type, id_item, nama_item):
    sql = ""

    try:
        if(type == "aktor"):
            sql = "SELECT * FROM imdb_cast WHERE id_cast = %s AND nama_cast = %s"
        elif(type == "sutradara"):
            sql = "SELECT * FROM imdb_director WHERE id_director = %s AND nama_director = %s"

        val = (id_item, nama_item)
        imdb_cursor.execute(sql, val)
        result = imdb_cursor.fetchone()
        return result
    except Error as error:
        print(error)


def checkGenreIMDB(genre):

    try:
        sql = "SELECT * FROM imdb_genre WHERE nama_genre = %s"
        val = (genre,)
        imdb_cursor.execute(sql, val)
        result = imdb_cursor.fetchone()
        return result
    except Error as error:
        print(error)


def updateMovie(item):
    try:

        now = datetime.now()
        dt = now.strftime("%Y/%m/%d %H:%M:%S")

        sql = "UPDATE `imdb_movie` SET `judul_movie` = %s, `tahun_movie` = %s, `gross_movie` = %s, `rating_movie` = %s, `meta_movie` = %s, `vote_movie` = %s, `rate_movie` = %s, `durasi_movie` = %s, `deskripsi_movie` = %s, `link_movie` = %s, `poster_movie` = %s, `dt_movie` = %s WHERE `imdb_movie`.`id_movie` = %s"

        val = (item['judul'], item['tahun'], item['gross'], item['rating'], item['meta_score'], item['vote'],
               item['rate'], item['durasi'], item['deskripsi'], item['link'], item['poster'], dt, item['id'])
        imdb_cursor.execute(sql, val)

        imdb_db.commit()

        print(item['judul'], "updated.")

    except Error as error:
        print(error)


def insertMovie(item):
    try:

        now = datetime.now()

        dt = now.strftime("%Y/%m/%d %H:%M:%S")

        sql = "INSERT INTO `imdb_movie` (`id_movie`, `judul_movie`, `tahun_movie`, `gross_movie`, `rating_movie`, `meta_movie`, `vote_movie`, `rate_movie`, `durasi_movie`, `deskripsi_movie`, `link_movie`, `poster_movie`, `dt_movie`) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"

        val = (item['id'], item['judul'], item['tahun'], item['gross'], item['rating'], item['meta_score'],
               item['vote'], item['rate'], item['durasi'], item['deskripsi'], item['link'], item['poster'], dt)

        imdb_cursor.execute(sql, val)

        imdb_db.commit()
        print(item['judul'], "inserted.")
    except Error as error:
        print(error)


def checkMovie(id_movie, judul_movie):
    try:
        sql = "SELECT * FROM imdb_movie WHERE id_movie = %s AND judul_movie = %s"
        val = (id_movie, judul_movie,)
        imdb_cursor.execute(sql, val)
        result = imdb_cursor.fetchone()
        return result
    except Error as error:
        print(error)


def crawl_movie_item(blok_movie, blok_poster):

    movie_item_data = {}

    try:
        movie_item_data['id'] = str(blok_movie.find(
            'a', href=True).attrs['href'].replace('/title/tt', '').replace('/', ''))
    except:
        movie_item_data['id'] = None

    try:
        movie_item_data['judul'] = str(blok_movie.find(
            'a').get_text())
    except:
        movie_item_data['judul'] = None

    try:
        movie_item_data['tahun'] = str(blok_movie.find(
            'span', {'class': 'lister-item-year'}).contents[0][1:-1])
    except:
        movie_item_data['tahun'] = None

    try:
        movie_item_data['rating'] = float(blok_movie.find(
            'div', {'class': 'inline-block ratings-imdb-rating'}).get('data-value'))
    except:
        movie_item_data['rating'] = None

    try:
        movie_item_data['meta_score'] = float(blok_movie.find(
            'span', {'class': 'metascore'}).contents[0].strip())
    except:
        movie_item_data['meta_score'] = None

    try:
        movie_item_data['vote'] = int(blok_movie.find(
            'span', {'name': 'nv'}).get('data-value'))
    except:
        movie_item_data['vote'] = None

    try:
        movie_item_data['rate'] = str(blok_movie.find(
            'span', {'class': 'certificate'}).contents[0].strip())
    except:
        movie_item_data['rate'] = None

    try:
        movie_item_data['durasi'] = str(blok_movie.find(
            'span', {'class': 'runtime'}).contents[0].strip())
    except:
        movie_item_data['durasi'] = None

    try:
        deskripsi_data = blok_movie.findAll('p', {'class': 'text-muted'})
        movie_item_data['deskripsi'] = str(
            deskripsi_data[1].get_text().strip())
    except:
        movie_item_data['deskripsi'] = None

    try:
        movie_item_data['link'] = str("https://www.imdb.com/"+blok_movie.find(
            'a', href=True).attrs['href'])
    except:
        movie_item_data['link'] = None

    try:

        movie_item_data['poster'] = blok_poster['loadlate']
        # print( movie_item_data['poster'])
    except:
        movie_item_data['poster'] = None

    try:
        data_genre=blok_movie.find('span', {'class': 'genre'}).contents[0].strip().split(',')
        genre_list={}
        for i in range(0,len(data_genre)):
            genre_list[i]=data_genre[i]

        #print(genre_list)      

        movie_item_data['genre'] = genre_list
    except:
        movie_item_data['genre'] = None

    try:
        sutradara_data = blok_movie.findAll('p')[2]
        data_dir = sutradara_data.get_text().strip().split('|')

        data_sutradara = {}

        director_len = len(data_dir[0].strip().split(','))
        sutradara_link = blok_movie.findAll('p')[2].findAll('a', href=True)

        if(director_len > 1):
            director = data_dir[0].replace("Directors:", '').split(',')

        else:
            director = data_dir[0].replace("Director:", '').split(',')

        for iz in range(0, len(director)):

            id_sutradara = sutradara_link[iz]['href'].split(
                '/')[2].replace("nm", '')
            nama_sutradara = director[iz].rstrip().strip()
            link_sutradara = "https://www.imdb.com" + \
                sutradara_link[iz]['href'].strip()

            data_sutradara[iz] = {'id_sutradara': id_sutradara,
                                  'nama_sutradara': nama_sutradara, 'link_sutradara': link_sutradara}

        # print(data_sutradara)

        movie_item_data['sutradara'] = data_sutradara
    except:
        movie_item_data['sutradara'] = None

    try:
        aktor_data = blok_movie.findAll('p')[2]
        data_cast = aktor_data.get_text().strip().split('|')

        data_aktor = {}

        director_len = len(data_cast[0].strip().split(','))
        aktor_link = blok_movie.findAll('p')[2].findAll('a', href=True)
        cast = data_cast[1].replace("Stars:", '').split(',')
        dir_len = director_len

        for iz in range(0, len(cast)):

            id_aktor = aktor_link[dir_len]['href'].split(
                '/')[2].replace("nm", '')
            nama_aktor = cast[iz].rstrip().strip()
            link_aktor = "https://www.imdb.com" + \
                aktor_link[dir_len]['href'].strip()

            data_aktor[iz] = {'id_aktor': id_aktor,
                              'nama_aktor': nama_aktor, 'link_aktor': link_aktor}
            dir_len += 1

        # print(data_aktor)

        movie_item_data['aktor'] = data_aktor
    except:
        movie_item_data['aktor'] = None

    try:
        movie_item_data['gross'] = int(blok_movie.findAll(
            'span', {'name': 'nv'})[1].get('data-value').replace(',', ''))

    except:
        movie_item_data['gross'] = None

    return movie_item_data


def crawl_hal_movie(blok_movie, blok_poster):
    # print(blok_poster)

    page_movie_data = []
    jml_blok = len(blok_movie)

    for block in range(jml_blok):
        page_movie_data.append(crawl_movie_item(
            blok_movie[block], blok_poster[block]))

    return page_movie_data


def crawl_main_IMDB(link, jml_movie):

    target_link = link
    target = jml_movie

    jml_awal_hal_movie_now = 0
    jml_akhir_hal_movie_now = 0
    jml_movie_tersisa = target - jml_akhir_hal_movie_now

    page_number = 1

    movie_data = []

    while jml_movie_tersisa > 0:

        url = target_link + str(page_number)

        source = requests.get(url).text
        soup = bs4.BeautifulSoup(source, 'html.parser')

        blok_movie = soup.findAll('div', {'class': 'lister-item-content'})
        blok_poster = soup.findAll('img', {'class': 'loadlate'})
        # print(blok_poster)

        movie_data.extend(crawl_hal_movie(blok_movie, blok_poster))

        jml_awal_hal_movie_now = int(soup.find("div", {"class": "nav"}).find(
            "div", {"class": "desc"}).contents[1].get_text().split("-")[0])

        jml_akhir_hal_movie_now = int(soup.find("div", {"class": "nav"}).find(
            "div", {"class": "desc"}).contents[1].get_text().split("-")[1].split(" ")[0])

        jml_movie_tersisa = target - jml_akhir_hal_movie_now

        if(jml_movie_tersisa >= 1):
            print('\r' + "Crawling movie: " + str(jml_awal_hal_movie_now) + " - " +
                  str(jml_akhir_hal_movie_now), "| jumlah tersisa: " + str(jml_movie_tersisa)+"\n", flush=True, end="")
        elif(jml_movie_tersisa < 0):
            print('\r' + "Crawling movie: " + str(jml_awal_hal_movie_now) + " - " +
                  str(jml_akhir_hal_movie_now), "| jumlah tersisa: 0 \n", flush=True, end="")

        page_number = jml_akhir_hal_movie_now + 1

    return movie_data


def runMain(link, list_IMDB, jumlah_list):
    list_IMDB = crawl_main_IMDB(link, jumlah_list)

    limit = jumlah_list
    for item in list_IMDB:
        if(limit > 0):

            if(checkMovie(item['id'], item['judul']) == None):
                insertMovie(item)

            else:
                updateMovie(item)

            checkInsertGenre(item['genre'], item['id'])
            checkInsertIMDB("aktor", item['aktor'], item['id'])
            checkInsertIMDB("sutradara", item['sutradara'], item['id'])

            limit -= 1
    #print(list_IMDB[5])


try:
    link = "https://www.imdb.com/search/title/?title_type=feature&num_votes=25000,&genres=action&sort=user_rating,desc&start="

    jumlah_list = 9
    list_IMDB = []

    runMain(link, list_IMDB, jumlah_list)


except KeyboardInterrupt:
    print("KeyboardInterrupt has been caught.")
