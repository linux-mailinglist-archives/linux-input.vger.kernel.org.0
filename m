Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70EAD113749
	for <lists+linux-input@lfdr.de>; Wed,  4 Dec 2019 22:55:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728121AbfLDVzk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Dec 2019 16:55:40 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:33686 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728042AbfLDVzk (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Dec 2019 16:55:40 -0500
Received: by mail-pf1-f196.google.com with SMTP id y206so515789pfb.0
        for <linux-input@vger.kernel.org>; Wed, 04 Dec 2019 13:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zKNvXEQhOZi0GX3YZdyX6P+ZfFgLht+HkhCGc6bw/WE=;
        b=hXfVW/hoPJ1iZvaY2FYoMyLCEFgUcaJuATWMbcEq7PxJjZHKjRmjldcXlX9DR4u5Tg
         e9U3+xWI0c6CRgHePT8bLRPAK56IlK6AL6jep6NU3ltnQYfHsykTHCdhJ3gSPxLkOJlH
         dnRKVC7gIGCtn4QEdRxtKSJIINRMn5KcZtazk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zKNvXEQhOZi0GX3YZdyX6P+ZfFgLht+HkhCGc6bw/WE=;
        b=Dwa2ajqa2ETgKz6IjbWUxQZfWOOqhpdj78C3YTd4VXU3y+neWvglS+qlPK2WzPUl4d
         H/5AbDt2qz1uYjOxIVbkawCur/T7p1k+GZb5MyuRX5NGKQav8JkrsWSjP9PDcfpBwqF2
         OcB4cpZjyIsijjP/y2cRvIGXbRmhVK9wrCoenqOFXUg6SJKcd+tOHiVqS1GM9aQaoKae
         LjJFSXBsLnSCCnpof4N+cRZJrTIuew9fbt/Y1HxJz7H1u0LCeb3Lj0YIVNZd19MiEzg+
         YK/1bYU0g3LW2AuleTyAVOiB+2jhZyQc1mbOeyPxiSwnIs7tDzdOBvFL3SR7La3nzXmq
         7zcg==
X-Gm-Message-State: APjAAAVUBdtHpx2HvwVJ4x11OxuXNUanhWe4Quz1QcXwLa48J9yPbXKF
        zZp+tT0FdsoLp0tgv1u0qVEczg==
X-Google-Smtp-Source: APXvYqxPKH0RgGKCKJSE0Sf4JTSGfYHd6GxBGvZXM3eNV6tb/V1rBYxB3/LDezYGyLM/1/7DDnNXog==
X-Received: by 2002:a63:cb48:: with SMTP id m8mr1519952pgi.128.1575496539271;
        Wed, 04 Dec 2019 13:55:39 -0800 (PST)
Received: from apsdesk.mtv.corp.google.com ([2620:15c:202:1:e09a:8d06:a338:aafb])
        by smtp.gmail.com with ESMTPSA id d23sm8648202pfo.176.2019.12.04.13.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2019 13:55:38 -0800 (PST)
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>,
        linux-input@vger.kernel.org
Cc:     linux-bluetooth@vger.kernel.org,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Logan Gunthorpe <logang@deltatee.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Kirill Smelkov <kirr@nexedi.com>
Subject: [PATCH v3] Input: uinput - Add UI_SET_PHYS_STR and UI_SET_UNIQ_STR
Date:   Wed,  4 Dec 2019 13:55:35 -0800
Message-Id: <20191204135434.v3.1.Ib53f70556ffe94d9a1903632ee9b0dc929f94557@changeid>
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


Changes in v3:
- Added UI_SET_PHYS_STR(len) and UI_SET_UNIQ_STR(len) and added
  deprecation notice for UI_SET_PHYS

Changes in v2:
- Added compat handling for UI_SET_UNIQ

 drivers/input/misc/uinput.c | 41 ++++++++++++++++++++++++++++++++++++-
 include/uapi/linux/uinput.h |  5 +++++
 2 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/drivers/input/misc/uinput.c b/drivers/input/misc/uinput.c
index 84051f20b18a..27a750896c71 100644
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
@@ -840,6 +843,7 @@ static long uinput_ioctl_handler(struct file *file, unsigned int cmd,
 	struct uinput_ff_erase  ff_erase;
 	struct uinput_request   *req;
 	char			*phys;
+	char			*uniq;
 	const char		*name;
 	unsigned int		size;
 
@@ -916,6 +920,8 @@ static long uinput_ioctl_handler(struct file *file, unsigned int cmd,
 		goto out;
 
 	case UI_SET_PHYS:
+		pr_warn_once("uinput: UI_SET_PHYS is deprecated. Use UI_SET_PHYS_STR");
+
 		if (udev->state == UIST_CREATED) {
 			retval = -EINVAL;
 			goto out;
@@ -1023,6 +1029,39 @@ static long uinput_ioctl_handler(struct file *file, unsigned int cmd,
 	case UI_ABS_SETUP & ~IOCSIZE_MASK:
 		retval = uinput_abs_setup(udev, p, size);
 		goto out;
+
+	case UI_SET_PHYS_STR(0):
+		if (udev->state == UIST_CREATED) {
+			retval = -EINVAL;
+			goto out;
+		}
+
+		phys = strndup_user(p, size);
+		if (IS_ERR(phys)) {
+			retval = PTR_ERR(phys);
+			goto out;
+		}
+
+		kfree(udev->dev->phys);
+		udev->dev->phys = phys;
+		goto out;
+
+	case UI_SET_UNIQ_STR(0):
+		if (udev->state == UIST_CREATED) {
+			retval = -EINVAL;
+			goto out;
+		}
+
+		uniq = strndup_user(p, size);
+		if (IS_ERR(uniq)) {
+			retval = PTR_ERR(uniq);
+			goto out;
+		}
+
+		kfree(udev->dev->uniq);
+		udev->dev->uniq = uniq;
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

