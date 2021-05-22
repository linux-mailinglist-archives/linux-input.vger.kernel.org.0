Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EFFA38D6CA
	for <lists+linux-input@lfdr.de>; Sat, 22 May 2021 20:06:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231370AbhEVSHt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 22 May 2021 14:07:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231342AbhEVSHp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 22 May 2021 14:07:45 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C37A6C06174A;
        Sat, 22 May 2021 11:06:18 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id u5-20020a7bc0450000b02901480e40338bso8192904wmc.1;
        Sat, 22 May 2021 11:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tvQkJA45dcnDhgUgMx0vMPfrn39cI+zkH5R9jIgqU68=;
        b=PsQ+cdJzZiglWQZ9C5mjX1BI5wFjif4GcbAGBC9hpjefTRbC6E8eYWsHIxWXX9JdYJ
         qoBLltW3bDowuM+Uc9iKcYgsZNeWq8SZiLo58Jp6ZCy4pLi1WBCdhTqtaKGpPNDAclZt
         sURjbCRUqQC5EZ2dhpItSMU2vBJc/f71HPe0EMB8qURat42D2jBbQcM70IhFpZAE8ymt
         bFsB6XlaUwx0FvaB3JX2tSJE666UWlUEhkmYXQCfj4RVi3SJVHZNJ7dgVzWFEnqEgdSu
         5v8XXrJkvTvu2EZVih64nOGzX82YbmUgFu7rZR/pkjY/dHaUbDnUIP2vwOzIcRuk4SRy
         mImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tvQkJA45dcnDhgUgMx0vMPfrn39cI+zkH5R9jIgqU68=;
        b=g9qzAyVHfUnFG4VstmF0loXOtVm1rkvVKYSe9s1IdXRV4fY0MYGpJlp+kbS/z1radu
         me3xWskr+sO7Ef3el95mIo1KTWCKYtBVXox9BZyVwF7adPRseNuweSpTOuad8tFQL+h6
         jXPxTfzXKI+04XheBf2e5Mgva9VN/PHR8pkP9ROceSAFlkADHRi4W9LpSveHoD2DBZOs
         q3nh2HC7DEshP6VCa5A8PZWDCes6vqGNNVsz3JoZSWAct55/ob+4euR1kbvDZkhkPZ97
         nF7KxvaguhDSii11XOXquAal4x619mZpzfYzO92+ueoJAA6EQmdvn1wF8Mj08aFXHAZ9
         Q0jQ==
X-Gm-Message-State: AOAM533fB6aKaaiUYhtqmVsvgTY5BqhM+gMf2IMR7mo1jVfroIgdKTxl
        b1U1/fxsHKXuZYXSi8kdvN8=
X-Google-Smtp-Source: ABdhPJyg9eEetn5/JE63jwsuleitlk0zssXyJ1gSTKVV37ZYnLabg3vncKl6jxji7BBlVaB+6R94GQ==
X-Received: by 2002:a05:600c:2909:: with SMTP id i9mr13674853wmd.116.1621706777371;
        Sat, 22 May 2021 11:06:17 -0700 (PDT)
Received: from localhost.localdomain ([94.73.38.147])
        by smtp.gmail.com with ESMTPSA id v12sm5913217wrv.76.2021.05.22.11.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 May 2021 11:06:17 -0700 (PDT)
From:   =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To:     jikos@kernel.org
Cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 3/5] HID: magicmouse: Magic Trackpad 2 USB battery capacity
Date:   Sat, 22 May 2021 20:06:09 +0200
Message-Id: <20210522180611.314300-3-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210522180611.314300-1-jose.exposito89@gmail.com>
References: <20210522180611.314300-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Report the battery capacity percentage for the Apple Magic Trackpad 2
when it is connected over USB.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/hid/Kconfig          |   2 +-
 drivers/hid/hid-magicmouse.c | 136 +++++++++++++++++++++++++++++++++++
 2 files changed, 137 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 4bf263c2d61a..f4856e5f5aa4 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -640,7 +640,7 @@ config LOGIWHEELS_FF
 
 config HID_MAGICMOUSE
 	tristate "Apple Magic Mouse/Trackpad multi-touch support"
-	depends on HID
+	depends on USB_HID
 	help
 	Support for the Apple Magic Mouse/Trackpad multi-touch.
 
diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
index d4a58dd6d2b8..ea8a85767c39 100644
--- a/drivers/hid/hid-magicmouse.c
+++ b/drivers/hid/hid-magicmouse.c
@@ -16,6 +16,7 @@
 #include <linux/input/mt.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <linux/usb.h>
 #include <linux/workqueue.h>
 
 #include "hid-ids.h"
@@ -58,6 +59,7 @@ MODULE_PARM_DESC(report_undeciphered, "Report undeciphered multi-touch state fie
 #define MOUSE2_REPORT_ID   0x12
 #define DOUBLE_REPORT_ID   0xf7
 #define BT_BATTERY_REPORT_ID 0x90
+#define USB_BATTERY_EP_ADDR  0x81
 
 /* These definitions are not precise, but they're close enough.  (Bits
  * 0x03 seem to indicate the aspect ratio of the touch, bits 0x70 seem
@@ -142,6 +144,10 @@ struct magicmouse_sc {
 		struct power_supply *ps;
 		struct power_supply_desc ps_desc;
 		int capacity;
+		struct urb *urb;
+		u8 *urb_buf;
+		int urb_buf_size;
+		dma_addr_t urb_buf_dma;
 	} battery;
 };
 
@@ -231,6 +237,112 @@ static int magicmouse_battery_get_property(struct power_supply *psy,
 	return ret;
 }
 
+static void magicmouse_battery_usb_urb_complete(struct urb *urb)
+{
+	struct magicmouse_sc *msc = urb->context;
+	int ret;
+
+	switch (urb->status) {
+	case 0:
+		msc->battery.capacity = msc->battery.urb_buf[2];
+		break;
+	case -EOVERFLOW:
+		hid_err(msc->hdev, "URB overflow\n");
+		fallthrough;
+	case -ECONNRESET:
+	case -ENOENT:
+	case -ESHUTDOWN:
+		return;
+	default:
+		break;
+	}
+
+	ret = usb_submit_urb(msc->battery.urb, GFP_ATOMIC);
+	if (ret)
+		hid_err(msc->hdev, "unable to submit URB, %d\n", ret);
+}
+
+static int magicmouse_battery_usb_probe(struct magicmouse_sc *msc)
+{
+	struct usb_interface *iface = to_usb_interface(msc->hdev->dev.parent);
+	struct usb_device *usbdev = interface_to_usbdev(iface);
+	struct usb_host_endpoint *endpoint = NULL;
+	u8 ep_address;
+	unsigned int pipe = 0;
+	int i, ret;
+
+	if (!magicmouse_can_report_battery_vendor(msc, USB_VENDOR_ID_APPLE))
+		return -EINVAL;
+
+	for (i = 0; i < sizeof(usbdev->ep_in); i++) {
+		endpoint = usbdev->ep_in[i];
+		if (endpoint) {
+			ep_address = endpoint->desc.bEndpointAddress;
+			if (ep_address == USB_BATTERY_EP_ADDR)
+				break;
+		}
+	}
+
+	if (!endpoint) {
+		hid_err(msc->hdev, "endpoint with address %d not found\n",
+			USB_BATTERY_EP_ADDR);
+		ret = -EIO;
+		goto exit;
+	}
+
+	msc->battery.urb = usb_alloc_urb(0, GFP_ATOMIC);
+	if (!msc->battery.urb) {
+		hid_err(msc->hdev, "unable to alloc URB, ENOMEM\n");
+		ret = -ENOMEM;
+		goto exit;
+	}
+
+	pipe = usb_rcvintpipe(usbdev, endpoint->desc.bEndpointAddress);
+	if (pipe == 0) {
+		hid_err(msc->hdev, "unable to create USB rcvintpipe\n");
+		ret = -EIO;
+		goto err_free_urb;
+	}
+
+	msc->battery.urb_buf_size = endpoint->desc.wMaxPacketSize;
+	msc->battery.urb_buf_dma = msc->battery.urb->transfer_dma;
+	msc->battery.urb_buf = usb_alloc_coherent(usbdev,
+			       msc->battery.urb_buf_size, GFP_ATOMIC,
+			       &msc->battery.urb_buf_dma);
+	if (!msc->battery.urb_buf) {
+		hid_err(msc->hdev, "unable to alloc URB buffer, ENOMEM\n");
+		ret = -ENOMEM;
+		goto err_free_urb;
+	}
+
+	usb_fill_int_urb(msc->battery.urb, usbdev, pipe, msc->battery.urb_buf,
+			 msc->battery.urb_buf_size,
+			 magicmouse_battery_usb_urb_complete, msc,
+			 endpoint->desc.bInterval);
+
+	ret = usb_submit_urb(msc->battery.urb, GFP_ATOMIC);
+	if (ret) {
+		hid_err(msc->hdev, "unable to submit URB, %d\n", ret);
+		goto err_free_urb_buf;
+	}
+
+	return 0;
+
+err_free_urb_buf:
+	usb_free_coherent(usbdev, msc->battery.urb_buf_size,
+			  msc->battery.urb_buf, msc->battery.urb_buf_dma);
+
+err_free_urb:
+	usb_free_urb(msc->battery.urb);
+
+exit:
+	msc->battery.urb = NULL;
+	msc->battery.urb_buf = NULL;
+	msc->battery.urb_buf_size = 0;
+
+	return ret;
+}
+
 static int magicmouse_battery_probe(struct hid_device *hdev)
 {
 	struct magicmouse_sc *msc = hid_get_drvdata(hdev);
@@ -269,6 +381,12 @@ static int magicmouse_battery_probe(struct hid_device *hdev)
 		return ret;
 	}
 
+	if (msc->input->id.vendor == USB_VENDOR_ID_APPLE) {
+		ret = magicmouse_battery_usb_probe(msc);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
@@ -923,7 +1041,25 @@ static int magicmouse_probe(struct hid_device *hdev,
 static void magicmouse_remove(struct hid_device *hdev)
 {
 	struct magicmouse_sc *msc = hid_get_drvdata(hdev);
+	struct usb_interface *iface;
+	struct usb_device *usbdev;
 	cancel_delayed_work_sync(&msc->work);
+
+	if (msc &&
+	    magicmouse_can_report_battery_vendor(msc, USB_VENDOR_ID_APPLE) &&
+	    msc->battery.urb && msc->battery.urb_buf) {
+		iface = to_usb_interface(hdev->dev.parent);
+		usbdev = interface_to_usbdev(iface);
+
+		usb_kill_urb(msc->battery.urb);
+
+		usb_free_coherent(usbdev, msc->battery.urb_buf_size,
+				  msc->battery.urb_buf,
+				  msc->battery.urb_buf_dma);
+
+		usb_free_urb(msc->battery.urb);
+	}
+
 	hid_hw_stop(hdev);
 }
 
-- 
2.25.1

