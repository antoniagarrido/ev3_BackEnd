from django.db import models
from django.utils import timezone

# Create your models here.

class Dueño(models.Model):
    nombre = models.CharField(max_length=150)
    rut = models.CharField(max_length=12, unique=True)
    direccion = models.CharField(max_length=255)
    telefono = models.CharField(max_length=15, unique=True)

    def __str__(self):
        return self.nombre

class Mascota(models.Model):
    nombre = models.CharField(max_length=100)
    especie = models.CharField(max_length=100)
    raza = models.CharField(max_length=100)
    dueño = models.ForeignKey(Dueño, on_delete=models.CASCADE, related_name="mascotas")
    foto_mascota = models.ImageField(upload_to='mascotas/', blank=True, null=True)

    def __str__(self):
        return f"{self.nombre} ({self.especie})"

    def delete(self, *args, **kwargs):
        if self.foto_mascota:
            self.foto_mascota.delete(save=False)
        super().delete(*args, **kwargs)

class Veterinario(models.Model):
    nombre = models.CharField(max_length=150)
    especialidad = models.CharField(max_length=100)
    telefono = models.CharField(max_length=15, unique=True)
    mascotas_atendidas = models.ManyToManyField(Mascota, related_name="veterinarios", blank=True)

    def __str__(self):
        return f"{self.nombre} ({self.especialidad})"

class Consulta(models.Model):
    mascota = models.ForeignKey(Mascota, on_delete=models.CASCADE, related_name="consultas")
    fecha = models.DateTimeField(default=timezone.now)
    motivo = models.TextField()
    diagnostico = models.TextField(blank=True, null=True)

    def __str__(self):
        return f"Consulta de {self.mascota.nombre} - {self.fecha.strftime('%Y-%m-%d')}"


class Producto(models.Model):
    nombre = models.CharField(max_length=150)
    descripcion = models.TextField(blank=True, null=True)
    precio = models.PositiveIntegerField()
    stock = models.PositiveIntegerField(default=0)
    
    imagen = models.ImageField(upload_to='productos/', blank=True, null=True)
    
    def __str__(self):
        return self.nombre

    def delete(self, *args, **kwargs):
        if self.imagen:
            self.imagen.delete(save=False)
        super().delete(*args, **kwargs)