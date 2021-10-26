import re
import fitz


class CustomPDFLibrary:
    def __init__(self):
        self.doc = None
        self.filename = None

    def open_document(self, filename):
        self.filename = filename
        self.doc = fitz.open(rf"{filename}")

    def close_document(self):
        if self.doc:
            self.doc.close()
            self.doc = None

    def get_pdf_text(self, patterns):  #
        for pattern in patterns:
            for pagenum, page in enumerate(self.doc):
                text = page.get_text().encode("utf8")
                matches = re.match(pattern, str(text), re.IGNORECASE)
                if matches:
                    return matches.group(1).replace('\\n', '\n').strip(), pagenum+1
        return None
