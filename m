Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CA2234E660
	for <lists+linux-input@lfdr.de>; Tue, 30 Mar 2021 13:34:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231887AbhC3Ldt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Mar 2021 07:33:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231863AbhC3Ldk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Mar 2021 07:33:40 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A7AFC061574
        for <linux-input@vger.kernel.org>; Tue, 30 Mar 2021 04:33:40 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id c17so11957303pfn.6
        for <linux-input@vger.kernel.org>; Tue, 30 Mar 2021 04:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fWEWnDB7IS15Aoqul4RZDergwEtbUe4NAH8lKjv7p/s=;
        b=t2VcQcgjlrxPCJleDx3ZzoDOZ+UbaLvOBwoQ1w/EBgqJFigxgIn9DXbKekJ3Iepsxq
         ENtT73YGcLNdJaLEPFSSyi3PU6zZEexZ85lbxqulQRMFtLH5mzxY5DuN2Rs42RqP6w6I
         inReeA26WMzi7CA6s2kKoGRVgUMSCImUbcGPJ2FVBn0PdcoqL1kTF82fRk7K1FRpM4u3
         ZdoaWTINuz1yliQ9rnvqfQqPN+BtnRskWwovV7IQ8qFplZFPvXJIhGTYUmZdMDPxUwOR
         lZAP+0y1MXJVlnSCnD1PqVCsku00bizvG8nEdt52bXHpKewXuyHVZRwuLTpLbBOpTgg/
         gUsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fWEWnDB7IS15Aoqul4RZDergwEtbUe4NAH8lKjv7p/s=;
        b=SOIfAg4lqi9g8w0ADEHJzk2+tOkKWcgVjy+MuxV4SXcCC8vsmwY7Ww43djJ6qn1Ti4
         F1AOWXshq/rXgl0DcmXf+qRQCRKbmwlEjEr3XDGTZbA4gxFJ0jqSO/bh3vbefyOA+/PI
         U3sTerRnGERuEFY4/nCiCECZ25uuj+5a8ZlIlM0+wHXV2HVRFXSshlyOw6AGvEAjhFZ1
         gqlf002jdZuElwDQrJzx/UA67WbedaHweRfiWZaUCYZprm1pMC4mOhpPwWwQXoqgRpcM
         Rgilr1U2pkUsaCB8r78D9Bxhti8ly2xUFZN1I2s9KP8jCYuVUmTD3gWdNfwJJ74I/fYQ
         WWRA==
X-Gm-Message-State: AOAM531lU47AgnI5arr7iXoy6QiFMKyxZnZpk+Vcn3EXckyosduJqrvQ
        OoKOKyco/UlPVGagD1c4PF86ufE7rlm+20bN
X-Google-Smtp-Source: ABdhPJzzqFTQiSNyIzjCF+37Lrau50sIYt0Vh4iJ9UYp63YiGocxfnKT2CfwL2XJO1tN2xB584Nd3g==
X-Received: by 2002:a62:d45a:0:b029:218:669c:4f37 with SMTP id u26-20020a62d45a0000b0290218669c4f37mr29824358pfl.48.1617104019756;
        Tue, 30 Mar 2021 04:33:39 -0700 (PDT)
Received: from johnchen902-arch-ryzen.. (2001-b011-3815-5a81-9afa-9bff-fe6e-3ce2.dynamic-ip6.hinet.net. [2001:b011:3815:5a81:9afa:9bff:fe6e:3ce2])
        by smtp.gmail.com with ESMTPSA id y4sm19650868pfn.67.2021.03.30.04.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 04:33:39 -0700 (PDT)
From:   John Chen <johnchen902@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Rohit Pidaparthi <rohitpid@gmail.com>,
        RicardoEPRodrigues <ricardo.e.p.rodrigues@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        John Chen <johnchen902@gmail.com>
Subject: [PATCH v2 3/4] HID: magicmouse: fix reconnection of Magic Mouse 2
Date:   Tue, 30 Mar 2021 19:33:18 +0800
Message-Id: <20210330113319.14010-4-johnchen902@gmail.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210330113319.14010-1-johnchen902@gmail.com>
References: <20210330113319.14010-1-johnchen902@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

It is observed that the Magic Mouse 2 would not enter multi-touch mode
unless the mouse is connected before loading the module. It seems to be
a quirk specific to Magic Mouse 2

Retrying after 500ms fixes the problem for me. The delay can't be
reduced much further --- 300ms didn't work for me. Retrying immediately
after receiving an event didn't work either.

Signed-off-by: John Chen <johnchen902@gmail.com>
---
 drivers/hid/hid-magicmouse.c | 93 ++++++++++++++++++++++++------------
 1 file changed, 63 insertions(+), 30 deletions(-)

diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
index c646b4cd3783..69aefef9fe07 100644
--- a/drivers/hid/hid-magicmouse.c
+++ b/drivers/hid/hid-magicmouse.c
@@ -16,6 +16,7 @@
 #include <linux/input/mt.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <linux/workqueue.h>
 
 #include "hid-ids.h"
 
@@ -128,6 +129,9 @@ struct magicmouse_sc {
 		u8 size;
 	} touches[16];
 	int tracking_ids[16];
+
+	struct hid_device *hdev;
+	struct delayed_work work;
 };
 
 static int magicmouse_firm_touch(struct magicmouse_sc *msc)
@@ -629,9 +633,7 @@ static int magicmouse_input_configured(struct hid_device *hdev,
 	return 0;
 }
 
-
-static int magicmouse_probe(struct hid_device *hdev,
-	const struct hid_device_id *id)
+static int magicmouse_enable_multitouch(struct hid_device *hdev)
 {
 	const u8 *feature;
 	const u8 feature_mt[] = { 0xD7, 0x01 };
@@ -639,10 +641,52 @@ static int magicmouse_probe(struct hid_device *hdev,
 	const u8 feature_mt_trackpad2_usb[] = { 0x02, 0x01 };
 	const u8 feature_mt_trackpad2_bt[] = { 0xF1, 0x02, 0x01 };
 	u8 *buf;
+	int ret;
+	int feature_size;
+
+	if (hdev->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2) {
+		if (hdev->vendor == BT_VENDOR_ID_APPLE) {
+			feature_size = sizeof(feature_mt_trackpad2_bt);
+			feature = feature_mt_trackpad2_bt;
+		} else { /* USB_VENDOR_ID_APPLE */
+			feature_size = sizeof(feature_mt_trackpad2_usb);
+			feature = feature_mt_trackpad2_usb;
+		}
+	} else if (hdev->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2) {
+		feature_size = sizeof(feature_mt_mouse2);
+		feature = feature_mt_mouse2;
+	} else {
+		feature_size = sizeof(feature_mt);
+		feature = feature_mt;
+	}
+
+	buf = kmemdup(feature, feature_size, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = hid_hw_raw_request(hdev, buf[0], buf, feature_size,
+				HID_FEATURE_REPORT, HID_REQ_SET_REPORT);
+	kfree(buf);
+	return ret;
+}
+
+static void magicmouse_enable_mt_work(struct work_struct *work)
+{
+	struct magicmouse_sc *msc =
+		container_of(work, struct magicmouse_sc, work.work);
+	int ret;
+
+	ret = magicmouse_enable_multitouch(msc->hdev);
+	if (ret < 0)
+		hid_err(msc->hdev, "unable to request touch data (%d)\n", ret);
+}
+
+static int magicmouse_probe(struct hid_device *hdev,
+	const struct hid_device_id *id)
+{
 	struct magicmouse_sc *msc;
 	struct hid_report *report;
 	int ret;
-	int feature_size;
 
 	if (id->vendor == USB_VENDOR_ID_APPLE &&
 	    id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 &&
@@ -656,6 +700,8 @@ static int magicmouse_probe(struct hid_device *hdev,
 	}
 
 	msc->scroll_accel = SCROLL_ACCEL_DEFAULT;
+	msc->hdev = hdev;
+	INIT_DEFERRABLE_WORK(&msc->work, magicmouse_enable_mt_work);
 
 	msc->quirks = id->driver_data;
 	hid_set_drvdata(hdev, msc);
@@ -705,28 +751,6 @@ static int magicmouse_probe(struct hid_device *hdev,
 	}
 	report->size = 6;
 
-	if (id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2) {
-		if (id->vendor == BT_VENDOR_ID_APPLE) {
-			feature_size = sizeof(feature_mt_trackpad2_bt);
-			feature = feature_mt_trackpad2_bt;
-		} else { /* USB_VENDOR_ID_APPLE */
-			feature_size = sizeof(feature_mt_trackpad2_usb);
-			feature = feature_mt_trackpad2_usb;
-		}
-	} else if (id->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2) {
-		feature_size = sizeof(feature_mt_mouse2);
-		feature = feature_mt_mouse2;
-	} else {
-		feature_size = sizeof(feature_mt);
-		feature = feature_mt;
-	}
-
-	buf = kmemdup(feature, feature_size, GFP_KERNEL);
-	if (!buf) {
-		ret = -ENOMEM;
-		goto err_stop_hw;
-	}
-
 	/*
 	 * Some devices repond with 'invalid report id' when feature
 	 * report switching it into multitouch mode is sent to it.
@@ -735,13 +759,14 @@ static int magicmouse_probe(struct hid_device *hdev,
 	 * but there seems to be no other way of switching the mode.
 	 * Thus the super-ugly hacky success check below.
 	 */
-	ret = hid_hw_raw_request(hdev, buf[0], buf, feature_size,
-				HID_FEATURE_REPORT, HID_REQ_SET_REPORT);
-	kfree(buf);
-	if (ret != -EIO && ret != feature_size) {
+	ret = magicmouse_enable_multitouch(hdev);
+	if (ret != -EIO && ret < 0) {
 		hid_err(hdev, "unable to request touch data (%d)\n", ret);
 		goto err_stop_hw;
 	}
+	if (ret == -EIO && id->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2) {
+		schedule_delayed_work(&msc->work, msecs_to_jiffies(500));
+	}
 
 	return 0;
 err_stop_hw:
@@ -749,6 +774,13 @@ static int magicmouse_probe(struct hid_device *hdev,
 	return ret;
 }
 
+static void magicmouse_remove(struct hid_device *hdev)
+{
+	struct magicmouse_sc *msc = hid_get_drvdata(hdev);
+	cancel_delayed_work_sync(&msc->work);
+	hid_hw_stop(hdev);
+}
+
 static const struct hid_device_id magic_mice[] = {
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE,
 		USB_DEVICE_ID_APPLE_MAGICMOUSE), .driver_data = 0 },
@@ -768,6 +800,7 @@ static struct hid_driver magicmouse_driver = {
 	.name = "magicmouse",
 	.id_table = magic_mice,
 	.probe = magicmouse_probe,
+	.remove = magicmouse_remove,
 	.raw_event = magicmouse_raw_event,
 	.event = magicmouse_event,
 	.input_mapping = magicmouse_input_mapping,
-- 
2.31.0

