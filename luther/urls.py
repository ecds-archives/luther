from django.conf.urls.defaults import *
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.staticfiles.urls import staticfiles_urlpatterns

from django.contrib import admin
admin.autodiscover()

from luther_app.views import index, overview, preface, intro, text, images, works, page, xml

urlpatterns = patterns('luther_app.views',
    url(r'^$', 'index', name='index'),
    url(r'^overview', 'overview', name='overview'),
    url(r'^preface', 'preface', name='preface'),
    url(r'^intro$', 'intro', name='intro'),
    url(r'^text$', 'text', name='text'),
    url(r'^xml$', 'xml', name='xml'),
    url(r'^images$', 'images', name='images'),
    url(r'^works$', 'works', name='works'),
    url(r'^(?P<filename>[^/]+)$', 'page', name='page'),
    )

#if settings.DEBUG:
  #urlpatterns += staticfiles_urlpatterns(
       #url(r'^static/(?P<path>.*)$', 'django.views.static.serve', {'document_root': settings.STATIC_ROOT } ),
    #)




