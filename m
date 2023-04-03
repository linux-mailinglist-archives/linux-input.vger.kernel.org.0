Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FE316D4217
	for <lists+linux-input@lfdr.de>; Mon,  3 Apr 2023 12:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232209AbjDCKdd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 3 Apr 2023 06:33:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231998AbjDCKdb (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 3 Apr 2023 06:33:31 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A847B2D51
        for <linux-input@vger.kernel.org>; Mon,  3 Apr 2023 03:33:28 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id w9so115356881edc.3
        for <linux-input@vger.kernel.org>; Mon, 03 Apr 2023 03:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1680518007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d6xqpZYXhV455piobVRy73dq/LZEbDPY6mjuuyg4UJs=;
        b=GjgLL2u8kxferRN00s52HE+jTS/gYDkkxlUyte7eR9feBqp/kT4nRVNYPMOeXlwOWD
         Y0SIxcwoa0g9YJIIXo/p5jRtGUDO669UV3afYZ8Ggm7iOpOTMTpdQUDLL4/+TCDcxFsu
         PNgUx4xnv+FlaAOK8aujdxTCxUClbQ2W/tAkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680518007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d6xqpZYXhV455piobVRy73dq/LZEbDPY6mjuuyg4UJs=;
        b=L24IkTLVSrfgh2a6RUCL5y4HbnEW7PR90w+X5Lc11bUQPOJtVfWSBmiipCr3bpZo+9
         /bHT5qmG0bTxcwgRrPhFOZompigs60TLK+taorCF46THXYFOORtmcOWmH82AIHltRtSY
         hXRFvB3HxzuF4fmiSrg+iUI3+HtHmoQmnA3ju+N1sWDNRTw2guuo6E+PQxuAkNli4Lmy
         0YG+IO39WNniS7oLCH3cryxx3JYieYsA1q6bysFLc9oe3gjVzHKHS7FTN6zxUAWukZri
         OLpI+00gvKPVQFxlzzvnUzbhIphtVAFA/+dO8ORsRCplMyWbLs/jjSAMo3xISyN6Jy2g
         Ja9A==
X-Gm-Message-State: AAQBX9d37j5aVWaeTrEXd/gUd9FRVSb5LQaI5fyBHchhBYaT/h0sIra7
        At5VsvktV3VhLRaJjOcbZYeiDg==
X-Google-Smtp-Source: AKy350YtZkIvqt0zsxEdZ+jopyH4QT6q/eCCSbkx9Q+/erHuZ34FvsgMSeuvZmCxgjw2rVj1R1LO1A==
X-Received: by 2002:a17:906:641:b0:8b1:77bf:3bdd with SMTP id t1-20020a170906064100b008b177bf3bddmr35678072ejb.36.1680518006899;
        Mon, 03 Apr 2023 03:33:26 -0700 (PDT)
Received: from balto.c.googlers.com.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id x43-20020a50baae000000b0050299cebf6esm2092862ede.54.2023.04.03.03.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 03:33:26 -0700 (PDT)
From:   Fabio Baltieri <fabiobaltieri@chromium.org>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Fabio Baltieri <fabiobaltieri@chromium.org>
Subject: [PATCH] HID: hid-stadiaff: add support for Stadia force feedback
Date:   Mon,  3 Apr 2023 10:33:24 +0000
Message-Id: <20230403103324.1746758-1-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add a hid-stadiaff module to support rumble based force feedback on the
Google Stadia controller. This works using the HID output endpoint
exposed on both the USB and BLE interface.

Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
---

Hi, this adds rumble support to the stadia controller using the input
interface. Up to now this has only been implemented at application level
using hidraw:

https://source.chromium.org/chromium/chromium/src/+/main:device/gamepad/hid_haptic_gamepad.cc

Tested with fftest, works both over USB and BLE.

 drivers/hid/Kconfig        |   7 ++
 drivers/hid/Makefile       |   1 +
 drivers/hid/hid-ids.h      |   1 +
 drivers/hid/hid-stadiaff.c | 132 +++++++++++++++++++++++++++++++++++++
 4 files changed, 141 insertions(+)
 create mode 100644 drivers/hid/hid-stadiaff.c

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 82f64fb31fda..934f73e9b800 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1031,6 +1031,13 @@ config HID_SPEEDLINK
 	help
 	Support for Speedlink Vicious and Divine Cezanne mouse.
 
+config HID_STADIA_FF
+	tristate "Google Stadia force feedback"
+	select INPUT_FF_MEMLESS
+	help
+	Say Y here if you want to enable force feedback support for the Google
+	Stadia controller.
+
 config HID_STEAM
 	tristate "Steam Controller/Deck support"
 	select POWER_SUPPLY
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index 5d37cacbde33..1d900fa55890 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -120,6 +120,7 @@ obj-$(CONFIG_HID_SIGMAMICRO)	+= hid-sigmamicro.o
 obj-$(CONFIG_HID_SMARTJOYPLUS)	+= hid-sjoy.o
 obj-$(CONFIG_HID_SONY)		+= hid-sony.o
 obj-$(CONFIG_HID_SPEEDLINK)	+= hid-speedlink.o
+obj-$(CONFIG_HID_STADIA_FF)	+= hid-stadiaff.o
 obj-$(CONFIG_HID_STEAM)		+= hid-steam.o
 obj-$(CONFIG_HID_STEELSERIES)	+= hid-steelseries.o
 obj-$(CONFIG_HID_SUNPLUS)	+= hid-sunplus.o
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 63545cd307e5..cffd4ac609a0 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -525,6 +525,7 @@
 #define USB_DEVICE_ID_GOOGLE_MOONBALL	0x5044
 #define USB_DEVICE_ID_GOOGLE_DON	0x5050
 #define USB_DEVICE_ID_GOOGLE_EEL	0x5057
+#define USB_DEVICE_ID_GOOGLE_STADIA	0x9400
 
 #define USB_VENDOR_ID_GOTOP		0x08f2
 #define USB_DEVICE_ID_SUPER_Q2		0x007f
diff --git a/drivers/hid/hid-stadiaff.c b/drivers/hid/hid-stadiaff.c
new file mode 100644
index 000000000000..f974b9e24d46
--- /dev/null
+++ b/drivers/hid/hid-stadiaff.c
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Stadia controller rumble support.
+ *
+ * Copyright 2023 Google LLC
+ */
+
+#include <linux/hid.h>
+#include <linux/input.h>
+#include <linux/slab.h>
+#include <linux/module.h>
+
+#include "hid-ids.h"
+
+#define STADIA_FF_REPORT_ID 5
+
+struct stadiaff_device {
+	struct hid_device *hid;
+	struct hid_report *report;
+	struct work_struct work;
+};
+
+static void stadiaff_work(struct work_struct *work)
+{
+	struct stadiaff_device *stadiaff =
+		container_of(work, struct stadiaff_device, work);
+
+	hid_hw_request(stadiaff->hid, stadiaff->report, HID_REQ_SET_REPORT);
+}
+
+static int stadiaff_play(struct input_dev *dev, void *data,
+			 struct ff_effect *effect)
+{
+	struct hid_device *hid = input_get_drvdata(dev);
+	struct stadiaff_device *stadiaff = hid_get_drvdata(hid);
+	struct hid_field *rumble_field = stadiaff->report->field[0];
+
+	rumble_field->value[0] = effect->u.rumble.strong_magnitude;
+	rumble_field->value[1] = effect->u.rumble.weak_magnitude;
+
+	schedule_work(&stadiaff->work);
+
+	return 0;
+}
+
+static int stadiaff_init(struct hid_device *hid)
+{
+	struct stadiaff_device *stadiaff;
+	struct hid_report *report;
+	struct hid_input *hidinput;
+	struct input_dev *dev;
+	int error;
+
+	if (list_empty(&hid->inputs)) {
+		hid_err(hid, "no inputs found\n");
+		return -ENODEV;
+	}
+	hidinput = list_entry(hid->inputs.next, struct hid_input, list);
+	dev = hidinput->input;
+
+	report = hid_validate_values(hid, HID_OUTPUT_REPORT,
+				     STADIA_FF_REPORT_ID, 0, 2);
+	if (!report)
+		return -ENODEV;
+
+	stadiaff = devm_kzalloc(&hid->dev, sizeof(struct stadiaff_device),
+				GFP_KERNEL);
+	if (!stadiaff)
+		return -ENOMEM;
+
+	hid_set_drvdata(hid, stadiaff);
+
+	input_set_capability(dev, EV_FF, FF_RUMBLE);
+
+	error = input_ff_create_memless(dev, NULL, stadiaff_play);
+	if (error)
+		return error;
+
+	stadiaff->hid = hid;
+	stadiaff->report = report;
+	INIT_WORK(&stadiaff->work, stadiaff_work);
+
+	hid_info(hid, "Force Feedback for Google Stadia controller\n");
+
+	return 0;
+}
+
+static int stadia_probe(struct hid_device *hdev, const struct hid_device_id *id)
+{
+	int ret;
+
+	ret = hid_parse(hdev);
+	if (ret) {
+		hid_err(hdev, "parse failed\n");
+		return ret;
+	}
+
+	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT & ~HID_CONNECT_FF);
+	if (ret) {
+		hid_err(hdev, "hw start failed\n");
+		return ret;
+	}
+
+	stadiaff_init(hdev);
+
+	return 0;
+}
+
+static void stadia_remove(struct hid_device *hid)
+{
+	struct stadiaff_device *stadiaff = hid_get_drvdata(hid);
+
+	cancel_work_sync(&stadiaff->work);
+	hid_hw_stop(hid);
+}
+
+static const struct hid_device_id stadia_devices[] = {
+	{ HID_USB_DEVICE(USB_VENDOR_ID_GOOGLE, USB_DEVICE_ID_GOOGLE_STADIA) },
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_GOOGLE, USB_DEVICE_ID_GOOGLE_STADIA) },
+	{ }
+};
+MODULE_DEVICE_TABLE(hid, stadia_devices);
+
+static struct hid_driver stadia_driver = {
+	.name = "stadia",
+	.id_table = stadia_devices,
+	.probe = stadia_probe,
+	.remove = stadia_remove,
+};
+module_hid_driver(stadia_driver);
+
+MODULE_LICENSE("GPL");
-- 
2.40.0.348.gf938b09366-goog

