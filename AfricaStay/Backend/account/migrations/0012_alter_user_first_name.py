# Generated by Django 5.0.6 on 2024-06-07 18:29

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('account', '0011_remove_hotelbook_id_hotelbook_book_id'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='first_name',
            field=models.CharField(default=None, max_length=250, null=True),
        ),
    ]
