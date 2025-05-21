from django.shortcuts import render
# from django.http import JsonResponse

# Create your views here.
from django.http import JsonResponse
from .models import Message
from .db_router import get_current_hostname


def get_messages(request):
    db = get_current_hostname()
    if not db:
        return JsonResponse({'error': 'No frontend-hostname header provided.'}, status=400)

    try:
        messages = Message.objects.using(db).all()
        data = [{'id': msg.id, 'content': msg.content, 'created_at': msg.created_at} for msg in messages]
        return JsonResponse({'db': db, 'messages': data})
    except Exception as e:
        return JsonResponse({'error': str(e)}, status=500)

def health_check(request):
    return JsonResponse({"status": "ok"})