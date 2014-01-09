import os
from urllib import urlencode
import logging

from django.conf import settings
from django.shortcuts import render, render_to_response
from django.http import HttpResponse, Http404
from django.core.paginator import Paginator, InvalidPage, EmptyPage
from django.template import RequestContext
from django.core import serializers

from eulxml import xmlmap

from luther_app.models import Text

logger = logging.getLogger(__name__)

def index(request):
  return render_to_response('index.html', context_instance=RequestContext(request))

def overview(request):
  file = xmlmap.load_xmlobject_from_file(filename=os.path.join(settings.BASE_DIR, 'static', 'xml', 'description.xml'))
  body = file.xsl_transform(filename=os.path.join(settings.BASE_DIR, '..', 'luther_app', 'xslt', 'luther.xsl'))
  return render_to_response('overview.html', {'body' : body.serializeDocument()}, context_instance=RequestContext(request))

def preface(request):
  file = xmlmap.load_xmlobject_from_file(filename=os.path.join(settings.BASE_DIR, 'static', 'teibp', 'content', 'preface.xml'))
  body = file.xsl_transform(filename=os.path.join(settings.BASE_DIR, 'static', 'teibp', 'content', 'teibp.xsl'))
  return render_to_response('preface.html', {'body' : body.serializeDocument()}, context_instance=RequestContext(request))

def intro(request):
  file = xmlmap.load_xmlobject_from_file(filename=os.path.join(settings.BASE_DIR, 'static', 'xml', 'intro.xml'))
  body = file.xsl_transform(filename=os.path.join(settings.BASE_DIR, '..', 'luther_app', 'xslt', 'luther.xsl'))
  return render_to_response('intro.html', {'body' : body.serializeDocument()}, context_instance=RequestContext(request))
 
def text(request):
  file = xmlmap.load_xmlobject_from_file(filename=os.path.join(settings.BASE_DIR, 'static', 'xml', 'luther_text.xml'))
  body = file.xsl_transform(filename=os.path.join(settings.BASE_DIR, '..', 'luther_app', 'xslt', 'text.xsl'))
  
  return render_to_response('text.html', {'body' : body.serializeDocument()}, context_instance=RequestContext(request))
 
def images(request):
  file = xmlmap.load_xmlobject_from_file(filename=os.path.join(settings.BASE_DIR, 'static', 'xml', 'description.xml'))
  body = file.xsl_transform(filename=os.path.join(settings.BASE_DIR, '..', 'luther_app', 'xslt', 'luther.xsl'))
  return render_to_response('overview.html', {'body' : body.serializeDocument()}, context_instance=RequestContext(request))

def works(request):
  file = xmlmap.load_xmlobject_from_file(filename=os.path.join(settings.BASE_DIR, 'static', 'xml', 'bibliography.xml'))
  body = file.xsl_transform(filename=os.path.join(settings.BASE_DIR, '..', 'luther_app', 'xslt', 'luther.xsl'))
  return render_to_response('works.html', {'body' : body.serializeDocument()}, context_instance=RequestContext(request))
