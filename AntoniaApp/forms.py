from django import forms
from django.contrib.auth.models import User
from django.utils import timezone
from .models import Dueño, Mascota, Veterinario, Consulta, Producto

class DueñoForm(forms.ModelForm):
    class Meta:
        model = Dueño
        fields = ['nombre', 'rut', 'direccion', 'telefono']
        widgets = {
            'nombre': forms.TextInput(attrs={'placeholder': 'Nombre completo'}),
            'rut': forms.TextInput(attrs={'placeholder': '12.345.678-9'}),
            'direccion': forms.TextInput(attrs={'placeholder': 'Ej: Av. Siempre Viva 742'}),
            'telefono': forms.TextInput(attrs={'placeholder': '+56 9 ...'}),
        }

class MascotaForm(forms.ModelForm):
    class Meta:
        model = Mascota
        fields = ['nombre', 'especie', 'raza', 'dueño', 'foto_mascota']
        widgets = {
            'nombre': forms.TextInput(attrs={'placeholder': 'Nombre de la mascota'}),
            'especie': forms.TextInput(attrs={'placeholder': 'Ej: Perro, Gato, Ave'}),
            'raza': forms.TextInput(attrs={'placeholder': 'Ej: Labrador, Siames'}),
        }

class VeterinarioForm(forms.ModelForm):
    class Meta:
        model = Veterinario
        fields = ['nombre', 'especialidad', 'telefono', 'mascotas_atendidas']
        widgets = {
            'nombre': forms.TextInput(attrs={'placeholder': 'Nombre completo del veterinario'}),
            'especialidad': forms.TextInput(attrs={'placeholder': 'Ej: Cirugía, Animales pequeños'}),
            'telefono': forms.TextInput(attrs={'placeholder': '+56 9 ...'}),
        }
        mascotas_atendidas = forms.ModelMultipleChoiceField(
            queryset=Mascota.objects.all(),
            widget=forms.CheckboxSelectMultiple,
            required=False
        )


class ConsultaForm(forms.ModelForm):
    class Meta:
        model = Consulta
        fields = ['mascota', 'fecha', 'motivo', 'diagnostico']
        widgets = {
            'fecha': forms.DateTimeInput(attrs={'type': 'datetime-local'}),
            'motivo': forms.Textarea(attrs={'rows': 4, 'placeholder': 'Motivo de la visita...'}),
            'diagnostico': forms.Textarea(attrs={'rows': 4, 'placeholder': 'Diagnóstico y tratamiento...'}),
        }

class CustomUserCreationForm(forms.ModelForm):
    password = forms.CharField(widget=forms.PasswordInput)

    class Meta:
        model = User
        fields = ['username', 'password']

    def save(self, commit=True):
        user = super().save(commit=False)
        user.set_password(self.cleaned_data["password"])
        if commit:
            user.save()
        return user

class ProductoForm(forms.ModelForm):
    class Meta:
        model = Producto

        fields = ['nombre', 'descripcion', 'precio', 'stock', 'imagen']
        
        widgets = {
            'nombre': forms.TextInput(attrs={'placeholder': 'Nombre del producto'}),
            'descripcion': forms.Textarea(attrs={'rows': 4, 'placeholder': 'Descripción...'}),
            'precio': forms.NumberInput(attrs={'min': 0}),
            'stock': forms.NumberInput(attrs={'min': 0}),
        }