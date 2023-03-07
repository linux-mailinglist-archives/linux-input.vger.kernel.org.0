Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDB8A6AE5BE
	for <lists+linux-input@lfdr.de>; Tue,  7 Mar 2023 17:02:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230472AbjCGQCQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Mar 2023 11:02:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231584AbjCGQBt (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Mar 2023 11:01:49 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 573B392BE9
        for <linux-input@vger.kernel.org>; Tue,  7 Mar 2023 07:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678204686;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hWLkfKCRU7DjTcjrlCzaNzBrqc0ZxcZBoiH+52oTC1I=;
        b=GM4OK9Mk/kc1XeG4K++Sy5882BOIaC/0J7iIoImi7XaksFqYMSRlikD2Egf2mvx2DwvV+Y
        PHiVDJLP5KpS2lmmYgq7ODMuN0rbE8EALwXJGPfKgnpRR+rTuuHkcqhYjCEF9o1KOWUy87
        jlEa6vndYkugbSRWi/VMCBXTyEY+EXg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-235-lIyPYJMeMG-mWA0yg1v0bA-1; Tue, 07 Mar 2023 10:58:01 -0500
X-MC-Unique: lIyPYJMeMG-mWA0yg1v0bA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3513802D2A;
        Tue,  7 Mar 2023 15:57:59 +0000 (UTC)
Received: from x1.nl (unknown [10.39.193.18])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C2AB81121314;
        Tue,  7 Mar 2023 15:57:58 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH v3 2/2] Input: hideep - Optionally reset controller work mode to native HiDeep protocol
Date:   Tue,  7 Mar 2023 16:57:55 +0100
Message-Id: <20230307155755.136968-3-hdegoede@redhat.com>
In-Reply-To: <20230307155755.136968-1-hdegoede@redhat.com>
References: <20230307155755.136968-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
This is guarded behind a new "hideep,reset-work-mode" boolean property,
to avoid changing behavior on other devices.

For the record: I did test using the i2c-hid driver with some quick hacks
and it does work. The I2C-HID descriptor is available from address 0x0020,
just like on the X91F Windows model.

So far the new "hideep,reset-work-mode" property is only used on x86/ACPI
(non devicetree) devs. IOW it is not used in actual devicetree files.
The devicetree-bindings maintainers have requested properties like these
to not be added to the devicetree-bindings, so the new property is
deliberately not added to the existing devicetree-bindings.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v3:
- Do not add the x86/acpi only property to the dt-bindings doc

Changes in v2:
- New patch in v2 of this patch-set
---
 drivers/input/touchscreen/hideep.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

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

