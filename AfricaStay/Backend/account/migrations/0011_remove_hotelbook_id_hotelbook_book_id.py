# Generated by Django 5.0.6 on 2024-05-21 17:00

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('account', '0010_hotelbook_room_alter_hotelbook_hotel_name'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='hotelbook',
            name='id',
        ),
        migrations.AddField(
            model_name='hotelbook',
            name='book_id',
            field=models.AutoField(default=None, primary_key=True, serialize=False),
        ),
    ]
