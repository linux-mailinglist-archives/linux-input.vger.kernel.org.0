Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C95556AA44F
	for <lists+linux-input@lfdr.de>; Fri,  3 Mar 2023 23:29:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232678AbjCCW3h (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 3 Mar 2023 17:29:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232739AbjCCW3Z (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 3 Mar 2023 17:29:25 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73B4A66D17
        for <linux-input@vger.kernel.org>; Fri,  3 Mar 2023 14:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677882088;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PgtKuD5FrBBF7NV156ZhbXuTJhyayqb07WuvPm7wnOw=;
        b=hTi09TOyycmn4PT9oTZIeeWRHIiMHxP514VBVQN9v0C7VwiXbeckR5q3tQqQ5KfZhq/r5E
        EzfF9Qqo699W76TI2mCdSG/fd7Hx7ihfi/HLze6z7dTiyJpg74+hUVJgXCCQkl9BfU3OAP
        wVWLeH2FwYIJFs/dYFiAGxX0po0WEwA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-QtiEGQBZP56PwUCs-H6OXw-1; Fri, 03 Mar 2023 17:21:25 -0500
X-MC-Unique: QtiEGQBZP56PwUCs-H6OXw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D14987B2A0;
        Fri,  3 Mar 2023 22:21:24 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.21])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E2E0F492B00;
        Fri,  3 Mar 2023 22:21:23 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v2 2/2] Input: hideep - Optionally reset controller work mode to native HiDeep protocol
Date:   Fri,  3 Mar 2023 23:21:13 +0100
Message-Id: <20230303222113.285546-3-hdegoede@redhat.com>
In-Reply-To: <20230303222113.285546-1-hdegoede@redhat.com>
References: <20230303222113.285546-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The HiDeep IST940E touchscreen controller used on the Lenovo Yoga Book X90F
convertible comes up in HID mode by default.

This works well on the X91F Windows model where the touchscreen is
correctly described in ACPI and ACPI takes care of controlling
the reset GPIO and regulators.

But the X90F ships with Android and the ACPI tables on this model don't
describe the touchscreen. Instead this is hardcoded in the vendor kernel.

The vendor kernel uses the touchscreen in native HiDeep 20 (2.0?) protocol
mode and switches the controller to this mode by writing 0 to reg 0x081e.

Adjusting the i2c-hid code to deal with the reset-gpio and regulators on
this non devicetree (but rather broken ACPI) convertible is somewhat tricky
and the native protocol reports ABS_MT_PRESSURE and ABS_MT_TOUCH_MAJOR
which are not reported in HID mode, so it is preferable to use the native
mode.

Add support to the hideep driver to reset the work-mode to the native
HiDeep protocol to allow using it on the Lenovo Yoga Book X90F.
This is guarded behind a new "hideep,reset-work-mode" boolean property,
to avoid changing behavior on other devices.

For the record: I did test using the i2c-hid driver with some quick hacks
and it does work. The I2C-HID descriptor is available from address 0x0020,
just like on the X91F Windows model.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../bindings/input/touchscreen/hideep.txt        |  1 +
 drivers/input/touchscreen/hideep.c               | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/hideep.txt b/Documentation/devicetree/bindings/input/touchscreen/hideep.txt
index a47c36190b01..68bb9f8dcc30 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/hideep.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/hideep.txt
@@ -17,6 +17,7 @@ Optional properties:
 - linux,keycodes	: Specifies an array of numeric keycode values to
 			be used for reporting button presses. The array can
 			contain up to 3 entries.
+- hideep,reset-work-mode: bool, reset touch report format to the native HiDeep protocol
 
 Example:
 
diff --git a/drivers/input/touchscreen/hideep.c b/drivers/input/touchscreen/hideep.c
index 373c1269485f..452914b78bf9 100644
--- a/drivers/input/touchscreen/hideep.c
+++ b/drivers/input/touchscreen/hideep.c
@@ -35,6 +35,7 @@
 #define HIDEEP_EVENT_ADDR		0x240
 
 /* command list */
+#define HIDEEP_WORK_MODE		0x081e
 #define HIDEEP_RESET_CMD		0x9800
 
 /* event bit */
@@ -964,6 +965,17 @@ static const struct attribute_group hideep_ts_attr_group = {
 	.attrs = hideep_ts_sysfs_entries,
 };
 
+static void hideep_set_work_mode(struct hideep_ts *ts)
+{
+	/*
+	 * Reset touch report format to the native HiDeep 20 protocol if requested.
+	 * This is necessary to make touchscreens which come up in I2C-HID mode
+	 * work with this driver.
+	 */
+	if (device_property_read_bool(&ts->client->dev, "hideep,reset-work-mode"))
+		regmap_write(ts->reg, HIDEEP_WORK_MODE, 0x00);
+}
+
 static int __maybe_unused hideep_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
@@ -987,6 +999,8 @@ static int __maybe_unused hideep_resume(struct device *dev)
 		return error;
 	}
 
+	hideep_set_work_mode(ts);
+
 	enable_irq(client->irq);
 
 	return 0;
@@ -1063,6 +1077,8 @@ static int hideep_probe(struct i2c_client *client)
 		return error;
 	}
 
+	hideep_set_work_mode(ts);
+
 	error = hideep_init_input(ts);
 	if (error)
 		return error;
-- 
2.39.1

