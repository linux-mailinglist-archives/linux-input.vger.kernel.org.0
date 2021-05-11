Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E44737AE49
	for <lists+linux-input@lfdr.de>; Tue, 11 May 2021 20:20:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231454AbhEKSVv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 May 2021 14:21:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231329AbhEKSVv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 May 2021 14:21:51 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D443C061574;
        Tue, 11 May 2021 11:20:44 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id s5-20020a7bc0c50000b0290147d0c21c51so1744969wmh.4;
        Tue, 11 May 2021 11:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ftGwwdNlFP05uVc9KwVMdLS0pcb01gK3FHHMMiTD974=;
        b=Ld7Ty0gR7mB0MC6BwFBIXZ1oMjm0Vx3JhPA88ybxJEZ8SnAyqUdtpDYwU52MFzpSu+
         HYIOMHM7OLkCChoZETc+D1EYGqRE5YKKxBq+JGeqDivGOXrm/wXDXrFhUgF3RMbCUeqA
         9a/281b7bndzRt+2+dyQz7GQ/AMJl4OCoB39Qba3UmfMXUE/XtspKhDls1kp265NnBPi
         oKU7nmAcTfx+7r9TxGxFMHhhgZjG7P2Pxumz0QCfiel2D/C1V6EjsWocDtplB2CCBBAM
         PEt6q9RyEsTw78SHQ9av3ATRjWAVxulV+YvOR0p7sf8bmcfpvPesfe4qPh6q+Dvrfkby
         92Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ftGwwdNlFP05uVc9KwVMdLS0pcb01gK3FHHMMiTD974=;
        b=ZpRfc1Q8SwBEQjJEVsMpfzhGSLMYfAuwTe8KXrsq6PA4k/UinPKpumBQaGrriAs8pJ
         bSyCBEykzkFMitnGCUIJOa56T61bEsjp33JwpQK+SVtM3mWwwzHvEtUWpgf2hdwbwNy9
         RSLFXkMiLLqVPo+Js2CE9PidGD4NwBLQ+9ezUT6HO/HkqiU2mRZ9VX17tjU5Ley29hdQ
         QPjxUZP1SfQHTHFyZJOoLj7pbo//OJsrqUWA9/gWN+hNJ886/KTzpyHRf73UY0XxzGRf
         Qgj+bCEu3NCvN/zufKvxjYyGlArbmNngEFtf31L9OewfcpxQ1dAuSjJVnfw+c43TXNd3
         dM3Q==
X-Gm-Message-State: AOAM532j14ILRJpnCA4Wh2PiDoKcCdykGzWdCAuXVyNANDFIW+HhKoqv
        AvLpkr3zV/jgiNlMbVD8hiJmJVE2/Gs5UG5p
X-Google-Smtp-Source: ABdhPJzipI5ebtz47j0YHilq4cAeh11Vl1vmdK2VpW48eBO3BK6g0jUi56HbdgF94xivljSxcw/g3A==
X-Received: by 2002:a7b:ce19:: with SMTP id m25mr33961850wmc.137.1620757243076;
        Tue, 11 May 2021 11:20:43 -0700 (PDT)
Received: from localhost.localdomain ([94.73.38.147])
        by smtp.gmail.com with ESMTPSA id d15sm28012133wrw.71.2021.05.11.11.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 11:20:42 -0700 (PDT)
From:   =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To:     jikos@kernel.org
Cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 1/5] HID: magicmouse: register power supply
Date:   Tue, 11 May 2021 20:20:19 +0200
Message-Id: <20210511182023.730524-1-jose.exposito89@gmail.com>
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

