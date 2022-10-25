Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8224A60CBD8
	for <lists+linux-input@lfdr.de>; Tue, 25 Oct 2022 14:29:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231504AbiJYM3o (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 Oct 2022 08:29:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231608AbiJYM3m (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 Oct 2022 08:29:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EAE8D0189
        for <linux-input@vger.kernel.org>; Tue, 25 Oct 2022 05:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666700980;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+jnErqmUXM69KiUVhn9cZxuyE5Zs8gY1PaHqvMhsIwk=;
        b=EJHGGAbTwXWWxjIF1JxtmCmMIEaJZva1Idsdn5XLMxzIzMkzcq97GlowQ3IrZezVCDn8nf
        /0hEO/277hBll9hwJvpKXYpvMsg291L5duDuzEZ9GfkfE/5tJtkhP8VVGMyIEgZcM7Cz9/
        OspBIjeyRKJ5vL8S3WM2mmK+QLK+io8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-O8GDVJWQPQCAyCNCVwxsgg-1; Tue, 25 Oct 2022 08:29:37 -0400
X-MC-Unique: O8GDVJWQPQCAyCNCVwxsgg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 636923C32C60;
        Tue, 25 Oct 2022 12:29:35 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.71])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 519184A9254;
        Tue, 25 Oct 2022 12:29:34 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: [PATCH 2/4] Input: touchscreen - Extend touchscreen_parse_properties() to allow overriding settings with a module option
Date:   Tue, 25 Oct 2022 14:29:28 +0200
Message-Id: <20221025122930.421377-3-hdegoede@redhat.com>
In-Reply-To: <20221025122930.421377-1-hdegoede@redhat.com>
References: <20221025122930.421377-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On x86/ACPI platforms touchscreens mostly just work without needing any
device/model specific configuration. But in some cases (mostly with Silead
and Goodix touchscreens) it is still necessary to manually specify various
touchscreen-properties on a per model basis.

This is handled by drivers/platform/x86/touchscreen_dmi.c which contains
a large list of per-model touchscreen properties which it attaches to the
(i2c)device before the touchscreen driver's probe() method gets called.
This means that ATM changing these settings requires recompiling the
kernel. This makes figuring out what settings/properties a specific
touchscreen needs very hard for normal users to do.

Add a new, optional, settings_override string argument to
touchscreen_parse_properties(), which takes a list of ; separated
property-name=value pairs, e.g. :
"touchscreen-size-x=1665;touchscreen-size-y=1140;touchscreen-swapped-x-y".

This new argument can be used by drivers to implement a module option which
allows users to easily specify alternative settings for testing.

The 2 new touchscreen_property_read_u32() and
touchscreen_property_read_bool() helpers are also exported so that
drivers can use these to add settings-override support to the code
for driver-specific properties.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Instead of patching all drivers rename touchscreen_parse_properties()
  to touchscreen_parse_properties_with_override() and add
  a static inline wrapper which passes NULL.
---
 drivers/input/touchscreen.c       | 103 ++++++++++++++++++++++++++----
 include/linux/input/touchscreen.h |  19 +++++-
 2 files changed, 109 insertions(+), 13 deletions(-)

diff --git a/drivers/input/touchscreen.c b/drivers/input/touchscreen.c
index 4620e20d0190..3b9505d5468d 100644
--- a/drivers/input/touchscreen.c
+++ b/drivers/input/touchscreen.c
@@ -12,15 +12,80 @@
 #include <linux/input/touchscreen.h>
 #include <linux/module.h>
 
+static int touchscreen_get_prop_from_settings_string(const char *settings,
+						     const char *propname,
+						     bool is_boolean,
+						     u32 *val_ret)
+{
+	char *begin, *end;
+	u32 val;
+
+	if (!settings)
+		return -ENOENT;
+
+	begin = strstr(settings, propname);
+	if (!begin)
+		return -ENOENT;
+
+	/* begin must be either the begin of settings, or be preceded by a ';' */
+	if (begin != settings && begin[-1] != ';')
+		return -EINVAL;
+
+	end = begin + strlen(propname);
+	if (*end != '=') {
+		if (is_boolean && (*end == '\0' || *end == ';')) {
+			*val_ret = true;
+			return 0;
+		}
+		return -EINVAL;
+	}
+
+	val = simple_strtoul(end + 1, &end, 0);
+	if (*end != '\0' && *end != ';')
+		return -EINVAL;
+
+	*val_ret = val;
+	return 0;
+}
+
+int touchscreen_property_read_u32(struct device *dev, const char *propname,
+				  const char *settings, u32 *val)
+{
+	int error;
+
+	error = device_property_read_u32(dev, propname, val);
+
+	if (touchscreen_get_prop_from_settings_string(settings, propname,
+						      false, val) == 0)
+		error = 0;
+
+	return error;
+}
+EXPORT_SYMBOL(touchscreen_property_read_u32);
+
+bool touchscreen_property_read_bool(struct device *dev, const char *propname,
+				    const char *settings)
+{
+	u32 val;
+
+	val = device_property_read_bool(dev, propname);
+
+	touchscreen_get_prop_from_settings_string(settings, propname, true, &val);
+
+	return val;
+}
+EXPORT_SYMBOL(touchscreen_property_read_bool);
+
 static bool touchscreen_get_prop_u32(struct device *dev,
 				     const char *property,
+				     const char *settings,
 				     unsigned int default_value,
 				     unsigned int *value)
 {
 	u32 val;
 	int error;
 
-	error = device_property_read_u32(dev, property, &val);
+	error = touchscreen_property_read_u32(dev, property, settings, &val);
 	if (error) {
 		*value = default_value;
 		return false;
@@ -50,20 +115,28 @@ static void touchscreen_set_params(struct input_dev *dev,
 }
 
 /**
- * touchscreen_parse_properties - parse common touchscreen properties
+ * touchscreen_parse_properties_with_settings - parse common touchscreen properties
  * @input: input device that should be parsed
  * @multitouch: specifies whether parsed properties should be applied to
  *	single-touch or multi-touch axes
  * @prop: pointer to a struct touchscreen_properties into which to store
  *	axis swap and invert info for use with touchscreen_report_x_y();
  *	or %NULL
+ * @settings: string with ; separated name=value pairs overriding
+ *	the device-properties or %NULL.
  *
  * This function parses common properties for touchscreens and sets up the
  * input device accordingly. The function keeps previously set up default
  * values if no value is specified.
+ *
+ * Callers can optional specify a settings string overriding the
+ * device-properties, this can be used to implement a module option which
+ * allows users to easily specify alternative settings for testing.
  */
-void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
-				  struct touchscreen_properties *prop)
+void touchscreen_parse_properties_with_settings(struct input_dev *input,
+						bool multitouch,
+						struct touchscreen_properties *prop,
+						const char *settings)
 {
 	struct device *dev = input->dev.parent;
 	struct input_absinfo *absinfo;
@@ -79,26 +152,32 @@ void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
 	axis_y = multitouch ? ABS_MT_POSITION_Y : ABS_Y;
 
 	data_present = touchscreen_get_prop_u32(dev, "touchscreen-min-x",
+						settings,
 						input_abs_get_min(input, axis_x),
 						&minimum);
 	data_present |= touchscreen_get_prop_u32(dev, "touchscreen-size-x",
+						 settings,
 						 input_abs_get_max(input,
 								   axis_x) + 1,
 						 &maximum);
 	data_present |= touchscreen_get_prop_u32(dev, "touchscreen-fuzz-x",
+						 settings,
 						 input_abs_get_fuzz(input, axis_x),
 						 &fuzz);
 	if (data_present)
 		touchscreen_set_params(input, axis_x, minimum, maximum - 1, fuzz);
 
 	data_present = touchscreen_get_prop_u32(dev, "touchscreen-min-y",
+						settings,
 						input_abs_get_min(input, axis_y),
 						&minimum);
 	data_present |= touchscreen_get_prop_u32(dev, "touchscreen-size-y",
+						 settings,
 						 input_abs_get_max(input,
 								   axis_y) + 1,
 						 &maximum);
 	data_present |= touchscreen_get_prop_u32(dev, "touchscreen-fuzz-y",
+						 settings,
 						 input_abs_get_fuzz(input, axis_y),
 						 &fuzz);
 	if (data_present)
@@ -107,10 +186,12 @@ void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
 	axis = multitouch ? ABS_MT_PRESSURE : ABS_PRESSURE;
 	data_present = touchscreen_get_prop_u32(dev,
 						"touchscreen-max-pressure",
+						settings,
 						input_abs_get_max(input, axis),
 						&maximum);
 	data_present |= touchscreen_get_prop_u32(dev,
 						 "touchscreen-fuzz-pressure",
+						 settings,
 						 input_abs_get_fuzz(input, axis),
 						 &fuzz);
 	if (data_present)
@@ -122,28 +203,28 @@ void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
 	prop->max_x = input_abs_get_max(input, axis_x);
 	prop->max_y = input_abs_get_max(input, axis_y);
 
-	prop->invert_x =
-		device_property_read_bool(dev, "touchscreen-inverted-x");
+	prop->invert_x = touchscreen_property_read_bool(dev, "touchscreen-inverted-x",
+							settings);
 	if (prop->invert_x) {
 		absinfo = &input->absinfo[axis_x];
 		absinfo->maximum -= absinfo->minimum;
 		absinfo->minimum = 0;
 	}
 
-	prop->invert_y =
-		device_property_read_bool(dev, "touchscreen-inverted-y");
+	prop->invert_y = touchscreen_property_read_bool(dev, "touchscreen-inverted-y",
+							settings);
 	if (prop->invert_y) {
 		absinfo = &input->absinfo[axis_y];
 		absinfo->maximum -= absinfo->minimum;
 		absinfo->minimum = 0;
 	}
 
-	prop->swap_x_y =
-		device_property_read_bool(dev, "touchscreen-swapped-x-y");
+	prop->swap_x_y = touchscreen_property_read_bool(dev, "touchscreen-swapped-x-y",
+							settings);
 	if (prop->swap_x_y)
 		swap(input->absinfo[axis_x], input->absinfo[axis_y]);
 }
-EXPORT_SYMBOL(touchscreen_parse_properties);
+EXPORT_SYMBOL(touchscreen_parse_properties_with_settings);
 
 static void
 touchscreen_apply_prop_to_x_y(const struct touchscreen_properties *prop,
diff --git a/include/linux/input/touchscreen.h b/include/linux/input/touchscreen.h
index fe66e2b58f62..0023c6e368ba 100644
--- a/include/linux/input/touchscreen.h
+++ b/include/linux/input/touchscreen.h
@@ -17,8 +17,23 @@ struct touchscreen_properties {
 	bool swap_x_y;
 };
 
-void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
-				  struct touchscreen_properties *prop);
+void touchscreen_parse_properties_with_settings(struct input_dev *input,
+						bool multitouch,
+						struct touchscreen_properties *prop,
+						const char *settings);
+
+static inline void touchscreen_parse_properties(struct input_dev *input,
+						bool multitouch,
+						struct touchscreen_properties *prop)
+{
+	touchscreen_parse_properties_with_settings(input, multitouch, prop, NULL);
+}
+
+int touchscreen_property_read_u32(struct device *dev, const char *propname,
+				  const char *settings, u32 *val);
+
+bool touchscreen_property_read_bool(struct device *dev, const char *propname,
+				    const char *settings);
 
 void touchscreen_set_mt_pos(struct input_mt_pos *pos,
 			    const struct touchscreen_properties *prop,
-- 
2.37.3

