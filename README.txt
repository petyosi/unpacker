unpacker
    by Petyo Ivanov

== DESCRIPTION

Small library for unpacking various archives, extracted from Beanstalk (http://beanstalkapp.com) (and rewritten, in fact).

== FEATURES/PROBLEMS

None so far :). Won't run on Windows, haven't tested.

== SAMPLE USAGE

To test archives do:

    Unpacker.valid? 'path/to/file.zip'

To extract files do:

    Unpacker.unpack('path/to/myfile.zip') do |directory_that_contains_extracted_files|
      
    end

In case the archive is not supported (currently working with zip, bzip, gzip, tar and rar) you may get UnrecognizedArchiveError in both methods.

The gem takes care to remove any temporary extractings after the block is executed; (uses /tmp/ directory). 

When working with .gz files (single archive), the extracted file is always called **gz-contents**. 

== REQUIREMENTS

Relies on system calls, so you should have 
- unzip
- unrar
- tar
- gunzip
- bunzip 

In path.

== INSTALL

`sudo gem install underlog-unpacker`

== LICENSE

(The MIT License)

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
