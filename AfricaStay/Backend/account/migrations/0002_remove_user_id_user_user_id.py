# Generated by Django 4.1.7 on 2024-04-26 15:21

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('account', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='user',
            name='id',
        ),
        migrations.AddField(
            model_name='user',
            name='user_id',
            field=models.AutoField(default=None, primary_key=True, serialize=False),
        ),
    ]