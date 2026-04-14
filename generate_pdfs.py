#!/usr/bin/env python3
"""
Script to convert Markdown files to PDF with proper support for:
- Code blocks with syntax highlighting
- Mathematical formulas (using KaTeX-style formatting)
- Images
- Tables
"""

import markdown
from weasyprint import HTML, CSS
import sys
import os
from pathlib import Path

def create_html_from_markdown(md_content, base_path):
    """Convert markdown to HTML with proper styling for code, formulas, and tables."""
    
    # Custom CSS for better formatting
    custom_css = """
    @page {
        size: letter;
        margin: 2cm;
        @bottom-center {
            content: "Page " counter(page);
            font-size: 10px;
        }
    }
    
    body {
        font-family: 'DejaVu Sans', Arial, sans-serif;
        font-size: 11pt;
        line-height: 1.6;
        color: #333;
    }
    
    h1 {
        color: #1a5276;
        font-size: 22pt;
        border-bottom: 3px solid #1a5276;
        padding-bottom: 8px;
        margin-top: 30px;
        page-break-after: avoid;
    }
    
    h2 {
        color: #2874a6;
        font-size: 18pt;
        border-bottom: 2px solid #2874a6;
        padding-bottom: 5px;
        margin-top: 25px;
        page-break-after: avoid;
    }
    
    h3 {
        color: #3498db;
        font-size: 15pt;
        margin-top: 20px;
        page-break-after: avoid;
    }
    
    h4 {
        color: #5dade2;
        font-size: 13pt;
        margin-top: 18px;
    }
    
    p {
        margin: 10px 0;
        text-align: justify;
    }
    
    pre {
        background-color: #f4f4f4;
        border: 1px solid #ddd;
        border-left: 4px solid #3498db;
        padding: 15px;
        overflow-x: auto;
        font-size: 9pt;
        line-height: 1.4;
        page-break-inside: avoid;
        margin: 15px 0;
    }
    
    code {
        background-color: #f4f4f4;
        padding: 2px 6px;
        border-radius: 3px;
        font-family: 'Courier New', Courier, monospace;
        font-size: 9.5pt;
    }
    
    pre code {
        background-color: transparent;
        padding: 0;
    }
    
    table {
        border-collapse: collapse;
        width: 100%;
        margin: 20px 0;
        page-break-inside: avoid;
    }
    
    th {
        background-color: #2874a6;
        color: white;
        padding: 10px;
        text-align: left;
        font-weight: bold;
    }
    
    td {
        padding: 8px 10px;
        border-bottom: 1px solid #ddd;
    }
    
    tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    
    img {
        max-width: 100%;
        height: auto;
        display: block;
        margin: 20px auto;
        page-break-inside: avoid;
    }
    
    blockquote {
        border-left: 4px solid #f39c12;
        padding-left: 20px;
        margin: 15px 0;
        color: #555;
        background-color: #fef9e7;
        padding: 15px;
        border-radius: 0 5px 5px 0;
    }
    
    ul, ol {
        padding-left: 30px;
    }
    
    li {
        margin: 5px 0;
    }
    
    strong {
        color: #1a5276;
    }
    
    em {
        color: #555;
    }
    
    a {
        color: #2874a6;
        text-decoration: none;
    }
    
    hr {
        border: none;
        border-top: 2px solid #ddd;
        margin: 30px 0;
    }
    """
    
    # Convert markdown to HTML
    extensions = ['tables', 'fenced_code', 'codehilite', 'attr_list']
    html_body = markdown.markdown(md_content, extensions=extensions)
    
    # Create full HTML document
    full_html = f"""
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <style>
            {custom_css}
        </style>
    </head>
    <body>
        {html_body}
    </body>
    </html>
    """
    
    return full_html

def generate_pdf(md_content, output_path, base_path):
    """Generate PDF from markdown content."""
    
    # Convert to HTML
    html_content = create_html_from_markdown(md_content, base_path)
    
    # Create CSS for print
    css = CSS(string="""
        @page {
            size: letter;
            margin: 2cm;
        }
        body {
            font-family: 'DejaVu Sans', Arial, sans-serif;
        }
    """)
    
    # Generate PDF
    HTML(string=html_content, base_url=base_path).write_pdf(
        output_path,
        stylesheets=[css]
    )
    
    print(f"✓ PDF generated: {output_path}")

def combine_readme_solutions(readme_path, solutions_path=None):
    """Combine README.md and soluciones.md into a single document with consigna + respuesta pattern."""
    
    # Read README
    with open(readme_path, 'r', encoding='utf-8') as f:
        readme_content = f.read()
    
    # If no solutions file, return just README
    if not solutions_path or not os.path.exists(solutions_path):
        return readme_content
    
    # Read solutions
    with open(solutions_path, 'r', encoding='utf-8') as f:
        solutions_content = f.read()
    
    # Combine with clear separation
    combined = f"""
{readme_content}

---

# 📝 Soluciones

{ solutions_content}
"""
    
    return combined

def main():
    """Main function to generate PDFs for each TP."""
    
    base_dir = Path('/home/facundo/SistemasParalelos')
    
    # Define TPs and their files
    tps = [
        {
            'name': '1TP',
            'dir': '1TP-Punteros_y_Gestion_Memoria_en_C',
            'readme': base_dir / '1TP-Punteros_y_Gestion_Memoria_en_C' / 'README.md',
            'solutions': base_dir / '1TP-Punteros_y_Gestion_Memoria_en_C' / 'SOLUCIONES.md',
            'output': base_dir / '1TP-Punteros_y_Gestion_Memoria_en_C' / 'TP1.pdf'
        },
        {
            'name': '2TP',
            'dir': '2TP',
            'readme': base_dir / '2TP' / 'README.md',
            'solutions': None,  # No soluciones.md for 2TP
            'output': base_dir / '2TP' / 'TP2.pdf'
        },
        {
            'name': '3TP',
            'dir': '3TP',
            'readme': base_dir / '3TP' / 'README.md',
            'solutions': base_dir / '3TP' / 'soluciones.md',
            'output': base_dir / '3TP' / 'TP3.pdf'
        },
        {
            'name': '4TP',
            'dir': '4TP',
            'readme': base_dir / '4TP' / 'README.md',
            'solutions': base_dir / '4TP' / 'soluciones.md',
            'output': base_dir / '4TP' / 'TP4.pdf'
        }
    ]
    
    for tp in tps:
        print(f"\n{'='*60}")
        print(f"Generating PDF for {tp['name']}...")
        print(f"{'='*60}")
        
        # Combine README and solutions
        combined_content = combine_readme_solutions(
            tp['readme'],
            tp['solutions']
        )
        
        # Get base path for relative URLs
        base_path = tp['readme'].parent.as_uri()
        
        # Generate PDF
        generate_pdf(combined_content, tp['output'], base_path)
    
    print(f"\n{'='*60}")
    print("✅ All PDFs generated successfully!")
    print(f"{'='*60}")

if __name__ == '__main__':
    main()
