# Generated by Django 5.0.6 on 2024-06-07 18:41

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('account', '0012_alter_user_first_name'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='first_name',
            field=models.CharField(default=None, max_length=250),
        ),
    ]