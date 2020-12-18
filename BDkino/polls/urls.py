from django.conf.urls import url
from django.views.generic import TemplateView

from . import views


from django.urls import path

urlpatterns = [
    #url(r'^$', views.index, name='index'),
    path(r'', views.index),
    path('p_function/', views.p_function),
    path('films_title/', views.films_title),
    path('selec/', views.BETWEEN_data),
    path('add_person/create/', views.create),
    path('films_title/test/', views.index),
    path('add_person/', views.add_person),
    path('edit/<int:id>/', views.edit),
    path('delete/<int:id>/', views.delete),
    path('films_title/delete_film/<int:id>/', views.delete_film),
    path('films_title/select_Blog/<int:id>/', views.select_Blog),
    path('image_upload', views.image_view, name = 'image_upload'),
    path('poster_images', views.display_images, name = 'poster_images'),
]
