from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    
    path('dueños/', views.dueño_list, name='dueño_list'),
    path('dueños/nuevo/', views.dueño_create, name='dueño_create'),
    path('dueños/<int:pk>/editar/', views.dueño_edit, name='dueño_edit'),
    path('dueños/<int:pk>/eliminar/', views.dueño_delete, name='dueño_delete'),

    path('mascotas/', views.mascota_list, name='mascota_list'),
    path('mascotas/nueva/', views.mascota_create, name='mascota_create'),
    path('mascotas/<int:pk>/editar/', views.mascota_edit, name='mascota_edit'),
    path('mascotas/<int:pk>/eliminar/', views.mascota_delete, name='mascota_delete'),

    path('veterinarios/', views.veterinario_list, name='veterinario_list'),
    path('veterinarios/nuevo/', views.veterinario_create, name='veterinario_create'),
    path('veterinarios/<int:pk>/editar/', views.veterinario_edit, name='veterinario_edit'),
    path('veterinarios/<int:pk>/eliminar/', views.veterinario_delete, name='veterinario_delete'),

    path('consultas/', views.consulta_list, name='consulta_list'),
    path('consultas/nueva/', views.consulta_create, name='consulta_create'),
    path('consultas/<int:pk>/editar/', views.consulta_edit, name='consulta_edit'),
    path('consultas/<int:pk>/eliminar/', views.consulta_delete, name='consulta_delete'),
    path('consultas/exportar-xls/', views.exportar_consultas_xls, name='exportar_consultas'),
    path('consultas/exportar-pdf/', views.exportar_consultas_pdf, name='exportar_consultas_pdf'),
    
    path('productos/', views.producto_list, name='producto_list'),
    path('productos/nuevo/', views.producto_create, name='producto_create'),
    path('productos/<int:pk>/editar/', views.producto_edit, name='producto_edit'),
    path('productos/<int:pk>/eliminar/', views.producto_delete, name='producto_delete'),
]