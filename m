Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37517637EBA
	for <lists+linux-input@lfdr.de>; Thu, 24 Nov 2022 19:00:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbiKXSAA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 24 Nov 2022 13:00:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbiKXR77 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 24 Nov 2022 12:59:59 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1D9A69AB0;
        Thu, 24 Nov 2022 09:59:57 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id i12so3555495wrb.0;
        Thu, 24 Nov 2022 09:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eLas5OIIcvGq9KaW1hfmH7/xf4z+eL8e9b9O9VZyGJE=;
        b=qwdmlyLl6nnkZ49N+bfWGUcyHJYIcJzrS//fcqMz+PUUPBt2ohEAQ1fFQbXJhiKWRe
         BtnwCPrMawoa4AvsM2SJOxFvfSKjaeOdttobV69uNvCI/1w3E38qGzjUTrkbsYKZ53ux
         SHpNPRnOOs2R+MIY7cM6i6/mCjwl820iM2qf/kgt3A6iKudMzgitcjoIV6aSvvGWgyPk
         wZVb3TEAvnsZfNgtps6RMjSTdDuWY0vzdXQJ0VsELDO/NPyHkTLJ1/v5qFtEsU2nkn8y
         KkG3gdDQUeb6VoXQTPVoL5xbwf2lRStIkvfGG6bXXUt2ABzRhdBO7mO2s3+RN39ia/S7
         xZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eLas5OIIcvGq9KaW1hfmH7/xf4z+eL8e9b9O9VZyGJE=;
        b=6hk+Jt9ehjUztwKBLegYtNVBKjI5RtrMv202zlMnfGysm10FcMIJf2tP2BUdkQB4uB
         mf/oEMs/NdpmAsf5WtcxduZbeBzHTMFN9buw4L8oM/IWi5+wORdmB7qswafH1ck9e+EN
         rcqlHJ1agHTEkqpLIkAo8ZoSJXN79IHFPkOrGZuivwR0XbeTnXetQ9rY9IuZcZxTT331
         CO01n4/WUv58zRJEJXtYSD1qY9KEHGB8jMxusPyoWge1FXl2mC5mRWXalDn/06OLnsIL
         vVs3ic9cL/4VtZOHjdrqDRBin6WtH3MMWfIL0S3WRcGOb7MR9Z99Ur8CZM018KfQVzFu
         W1VA==
X-Gm-Message-State: ANoB5pkkqibINA0B97czFKnCBR8E+Frp8avadTk2DNRVI0+5KzuBxie4
        L2YX1WvNSl8EqyYdVwGXnIE=
X-Google-Smtp-Source: AA0mqf7D9CXPnkjesHDDFFYroMnMl5i+Ub1vEzzhBvTYnWZD8ZtWN2S+l6twFBDy2Jjm76KV5rQzzA==
X-Received: by 2002:adf:dc0f:0:b0:241:e7b4:e10 with SMTP id t15-20020adfdc0f000000b00241e7b40e10mr7196733wri.423.1669312796155;
        Thu, 24 Nov 2022 09:59:56 -0800 (PST)
Received: from localhost.localdomain ([94.73.35.229])
        by smtp.gmail.com with ESMTPSA id l1-20020a05600c4f0100b003c6f3f6675bsm7094865wmq.26.2022.11.24.09.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 09:59:55 -0800 (PST)
From:   =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To:     jikos@kernel.org
Cc:     benjamin.tissoires@redhat.com, rydberg@bitmath.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH RESEND 1/1] HID: input: map battery system charging
Date:   Thu, 24 Nov 2022 18:59:37 +0100
Message-Id: <20221124175937.7631-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221124175937.7631-1-jose.exposito89@gmail.com>
References: <20221124175937.7631-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

HID descriptors with Battery System (0x85) Charging (0x44) usage are
ignored and POWER_SUPPLY_STATUS_DISCHARGING is always reported to user
space, even when the device is charging.

Map this usage and when it is reported set the right charging status.

In addition, add KUnit tests to make sure that the charging status is
correctly set and reported. They can be run with the usual command:

    $ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/hid

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/hid/.kunitconfig     |  1 +
 drivers/hid/Kconfig          |  1 +
 drivers/hid/hid-input-test.c | 80 ++++++++++++++++++++++++++++++++++++
 drivers/hid/hid-input.c      | 36 +++++++++++++++-
 include/linux/hid.h          |  2 +
 5 files changed, 118 insertions(+), 2 deletions(-)
 create mode 100644 drivers/hid/hid-input-test.c

diff --git a/drivers/hid/.kunitconfig b/drivers/hid/.kunitconfig
index 04daeff5c970..675a8209c7ae 100644
--- a/drivers/hid/.kunitconfig
+++ b/drivers/hid/.kunitconfig
@@ -1,5 +1,6 @@
 CONFIG_KUNIT=y
 CONFIG_USB=y
 CONFIG_USB_HID=y
+CONFIG_HID_BATTERY_STRENGTH=y
 CONFIG_HID_UCLOGIC=y
 CONFIG_HID_KUNIT_TEST=y
diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 185a077d59cd..644b4913d4d8 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1263,6 +1263,7 @@ config HID_MCP2221
 config HID_KUNIT_TEST
 	tristate "KUnit tests for HID" if !KUNIT_ALL_TESTS
 	depends on KUNIT=y
+	depends on HID_BATTERY_STRENGTH
 	depends on HID_UCLOGIC
 	default KUNIT_ALL_TESTS
 	help
diff --git a/drivers/hid/hid-input-test.c b/drivers/hid/hid-input-test.c
new file mode 100644
index 000000000000..77c2d45ac62a
--- /dev/null
+++ b/drivers/hid/hid-input-test.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ *  HID to Linux Input mapping
+ *
+ *  Copyright (c) 2022 José Expósito <jose.exposito89@gmail.com>
+ */
+
+#include <kunit/test.h>
+
+static void hid_test_input_set_battery_charge_status(struct kunit *test)
+{
+	struct hid_device *dev;
+	bool handled;
+
+	dev = kunit_kzalloc(test, sizeof(*dev), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+
+	handled = hidinput_set_battery_charge_status(dev, HID_DG_HEIGHT, 0);
+	KUNIT_EXPECT_FALSE(test, handled);
+	KUNIT_EXPECT_EQ(test, dev->battery_charge_status, POWER_SUPPLY_STATUS_UNKNOWN);
+
+	handled = hidinput_set_battery_charge_status(dev, HID_BAT_CHARGING, 0);
+	KUNIT_EXPECT_TRUE(test, handled);
+	KUNIT_EXPECT_EQ(test, dev->battery_charge_status, POWER_SUPPLY_STATUS_DISCHARGING);
+
+	handled = hidinput_set_battery_charge_status(dev, HID_BAT_CHARGING, 1);
+	KUNIT_EXPECT_TRUE(test, handled);
+	KUNIT_EXPECT_EQ(test, dev->battery_charge_status, POWER_SUPPLY_STATUS_CHARGING);
+}
+
+static void hid_test_input_get_battery_property(struct kunit *test)
+{
+	struct power_supply *psy;
+	struct hid_device *dev;
+	union power_supply_propval val;
+	int ret;
+
+	dev = kunit_kzalloc(test, sizeof(*dev), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+	dev->battery_avoid_query = true;
+
+	psy = kunit_kzalloc(test, sizeof(*psy), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, psy);
+	psy->drv_data = dev;
+
+	dev->battery_status = HID_BATTERY_UNKNOWN;
+	dev->battery_charge_status = POWER_SUPPLY_STATUS_CHARGING;
+	ret = hidinput_get_battery_property(psy, POWER_SUPPLY_PROP_STATUS, &val);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, val.intval, POWER_SUPPLY_STATUS_UNKNOWN);
+
+	dev->battery_status = HID_BATTERY_REPORTED;
+	dev->battery_charge_status = POWER_SUPPLY_STATUS_CHARGING;
+	ret = hidinput_get_battery_property(psy, POWER_SUPPLY_PROP_STATUS, &val);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, val.intval, POWER_SUPPLY_STATUS_CHARGING);
+
+	dev->battery_status = HID_BATTERY_REPORTED;
+	dev->battery_charge_status = POWER_SUPPLY_STATUS_DISCHARGING;
+	ret = hidinput_get_battery_property(psy, POWER_SUPPLY_PROP_STATUS, &val);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, val.intval, POWER_SUPPLY_STATUS_DISCHARGING);
+}
+
+static struct kunit_case hid_input_tests[] = {
+	KUNIT_CASE(hid_test_input_set_battery_charge_status),
+	KUNIT_CASE(hid_test_input_get_battery_property),
+	{ }
+};
+
+static struct kunit_suite hid_input_test_suite = {
+	.name = "hid_input",
+	.test_cases = hid_input_tests,
+};
+
+kunit_test_suite(hid_input_test_suite);
+
+MODULE_DESCRIPTION("HID input KUnit tests");
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("José Expósito <jose.exposito89@gmail.com>");
diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 859aeb07542e..587112e9efe2 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -477,7 +477,7 @@ static int hidinput_get_battery_property(struct power_supply *psy,
 		if (dev->battery_status == HID_BATTERY_UNKNOWN)
 			val->intval = POWER_SUPPLY_STATUS_UNKNOWN;
 		else
-			val->intval = POWER_SUPPLY_STATUS_DISCHARGING;
+			val->intval = dev->battery_charge_status;
 		break;
 
 	case POWER_SUPPLY_PROP_SCOPE:
@@ -545,6 +545,7 @@ static int hidinput_setup_battery(struct hid_device *dev, unsigned report_type,
 	dev->battery_max = max;
 	dev->battery_report_type = report_type;
 	dev->battery_report_id = field->report->id;
+	dev->battery_charge_status = POWER_SUPPLY_STATUS_DISCHARGING;
 
 	/*
 	 * Stylus is normally not connected to the device and thus we
@@ -608,6 +609,20 @@ static void hidinput_update_battery(struct hid_device *dev, int value)
 		power_supply_changed(dev->battery);
 	}
 }
+
+static bool hidinput_set_battery_charge_status(struct hid_device *dev,
+					       unsigned int usage, int value)
+{
+	switch (usage) {
+	case HID_BAT_CHARGING:
+		dev->battery_charge_status = value ?
+					     POWER_SUPPLY_STATUS_CHARGING :
+					     POWER_SUPPLY_STATUS_DISCHARGING;
+		return true;
+	}
+
+	return false;
+}
 #else  /* !CONFIG_HID_BATTERY_STRENGTH */
 static int hidinput_setup_battery(struct hid_device *dev, unsigned report_type,
 				  struct hid_field *field, bool is_percentage)
@@ -622,6 +637,12 @@ static void hidinput_cleanup_battery(struct hid_device *dev)
 static void hidinput_update_battery(struct hid_device *dev, int value)
 {
 }
+
+static bool hidinput_set_battery_charge_status(struct hid_device *dev,
+					       unsigned int usage, int value)
+{
+	return false;
+}
 #endif	/* CONFIG_HID_BATTERY_STRENGTH */
 
 static bool hidinput_field_in_collection(struct hid_device *device, struct hid_field *field,
@@ -1208,6 +1229,9 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 			hidinput_setup_battery(device, HID_INPUT_REPORT, field, true);
 			usage->type = EV_PWR;
 			return;
+		case HID_BAT_CHARGING:
+			usage->type = EV_PWR;
+			return;
 		}
 		goto unknown;
 
@@ -1450,7 +1474,11 @@ void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct
 		return;
 
 	if (usage->type == EV_PWR) {
-		hidinput_update_battery(hid, value);
+		bool handled = hidinput_set_battery_charge_status(hid, usage->hid, value);
+
+		if (!handled)
+			hidinput_update_battery(hid, value);
+
 		return;
 	}
 
@@ -2306,3 +2334,7 @@ void hidinput_disconnect(struct hid_device *hid)
 	cancel_work_sync(&hid->led_work);
 }
 EXPORT_SYMBOL_GPL(hidinput_disconnect);
+
+#ifdef CONFIG_HID_KUNIT_TEST
+#include "hid-input-test.c"
+#endif
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 8677ae38599e..1eb5408599cd 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -312,6 +312,7 @@ struct hid_item {
 #define HID_DG_LATENCYMODE	0x000d0060
 
 #define HID_BAT_ABSOLUTESTATEOFCHARGE	0x00850065
+#define HID_BAT_CHARGING		0x00850044
 
 #define HID_VD_ASUS_CUSTOM_MEDIA_KEYS	0xff310076
 
@@ -611,6 +612,7 @@ struct hid_device {							/* device report descriptor */
 	__s32 battery_max;
 	__s32 battery_report_type;
 	__s32 battery_report_id;
+	__s32 battery_charge_status;
 	enum hid_battery_status battery_status;
 	bool battery_avoid_query;
 	ktime_t battery_ratelimit_time;
-- 
2.38.1

