import threading

_thread_local = threading.local()

def get_current_hostname():
    return getattr(_thread_local, "frontend_hostname", None)

def set_current_hostname(hostname):
    _thread_local.frontend_hostname = hostname

class CustomDatabaseRouter:
    def db_for_read(self, model, **hints):
        return get_current_hostname()

    def db_for_write(self, model, **hints):
        return get_current_hostname()

    def allow_relation(self, obj1, obj2, **hints):
        db1 = get_current_hostname()
        db2 = get_current_hostname()
        return db1 == db2

    def allow_migrate(self, db, app_label, model_name=None, **hints):
        return db == get_current_hostname()
