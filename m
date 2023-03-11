Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAC986B5B4D
	for <lists+linux-input@lfdr.de>; Sat, 11 Mar 2023 12:48:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbjCKLsU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 11 Mar 2023 06:48:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbjCKLsT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 11 Mar 2023 06:48:19 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C30B2597F
        for <linux-input@vger.kernel.org>; Sat, 11 Mar 2023 03:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678535251;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eG9Tr7sxkZtQXo+XMiP2Xmu0AaM5weaeNyVvlOJiu+s=;
        b=FrhWZ5p0mshf60lJvYpQo+rE3FE0FxYKojfccx/m5/uqToOY7DYTPcMUeNJH7INP7vfQfD
        FaA0xcjHUcDV/+uqU0tIeWvwx6X2EFyjtvPCB3MtrLelV09pcI9nON/2MGd0uTuYXEQqBI
        2h4w5pdWEUFJcIA05v/uqUPnjd9tncI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-247-foAKDqp4NUGze0NU3-kt4w-1; Sat, 11 Mar 2023 06:47:29 -0500
X-MC-Unique: foAKDqp4NUGze0NU3-kt4w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50E33800050;
        Sat, 11 Mar 2023 11:47:29 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.56])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9F216C16028;
        Sat, 11 Mar 2023 11:47:28 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-input@vger.kernel.org
Subject: [PATCH v5 2/2] Input: hideep - Optionally reset controller work mode to native HiDeep protocol
Date:   Sat, 11 Mar 2023 12:47:26 +0100
Message-Id: <20230311114726.182789-3-hdegoede@redhat.com>
In-Reply-To: <20230311114726.182789-1-hdegoede@redhat.com>
References: <20230311114726.182789-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
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
This is guarded behind a new "hideep,force-native-protocol" boolean
property, to avoid changing behavior on other devices.

For the record: I did test using the i2c-hid driver with some quick hacks
and it does work. The I2C-HID descriptor is available from address 0x0020,
just like on the X91F Windows model.

So far the new "hideep,force-native-protocol" property is only used on
x86/ACPI (non devicetree) devs. IOW it is not used in actual devicetree
files. The devicetree-bindings maintainers have requested properties like
these to not be added to the devicetree-bindings, so the new property is
deliberately not added to the existing devicetree-bindings.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v5:
- Rename the property to "hideep,force-native-protocol"
- Add a comment to the property checking code that this property
  should not be used in devicetree without first adding it to
  the devicetree-bindings.

Changes in v3:
- Do not add the x86/acpi only property to the dt-bindings doc

Changes in v2:
- New patch in v2 of this patch-set
---
 drivers/input/touchscreen/hideep.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/input/touchscreen/hideep.c b/drivers/input/touchscreen/hideep.c
index 5e6e43d56448..74673db06ed0 100644
--- a/drivers/input/touchscreen/hideep.c
+++ b/drivers/input/touchscreen/hideep.c
@@ -35,6 +35,7 @@
 #define HIDEEP_EVENT_ADDR		0x240
 
 /* command list */
+#define HIDEEP_WORK_MODE		0x081e
 #define HIDEEP_RESET_CMD		0x9800
 
 /* event bit */
@@ -964,6 +965,21 @@ static const struct attribute_group hideep_ts_attr_group = {
 	.attrs = hideep_ts_sysfs_entries,
 };
 
+static void hideep_set_work_mode(struct hideep_ts *ts)
+{
+	/*
+	 * Reset touch report format to the native HiDeep 20 protocol if requested.
+	 * This is necessary to make touchscreens which come up in I2C-HID mode
+	 * work with this driver.
+	 *
+	 * Note this is a kernel internal device-property set by x86 platform code,
+	 * this MUST not be used in devicetree files without first adding it to
+	 * the DT bindings.
+	 */
+	if (device_property_read_bool(&ts->client->dev, "hideep,force-native-protocol"))
+		regmap_write(ts->reg, HIDEEP_WORK_MODE, 0x00);
+}
+
 static int hideep_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
@@ -987,6 +1003,8 @@ static int hideep_resume(struct device *dev)
 		return error;
 	}
 
+	hideep_set_work_mode(ts);
+
 	enable_irq(client->irq);
 
 	return 0;
@@ -1063,6 +1081,8 @@ static int hideep_probe(struct i2c_client *client)
 		return error;
 	}
 
+	hideep_set_work_mode(ts);
+
 	error = hideep_init_input(ts);
 	if (error)
 		return error;
-- 
2.39.1

