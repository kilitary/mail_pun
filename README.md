# MailPun

An email address generator. A toy. Do not use.

# About

Generates email addresses using rules described
in the [wikipedia article](http://en.wikipedia.org/wiki/Email_address#Syntax)

This might be useful for property testing code relying on email adresses as
input (if a shrinker/integration to Rantly/Generatron is ever added).

The emails are property tested against the infamous rfc822 regexp ripped
straight out of the Perl Mail::RFC822::Address module (version 0.4).

The regexp does not allow comments at the end of the local part though (i.e.
``foo(bar)@example.net``), so this functionality is disabled. The local part
won't contain dots nor both a comment and a quoted part - a possible FIXME.

As the emails are valid, it might happen they correspond to an existing
address. Although this is highly unlikely, do not send any email to those.
