# string_utils.py
import unicodedata

def normalize_and_compare(str1, str2):
    normalized_str1 = unicodedata.normalize('NFC', str1)
    normalized_str2 = unicodedata.normalize('NFC', str2)
    return normalized_str1 == normalized_str2, normalized_str1, normalized_str2