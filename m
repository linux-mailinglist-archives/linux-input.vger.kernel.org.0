Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB97C10B61D
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2019 19:52:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727111AbfK0Sv7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Nov 2019 13:51:59 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:44002 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727416AbfK0Sv5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Nov 2019 13:51:57 -0500
Received: by mail-pl1-f194.google.com with SMTP id q16so6001053plr.10
        for <linux-input@vger.kernel.org>; Wed, 27 Nov 2019 10:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YimDLRO44EFdVpsrruJmPdiNyDfnYjYesEmjPbE4iug=;
        b=D/I1PI3/xRstodfiyXqR1BgtCy/ajR8WN0uJqbYuGeWhpekpVi8hrssvJ6Uej9JgIC
         OQiXNI3dbKwmTz8Opz4WZIL67/55kCioIxXRa5OrTNIM/kclnAYk1eDIm9peYJE5fqNn
         LFNTa/mOB4TkrVqFH/GHRejPJk47fxpl9tYV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YimDLRO44EFdVpsrruJmPdiNyDfnYjYesEmjPbE4iug=;
        b=erOeT16WfBZk2YWRQ2xN0AYleCerOHkNTPL29tXIrGPJeF3HAPnJCdpxlzB9jlYQmL
         5Xrgxzx78OLYWBnZ3X0HfHKai21z04waW9D6dgX4EcPLbdWfc/P5fT6VfXFJlCcJNI/G
         lM7THbc6BNaawtMfRwClwfq9qJPGJMHsFoQi2i+r+q+cCOGSM68ZczMMLpSTfoKJciRZ
         CsiK9X+rP8MZlTYgNmmLs7QIOcRezBoJ9ssWu8HSO7xiIKK6H1sWzEWMSJZlAXiS58gm
         HFYHzNWvLt7CPSb6XZaYumC1UUbu8AO/mFeR7UtWOHtqiCojP5KJh4pCq8BZc6fPnZC1
         FFAQ==
X-Gm-Message-State: APjAAAUzYykhB73g2QfbUguuv9UKTRExj3RuxQdy5ksq0AQ1sUvcKCTA
        qLK83OESRXEwnP9DTM2R8+M+zwrbSp4=
X-Google-Smtp-Source: APXvYqwu01IvMOa1VFObRaM/KHPJkHSkKDJA8DuUDOHFFKgjF15kURy3Urf9LJqzyG7YUQ3N0tLSGQ==
X-Received: by 2002:a17:90a:c68f:: with SMTP id n15mr7977113pjt.20.1574880715835;
        Wed, 27 Nov 2019 10:51:55 -0800 (PST)
Received: from apsdesk.mtv.corp.google.com ([2620:15c:202:1:e09a:8d06:a338:aafb])
        by smtp.gmail.com with ESMTPSA id x2sm17088680pgc.67.2019.11.27.10.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2019 10:51:55 -0800 (PST)
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To:     linux-input@vger.kernel.org
Cc:     =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>,
        linux-bluetooth@vger.kernel.org,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Logan Gunthorpe <logang@deltatee.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Kirill Smelkov <kirr@nexedi.com>
Subject: [PATCH] Input: uinput - Add UI_SET_UNIQ ioctl handler
Date:   Wed, 27 Nov 2019 10:51:39 -0800
Message-Id: <20191127185139.65048-1-abhishekpandit@chromium.org>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Support setting the uniq attribute of the input device. The uniq
attribute is used as a unique identifier for the connected device.

For example, uinput devices created by BlueZ will store the address of
the connected device as the uniq property.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---
Hi input maintainers,

I added this change to allow BlueZ to display the peer device address in
udev. BlueZ has been setting ATTR{name} to the peer address since it
isn't possible to set the uniq attribute currently.

I've tested this on a Chromebook running kernel v4.19 with this patch.

$ uname -r
4.19.85

$ dmesg | grep "input:" | tail -1
[   69.604752] input: BeatsStudio Wireless as /devices/virtual/input/input17

$ udevadm info -a -p /sys/devices/virtual/input/input17

Udevadm info starts with the device specified by the devpath and then
walks up the chain of parent devices. It prints for every device
found, all possible attributes in the udev rules key format.
A rule to match, can be composed by the attributes of the device
and the attributes from one single parent device.

  looking at device '/devices/virtual/input/input17':
    KERNEL=="input17"
    SUBSYSTEM=="input"
    DRIVER==""
    ATTR{inhibited}=="0"
    ATTR{name}=="BeatsStudio Wireless"
    ATTR{phys}=="00:00:00:6e:d0:74"
    ATTR{properties}=="0"
    ATTR{uniq}=="00:00:00:cc:1c:f3"

(I zeroed out part of the addresses above. The phys attribute
corresponds to the address of the Bluetooth controller on the Chromebook
and the uniq is the address of the headphones)


 drivers/input/misc/uinput.c | 21 ++++++++++++++++++++-
 include/uapi/linux/uinput.h |  1 +
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/input/misc/uinput.c b/drivers/input/misc/uinput.c
index 84051f20b18a..68319bda41b8 100644
--- a/drivers/input/misc/uinput.c
+++ b/drivers/input/misc/uinput.c
@@ -280,7 +280,7 @@ static int uinput_dev_flush(struct input_dev *dev, struct file *file)
 
 static void uinput_destroy_device(struct uinput_device *udev)
 {
-	const char *name, *phys;
+	const char *name, *phys, *uniq;
 	struct input_dev *dev = udev->dev;
 	enum uinput_state old_state = udev->state;
 
@@ -289,6 +289,7 @@ static void uinput_destroy_device(struct uinput_device *udev)
 	if (dev) {
 		name = dev->name;
 		phys = dev->phys;
+		uniq = dev->uniq;
 		if (old_state == UIST_CREATED) {
 			uinput_flush_requests(udev);
 			input_unregister_device(dev);
@@ -297,6 +298,7 @@ static void uinput_destroy_device(struct uinput_device *udev)
 		}
 		kfree(name);
 		kfree(phys);
+		kfree(uniq);
 		udev->dev = NULL;
 	}
 }
@@ -840,6 +842,7 @@ static long uinput_ioctl_handler(struct file *file, unsigned int cmd,
 	struct uinput_ff_erase  ff_erase;
 	struct uinput_request   *req;
 	char			*phys;
+	char			*uniq;
 	const char		*name;
 	unsigned int		size;
 
@@ -931,6 +934,22 @@ static long uinput_ioctl_handler(struct file *file, unsigned int cmd,
 		udev->dev->phys = phys;
 		goto out;
 
+	case UI_SET_UNIQ:
+		if (udev->state == UIST_CREATED) {
+			retval = -EINVAL;
+			goto out;
+		}
+
+		uniq = strndup_user(p, 1024);
+		if (IS_ERR(uniq)) {
+			retval = PTR_ERR(uniq);
+			goto out;
+		}
+
+		kfree(udev->dev->uniq);
+		udev->dev->uniq = uniq;
+		goto out;
+
 	case UI_BEGIN_FF_UPLOAD:
 		retval = uinput_ff_upload_from_user(p, &ff_up);
 		if (retval)
diff --git a/include/uapi/linux/uinput.h b/include/uapi/linux/uinput.h
index c9e677e3af1d..d5b7767c1b02 100644
--- a/include/uapi/linux/uinput.h
+++ b/include/uapi/linux/uinput.h
@@ -145,6 +145,7 @@ struct uinput_abs_setup {
 #define UI_SET_PHYS		_IOW(UINPUT_IOCTL_BASE, 108, char*)
 #define UI_SET_SWBIT		_IOW(UINPUT_IOCTL_BASE, 109, int)
 #define UI_SET_PROPBIT		_IOW(UINPUT_IOCTL_BASE, 110, int)
+#define UI_SET_UNIQ		_IOW(UINPUT_IOCTL_BASE, 111, char*)
 
 #define UI_BEGIN_FF_UPLOAD	_IOWR(UINPUT_IOCTL_BASE, 200, struct uinput_ff_upload)
 #define UI_END_FF_UPLOAD	_IOW(UINPUT_IOCTL_BASE, 201, struct uinput_ff_upload)
-- 
2.24.0.432.g9d3f5f5b63-goog

