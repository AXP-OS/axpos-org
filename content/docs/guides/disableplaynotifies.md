---
title: "Disable Google Play Notifications"
type: docs
toc: true
aliases:
    - /Google-Play-store-notifications
---
Google play will try to update the Google Play services which is not possible on a microG enabled device (i.e. AXP.OS or any other OS using microG instead of using the Google implementation).

There is no way to _disable_ these checks other than to deactivate the Play store (or modify the closed source code) whenever not needed but what you can do instead is at least hide the notifications for these failed attempts.

find the notification in the drop down:

![2024-09-16-18-11-06-561_resized](https://github.com/user-attachments/assets/f23b6214-b6b2-45e6-a288-486ba8d511e1)

looong press the notification:

![2024-09-16-18-11-16-412_resized](https://github.com/user-attachments/assets/24bcaf07-0270-41f0-a8b1-9b774aad1139)

press the `(i)` or in newer Android versions the gears icon:

![2024-09-16-18-11-41-447_resized](https://github.com/user-attachments/assets/ca118279-0e1e-4f0d-9bf5-80b9ac6fa77a)

on some Android version you have to select "Notifications" there:

![2024-09-16-18-11-59-034_resized](https://github.com/user-attachments/assets/5b5299d3-5b5d-4dcf-84db-5d113ab4d131)

you should be redirected to the corresponding notification topic, deselect it and those notifications are gone:

![2024-09-16-18-12-15-986_resized](https://github.com/user-attachments/assets/f466d619-18f3-49aa-b11f-6966e379c7a4)

