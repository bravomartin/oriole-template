
::: #init
# A Simple Oriole
:::

::: #simple-example
A really simple example:
:::

``` python
hey = &#34;hello world&#34;, 38+4
print(hey)
print("I'm executable")
```

::: #some-other-id
When I write something.
:::

```
print("I'm not executable")
```

This is some plain text.

::: #an-id
I'm a block with the id #an-id
:::


::: #complicated-example
## More complicated example
:::

::: #complicated-example-code
``` python
x = [1,1]
for i in range(10):    
    x.append(x[-1] + x[-2]) 
print(&#39;, &#39;.join(str(y) for y in x))
```
:::

::: #a-chart
## A Chart
::: 

<span id="example3"/> (this is also valid)

``` python
%matplotlib inline
import matplotlib.pyplot as plt
import numpy as np
x = np.linspace(0, 3*np.pi, 500)
plt.plot(x, np.sin(x**2))
plt.title("&#39;A simple chirp&#39;");
```

::: #seaborn-example
## Seaborn Example
:::

``` python
from __future__ import print_function, division

%matplotlib inline
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

x = np.linspace(0, 10, 1000)
plt.plot(x, np.sin(x), x, np.cos(x));

import seaborn as sns
sns.set()
plt.plot(x, np.sin(x), x, np.cos(x));
```

::: #interactive-widgets
## Interactive widgets
:::

```
%matplotlib inline
from IPython.display import Image
from IPython.html.widgets import interact
from numpy import pi, cos, sin
import numpy as np
import pylab as plt
import seaborn as sns
sns.set()
```
::: #these-too
And these too
:::

```
def plot_fringe(bl_length, wavelength):
    &#34;&#34;&#34; Plot the fringe function for a baseline (see Fig 1)

    bl_length:      distance between antennas, in m
    wavelength:     wavelength, in m
    &#34;&#34;&#34;
    theta = np.linspace(-np.pi, np.pi, 401)
    l = sin(theta)
    F = cos(2 * pi * bl_length * l / wavelength)
    F2 = cos(2 * pi * 2 * bl_length * l / wavelength)

    plt.plot(l, F, c=&#39;#cc0000&#39;, label=&#34;Baseline 1-2&#34;)
    plt.plot(l, F2, c=&#39;#0000cc&#39;, label=&#34;Baseline 1-3&#34;)
    plt.xlabel(&#34;$sin(\\theta)$&#34;)
    plt.ylabel(&#34;Fringe amplitude&#34;)
    plt.ylim(-2, 2)
    plt.legend()

f = interact(plot_fringe, bl_length=(1, 100), wavelength=(1, 100))
```
