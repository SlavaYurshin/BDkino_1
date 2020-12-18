from django.shortcuts import render, redirect
from django.http import HttpResponseRedirect, HttpResponseNotFound

# Create your views here.
from .models import Persons, Person_Function, Genres, Films, Blog_for_person, Image_BD, PosterForm
from django.views.generic.list import ListView
from django.views import generic
from django.db.models import Avg, Max, Min, Count, Sum
from django.db.models import Aggregate
from django.contrib.auth.decorators import login_required



def films_title(request):
    film = Films.objects.all()
    Img = Image_BD.objects.all()
    return render(request, "films.html", {"film": film, 'poster_images': Img})

@login_required
def add_person(request):
    return render(request, "add_person.html")

# получение данных о человеке
def index(request):
    people = Persons.objects.all()
    return render(request, "test.html", {"people": people})

def p_function(request):
    person_function = Person_Function.objects.all()
    return render(request, "person_function.html", {"person_function": person_function})

def select_Blog(request, id):
    try:
        if request.method == "POST":
            post = Blog_for_person()
            post.name_blog = Films.objects.get(id=id)
            post.blog = request.POST.get("name_blog")
            post.save()
            return HttpResponseRedirect("/")
        else:
            film_id = Films.objects.get(id=id)
            blog = Blog_for_person.objects.filter(name_blog=film_id)
            return render(request, "select_Blog.html", {"blog": blog})
    except Blog_for_person.DoesNotExist:
        return HttpResponseNotFound("<h2>Person not found</h2>")

# def images(request):
#     image_file = request.FILES['image_file'].file.read()
#     Image_BD.objects.create(image=image_file)


def image_view(request):
    if request.method == 'POST':
        form = PosterForm(request.POST, request.FILES)

        if form.is_valid():
            form.save()
            return HttpResponseRedirect('/')
    else:
        form = PosterForm()
    return render(request, 'add_image.html', {'form': form})


def display_images(request):
    if request.method == "GET":
        poster = Image_BD.objects.all()
        return render(request, 'ERR.html', {'poster_images': poster})


# сохранение данных в бд
def create(request):
    if request.method == "POST":
        n = Persons()
        n.name = request.POST.get("name")
        n.last_name = request.POST.get("last_name")
        n.age = request.POST.get("age")
        n.save()
    return HttpResponseRedirect("/")


# изменение данных в бд
def edit(request, id):
    try:
        person = Persons.objects.get(id=id)

        if request.method == "POST":
            person.name = request.POST.get("name")
            person.last_name = request.POST.get("last_name")
            person.country = request.POST("country")
            person.date_birth = request.POST("date_birth")
            person.person_function = request.POST("person_function")
            person.age = request.POST.get("age")
            person.save()
            return HttpResponseRedirect("/")
        else:
            return render(request, "edit.html", {"person": person})
    except Person.DoesNotExist:
        return HttpResponseNotFound("<h2>Person not found</h2>")


# удаление данных из бд
@login_required
def delete(request, id):
    try:
        person = Persons.objects.get(id=id)
        person.delete()
        return HttpResponseRedirect("/")
    except Person.DoesNotExist:
        return HttpResponseNotFound("<h2>Person not found</h2>")

@login_required
def delete_film(request, id):
    try:
        if request.method == "POST":
            film = Films.objects.get(id=id)
            film.delete()
            return HttpResponseRedirect("/")
        else:
            film_id = int(id)
            return render(request, "_delit_.html", {"film_id": film_id})
    except Filmsdelete.DoesNotExist:
        return HttpResponseNotFound("<h2>Film not found</h2>")

def BETWEEN_data(request):
    try:
        if 'q1' and 'q2' in request.GET:
            q1 = request.GET['q1']
            q2= request.GET['q2']
            #     q2 = request.GET['q2']
            pp = Persons.objects.filter(age__gt=q1, age__lte=q2)
            return render(request, 'test.html', {'pp': pp})
        else:
            return HttpResponseRedirect("/")
    except Persons.DoesNotExist:
        return HttpResponseNotFound("<h2>Person not found</h2>")

