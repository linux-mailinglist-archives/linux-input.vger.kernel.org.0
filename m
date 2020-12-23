Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7948A2E18B1
	for <lists+linux-input@lfdr.de>; Wed, 23 Dec 2020 07:00:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727314AbgLWF6k (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 23 Dec 2020 00:58:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbgLWF6k (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 23 Dec 2020 00:58:40 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C01B6C061282
        for <linux-input@vger.kernel.org>; Tue, 22 Dec 2020 21:57:43 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id s21so9740198pfu.13
        for <linux-input@vger.kernel.org>; Tue, 22 Dec 2020 21:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessos.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CiAgmQ36u6t1yLjWQZDdT7pzao39fW0trdj2Djils5w=;
        b=Aj9AiNmpI3ngrDbHOyqi+PQNIbGBhjx3ScIHMIS/espemOofGoMO18eMcFt87Dnb3d
         Z/niVLsxw7lIwymZEm32hNNRKtK5LvrGhtEra13GrNzq7+vVEijz0jLVKugWW4ESPrad
         hZqFUFtcwumKeyMs4tAJB6VFCVUlDRQ9rFou1Z2Gmj36wkVfs0cF5QWtN84Xp8fnho+X
         SdFeH3ieNMql/EAAzMwJaEHnR0Dte1ghYJH/WMytRHI9bCQjcz6Vv+x9cu5Y/WBOVFqe
         aCdfsExgxXmPHPT2h8TPyR1YqzbM9RkrrcQopiRJKtScfvFPZliBi7t3r7MjpZ/6zm2j
         M76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CiAgmQ36u6t1yLjWQZDdT7pzao39fW0trdj2Djils5w=;
        b=J7o/A/bmAIzum+ndwxnJIU2kkZPt6BLkgP7wZlaKi1vde3ts1Ixi54WeBSaLFiKSVp
         CodqpTFhIg4PuSOqPTuEQZA3wE5Ow8A6Hj+w53Z8C9NeeyuOhZHZshvirLXEF60sndVf
         WJg+guYxazi7zCbtshmW+xarb2qIlsRHaU7Jq585LdXwy6+nlHUI92zggXEgVIAJglen
         oQMBX8RkDWGuiCr9beGft8GDltSuv+91hux9qtfRXgzTMg+q1a7qcaM+U55lf8xgIKvb
         qpjlYe1SLFYahIHpbcRRa6eiEptuvmICE0PaI+dLtiof0RTxlXI5BBlW1zFFcspphmQV
         N70g==
X-Gm-Message-State: AOAM530fNkHpG2mWudCDfyecQruMRNZK9j1Z+0eoHlrrc060t93MVB44
        F1EUkNTdrSQ/BA4YdrkIK62pEg==
X-Google-Smtp-Source: ABdhPJy/Mna24FjtVPdXq1LCAcAPodL3GkBJzm6psYz8+aLYqqfRLVyJy2BH/2KXr4OlWPjvjBPIJw==
X-Received: by 2002:a63:2045:: with SMTP id r5mr23301752pgm.6.1608703063365;
        Tue, 22 Dec 2020 21:57:43 -0800 (PST)
Received: from starnight.localdomain (123-204-46-122.static.seed.net.tw. [123.204.46.122])
        by smtp.googlemail.com with ESMTPSA id h12sm22403656pgs.7.2020.12.22.21.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 21:57:42 -0800 (PST)
From:   Jian-Hong Pan <jhp@endlessos.org>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Chris Chiu <chiu@endlessos.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux@endlessos.org, Jian-Hong Pan <jhp@endlessos.org>
Subject: [PATCH v2] HID: Add Wireless Radio Control feature for Chicony devices
Date:   Wed, 23 Dec 2020 13:55:41 +0800
Message-Id: <20201223055540.204685-1-jhp@endlessos.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <CAB4CAwfFQrMDYuzjL2nuUnHgXO031ty-mA7GGxW+-nHFkZTGTg@mail.gmail.com>
References: <CAB4CAwfFQrMDYuzjL2nuUnHgXO031ty-mA7GGxW+-nHFkZTGTg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some Chicony's keyboards support airplane mode hotkey (Fn+F2) with
"Wireless Radio Control" feature. For example, the wireless keyboard
[04f2:1236] shipped with ASUS all-in-one desktop.

After consulting Chicony for this hotkey, learned the device will send
with 0x11 as the report ID and 0x1 as the value when the key is pressed
down.

This patch maps the event as KEY_RFKILL.

Signed-off-by: Jian-Hong Pan <jhp@endlessos.org>
---
v2: Remove the duplicated key pressed check.

 drivers/hid/hid-chicony.c | 55 +++++++++++++++++++++++++++++++++++++++
 drivers/hid/hid-ids.h     |  1 +
 2 files changed, 56 insertions(+)

diff --git a/drivers/hid/hid-chicony.c b/drivers/hid/hid-chicony.c
index 3f0ed6a95223..ca556d39da2a 100644
--- a/drivers/hid/hid-chicony.c
+++ b/drivers/hid/hid-chicony.c
@@ -21,6 +21,39 @@
 
 #include "hid-ids.h"
 
+#define CH_WIRELESS_CTL_REPORT_ID	0x11
+
+static int ch_report_wireless(struct hid_report *report, u8 *data, int size)
+{
+	struct hid_device *hdev = report->device;
+	struct input_dev *input;
+
+	if (report->id != CH_WIRELESS_CTL_REPORT_ID || report->maxfield != 1)
+		return 0;
+
+	input = report->field[0]->hidinput->input;
+	if (!input) {
+		hid_warn(hdev, "can't find wireless radio control's input");
+		return 0;
+	}
+
+	input_report_key(input, KEY_RFKILL, 1);
+	input_sync(input);
+	input_report_key(input, KEY_RFKILL, 0);
+	input_sync(input);
+
+	return 1;
+}
+
+static int ch_raw_event(struct hid_device *hdev,
+		struct hid_report *report, u8 *data, int size)
+{
+	if (report->application == HID_GD_WIRELESS_RADIO_CTLS)
+		return ch_report_wireless(report, data, size);
+
+	return 0;
+}
+
 #define ch_map_key_clear(c)	hid_map_usage_clear(hi, usage, bit, max, \
 					EV_KEY, (c))
 static int ch_input_mapping(struct hid_device *hdev, struct hid_input *hi,
@@ -77,10 +110,30 @@ static __u8 *ch_switch12_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 	return rdesc;
 }
 
+static int ch_probe(struct hid_device *hdev, const struct hid_device_id *id)
+{
+	int ret;
+
+	hdev->quirks |= HID_QUIRK_INPUT_PER_APP;
+	ret = hid_parse(hdev);
+	if (ret) {
+		hid_err(hdev, "Chicony hid parse failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
+	if (ret) {
+		hid_err(hdev, "Chicony hw start failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
 
 static const struct hid_device_id ch_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_TACTICAL_PAD) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_WIRELESS2) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_WIRELESS3) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_ACER_SWITCH12) },
 	{ }
 };
@@ -91,6 +144,8 @@ static struct hid_driver ch_driver = {
 	.id_table = ch_devices,
 	.report_fixup = ch_switch12_report_fixup,
 	.input_mapping = ch_input_mapping,
+	.probe = ch_probe,
+	.raw_event = ch_raw_event,
 };
 module_hid_driver(ch_driver);
 
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 4c5f23640f9c..06d90301a3dc 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -270,6 +270,7 @@
 #define USB_DEVICE_ID_CHICONY_PIXART_USB_OPTICAL_MOUSE	0x1053
 #define USB_DEVICE_ID_CHICONY_PIXART_USB_OPTICAL_MOUSE2	0x0939
 #define USB_DEVICE_ID_CHICONY_WIRELESS2	0x1123
+#define USB_DEVICE_ID_CHICONY_WIRELESS3	0x1236
 #define USB_DEVICE_ID_ASUS_AK1D		0x1125
 #define USB_DEVICE_ID_CHICONY_TOSHIBA_WT10A	0x1408
 #define USB_DEVICE_ID_CHICONY_ACER_SWITCH12	0x1421
-- 
2.29.2

