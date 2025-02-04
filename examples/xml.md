## XML Code Example

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!-- This is an XML comment -->
<!DOCTYPE library [
  <!ELEMENT library (book+)>
  <!ELEMENT book (title, author+, published, description?)>
  <!ELEMENT title (#PCDATA)>
  <!ELEMENT author (#PCDATA)>
  <!ELEMENT published (#PCDATA)>
  <!ELEMENT description (#PCDATA)>
  <!ATTLIST book 
    id ID #REQUIRED
    category CDATA #IMPLIED
    inStock (yes|no) "yes">
]>

<library xmlns:lit="http://example.com/literature"
         xmlns:pub="http://example.com/publishing">
  
  <!-- Basic element with attributes -->
  <book id="b1" category="fiction" inStock="yes">
    <title>The Great Gatsby</title>
    <!-- Multiple elements of same type -->
    <author>F. Scott Fitzgerald</author>
    <published>1925</published>
    <!-- CDATA section for text with special characters -->
    <description><![CDATA[A story about the American Dream & society in the 1920s]]></description>
  </book>

  <!-- Namespaces -->
  <lit:book id="b2" inStock="no">
    <title>1984</title>
    <author>George Orwell</author>
    <!-- Empty element -->
    <pub:published />
  </lit:book>

  <!-- Special characters and entities -->
  <book id="b3">
    <title>Alice &amp; Wonderland</title>
    <author>Lewis Carroll</author>
    <published>1865</published>
    <!-- Mixed content -->
    <description>
      A tale about a girl named <emphasis>Alice</emphasis> who falls down a rabbit hole.
      Special chars: &lt; &gt; &amp; &apos; &quot;
    </description>
  </book>

  <!-- Processing instruction -->
  <?display-mode full-screen?>
  
  <!-- Whitespace preservation -->
  <book id="b4" xml:space="preserve">
    <title>    The    Raven    </title>
    <author>Edgar Allan Poe</author>
    <published>1845</published>
  </book>
</library>
```
