from django.contrib import admin

# Register your models here.
from .models import Persons, Genres, Films, Person_Function, Blog_for_person, Country, Image_BD, News_for_film, Rating_film, Studio

admin.site.register(Genres)
admin.site.register(Films)
admin.site.register(Persons)
admin.site.register(Person_Function)
admin.site.register(Blog_for_person)
admin.site.register(Country)
admin.site.register(Image_BD)
admin.site.register(News_for_film)
admin.site.register(Rating_film)
admin.site.register(Studio)