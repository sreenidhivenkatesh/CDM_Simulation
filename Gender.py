#!/usr/bin/env python
# coding: utf-8
# In[39]:

#importing necessary packages

import numpy as np
import pandas as pd
import random
from faker import Faker


# In[29]:


from faker import Faker


#improting faker to create fake data
fake = Faker()


# In[42]:


def make_workers(num):
    random.seed(1)
    gender_list = ['M', 'F']
    fake_workers = [{'sample_id':np.random.randint(1,500),
    'gender': np.random.choice(gender_list)}]   
    return fake_workers


# In[43]:


worker_df = pd.DataFrame(make_workers(num=1))

i=1
while i < 500:
    worker_df = worker_df.append(pd.DataFrame(make_workers(num=1)))
    i += 1

worker_df.head(100)


# In[45]:
print(worker_df['gender'].tolist().count('F'))
print(worker_df)

# In[ ]:
gender = ["M", "F"]

print(random.choices(gender, weights = [49,50], k = 500 ))
print(worker_df['gender'].tolist().count('F'))

# In[ ]:
c
from random import randint

def random_with_N_digits(n):
    range_start = 10**(n-1)
    range_end = (10**n)-1
    return randint(range_start, range_end)
print(random_with_N_digits(6))
# data frame with 500 of the interger 6
sample_ids = pd.DataFrame(np.random.randint(100000, 999999, size=(500, 1)), columns=list('A'))
print(df)

# In[ ]:




