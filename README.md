# dropaway
Base repo for Junction2022 wolt challenge

1.uztaisi python virtual environmentu lai defaultais pytons ko izsauc ir 3.11
jabūt dropaway/api mapē un jāizpilda komanda: 
python3.11 -m venv venv

tad aktivē python3.11 virtual envu. esi relative mapē tur kur spawnojās venv mapīte kurā ir python interpreteris, komanda:
source venv/bin/activate

update pip ar komandu
pip install -U pip

2.tad instalēt requirementus
pip install -r dropaway/api/requirements.txt

tad 
cd dropaway/api/src

python manage.py makemigrations
python manage.py migrate
python manage.py runserver