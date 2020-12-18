from django.db import models
from django import  forms

# Специальность
class Person_Function(models.Model):
    name_function = models.CharField(max_length=20, null=True)

    def __str__(self):
        return self.name_function
# Жанр
class Genres(models.Model):
    name_genre = models.CharField(max_length=20)

    def __str__(self):
        return self.name_genre

class Country(models.Model):
    name_country = models.CharField(max_length=20)

    def __str__(self):
        return self.name_country


# Человек
class Persons(models.Model):
    name = models.CharField(max_length=20)
    last_name = models.CharField(max_length=20)
    country = models.ForeignKey(Country, on_delete=models.TextField, null=True)
    date_birth = models.DateField(null=True, blank=True)
    person_function = models.ForeignKey(Person_Function, on_delete=models.CASCADE, null=True)
    age = models.IntegerField()

    def __str__(self):
        return str(self.name + ' ' + self.last_name+ ' ')

class Studio(models.Model):
    name_studio = models.TextField(max_length=20)
    country_studio = models.ForeignKey(Country, null=True, on_delete=models.TextField)

    def __str__(self):
        return str(self.name_studio)

# Фильмы
class Films(models.Model):
    name_film = models.CharField(max_length=20)
    film_genre = models.ManyToManyField(Genres, null=True)
    film_person_crate = models.ForeignKey(Persons, null=True, related_name='film_person_crate', on_delete=models.TextField)
    film_person = models.ManyToManyField(Persons, null=True, related_name='film_person')
    film_studio = models.ManyToManyField(Studio, null=True, related_name='film_studio')
    film_country = models.ForeignKey(Country, null=True, on_delete=models.CASCADE)
    film_year = models.IntegerField(null=True)

    def __str__(self):
        return self.name_film


# Блог
class Blog_for_person(models.Model):
    name_blog = models.ForeignKey(Films, on_delete=models.CASCADE)
    blog = models.TextField()

    def __str__(self):
        return str(self.name_blog)


class Rating_film(models.Model):
    film_r = models.ForeignKey(Films, null=True, on_delete=models.TextField, related_name='film_rating')
    rating = models.FloatField(null=True)


class Image_BD(models.Model):
    image_name = models.ForeignKey(Films, primary_key=True, on_delete=models.CASCADE)
    image = models.ImageField(upload_to='images/')

    def __str__(self):
        return str(self.image_name)

class PosterForm(forms.ModelForm):
    class Meta:
        model = Image_BD
        fields = ['image_name', 'image']

class News_for_film(models.Model):
    name_film = models.ForeignKey(Films, on_delete=models.CASCADE, related_name='films_name')
    news = models.TextField()

    def __str__(self):
        return str(self.name_film)









