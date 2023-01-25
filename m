Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 326E467B065
	for <lists+linux-input@lfdr.de>; Wed, 25 Jan 2023 11:55:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234742AbjAYKzN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Jan 2023 05:55:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235229AbjAYKzM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Jan 2023 05:55:12 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 472FF26BC
        for <linux-input@vger.kernel.org>; Wed, 25 Jan 2023 02:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674644063;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EHJ7QbuEJCvF5/OpAVlhSNCtx75bh+5UQF4mH8jOT6c=;
        b=Jnmdp+3nl3j3+30o0J8tzI/gUhWE6MijVI+UQwMYoo9+imeED2oMfe8txe7XlRaXi8APSD
        ryG/Lx7oBoKG9YrcsbVqu0uSdX8RwPeBFBV2oN/gYGezosanxlxckhg53IQdQGVxhzpjdh
        o+iN053GMJXMnfioFsC5FWJ2fZ6GKQY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-ROovyowFO6OKhy_RO1NK6Q-1; Wed, 25 Jan 2023 05:54:19 -0500
X-MC-Unique: ROovyowFO6OKhy_RO1NK6Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70976858F0E;
        Wed, 25 Jan 2023 10:54:19 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.104])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 937334085720;
        Wed, 25 Jan 2023 10:54:18 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        Gregor Riepl <onitake@gmail.com>, linux-input@vger.kernel.org
Subject: [PATCH resend 1/3] Input: touchscreen - Extend touchscreen_parse_properties() to allow overriding settings with a module option
Date:   Wed, 25 Jan 2023 11:54:14 +0100
Message-Id: <20230125105416.17406-2-hdegoede@redhat.com>
In-Reply-To: <20230125105416.17406-1-hdegoede@redhat.com>
References: <20230125105416.17406-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

Reviewed-by: Bastien Nocera <hadess@hadess.net>
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
2.39.0

