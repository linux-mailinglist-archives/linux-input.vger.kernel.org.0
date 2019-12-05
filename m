Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCD3F1139F1
	for <lists+linux-input@lfdr.de>; Thu,  5 Dec 2019 03:31:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728707AbfLECbB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Dec 2019 21:31:01 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:40889 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728132AbfLECbB (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Dec 2019 21:31:01 -0500
Received: by mail-pg1-f193.google.com with SMTP id k25so826457pgt.7
        for <linux-input@vger.kernel.org>; Wed, 04 Dec 2019 18:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y7Ee+dNHq54/7afYHD+UmtJjTH9smfXBulTry9R0FkI=;
        b=Thn+k6tk3XAXYITVNqhSJ+4N0+izNtsGUvABmDpnSR1IwTELS0KwBKxwk7UQ7rn6Ty
         umt/AFtjgw5HG9B1Vw5DmFkBfGUkjk8NsxXQToq4x2kCW+9zWH0YSahqVuvqketU9cGI
         mOwVSN3cP20uwpDuB0kELiE7Rc/YkC5xwws+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y7Ee+dNHq54/7afYHD+UmtJjTH9smfXBulTry9R0FkI=;
        b=Up0neNrI41iCXETZMIs+A1B4dCV9mB2i8KEh4YMwvHfyO/bXcj+d44/rh5do/Gh/mk
         oitqySGpiKSPsjLUm01P1SJJPg9FckhMb71j9bPbHvbx/gMtRebng5G5UqxmL/JROoAt
         LmQRtmxs0hyG0u1Yp1q11CmrymiqbaENmJ/jmqpd8P9Vt9+v516iu6J5aqNkneIheo5i
         CuEshjLaEXLmxJHuzlGxqCCiiPgSp89UCrldpFBwKsWbHY9HyYqQeK+PHLD4/6cRy7jf
         O2mZ9mHrmTvzaNwP1QzunvnOsMWbU+1sBAzQLNFIw9XmtdhLLq8QVxJrjeo/QQJEEDKB
         fsMw==
X-Gm-Message-State: APjAAAV8bY4HcsNvhNmreoNRGJQgqHLdKhYCIkXH82D3S3XR41ct/WSo
        s0IOTifTCCNRFaLGL5cE+59nVw==
X-Google-Smtp-Source: APXvYqyOdLLYrYiBx7emxUHQXoL+NtXJVUM7x47UAozTKa86tXu0VL7qz2ZM/f7flmKp37j0OOC9Gw==
X-Received: by 2002:a62:7b46:: with SMTP id w67mr6732042pfc.113.1575513060108;
        Wed, 04 Dec 2019 18:31:00 -0800 (PST)
Received: from apsdesk.mtv.corp.google.com ([2620:15c:202:1:e09a:8d06:a338:aafb])
        by smtp.gmail.com with ESMTPSA id x12sm9174425pfm.130.2019.12.04.18.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2019 18:30:59 -0800 (PST)
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>,
        linux-input@vger.kernel.org
Cc:     linux-bluetooth@vger.kernel.org,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Kirill Smelkov <kirr@nexedi.com>
Subject: [PATCH v4] Input: uinput - Add UI_SET_PHYS_STR and UI_SET_UNIQ_STR
Date:   Wed,  4 Dec 2019 18:30:54 -0800
Message-Id: <20191204182942.v4.1.Ib53f70556ffe94d9a1903632ee9b0dc929f94557@changeid>
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The ioctl definition for UI_SET_PHYS is ambiguous because it is defined
with size = sizeof(char*) but is expected to be given a variable length
string. Add a deprecation notice for UI_SET_PHYS and provide
UI_SET_PHYS_STR(len) which expects a size from the user.

Also support setting the uniq attribute of the input device. The uniq
attribute is used as a unique identifier for the connected device.

For example, uinput devices created by BlueZ will store the address of
the connected device as the uniq property.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---
Hi input maintainers,

Here is an updated patch that refactors the ioctl handlers (properly
allowing the size to be set from userspace). When calling the new
ioctls, the call signature will look like this:

```
ioctl(fd, UI_SET_PHYS_STR(18), "00:11:22:33:44:55");
```

I've tested this on a Chromebook running kernel v4.19 with a sample
program compiled for both 32-bit (i.e. gcc -m32 test.c) and 64-bit.

The final uinput device looks like this:

```
udevadm info -a -p /devices/virtual/input/input18

Udevadm info starts with the device specified by the devpath and then
walks up the chain of parent devices. It prints for every device
found, all possible attributes in the udev rules key format.
A rule to match, can be composed by the attributes of the device
and the attributes from one single parent device.

  looking at device '/devices/virtual/input/input18':
    KERNEL=="input18"
    SUBSYSTEM=="input"
    DRIVER==""
    ATTR{inhibited}=="0"
    ATTR{name}=="Test"
    ATTR{phys}=="00:00:00:33:44:55"
    ATTR{properties}=="0"
    ATTR{uniq}=="00:11:22:00:00:00"

```


Changes in v4:
- Added uinput_get_user_str

Changes in v3:
- Added UI_SET_PHYS_STR(len) and UI_SET_UNIQ_STR(len) and added
  deprecation notice for UI_SET_PHYS

Changes in v2:
- Added compat handling for UI_SET_UNIQ

 drivers/input/misc/uinput.c | 48 +++++++++++++++++++++++++------------
 include/uapi/linux/uinput.h |  5 ++++
 2 files changed, 38 insertions(+), 15 deletions(-)

diff --git a/drivers/input/misc/uinput.c b/drivers/input/misc/uinput.c
index 84051f20b18a..2c3180370a02 100644
--- a/drivers/input/misc/uinput.c
+++ b/drivers/input/misc/uinput.c
@@ -20,6 +20,7 @@
  */
 #include <uapi/linux/uinput.h>
 #include <linux/poll.h>
+#include <linux/printk.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/module.h>
@@ -280,7 +281,7 @@ static int uinput_dev_flush(struct input_dev *dev, struct file *file)
 
 static void uinput_destroy_device(struct uinput_device *udev)
 {
-	const char *name, *phys;
+	const char *name, *phys, *uniq;
 	struct input_dev *dev = udev->dev;
 	enum uinput_state old_state = udev->state;
 
@@ -289,6 +290,7 @@ static void uinput_destroy_device(struct uinput_device *udev)
 	if (dev) {
 		name = dev->name;
 		phys = dev->phys;
+		uniq = dev->uniq;
 		if (old_state == UIST_CREATED) {
 			uinput_flush_requests(udev);
 			input_unregister_device(dev);
@@ -297,6 +299,7 @@ static void uinput_destroy_device(struct uinput_device *udev)
 		}
 		kfree(name);
 		kfree(phys);
+		kfree(uniq);
 		udev->dev = NULL;
 	}
 }
@@ -831,6 +834,24 @@ static int uinput_str_to_user(void __user *dest, const char *str,
 	return ret ? -EFAULT : len;
 }
 
+static int uinput_get_user_str(struct uinput_device *udev, const char **kptr,
+			       const char *uptr, unsigned int size)
+{
+	char *tmp;
+
+	if (udev->state == UIST_CREATED)
+		return -EINVAL;
+
+	tmp = strndup_user(uptr, size);
+	if (IS_ERR(tmp))
+		return PTR_ERR(tmp);
+
+	kfree(*kptr);
+	*kptr = tmp;
+
+	return 0;
+}
+
 static long uinput_ioctl_handler(struct file *file, unsigned int cmd,
 				 unsigned long arg, void __user *p)
 {
@@ -839,7 +860,6 @@ static long uinput_ioctl_handler(struct file *file, unsigned int cmd,
 	struct uinput_ff_upload ff_up;
 	struct uinput_ff_erase  ff_erase;
 	struct uinput_request   *req;
-	char			*phys;
 	const char		*name;
 	unsigned int		size;
 
@@ -916,19 +936,8 @@ static long uinput_ioctl_handler(struct file *file, unsigned int cmd,
 		goto out;
 
 	case UI_SET_PHYS:
-		if (udev->state == UIST_CREATED) {
-			retval = -EINVAL;
-			goto out;
-		}
-
-		phys = strndup_user(p, 1024);
-		if (IS_ERR(phys)) {
-			retval = PTR_ERR(phys);
-			goto out;
-		}
-
-		kfree(udev->dev->phys);
-		udev->dev->phys = phys;
+		pr_warn_once("uinput: UI_SET_PHYS is deprecated. Use UI_SET_PHYS_STR");
+		retval = uinput_get_user_str(udev, &udev->dev->phys, p, 1024);
 		goto out;
 
 	case UI_BEGIN_FF_UPLOAD:
@@ -1023,6 +1032,15 @@ static long uinput_ioctl_handler(struct file *file, unsigned int cmd,
 	case UI_ABS_SETUP & ~IOCSIZE_MASK:
 		retval = uinput_abs_setup(udev, p, size);
 		goto out;
+
+	case UI_SET_PHYS_STR(0):
+		retval = uinput_get_user_str(udev, &udev->dev->phys, p, size);
+		goto out;
+
+	case UI_SET_UNIQ_STR(0):
+		retval = uinput_get_user_str(udev, &udev->dev->uniq, p, size);
+		goto out;
+
 	}
 
 	retval = -EINVAL;
diff --git a/include/uapi/linux/uinput.h b/include/uapi/linux/uinput.h
index c9e677e3af1d..84d4fa142830 100644
--- a/include/uapi/linux/uinput.h
+++ b/include/uapi/linux/uinput.h
@@ -142,9 +142,14 @@ struct uinput_abs_setup {
 #define UI_SET_LEDBIT		_IOW(UINPUT_IOCTL_BASE, 105, int)
 #define UI_SET_SNDBIT		_IOW(UINPUT_IOCTL_BASE, 106, int)
 #define UI_SET_FFBIT		_IOW(UINPUT_IOCTL_BASE, 107, int)
+
+/* DEPRECATED: Data size is ambiguous. Use UI_SET_PHYS_STR instead. */
 #define UI_SET_PHYS		_IOW(UINPUT_IOCTL_BASE, 108, char*)
+
 #define UI_SET_SWBIT		_IOW(UINPUT_IOCTL_BASE, 109, int)
 #define UI_SET_PROPBIT		_IOW(UINPUT_IOCTL_BASE, 110, int)
+#define UI_SET_PHYS_STR(len)	_IOC(_IOC_WRITE, UINPUT_IOCTL_BASE, 111, len)
+#define UI_SET_UNIQ_STR(len)	_IOC(_IOC_WRITE, UINPUT_IOCTL_BASE, 112, len)
 
 #define UI_BEGIN_FF_UPLOAD	_IOWR(UINPUT_IOCTL_BASE, 200, struct uinput_ff_upload)
 #define UI_END_FF_UPLOAD	_IOW(UINPUT_IOCTL_BASE, 201, struct uinput_ff_upload)
-- 
2.24.0.393.g34dc348eaf-goog

