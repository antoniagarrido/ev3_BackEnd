from django.shortcuts import render, redirect, get_object_or_404
from .models import Dueño, Mascota, Veterinario, Consulta, Producto
from .forms import DueñoForm, MascotaForm, VeterinarioForm, ConsultaForm, CustomUserCreationForm, ProductoForm
from django.contrib.auth.decorators import login_required
from django.contrib.auth.forms import UserCreationForm
from django.http import HttpResponse
from reportlab.pdfgen import canvas
from reportlab.lib.pagesizes import letter
from reportlab.lib.units import inch
from reportlab.platypus import SimpleDocTemplate, Table, TableStyle
from reportlab.lib import colors
from django.core.paginator import Paginator
from django.db.models import Q, Count
import json
import xlwt

# Create your views here.

@login_required
def home(request):
    total_mascotas = Mascota.objects.count()
    total_dueños = Dueño.objects.count()
    total_consultas = Consulta.objects.count()

    especie_data = Mascota.objects.values('especie').annotate(total=Count('especie'))
    
    chart_labels = json.dumps([item['especie'] for item in especie_data])
    chart_data = json.dumps([item['total'] for item in especie_data])

    context = {
        'total_mascotas': total_mascotas,
        'total_dueños': total_dueños,
        'total_consultas': total_consultas,
        'chart_labels': chart_labels,
        'chart_data': chart_data,
    }
    return render(request, 'home.html', context)

@login_required
def dueño_list(request):
    if not request.user.is_staff:
        return redirect('home')
        
    q = request.GET.get('q', '')
    if q:
        dueño_list = Dueño.objects.filter(
            Q(nombre__icontains=q) | Q(rut__icontains=q)
        ).order_by('nombre')
    else:
        dueño_list = Dueño.objects.all().order_by('nombre')
    
    paginator = Paginator(dueño_list, 10)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    
    return render(request, 'dueño_list.html', {'page_obj': page_obj, 'q': q})

@login_required
def dueño_create(request):
    if not request.user.is_staff:
        return redirect('dueño_list')
    if request.method == 'POST':
        form = DueñoForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('dueño_list')
    else:
        form = DueñoForm()
    return render(request, 'dueño_form.html', {'form': form, 'titulo': 'Registrar Nuevo Dueño'})

@login_required
def dueño_edit(request, pk):
    if not request.user.is_staff:
        return redirect('dueño_list')
    dueño = get_object_or_404(Dueño, pk=pk)
    if request.method == 'POST':
        form = DueñoForm(request.POST, instance=dueño)
        if form.is_valid():
            form.save()
            return redirect('dueño_list')
    else:
        form = DueñoForm(instance=dueño)
    return render(request, 'dueño_form.html', {'form': form, 'titulo': 'Editar Dueño'})

@login_required
def dueño_delete(request, pk):
    if not request.user.is_staff:
        return redirect('dueño_list')
    dueño = get_object_or_404(Dueño, pk=pk)
    if request.method == 'POST':
        dueño.delete()
        return redirect('dueño_list')
    return render(request, 'dueño_confirm_delete.html', {'obj': dueño})

@login_required
def mascota_list(request):
    if not request.user.is_staff:
        return redirect('home')
        
    q = request.GET.get('q', '')
    if q:
        mascota_list = Mascota.objects.filter(
            Q(nombre__icontains=q) | Q(especie__icontains=q) | Q(raza__icontains=q) | Q(dueño__nombre__icontains=q)
        ).order_by('nombre')
    else:
        mascota_list = Mascota.objects.all().order_by('nombre')
    
    paginator = Paginator(mascota_list, 10)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    
    return render(request, 'mascota_list.html', {'page_obj': page_obj, 'q': q})

@login_required
def mascota_create(request):
    if not request.user.is_staff:
        return redirect('mascota_list')
    if request.method == 'POST':
        form = MascotaForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('mascota_list')
    else:
        form = MascotaForm()
    return render(request, 'mascota_form.html', {'form': form, 'titulo': 'Registrar Nueva Mascota'})

@login_required
def mascota_edit(request, pk):
    if not request.user.is_staff:
        return redirect('mascota_list')
    mascota = get_object_or_404(Mascota, pk=pk)
    if request.method == 'POST':
        form = MascotaForm(request.POST, request.FILES, instance=mascota)
        if form.is_valid():
            form.save()
            return redirect('mascota_list')
    else:
        form = MascotaForm(instance=mascota)
    return render(request, 'mascota_form.html', {'form': form, 'titulo': 'Editar Mascota'})

@login_required
def mascota_delete(request, pk):
    if not request.user.is_staff:
        return redirect('mascota_list')
    mascota = get_object_or_404(Mascota, pk=pk)
    if request.method == 'POST':
        mascota.delete()
        return redirect('mascota_list')
    return render(request, 'mascota_confirm_delete.html', {'obj': mascota})

@login_required
def veterinario_list(request):
    q = request.GET.get('q', '')
    if q:
        veterinario_list = Veterinario.objects.filter(
            Q(nombre__icontains=q) | Q(especialidad__icontains=q)
        ).order_by('nombre')
    else:
        veterinario_list = Veterinario.objects.all().order_by('nombre')
    
    paginator = Paginator(veterinario_list, 10)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    return render(request, 'veterinario_list.html', {'page_obj': page_obj, 'q': q})

@login_required
def veterinario_create(request):
    if not request.user.is_staff:
        return redirect('veterinario_list')
    if request.method == 'POST':
        form = VeterinarioForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('veterinario_list')
    else:
        form = VeterinarioForm()
    return render(request, 'veterinario_form.html', {'form': form, 'titulo': 'Registrar Veterinario'})

@login_required
def veterinario_edit(request, pk):
    if not request.user.is_staff:
        return redirect('veterinario_list')
    veterinario = get_object_or_404(Veterinario, pk=pk)
    if request.method == 'POST':
        form = VeterinarioForm(request.POST, instance=veterinario)
        if form.is_valid():
            form.save()
            return redirect('veterinario_list')
    else:
        form = VeterinarioForm(instance=veterinario)
    return render(request, 'veterinario_form.html', {'form': form, 'titulo': 'Editar Veterinario'})

@login_required
def veterinario_delete(request, pk):
    if not request.user.is_staff:
        return redirect('veterinario_list')
    veterinario = get_object_or_404(Veterinario, pk=pk)
    if request.method == 'POST':
        veterinario.delete()
        return redirect('veterinario_list')
    return render(request, 'veterinario_confirm_delete.html', {'obj': veterinario})

@login_required
def consulta_list(request):
    if not request.user.is_staff:
        return redirect('home')
        
    q = request.GET.get('q', '')
    if q:
        consulta_list = Consulta.objects.filter(
            Q(mascota__nombre__icontains=q) | Q(motivo__icontains=q) | Q(diagnostico__icontains=q)
        ).order_by('-fecha')
    else:
        consulta_list = Consulta.objects.all().order_by('-fecha')
    
    paginator = Paginator(consulta_list, 10)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    return render(request, 'consulta_list.html', {'page_obj': page_obj, 'q': q})

@login_required
def consulta_create(request):
    if not request.user.is_staff:
        return redirect('consulta_list')
    if request.method == 'POST':
        form = ConsultaForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('consulta_list')
    else:
        form = ConsultaForm()
    return render(request, 'consulta_form.html', {'form': form, 'titulo': 'Registrar Nueva Consulta'})

@login_required
def consulta_edit(request, pk):
    if not request.user.is_staff:
        return redirect('consulta_list')
    consulta = get_object_or_404(Consulta, pk=pk)
    if request.method == 'POST':
        form = ConsultaForm(request.POST, instance=consulta)
        if form.is_valid():
            form.save()
            return redirect('consulta_list')
    else:
        form = ConsultaForm(instance=consulta)
    return render(request, 'consulta_form.html', {'form': form, 'titulo': 'Editar Consulta'})

@login_required
def consulta_delete(request, pk):
    if not request.user.is_staff:
        return redirect('consulta_list')
    consulta = get_object_or_404(Consulta, pk=pk)
    if request.method == 'POST':
        consulta.delete()
        return redirect('consulta_list')
    return render(request, 'consulta_confirm_delete.html', {'obj': consulta})

@login_required
def producto_list(request):
    q = request.GET.get('q', '')
    if q:
        producto_list = Producto.objects.filter(
            Q(nombre__icontains=q) | Q(descripcion__icontains=q)
        ).order_by('nombre')
    else:
        producto_list = Producto.objects.all().order_by('nombre')
    
    paginator = Paginator(producto_list, 10)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    return render(request, 'producto_list.html', {'page_obj': page_obj, 'q': q})


@login_required
def producto_create(request):
    if not request.user.is_staff:
        return redirect('producto_list')
    if request.method == 'POST':
       
        form = ProductoForm(request.POST, request.FILES) 
        if form.is_valid():
            form.save()
            return redirect('producto_list')
    else:
        form = ProductoForm()
    return render(request, 'producto_form.html', {'form': form, 'titulo': 'Registrar Nuevo Producto'})

@login_required
def producto_edit(request, pk):
    if not request.user.is_staff:
        return redirect('producto_list')
    producto = get_object_or_404(Producto, pk=pk)
    if request.method == 'POST':
   
        form = ProductoForm(request.POST, request.FILES, instance=producto)
        if form.is_valid():
            form.save()
            return redirect('producto_list')
    else:
        form = ProductoForm(instance=producto)
    return render(request, 'producto_form.html', {'form': form, 'titulo': 'Editar Producto'})


@login_required
def producto_delete(request, pk):
    if not request.user.is_staff:
        return redirect('producto_list')
    producto = get_object_or_404(Producto, pk=pk)
    if request.method == 'POST':
        producto.delete()
        return redirect('producto_list')
    return render(request, 'producto_confirm_delete.html', {'obj': producto})

def register(request):
    if request.method == 'POST':
        form = CustomUserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('login')
    else:
        form = CustomUserCreationForm()
    return render(request, 'registration/register.html', {'form': form})

def get_filtered_consultas(q):
    if q:
        return Consulta.objects.filter(
            Q(mascota__nombre__icontains=q) | Q(motivo__icontains=q) | Q(diagnostico__icontains=q)
        ).order_by('-fecha')
    else:
        return Consulta.objects.all().order_by('-fecha')

@login_required
def exportar_consultas_xls(request):
    q = request.GET.get('q', '')
    rows = get_filtered_consultas(q)
    
    response = HttpResponse(content_type='application/ms-excel')
    response['Content-Disposition'] = 'attachment; filename="consultas.xls"'

    wb = xlwt.Workbook(encoding='utf-8')
    ws = wb.add_sheet('Consultas')

    row_num = 0
    columns = ['Mascota', 'Fecha', 'Motivo', 'Diagnóstico']
    for col_num, column_title in enumerate(columns):
        ws.write(row_num, col_num, column_title)
    
    for row_num, consulta in enumerate(rows, start=1):
        ws.write(row_num, 0, consulta.mascota.nombre)
        ws.write(row_num, 1, consulta.fecha.strftime('%Y-%m-%d %H:%M'))
        ws.write(row_num, 2, consulta.motivo)
        ws.write(row_num, 3, consulta.diagnostico)

    wb.save(response)
    return response

@login_required
def exportar_consultas_pdf(request):
    q = request.GET.get('q', '')
    consultas = get_filtered_consultas(q)

    response = HttpResponse(content_type='application/pdf')
    response['Content-Disposition'] = 'attachment; filename="consultas.pdf"'

    doc = SimpleDocTemplate(response, pagesize=letter)
    elements = []

    data = [['Mascota', 'Fecha', 'Motivo', 'Diagnostico']]
    for consulta in consultas:
        data.append([
            consulta.mascota.nombre,
            consulta.fecha.strftime('%Y-%m-%d'),
            consulta.motivo,
            consulta.diagnostico
        ])

    table = Table(data, colWidths=[1.5*inch, 1*inch, 2.5*inch, 2.5*inch])
    table.setStyle(TableStyle([
        ('BACKGROUND', (0, 0), (-1, 0), colors.pink),
        ('TEXTCOLOR', (0, 0), (-1, 0), colors.whitesmoke),
        ('ALIGN', (0, 0), (-1, -1), 'LEFT'),
        ('FONTNAME', (0, 0), (-1, 0), 'Helvetica-Bold'),
        ('BOTTOMPADDING', (0, 0), (-1, 0), 12),
        ('BACKGROUND', (0, 1), (-1, -1), colors.lavenderblush),
        ('GRID', (0, 0), (-1, -1), 1, colors.pink),
    ]))
    
    elements.append(table)
    doc.build(elements)
    return response