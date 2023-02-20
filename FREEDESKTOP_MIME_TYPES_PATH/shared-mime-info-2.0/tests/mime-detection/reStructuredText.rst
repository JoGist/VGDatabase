Examples from Wikipedia page
============================

Lists
-----

- A bullet list item
- Second item

  - A sub item

- Spacing between items creates separate lists

- Third item

1) An enumerated list item

2) Second item

   a) Sub item that goes on at length and thus needs
      to be wrapped. Note the indentation that must
      match the beginning of the text, not the
      enumerator.

      i) List items can even include

         paragraph breaks.

3) Third item

#) Another enumerated list item

#) Second item

Images
------

.. image:: /path/to/image.jpg

Named links
-----------

A sentence with links to Wikipedia_ and the `Linux kernel archive`_.

.. _Wikipedia: https://www.wikipedia.org/
.. _Linux kernel archive: https://www.kernel.org/

Anonymous links
---------------

Another sentence with an `anonymous link to the Python website`__.

__ https://www.python.org/

Literal blocks
--------------

::

  some literal text

This may also be used inline at the end of a paragraph, like so::

  some more literal text

.. code:: python

   print("A literal block directive explicitly marked as python code")
