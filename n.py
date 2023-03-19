import requests


url = 'https://akabab.github.io/superhero-api/api/powerstats/332.json'


class Hero:
    def __init__(self, name):
        self.name = name

    def find_int(self, hero_url):
        response = requests.get(hero_url)
        self.int = response.json()['intelligence']
        return self.int

    def who_is_smarter(*args):
        smartest_hero = {}
        new_list = []
        max = 0
        for i in args:
            new_list.append(i.__dict__)
        for i in new_list:
            if i['int'] > max:
                max, best_hero = i['int'], i['name']
            else:
                continue
        return f'The smartest hero among chosen is {best_hero} with int = {max}'



Hulk = Hero('Hulk')
Cap = Hero('Cap')
Thanos = Hero('Thanos')
Galactus = Hero('Galactus')
Hulk.find_int('https://akabab.github.io/superhero-api/api/powerstats/332.json')
Cap.find_int('https://akabab.github.io/superhero-api/api/powerstats/149.json')
Thanos.find_int('https://akabab.github.io/superhero-api/api/powerstats/655.json')


print(Hero.who_is_smarter(Hulk, Cap, Thanos))