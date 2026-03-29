import os
import subprocess
from behave import given, when, then


@given('подготовили тестовый файл "{filename}"')
def step_prepare_test_file(context, filename):
    """Проверка на наличие файла"""
    if not os.path.exists(filename):
        raise FileNotFoundError(f"Тестовый файл не найден: {filename}")


@when('я запускаю "{command}"')
def step_run_command(context, command):
    """Запуск приложения как подпроцесса"""
    try:
        result = subprocess.run(
            command,
            shell=True,
            capture_output=True,
            text=True,
            encoding="utf-8",
            timeout=10,
        )

        context.returncode = result.returncode
        context.stdout = result.stdout.strip()
        context.stderr = result.stderr.strip()
        context.last_command = command

    except subprocess.TimeoutExpired:
        context.stdout = ""
        context.stderr = "Timeout expired"
        context.returncode = -1
        raise
    except FileNotFoundError as e:
        context.stdout = ""
        context.stderr = f"Не найден исполняемый файл: {e}"
        context.returncode = -1
        raise
    except Exception as e:
        context.stdout = ""
        context.stderr = str(e)
        context.returncode = -1
        raise


@then('выводится "{expected_output}"')
def step_check_output(context, expected_output):
    """Проверка точного совпадения вывода"""
    actual = context.stdout
    assert actual == expected_output, \
        f"Ожидался вывод: '{expected_output}'\nПолучено: '{actual}'\nКоманда: {context.last_command}"


@then('ошибка')
def step_check_error(context):
    """Проверка, что приложение завершилось с ошибкой"""
    assert context.returncode != 0, \
        f"Ожидалась ошибка (ненулевой код возврата), но приложение завершилось успешно.\n" \
        f"Вывод: '{context.stdout}'\nКод возврата: {context.returncode}\nКоманда: {context.last_command}"