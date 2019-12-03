Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00CC610F45B
	for <lists+linux-input@lfdr.de>; Tue,  3 Dec 2019 02:05:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbfLCBFi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Dec 2019 20:05:38 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:36733 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726318AbfLCBFi (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Dec 2019 20:05:38 -0500
Received: by mail-pg1-f194.google.com with SMTP id k13so738549pgh.3
        for <linux-input@vger.kernel.org>; Mon, 02 Dec 2019 17:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vQLxprmCC8JfA2uG9NjGBGy94LqJAU7ib6W5ozoiA9A=;
        b=M9xaurVUD+kIv5wybWVAkUF/iTFeS8zB7Mo6bQy8aUTUSBVZkMwjkUBYeZQcfJXaRb
         iK0kB/15uQ1OvsRmDOenchn7uq6V0nmG4a0XNj1zFyFG+rzxRKR6eJ268iqo1vc9xWO2
         IInHkTL/m32zgYTjt9pv5LHRDTIpSd9gT24aI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vQLxprmCC8JfA2uG9NjGBGy94LqJAU7ib6W5ozoiA9A=;
        b=Xb6TO2Ij2cUpGehnc6jkyJyLoA6Mnz04kIajbZq4WvL5at/1PNR+9w6kqYzZzUtNwu
         Kr6UHnvwN+6+dpSzXMIAX8vzhlaTEsF2AiekGEUvtx57kttSxty1y0a17ksapIVJzqDs
         Bn9Y05OdqBNpiZcRkn0MQzYfenjzGMr+aoIk1mEXfXxnnPs/G5GG0wKhT9Mpnc3k997z
         SafimZy6b/yBb6AWk9ZXmwWAoF/6twl6eEDuJQCjn2uwYYzywAjCEJq2aCrNFxPDHtDb
         RP1rClGOlg+Q+i/MrOxcIFMFZuSbLob6+z8dw5K3RMf0nFqR21TAteWRdafdfxNbWip8
         Xdow==
X-Gm-Message-State: APjAAAX9VTuJ45aDdVf5TVefN9vXxYZTRmLMuMxFiYJbzwvL+py6bUue
        wPEausLlyHEn6cwq0z7Jok68ET20nVA=
X-Google-Smtp-Source: APXvYqxNia/3JTgxap9fHMWDpLMTr4uqu4JKDoTN7qXRJoyVQLz+gHJrRQZHA/ABNQKvLJYuEI2RJw==
X-Received: by 2002:a62:e411:: with SMTP id r17mr1771126pfh.119.1575335136928;
        Mon, 02 Dec 2019 17:05:36 -0800 (PST)
Received: from apsdesk.mtv.corp.google.com ([2620:15c:202:1:e09a:8d06:a338:aafb])
        by smtp.gmail.com with ESMTPSA id r7sm759116pfg.34.2019.12.02.17.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 17:05:35 -0800 (PST)
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To:     linux-input@vger.kernel.org
Cc:     =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>,
        linux-bluetooth@vger.kernel.org,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Logan Gunthorpe <logang@deltatee.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Kirill Smelkov <kirr@nexedi.com>
Subject: [PATCH v2] Input: uinput - Add UI_SET_UNIQ ioctl handler
Date:   Mon,  2 Dec 2019 17:05:21 -0800
Message-Id: <20191203010521.220577-1-abhishekpandit@chromium.org>
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
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


Changes in v2:
- Added compat handling for UI_SET_UNIQ

 drivers/input/misc/uinput.c | 26 +++++++++++++++++++++++++-
 include/uapi/linux/uinput.h |  1 +
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/input/misc/uinput.c b/drivers/input/misc/uinput.c
index 84051f20b18a..a7cbf5726a36 100644
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
@@ -1044,6 +1063,8 @@ static long uinput_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
  */
 #define UI_SET_PHYS_COMPAT		\
 	_IOW(UINPUT_IOCTL_BASE, 108, compat_uptr_t)
+#define UI_SET_UNIQ_COMPAT		\
+	_IOW(UINPUT_IOCTL_BASE, 111, compat_uptr_t)
 #define UI_BEGIN_FF_UPLOAD_COMPAT	\
 	_IOWR(UINPUT_IOCTL_BASE, 200, struct uinput_ff_upload_compat)
 #define UI_END_FF_UPLOAD_COMPAT		\
@@ -1056,6 +1077,9 @@ static long uinput_compat_ioctl(struct file *file,
 	case UI_SET_PHYS_COMPAT:
 		cmd = UI_SET_PHYS;
 		break;
+	case UI_SET_UNIQ_COMPAT:
+		cmd = UI_SET_UNIQ;
+		break;
 	case UI_BEGIN_FF_UPLOAD_COMPAT:
 		cmd = UI_BEGIN_FF_UPLOAD;
 		break;
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
2.24.0.393.g34dc348eaf-goog

