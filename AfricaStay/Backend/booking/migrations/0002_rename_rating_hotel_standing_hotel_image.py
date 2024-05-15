# Generated by Django 5.0.6 on 2024-05-15 18:31

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('booking', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='hotel',
            old_name='rating',
            new_name='standing',
        ),
        migrations.AddField(
            model_name='hotel',
            name='image',
            field=models.ImageField(default=None, upload_to='hotel_images/'),
        ),
    ]