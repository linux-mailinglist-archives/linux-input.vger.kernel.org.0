Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66A3C38D6C6
	for <lists+linux-input@lfdr.de>; Sat, 22 May 2021 20:06:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231146AbhEVSHm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 22 May 2021 14:07:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230497AbhEVSHl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 22 May 2021 14:07:41 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD647C061574;
        Sat, 22 May 2021 11:06:16 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id f6-20020a1c1f060000b0290175ca89f698so9114704wmf.5;
        Sat, 22 May 2021 11:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PdFjx680hDLKYhZTSS1Guwd8pcDuscxe0HRr3gILf8o=;
        b=A39KiAyYjelaEcQ79m/x3fciVw/rhCbwPQdbdMQ2FfuuVDJVLSs6LLhVYv/1SVsP57
         UgUk4yrhf9Vpd2k0j0lgdyqJYvTdQFBow4xqv+wKc2wlkw1MgniZm5gSZv/Buekr79IA
         oV1oJZboQEk87pn1vEBEXdi4r917R4FqtznvzIVNODAk9Slp+YrL8gjJ6EZ5OdrHAARa
         Q1ZASIYneTQFE/gML4pqq01HCXsMPfzl37VpuLzTx+kjBbCM9tNP0BbFj9YF8x/3Wvrh
         wGaObo9zEcXXAgXZ35fvvL1amWzUP/zlWQsVvGoUAL53znJx+5YM+ONBufLzTMtZ5fBC
         SIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PdFjx680hDLKYhZTSS1Guwd8pcDuscxe0HRr3gILf8o=;
        b=lVGg6+KXwRIiEFi/LzgOtnd9K7wa1GsCim39xbpBFo1W7RX1WaPag2R2HNr0hXjJTa
         IaJ4B6PrGJ36O7HYrFg8ltBzh6HYuAm5K6fbok+PdTSIgBpsdcWVa+laJSSeglWxbd/+
         EjCtdwohi6hfp1qN+obTqZLzz14qTyNzmM02zo6xIi2JSidP3B0f6Za+R2DVfjHqVAXd
         Q6LvTVDIRaOqYI5W1jb9ZVaMwtb7URXIS1ybP3oyFv7MKJZiSbmeMxRbtmssBaw536XE
         GsB/4gvYEnc21HIMurgz/4CR0W9qlHiNl8P4s862lKgQ+O3Mf2DPdWiPdRsYJk0gQYkJ
         IIOQ==
X-Gm-Message-State: AOAM530rAYST+DLohK79jsT3tgTG/1pyzffCQ8Cy4zr68HWm0iwGU9FU
        C8fDUBlAyB/kyALiRpIgy0U=
X-Google-Smtp-Source: ABdhPJyo+3t36ZZ6jzAGBJ97JSOBr88XANmvxxgDzk+n74H2zGGxXbJZysJSwhTApWGuaR91GSL/yQ==
X-Received: by 2002:a05:600c:4f48:: with SMTP id m8mr13935940wmq.169.1621706775244;
        Sat, 22 May 2021 11:06:15 -0700 (PDT)
Received: from localhost.localdomain ([94.73.38.147])
        by smtp.gmail.com with ESMTPSA id v12sm5913217wrv.76.2021.05.22.11.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 May 2021 11:06:14 -0700 (PDT)
From:   =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To:     jikos@kernel.org
Cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 1/5] HID: magicmouse: register power supply
Date:   Sat, 22 May 2021 20:06:07 +0200
Message-Id: <20210522180611.314300-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Unlike the Apple Magic Mouse 1 and the Apple Magic Trackpad 1, the
second generation of the devices don't report their battery status
automatically.

This patchset adds support for reporting the battery capacity and
charging status for the Apple Magic Mouse 2 and Apple Magic Trackpad
2 both over bluetooth and USB.

This patch:

Register the required power supply structs for the Apple Magic Mouse 2
and the Apple Magic Trackpad 2 to be able to report battery capacity
and status in future patches.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>

---

v2: Add depends on USB_HID to Kconfig
---
 drivers/hid/hid-magicmouse.c | 90 ++++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
index 2bb473d8c424..0f766bce4537 100644
--- a/drivers/hid/hid-magicmouse.c
+++ b/drivers/hid/hid-magicmouse.c
@@ -112,6 +112,9 @@ MODULE_PARM_DESC(report_undeciphered, "Report undeciphered multi-touch state fie
  * @scroll_jiffies: Time of last scroll motion.
  * @touches: Most recent data for a touch, indexed by tracking ID.
  * @tracking_ids: Mapping of current touch input data to @touches.
+ * @battery: Required data to report the battery status of the Apple Magic
+ * Mouse 2 and Apple Magic Trackpad 2. Battery is reported automatically on the
+ * first generation of the devices.
  */
 struct magicmouse_sc {
 	struct input_dev *input;
@@ -132,8 +135,89 @@ struct magicmouse_sc {
 
 	struct hid_device *hdev;
 	struct delayed_work work;
+
+	struct {
+		struct power_supply *ps;
+		struct power_supply_desc ps_desc;
+	} battery;
+};
+
+static enum power_supply_property magicmouse_ps_props[] = {
+	POWER_SUPPLY_PROP_PRESENT,
+	POWER_SUPPLY_PROP_SCOPE,
 };
 
+static bool magicmouse_can_report_battery(struct magicmouse_sc *msc)
+{
+	return (msc->input->id.product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2) ||
+	       (msc->input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2);
+}
+
+static int magicmouse_battery_get_property(struct power_supply *psy,
+					   enum power_supply_property psp,
+					   union power_supply_propval *val)
+{
+	struct magicmouse_sc *msc = power_supply_get_drvdata(psy);
+	int ret = 0;
+
+	if (!magicmouse_can_report_battery(msc))
+		return -EINVAL;
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_PRESENT:
+		val->intval = 1;
+		break;
+	case POWER_SUPPLY_PROP_SCOPE:
+		val->intval = POWER_SUPPLY_SCOPE_DEVICE;
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static int magicmouse_battery_probe(struct hid_device *hdev)
+{
+	struct magicmouse_sc *msc = hid_get_drvdata(hdev);
+	struct power_supply *ps = NULL;
+	struct power_supply_config ps_cfg = { .drv_data = msc };
+	int ret;
+
+	if (!magicmouse_can_report_battery(msc))
+		return 0;
+
+	msc->battery.ps_desc.type = POWER_SUPPLY_TYPE_BATTERY;
+	msc->battery.ps_desc.properties = magicmouse_ps_props;
+	msc->battery.ps_desc.num_properties = ARRAY_SIZE(magicmouse_ps_props);
+	msc->battery.ps_desc.get_property = magicmouse_battery_get_property;
+	msc->battery.ps_desc.name = kasprintf(GFP_KERNEL, "magic_trackpad_2_%s",
+					      msc->input->uniq);
+	if (!msc->battery.ps_desc.name) {
+		hid_err(hdev, "unable to register ps_desc name, ENOMEM\n");
+		return -ENOMEM;
+	}
+
+	ps = devm_power_supply_register(&hdev->dev, &msc->battery.ps_desc,
+					&ps_cfg);
+	if (IS_ERR(ps)) {
+		ret = PTR_ERR(ps);
+		hid_err(hdev, "unable to register battery device: %d\n", ret);
+		return ret;
+	}
+
+	msc->battery.ps = ps;
+
+	ret = power_supply_powers(msc->battery.ps, &hdev->dev);
+	if (ret) {
+		hid_err(hdev, "unable to activate battery device: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int magicmouse_firm_touch(struct magicmouse_sc *msc)
 {
 	int touch = -1;
@@ -726,6 +810,12 @@ static int magicmouse_probe(struct hid_device *hdev,
 		goto err_stop_hw;
 	}
 
+	ret = magicmouse_battery_probe(hdev);
+	if (ret) {
+		hid_err(hdev, "battery not registered\n");
+		goto err_stop_hw;
+	}
+
 	if (id->product == USB_DEVICE_ID_APPLE_MAGICMOUSE)
 		report = hid_register_report(hdev, HID_INPUT_REPORT,
 			MOUSE_REPORT_ID, 0);
-- 
2.25.1

