Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9087D37AE4B
	for <lists+linux-input@lfdr.de>; Tue, 11 May 2021 20:20:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232048AbhEKSVx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 May 2021 14:21:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231329AbhEKSVx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 May 2021 14:21:53 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50F51C06174A;
        Tue, 11 May 2021 11:20:46 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id e7so2550806wrc.11;
        Tue, 11 May 2021 11:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c3iaH3y/FZoaNpVFta2w69W8hOQ3/2OA7g9Y/AFoXo8=;
        b=lFKWrtI/Qq/pS2K02NGYIJDsqyB1Op2vp8CB+1iBEc+Bc5tL6Cxu4g96ztcSR3SSRN
         nsXCPrXI7ovYD8j6T+RZsxuPbtA7WJOd0ve+YiC3S5IFwPum903+ayyVL+TJzY7Qzf8B
         tWaam2y2aMX2Wv/EcK4t7u+aYC4vmYNn6nJLqNGCtkL5utiJ174BmPQKyj3vIuO46RRI
         p1P50dIG59nfPlrdi38qCsTkxtNHc/swv2Jk9jBiGkX1j6FfMT/7QDKFnYISLHP06U+m
         O0vsM4ejC6w/3zfwuZIHaHlbn8RTTvs2cBjzidfbTTw3YslaQR9osoKxE2eOgWvb1Tpy
         1EsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c3iaH3y/FZoaNpVFta2w69W8hOQ3/2OA7g9Y/AFoXo8=;
        b=kXzwUFnY1UR417zZHObY2c3bNYzu/r9jaObDFVbfiAVdsTEUN5sWHhmDykFK3UaKTg
         +3MhZBYVHm5vJOUGOuGOlf8ZTnsyjinu9hU76Yn3Rsj2vo0EIYAeHsj2qW1u3KgBjAHS
         XO8WQyjOoDPwvJ8+CdKgr2G/vwtAz4VtFYZnGrOZf3QaqrUgpDEk5tsAkq9zXdTCKt8l
         fotCbGp1LAcObBD592CAUl7p/CfUq1dYLYsYJoHxRF0/tSHL8hpxNhWpg4ya9yzAenc3
         QnDxNaqXW2i7ZZo8UmBDxsvVI9Bj+F/klGj+dgyX7QEPN8mWZUI0l/5L27lpuzm2r5xr
         BP7A==
X-Gm-Message-State: AOAM532ZlfJpuCLKSvqKVosdiNvLqnah59LA6YjjDlkD4BYBsk9zkPj6
        Q0XRpeIwQGvp+OdVyi3qgGk=
X-Google-Smtp-Source: ABdhPJwPFDK4Msv4z0+ZQwxLFA87V0cw+uujSfYn5M5PwJ0U1/1g9/ifAO9FbpUETNek+9OlCL6zGw==
X-Received: by 2002:a5d:40c9:: with SMTP id b9mr39344824wrq.59.1620757245088;
        Tue, 11 May 2021 11:20:45 -0700 (PDT)
Received: from localhost.localdomain ([94.73.38.147])
        by smtp.gmail.com with ESMTPSA id d15sm28012133wrw.71.2021.05.11.11.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 11:20:44 -0700 (PDT)
From:   =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To:     jikos@kernel.org
Cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 3/5] HID: magicmouse: Magic Trackpad 2 USB battery capacity
Date:   Tue, 11 May 2021 20:20:21 +0200
Message-Id: <20210511182023.730524-3-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210511182023.730524-1-jose.exposito89@gmail.com>
References: <20210511182023.730524-1-jose.exposito89@gmail.com>
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
 drivers/hid/hid-magicmouse.c | 136 +++++++++++++++++++++++++++++++++++
 1 file changed, 136 insertions(+)

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

