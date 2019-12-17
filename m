Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E86D123A33
	for <lists+linux-input@lfdr.de>; Tue, 17 Dec 2019 23:50:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbfLQWuZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Dec 2019 17:50:25 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43600 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbfLQWuZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Dec 2019 17:50:25 -0500
Received: by mail-pg1-f195.google.com with SMTP id k197so100466pga.10;
        Tue, 17 Dec 2019 14:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=+TnDTXs1lzMnWtLAgPPWwOLrYNuxW1IXk2XEJQz09/I=;
        b=IdskijD4Nb9zhzhBU3KpYteX9WG0D9CusGT2Ty8kKstGFm2AsDJz/q4DwEQP0c0U3x
         vCck7W6tWtBbunVuaBNRj4j/qJFkx9NzqzoRT2ZYuUUohn+lTworcjz8L4iLRub4gEKh
         2eCrj7UK1/9ghd2i1fQFvWh30chBYW8y7nFgXhR1ToXKebMCPX7adJPlKpKKhYnlYHuT
         hdu54MoOMCw5QReT9OV6H3chwywjRhvsCb0/1Xcq32V6yZ8Ex0cjTqOEHSgtJc11Oq2R
         4VFzii5a9HfMMxbLqKLHBGgtGhGPVXZDzlxVLJ56aotrwkqZMEXdW4qio7lbLZTmP5qh
         hoIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=+TnDTXs1lzMnWtLAgPPWwOLrYNuxW1IXk2XEJQz09/I=;
        b=ItcSGQ8N5XlOnc/oe6CPBBEIjJLT/Cuq04tgXkchUjldBSnnIsR6UTG4+tOxPqhscr
         E/u2xIRXoaDjxVxFHE3D4H2sNQR4N2aO2QhvWWNsEueVPNlAmGywgRPydwiM+0tOArAa
         lnSDVbVi2NuJZlrbAghl50ST98QeE4wYpNw250NrT1Opsn+sCeXY/CDFeQJoDn5hFoGq
         ctdfXYpV1dhlqNb38CJnLFwqkZThYRLYuj2JNDJSc5L+Vor9loHXSaSo5A39I0rXeATI
         3T87ZXN+LggZ70A+Lowostl1jyvFGC4nFfs8qcb0Fylr62kuey5cYr3qB9y/JREusSzZ
         A94A==
X-Gm-Message-State: APjAAAXcPnyXFLdlrnGv09DOIqBgE03TQhKnlVVATeCqTifeTkVOvu/U
        jQCPFECMQmkYereKz1nfYY8=
X-Google-Smtp-Source: APXvYqyIuuevXTJ1358EAR4bTnYcaknv0s9VjaFiC+JwpkXY+9D6bOQOlyHOcGwhDtqtJF1huJyrEg==
X-Received: by 2002:a62:33c6:: with SMTP id z189mr85248pfz.246.1576623024108;
        Tue, 17 Dec 2019 14:50:24 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id w11sm20740pgs.60.2019.12.17.14.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 14:50:23 -0800 (PST)
Date:   Tue, 17 Dec 2019 14:50:21 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] HID: hiddev: fix mess in hiddev_open()
Message-ID: <20191217225021.GA34258@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The open method of hiddev handler fails to bring the device out of
autosuspend state as was promised in 0361a28d3f9a, as it actually has 2
blocks that try to start the transport (call hid_hw_open()) with both
being guarded by the "open" counter, so the 2nd block is never executed as
the first block increments the counter so it is never at 0 when we check
it for the second block.

Additionally hiddev_open() was leaving counter incremented on errors,
causing the device to never be reopened properly if there was ever an
error.

Let's fix all of this by factoring out code that creates client structure
and powers up the device into a separate function that is being called
from usbhid_open() with the "existancelock" being held.

Fixes: 0361a28d3f9a ("HID: autosuspend support for USB HID")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/usbhid/hiddev.c | 97 ++++++++++++++++---------------------
 1 file changed, 42 insertions(+), 55 deletions(-)

diff --git a/drivers/hid/usbhid/hiddev.c b/drivers/hid/usbhid/hiddev.c
index 1f9bc4483465..c879b214a479 100644
--- a/drivers/hid/usbhid/hiddev.c
+++ b/drivers/hid/usbhid/hiddev.c
@@ -241,12 +241,51 @@ static int hiddev_release(struct inode * inode, struct file * file)
 	return 0;
 }
 
+static int __hiddev_open(struct hiddev *hiddev, struct file *file)
+{
+	struct hiddev_list *list;
+	int error;
+
+	lockdep_assert_held(&hiddev->existancelock);
+
+	list = vzalloc(sizeof(*list));
+	if (!list)
+		return -ENOMEM;
+
+	mutex_init(&list->thread_lock);
+	list->hiddev = hiddev;
+
+	if (!hiddev->open++) {
+		error = hid_hw_power(hiddev->hid, PM_HINT_FULLON);
+		if (error < 0)
+			goto err_drop_count;
+
+		error = hid_hw_open(hiddev->hid);
+		if (error < 0)
+			goto err_normal_power;
+	}
+
+	spin_lock_irq(&hiddev->list_lock);
+	list_add_tail(&list->node, &hiddev->list);
+	spin_unlock_irq(&hiddev->list_lock);
+
+	file->private_data = list;
+
+	return 0;
+
+err_normal_power:
+	hid_hw_power(hiddev->hid, PM_HINT_NORMAL);
+err_drop_count:
+	hiddev->open--;
+	vfree(list);
+	return error;
+}
+
 /*
  * open file op
  */
 static int hiddev_open(struct inode *inode, struct file *file)
 {
-	struct hiddev_list *list;
 	struct usb_interface *intf;
 	struct hid_device *hid;
 	struct hiddev *hiddev;
@@ -255,66 +294,14 @@ static int hiddev_open(struct inode *inode, struct file *file)
 	intf = usbhid_find_interface(iminor(inode));
 	if (!intf)
 		return -ENODEV;
+
 	hid = usb_get_intfdata(intf);
 	hiddev = hid->hiddev;
 
-	if (!(list = vzalloc(sizeof(struct hiddev_list))))
-		return -ENOMEM;
-	mutex_init(&list->thread_lock);
-	list->hiddev = hiddev;
-	file->private_data = list;
-
-	/*
-	 * no need for locking because the USB major number
-	 * is shared which usbcore guards against disconnect
-	 */
-	if (list->hiddev->exist) {
-		if (!list->hiddev->open++) {
-			res = hid_hw_open(hiddev->hid);
-			if (res < 0)
-				goto bail;
-		}
-	} else {
-		res = -ENODEV;
-		goto bail;
-	}
-
-	spin_lock_irq(&list->hiddev->list_lock);
-	list_add_tail(&list->node, &hiddev->list);
-	spin_unlock_irq(&list->hiddev->list_lock);
-
 	mutex_lock(&hiddev->existancelock);
-	/*
-	 * recheck exist with existance lock held to
-	 * avoid opening a disconnected device
-	 */
-	if (!list->hiddev->exist) {
-		res = -ENODEV;
-		goto bail_unlock;
-	}
-	if (!list->hiddev->open++)
-		if (list->hiddev->exist) {
-			struct hid_device *hid = hiddev->hid;
-			res = hid_hw_power(hid, PM_HINT_FULLON);
-			if (res < 0)
-				goto bail_unlock;
-			res = hid_hw_open(hid);
-			if (res < 0)
-				goto bail_normal_power;
-		}
-	mutex_unlock(&hiddev->existancelock);
-	return 0;
-bail_normal_power:
-	hid_hw_power(hid, PM_HINT_NORMAL);
-bail_unlock:
+	res = hiddev->exist ? __hiddev_open(hiddev, file) : -ENODEV;
 	mutex_unlock(&hiddev->existancelock);
 
-	spin_lock_irq(&list->hiddev->list_lock);
-	list_del(&list->node);
-	spin_unlock_irq(&list->hiddev->list_lock);
-bail:
-	file->private_data = NULL;
-	vfree(list);
 	return res;
 }
 
-- 
2.24.1.735.g03f4e72817-goog


-- 
Dmitry
