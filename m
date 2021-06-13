Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2CCA3A5799
	for <lists+linux-input@lfdr.de>; Sun, 13 Jun 2021 12:22:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231576AbhFMKYN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 13 Jun 2021 06:24:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48656 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231612AbhFMKYL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 13 Jun 2021 06:24:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623579729;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Z8Z++FUNCB7I+NNPl7+CqbfgMkBQw3ZEntRvC6ohyE4=;
        b=NIzi1zKh7CYrqeVevwIrppHoh/Zq7SodWtjSyu+HnpW5R0lvwdJ/dB0+8rYYxG2zZbA3CS
        Ov+AQoKq7U7K1wWfBodtQc7HxDlJoA7XDqMTYEjlboAz9YWKXZLZozQlpIkdrh1rtQel7s
        8CGVVk0NmE67rx5u+WVPkdoRpTV4hqs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-x46gyaqtNsOSaY8IEfoIRA-1; Sun, 13 Jun 2021 06:22:08 -0400
X-MC-Unique: x46gyaqtNsOSaY8IEfoIRA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 233525721E;
        Sun, 13 Jun 2021 10:22:07 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-77.ams2.redhat.com [10.36.112.77])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8EDCB60C0F;
        Sun, 13 Jun 2021 10:22:00 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        Gregor Riepl <onitake@gmail.com>, linux-input@vger.kernel.org
Subject: [PATCH 1/3] Input: touchscreen - Extend touchscreen_parse_properties() to allow overriding settings with a module option
Date:   Sun, 13 Jun 2021 12:21:56 +0200
Message-Id: <20210613102158.16886-2-hdegoede@redhat.com>
In-Reply-To: <20210613102158.16886-1-hdegoede@redhat.com>
References: <20210613102158.16886-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Note instead of patching all touchscreen drivers we could also rename
touchscreen_parse_properties() to touchscreen_parse_properties_with_override()
and add a static inline wrapper which passes NULL. Just patching the drivers
feels a bit cleaner to me though.
---
 drivers/input/misc/iqs626a.c                  |  2 +-
 drivers/input/touchscreen.c                   | 96 +++++++++++++++++--
 drivers/input/touchscreen/ad7879.c            |  2 +-
 drivers/input/touchscreen/ads7846.c           |  2 +-
 drivers/input/touchscreen/bu21013_ts.c        |  2 +-
 drivers/input/touchscreen/bu21029_ts.c        |  2 +-
 drivers/input/touchscreen/chipone_icn8318.c   |  2 +-
 drivers/input/touchscreen/chipone_icn8505.c   |  2 +-
 drivers/input/touchscreen/cy8ctma140.c        |  2 +-
 drivers/input/touchscreen/cyttsp_core.c       |  2 +-
 drivers/input/touchscreen/edt-ft5x06.c        |  2 +-
 drivers/input/touchscreen/eeti_ts.c           |  2 +-
 drivers/input/touchscreen/ektf2127.c          |  2 +-
 drivers/input/touchscreen/elants_i2c.c        |  2 +-
 drivers/input/touchscreen/exc3000.c           |  2 +-
 drivers/input/touchscreen/goodix.c            |  2 +-
 drivers/input/touchscreen/hideep.c            |  2 +-
 drivers/input/touchscreen/hycon-hy46xx.c      |  2 +-
 drivers/input/touchscreen/ili210x.c           |  2 +-
 drivers/input/touchscreen/ilitek_ts_i2c.c     |  2 +-
 drivers/input/touchscreen/iqs5xx.c            |  2 +-
 drivers/input/touchscreen/mms114.c            |  2 +-
 drivers/input/touchscreen/msg2638.c           |  2 +-
 drivers/input/touchscreen/pixcir_i2c_ts.c     |  2 +-
 drivers/input/touchscreen/raspberrypi-ts.c    |  2 +-
 .../input/touchscreen/resistive-adc-touch.c   |  2 +-
 drivers/input/touchscreen/s6sy761.c           |  2 +-
 drivers/input/touchscreen/silead.c            |  2 +-
 drivers/input/touchscreen/st1232.c            |  2 +-
 drivers/input/touchscreen/stmfts.c            |  2 +-
 drivers/input/touchscreen/stmpe-ts.c          |  2 +-
 drivers/input/touchscreen/sx8654.c            |  2 +-
 drivers/input/touchscreen/tsc200x-core.c      |  2 +-
 drivers/input/touchscreen/zet6223.c           |  2 +-
 drivers/input/touchscreen/zinitix.c           |  2 +-
 include/linux/input/touchscreen.h             |  9 +-
 36 files changed, 130 insertions(+), 43 deletions(-)

diff --git a/drivers/input/misc/iqs626a.c b/drivers/input/misc/iqs626a.c
index d57e996732cf..5007c96aac2a 100644
--- a/drivers/input/misc/iqs626a.c
+++ b/drivers/input/misc/iqs626a.c
@@ -1484,7 +1484,7 @@ static int iqs626_input_init(struct iqs626_private *iqs626)
 					     ABS_X, 0, 128, 0, 0);
 
 		touchscreen_parse_properties(iqs626->trackpad, false,
-					     &iqs626->prop);
+					     &iqs626->prop, NULL);
 	} else {
 		for (i = 0; i < IQS626_NUM_GESTURES; i++)
 			if (iqs626->tp_code[i] != KEY_RESERVED)
diff --git a/drivers/input/touchscreen.c b/drivers/input/touchscreen.c
index dd18cb917c4d..ebf313fb341f 100644
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
+				  const char *settings_override, u32 *val)
+{
+	int error;
+
+	error = device_property_read_u32(dev, propname, val);
+
+	if (touchscreen_get_prop_from_settings_string(settings_override, propname,
+						      false, val) == 0)
+		error = 0;
+
+	return error;
+}
+EXPORT_SYMBOL(touchscreen_property_read_u32);
+
+bool touchscreen_property_read_bool(struct device *dev, const char *propname,
+				    const char *settings_override)
+{
+	u32 val;
+
+	val = device_property_read_bool(dev, propname);
+
+	touchscreen_get_prop_from_settings_string(settings_override, propname, true, &val);
+
+	return val;
+}
+EXPORT_SYMBOL(touchscreen_property_read_bool);
+
 static bool touchscreen_get_prop_u32(struct device *dev,
 				     const char *property,
+				     const char *settings_override,
 				     unsigned int default_value,
 				     unsigned int *value)
 {
 	u32 val;
 	int error;
 
-	error = device_property_read_u32(dev, property, &val);
+	error = touchscreen_property_read_u32(dev, property, settings_override, &val);
 	if (error) {
 		*value = default_value;
 		return false;
@@ -57,13 +122,20 @@ static void touchscreen_set_params(struct input_dev *dev,
  * @prop: pointer to a struct touchscreen_properties into which to store
  *	axis swap and invert info for use with touchscreen_report_x_y();
  *	or %NULL
+ * @settings_override: string with ; separated name=value pairs overriding
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
 void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
-				  struct touchscreen_properties *prop)
+				  struct touchscreen_properties *prop,
+				  const char *settings_override)
 {
 	struct device *dev = input->dev.parent;
 	struct input_absinfo *absinfo;
@@ -79,26 +151,32 @@ void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
 	axis_y = multitouch ? ABS_MT_POSITION_Y : ABS_Y;
 
 	data_present = touchscreen_get_prop_u32(dev, "touchscreen-min-x",
+						settings_override,
 						input_abs_get_min(input, axis_x),
 						&minimum) |
 		       touchscreen_get_prop_u32(dev, "touchscreen-size-x",
+						settings_override,
 						input_abs_get_max(input,
 								  axis_x) + 1,
 						&maximum) |
 		       touchscreen_get_prop_u32(dev, "touchscreen-fuzz-x",
+						settings_override,
 						input_abs_get_fuzz(input, axis_x),
 						&fuzz);
 	if (data_present)
 		touchscreen_set_params(input, axis_x, minimum, maximum - 1, fuzz);
 
 	data_present = touchscreen_get_prop_u32(dev, "touchscreen-min-y",
+						settings_override,
 						input_abs_get_min(input, axis_y),
 						&minimum) |
 		       touchscreen_get_prop_u32(dev, "touchscreen-size-y",
+						settings_override,
 						input_abs_get_max(input,
 								  axis_y) + 1,
 						&maximum) |
 		       touchscreen_get_prop_u32(dev, "touchscreen-fuzz-y",
+						settings_override,
 						input_abs_get_fuzz(input, axis_y),
 						&fuzz);
 	if (data_present)
@@ -107,10 +185,12 @@ void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
 	axis = multitouch ? ABS_MT_PRESSURE : ABS_PRESSURE;
 	data_present = touchscreen_get_prop_u32(dev,
 						"touchscreen-max-pressure",
+						settings_override,
 						input_abs_get_max(input, axis),
 						&maximum) |
 		       touchscreen_get_prop_u32(dev,
 						"touchscreen-fuzz-pressure",
+						settings_override,
 						input_abs_get_fuzz(input, axis),
 						&fuzz);
 	if (data_present)
@@ -122,24 +202,24 @@ void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
 	prop->max_x = input_abs_get_max(input, axis_x);
 	prop->max_y = input_abs_get_max(input, axis_y);
 
-	prop->invert_x =
-		device_property_read_bool(dev, "touchscreen-inverted-x");
+	prop->invert_x = touchscreen_property_read_bool(dev, "touchscreen-inverted-x",
+							settings_override);
 	if (prop->invert_x) {
 		absinfo = &input->absinfo[axis_x];
 		absinfo->maximum -= absinfo->minimum;
 		absinfo->minimum = 0;
 	}
 
-	prop->invert_y =
-		device_property_read_bool(dev, "touchscreen-inverted-y");
+	prop->invert_y = touchscreen_property_read_bool(dev, "touchscreen-inverted-y",
+							settings_override);
 	if (prop->invert_y) {
 		absinfo = &input->absinfo[axis_y];
 		absinfo->maximum -= absinfo->minimum;
 		absinfo->minimum = 0;
 	}
 
-	prop->swap_x_y =
-		device_property_read_bool(dev, "touchscreen-swapped-x-y");
+	prop->swap_x_y = touchscreen_property_read_bool(dev, "touchscreen-swapped-x-y",
+							settings_override);
 	if (prop->swap_x_y)
 		swap(input->absinfo[axis_x], input->absinfo[axis_y]);
 }
diff --git a/drivers/input/touchscreen/ad7879.c b/drivers/input/touchscreen/ad7879.c
index e850853328f1..935bfd8340cf 100644
--- a/drivers/input/touchscreen/ad7879.c
+++ b/drivers/input/touchscreen/ad7879.c
@@ -564,7 +564,7 @@ int ad7879_probe(struct device *dev, struct regmap *regmap,
 	input_set_abs_params(input_dev, ABS_X, 0, MAX_12BIT, 0, 0);
 	input_set_abs_params(input_dev, ABS_Y, 0, MAX_12BIT, 0, 0);
 	input_set_capability(input_dev, EV_ABS, ABS_PRESSURE);
-	touchscreen_parse_properties(input_dev, false, NULL);
+	touchscreen_parse_properties(input_dev, false, NULL, NULL);
 	if (!input_abs_get_max(input_dev, ABS_PRESSURE)) {
 		dev_err(dev, "Touchscreen pressure is not specified\n");
 		return -EINVAL;
diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
index f113a27aeb1e..769c7efeef5c 100644
--- a/drivers/input/touchscreen/ads7846.c
+++ b/drivers/input/touchscreen/ads7846.c
@@ -1331,7 +1331,7 @@ static int ads7846_probe(struct spi_device *spi)
 	 * correct behaviour in case of using the legacy vendor bindings. The
 	 * general binding value overrides the vendor specific one.
 	 */
-	touchscreen_parse_properties(ts->input, false, &ts->core_prop);
+	touchscreen_parse_properties(ts->input, false, &ts->core_prop, NULL);
 	ts->pressure_max = input_abs_get_max(input_dev, ABS_PRESSURE) ? : ~0;
 
 	/*
diff --git a/drivers/input/touchscreen/bu21013_ts.c b/drivers/input/touchscreen/bu21013_ts.c
index 2f1f0d7607f8..17f944cb2334 100644
--- a/drivers/input/touchscreen/bu21013_ts.c
+++ b/drivers/input/touchscreen/bu21013_ts.c
@@ -451,7 +451,7 @@ static int bu21013_probe(struct i2c_client *client,
 	input_set_abs_params(in_dev, ABS_MT_POSITION_X, 0, max_x, 0, 0);
 	input_set_abs_params(in_dev, ABS_MT_POSITION_Y, 0, max_y, 0, 0);
 
-	touchscreen_parse_properties(in_dev, true, &ts->props);
+	touchscreen_parse_properties(in_dev, true, &ts->props, NULL);
 
 	/* Adjust for the legacy "flip" properties, if present */
 	if (!ts->props.invert_x &&
diff --git a/drivers/input/touchscreen/bu21029_ts.c b/drivers/input/touchscreen/bu21029_ts.c
index 392950aa7856..301e3460c583 100644
--- a/drivers/input/touchscreen/bu21029_ts.c
+++ b/drivers/input/touchscreen/bu21029_ts.c
@@ -397,7 +397,7 @@ static int bu21029_probe(struct i2c_client *client,
 	input_set_abs_params(in_dev, ABS_X, 0, MAX_12BIT, 0, 0);
 	input_set_abs_params(in_dev, ABS_Y, 0, MAX_12BIT, 0, 0);
 	input_set_abs_params(in_dev, ABS_PRESSURE, 0, MAX_12BIT, 0, 0);
-	touchscreen_parse_properties(in_dev, false, &bu21029->prop);
+	touchscreen_parse_properties(in_dev, false, &bu21029->prop, NULL);
 
 	input_set_drvdata(in_dev, bu21029);
 
diff --git a/drivers/input/touchscreen/chipone_icn8318.c b/drivers/input/touchscreen/chipone_icn8318.c
index f2fb41fb031e..6019a6665d40 100644
--- a/drivers/input/touchscreen/chipone_icn8318.c
+++ b/drivers/input/touchscreen/chipone_icn8318.c
@@ -214,7 +214,7 @@ static int icn8318_probe(struct i2c_client *client,
 	input_set_capability(input, EV_ABS, ABS_MT_POSITION_X);
 	input_set_capability(input, EV_ABS, ABS_MT_POSITION_Y);
 
-	touchscreen_parse_properties(input, true, &data->prop);
+	touchscreen_parse_properties(input, true, &data->prop, NULL);
 	if (!input_abs_get_max(input, ABS_MT_POSITION_X) ||
 	    !input_abs_get_max(input, ABS_MT_POSITION_Y)) {
 		dev_err(dev, "Error touchscreen-size-x and/or -y missing\n");
diff --git a/drivers/input/touchscreen/chipone_icn8505.c b/drivers/input/touchscreen/chipone_icn8505.c
index f9ca5502ac8c..d26e84b86e5c 100644
--- a/drivers/input/touchscreen/chipone_icn8505.c
+++ b/drivers/input/touchscreen/chipone_icn8505.c
@@ -445,7 +445,7 @@ static int icn8505_probe(struct i2c_client *client)
 	input_set_abs_params(input, ABS_MT_POSITION_Y, 0,
 			     le16_to_cpu(resolution[1]) - 1, 0, 0);
 
-	touchscreen_parse_properties(input, true, &icn8505->prop);
+	touchscreen_parse_properties(input, true, &icn8505->prop, NULL);
 	if (!input_abs_get_max(input, ABS_MT_POSITION_X) ||
 	    !input_abs_get_max(input, ABS_MT_POSITION_Y)) {
 		dev_err(dev, "Error touchscreen-size-x and/or -y missing\n");
diff --git a/drivers/input/touchscreen/cy8ctma140.c b/drivers/input/touchscreen/cy8ctma140.c
index a9be29139cbf..4cb8a8a7fc9c 100644
--- a/drivers/input/touchscreen/cy8ctma140.c
+++ b/drivers/input/touchscreen/cy8ctma140.c
@@ -235,7 +235,7 @@ static int cy8ctma140_probe(struct i2c_client *client,
 	 * The firmware takes care of finger tracking and dropping
 	 * invalid ranges.
 	 */
-	touchscreen_parse_properties(input, true, &ts->props);
+	touchscreen_parse_properties(input, true, &ts->props, NULL);
 	input_abs_set_fuzz(input, ABS_MT_POSITION_X, 0);
 	input_abs_set_fuzz(input, ABS_MT_POSITION_Y, 0);
 
diff --git a/drivers/input/touchscreen/cyttsp_core.c b/drivers/input/touchscreen/cyttsp_core.c
index 106dd4962785..d13a0bd6310f 100644
--- a/drivers/input/touchscreen/cyttsp_core.c
+++ b/drivers/input/touchscreen/cyttsp_core.c
@@ -655,7 +655,7 @@ struct cyttsp *cyttsp_probe(const struct cyttsp_bus_ops *bus_ops,
 	/* One byte for width 0..255 so this is the limit */
 	input_set_abs_params(input_dev, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
 
-	touchscreen_parse_properties(input_dev, true, NULL);
+	touchscreen_parse_properties(input_dev, true, NULL, NULL);
 
 	error = input_mt_init_slots(input_dev, CY_MAX_ID, INPUT_MT_DIRECT);
 	if (error) {
diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index 2eefbc2485bc..78fae8e8cb72 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -1201,7 +1201,7 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
 	input_set_abs_params(input, ABS_MT_POSITION_Y,
 			     0, tsdata->num_y * 64 - 1, 0, 0);
 
-	touchscreen_parse_properties(input, true, &tsdata->prop);
+	touchscreen_parse_properties(input, true, &tsdata->prop, NULL);
 
 	error = input_mt_init_slots(input, tsdata->max_support_points,
 				INPUT_MT_DIRECT);
diff --git a/drivers/input/touchscreen/eeti_ts.c b/drivers/input/touchscreen/eeti_ts.c
index a639ba7e56ea..11e6e6a8c4d7 100644
--- a/drivers/input/touchscreen/eeti_ts.c
+++ b/drivers/input/touchscreen/eeti_ts.c
@@ -193,7 +193,7 @@ static int eeti_ts_probe(struct i2c_client *client,
 	input_set_abs_params(input, ABS_Y, 0, EETI_MAXVAL, 0, 0);
 	input_set_abs_params(input, ABS_PRESSURE, 0, 0xff, 0, 0);
 
-	touchscreen_parse_properties(input, false, &eeti->props);
+	touchscreen_parse_properties(input, false, &eeti->props, NULL);
 
 	input->name = client->name;
 	input->id.bustype = BUS_I2C;
diff --git a/drivers/input/touchscreen/ektf2127.c b/drivers/input/touchscreen/ektf2127.c
index 2d01a8cbfcc6..d2336d359770 100644
--- a/drivers/input/touchscreen/ektf2127.c
+++ b/drivers/input/touchscreen/ektf2127.c
@@ -298,7 +298,7 @@ static int ektf2127_probe(struct i2c_client *client,
 
 	input_set_abs_params(input, ABS_MT_POSITION_X, 0, max_x, 0, 0);
 	input_set_abs_params(input, ABS_MT_POSITION_Y, 0, max_y, 0, 0);
-	touchscreen_parse_properties(input, true, &ts->prop);
+	touchscreen_parse_properties(input, true, &ts->prop, NULL);
 
 	error = input_mt_init_slots(input, EKTF2127_MAX_TOUCHES,
 				    INPUT_MT_DIRECT |
diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index 17540bdb1eaf..320bd434d085 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -1479,7 +1479,7 @@ static int elants_i2c_probe(struct i2c_client *client,
 	input_set_abs_params(ts->input, ABS_MT_TOOL_TYPE,
 			     0, MT_TOOL_PALM, 0, 0);
 
-	touchscreen_parse_properties(ts->input, true, &ts->prop);
+	touchscreen_parse_properties(ts->input, true, &ts->prop, NULL);
 
 	if (ts->chip_id == EKTF3624 && ts->phy_x && ts->phy_y) {
 		/* calculate resolution from size */
diff --git a/drivers/input/touchscreen/exc3000.c b/drivers/input/touchscreen/exc3000.c
index cbe0dd412912..285568e8ac24 100644
--- a/drivers/input/touchscreen/exc3000.c
+++ b/drivers/input/touchscreen/exc3000.c
@@ -374,7 +374,7 @@ static int exc3000_probe(struct i2c_client *client)
 	input_set_abs_params(input, ABS_MT_POSITION_X, 0, max_xy, 0, 0);
 	input_set_abs_params(input, ABS_MT_POSITION_Y, 0, max_xy, 0, 0);
 
-	touchscreen_parse_properties(input, true, &data->prop);
+	touchscreen_parse_properties(input, true, &data->prop, NULL);
 
 	error = input_mt_init_slots(input, EXC3000_NUM_SLOTS,
 				    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index d92f6b2b6dcf..2efb82977115 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -1026,7 +1026,7 @@ static int goodix_configure_dev(struct goodix_ts_data *ts)
 	goodix_read_config(ts);
 
 	/* Try overriding touchscreen parameters via device properties */
-	touchscreen_parse_properties(ts->input_dev, true, &ts->prop);
+	touchscreen_parse_properties(ts->input_dev, true, &ts->prop, NULL);
 
 	if (!ts->prop.max_x || !ts->prop.max_y || !ts->max_touch_num) {
 		dev_err(&ts->client->dev,
diff --git a/drivers/input/touchscreen/hideep.c b/drivers/input/touchscreen/hideep.c
index ddad4a82a5e5..42bef005f868 100644
--- a/drivers/input/touchscreen/hideep.c
+++ b/drivers/input/touchscreen/hideep.c
@@ -798,7 +798,7 @@ static int hideep_init_input(struct hideep_ts *ts)
 	input_set_abs_params(ts->input_dev, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
 	input_set_abs_params(ts->input_dev, ABS_MT_TOOL_TYPE,
 			     0, MT_TOOL_MAX, 0, 0);
-	touchscreen_parse_properties(ts->input_dev, true, &ts->prop);
+	touchscreen_parse_properties(ts->input_dev, true, &ts->prop, NULL);
 
 	if (ts->prop.max_x == 0 || ts->prop.max_y == 0) {
 		error = hideep_get_axis_info(ts);
diff --git a/drivers/input/touchscreen/hycon-hy46xx.c b/drivers/input/touchscreen/hycon-hy46xx.c
index 891d0430083e..93f50ef8565a 100644
--- a/drivers/input/touchscreen/hycon-hy46xx.c
+++ b/drivers/input/touchscreen/hycon-hy46xx.c
@@ -517,7 +517,7 @@ static int hycon_hy46xx_probe(struct i2c_client *client,
 	input_set_abs_params(input, ABS_MT_POSITION_X, 0, -1, 0, 0);
 	input_set_abs_params(input, ABS_MT_POSITION_Y, 0, -1, 0, 0);
 
-	touchscreen_parse_properties(input, true, &tsdata->prop);
+	touchscreen_parse_properties(input, true, &tsdata->prop, NULL);
 
 	error = input_mt_init_slots(input, HY46XX_MAX_SUPPORTED_POINTS,
 				    INPUT_MT_DIRECT);
diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index 30576a5f2f04..74da3a569a54 100644
--- a/drivers/input/touchscreen/ili210x.c
+++ b/drivers/input/touchscreen/ili210x.c
@@ -449,7 +449,7 @@ static int ili210x_i2c_probe(struct i2c_client *client,
 	input_set_abs_params(input, ABS_MT_POSITION_Y, 0, max_xy, 0, 0);
 	if (priv->chip->has_pressure_reg)
 		input_set_abs_params(input, ABS_MT_PRESSURE, 0, 0xa, 0, 0);
-	touchscreen_parse_properties(input, true, &priv->prop);
+	touchscreen_parse_properties(input, true, &priv->prop, NULL);
 
 	error = input_mt_init_slots(input, priv->chip->max_touches,
 				    INPUT_MT_DIRECT);
diff --git a/drivers/input/touchscreen/ilitek_ts_i2c.c b/drivers/input/touchscreen/ilitek_ts_i2c.c
index c5d259c76adc..3420c1585ea8 100644
--- a/drivers/input/touchscreen/ilitek_ts_i2c.c
+++ b/drivers/input/touchscreen/ilitek_ts_i2c.c
@@ -474,7 +474,7 @@ static int ilitek_input_dev_init(struct device *dev, struct ilitek_ts_data *ts)
 	input_set_abs_params(input, ABS_MT_POSITION_Y,
 			     ts->screen_min_y, ts->screen_max_y, 0, 0);
 
-	touchscreen_parse_properties(input, true, &ts->prop);
+	touchscreen_parse_properties(input, true, &ts->prop, NULL);
 
 	error = input_mt_init_slots(input, ts->max_tp,
 				    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
index b3fa71213d60..5c608a604e38 100644
--- a/drivers/input/touchscreen/iqs5xx.c
+++ b/drivers/input/touchscreen/iqs5xx.c
@@ -516,7 +516,7 @@ static int iqs5xx_axis_init(struct i2c_client *client)
 	input_set_abs_params(iqs5xx->input, ABS_MT_POSITION_Y, 0, max_y, 0, 0);
 	input_set_abs_params(iqs5xx->input, ABS_MT_PRESSURE, 0, U16_MAX, 0, 0);
 
-	touchscreen_parse_properties(iqs5xx->input, true, prop);
+	touchscreen_parse_properties(iqs5xx->input, true, prop, NULL);
 
 	/*
 	 * The device reserves 0xFFFF for coordinates that correspond to slots
diff --git a/drivers/input/touchscreen/mms114.c b/drivers/input/touchscreen/mms114.c
index 0efd1a1bb192..6f1c4b4598e3 100644
--- a/drivers/input/touchscreen/mms114.c
+++ b/drivers/input/touchscreen/mms114.c
@@ -473,7 +473,7 @@ static int mms114_probe(struct i2c_client *client,
 	input_set_abs_params(input_dev, ABS_MT_TOUCH_MAJOR,
 			     0, MMS114_MAX_AREA, 0, 0);
 
-	touchscreen_parse_properties(input_dev, true, &data->props);
+	touchscreen_parse_properties(input_dev, true, &data->props, NULL);
 	if (!data->props.max_x || !data->props.max_y) {
 		dev_dbg(&client->dev,
 			"missing X/Y size properties, trying legacy bindings\n");
diff --git a/drivers/input/touchscreen/msg2638.c b/drivers/input/touchscreen/msg2638.c
index 75536bc88969..08b36774cc3f 100644
--- a/drivers/input/touchscreen/msg2638.c
+++ b/drivers/input/touchscreen/msg2638.c
@@ -209,7 +209,7 @@ static int msg2638_init_input_dev(struct msg2638_ts_data *msg2638)
 	input_set_capability(input_dev, EV_ABS, ABS_MT_POSITION_X);
 	input_set_capability(input_dev, EV_ABS, ABS_MT_POSITION_Y);
 
-	touchscreen_parse_properties(input_dev, true, &msg2638->prop);
+	touchscreen_parse_properties(input_dev, true, &msg2638->prop, NULL);
 	if (!msg2638->prop.max_x || !msg2638->prop.max_y) {
 		dev_err(dev, "touchscreen-size-x and/or touchscreen-size-y not set in properties\n");
 		return -EINVAL;
diff --git a/drivers/input/touchscreen/pixcir_i2c_ts.c b/drivers/input/touchscreen/pixcir_i2c_ts.c
index dc148b4bed74..e33e7a828890 100644
--- a/drivers/input/touchscreen/pixcir_i2c_ts.c
+++ b/drivers/input/touchscreen/pixcir_i2c_ts.c
@@ -498,7 +498,7 @@ static int pixcir_i2c_ts_probe(struct i2c_client *client,
 
 	input_set_capability(input, EV_ABS, ABS_MT_POSITION_X);
 	input_set_capability(input, EV_ABS, ABS_MT_POSITION_Y);
-	touchscreen_parse_properties(input, true, &tsdata->prop);
+	touchscreen_parse_properties(input, true, &tsdata->prop, NULL);
 	if (!input_abs_get_max(input, ABS_MT_POSITION_X) ||
 	    !input_abs_get_max(input, ABS_MT_POSITION_Y)) {
 		dev_err(dev, "Touchscreen size is not specified\n");
diff --git a/drivers/input/touchscreen/raspberrypi-ts.c b/drivers/input/touchscreen/raspberrypi-ts.c
index 5000f5fd9ec3..7f0f8b4b9263 100644
--- a/drivers/input/touchscreen/raspberrypi-ts.c
+++ b/drivers/input/touchscreen/raspberrypi-ts.c
@@ -182,7 +182,7 @@ static int rpi_ts_probe(struct platform_device *pdev)
 			     RPI_TS_DEFAULT_WIDTH, 0, 0);
 	input_set_abs_params(input, ABS_MT_POSITION_Y, 0,
 			     RPI_TS_DEFAULT_HEIGHT, 0, 0);
-	touchscreen_parse_properties(input, true, &ts->prop);
+	touchscreen_parse_properties(input, true, &ts->prop, NULL);
 
 	error = input_mt_init_slots(input, RPI_TS_MAX_SUPPORTED_POINTS,
 				    INPUT_MT_DIRECT);
diff --git a/drivers/input/touchscreen/resistive-adc-touch.c b/drivers/input/touchscreen/resistive-adc-touch.c
index e50af30183f4..308a0a71e999 100644
--- a/drivers/input/touchscreen/resistive-adc-touch.c
+++ b/drivers/input/touchscreen/resistive-adc-touch.c
@@ -153,7 +153,7 @@ static int grts_probe(struct platform_device *pdev)
 	input_set_capability(input, EV_KEY, BTN_TOUCH);
 
 	/* parse optional device tree properties */
-	touchscreen_parse_properties(input, false, &st->prop);
+	touchscreen_parse_properties(input, false, &st->prop, NULL);
 
 	st->input = input;
 	input_set_drvdata(input, st);
diff --git a/drivers/input/touchscreen/s6sy761.c b/drivers/input/touchscreen/s6sy761.c
index 85a1f465c097..346059d40ef8 100644
--- a/drivers/input/touchscreen/s6sy761.c
+++ b/drivers/input/touchscreen/s6sy761.c
@@ -441,7 +441,7 @@ static int s6sy761_probe(struct i2c_client *client,
 	input_set_abs_params(sdata->input, ABS_MT_TOUCH_MINOR, 0, 255, 0, 0);
 	input_set_abs_params(sdata->input, ABS_MT_PRESSURE, 0, 255, 0, 0);
 
-	touchscreen_parse_properties(sdata->input, true, &sdata->prop);
+	touchscreen_parse_properties(sdata->input, true, &sdata->prop, NULL);
 
 	if (!input_abs_get_max(sdata->input, ABS_X) ||
 	    !input_abs_get_max(sdata->input, ABS_Y)) {
diff --git a/drivers/input/touchscreen/silead.c b/drivers/input/touchscreen/silead.c
index 1ee760bac0cf..a6386b715b7b 100644
--- a/drivers/input/touchscreen/silead.c
+++ b/drivers/input/touchscreen/silead.c
@@ -96,7 +96,7 @@ static int silead_ts_request_input_dev(struct silead_ts_data *data)
 
 	input_set_abs_params(data->input, ABS_MT_POSITION_X, 0, 4095, 0, 0);
 	input_set_abs_params(data->input, ABS_MT_POSITION_Y, 0, 4095, 0, 0);
-	touchscreen_parse_properties(data->input, true, &data->prop);
+	touchscreen_parse_properties(data->input, true, &data->prop, NULL);
 
 	input_mt_init_slots(data->input, data->max_fingers,
 			    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED |
diff --git a/drivers/input/touchscreen/st1232.c b/drivers/input/touchscreen/st1232.c
index 6abae665ca71..8fc2779dee1f 100644
--- a/drivers/input/touchscreen/st1232.c
+++ b/drivers/input/touchscreen/st1232.c
@@ -309,7 +309,7 @@ static int st1232_ts_probe(struct i2c_client *client,
 	input_set_abs_params(input_dev, ABS_MT_POSITION_Y,
 			     0, max_y, 0, 0);
 
-	touchscreen_parse_properties(input_dev, true, &ts->prop);
+	touchscreen_parse_properties(input_dev, true, &ts->prop, NULL);
 
 	error = input_mt_init_slots(input_dev, ts->chip_info->max_fingers,
 				    INPUT_MT_DIRECT | INPUT_MT_TRACK |
diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index bc11203c9cf7..72e973ee7318 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -662,7 +662,7 @@ static int stmfts_probe(struct i2c_client *client,
 
 	input_set_capability(sdata->input, EV_ABS, ABS_MT_POSITION_X);
 	input_set_capability(sdata->input, EV_ABS, ABS_MT_POSITION_Y);
-	touchscreen_parse_properties(sdata->input, true, &sdata->prop);
+	touchscreen_parse_properties(sdata->input, true, &sdata->prop, NULL);
 
 	input_set_abs_params(sdata->input, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
 	input_set_abs_params(sdata->input, ABS_MT_TOUCH_MINOR, 0, 255, 0, 0);
diff --git a/drivers/input/touchscreen/stmpe-ts.c b/drivers/input/touchscreen/stmpe-ts.c
index 25c45c3a3561..9ccf5c15c1da 100644
--- a/drivers/input/touchscreen/stmpe-ts.c
+++ b/drivers/input/touchscreen/stmpe-ts.c
@@ -339,7 +339,7 @@ static int stmpe_input_probe(struct platform_device *pdev)
 	input_set_abs_params(idev, ABS_Y, 0, XY_MASK, 0, 0);
 	input_set_abs_params(idev, ABS_PRESSURE, 0x0, 0xff, 0, 0);
 
-	touchscreen_parse_properties(idev, false, &ts->prop);
+	touchscreen_parse_properties(idev, false, &ts->prop, NULL);
 
 	error = input_register_device(idev);
 	if (error) {
diff --git a/drivers/input/touchscreen/sx8654.c b/drivers/input/touchscreen/sx8654.c
index de85e57b2486..26a659439677 100644
--- a/drivers/input/touchscreen/sx8654.c
+++ b/drivers/input/touchscreen/sx8654.c
@@ -361,7 +361,7 @@ static int sx8654_probe(struct i2c_client *client,
 	input_set_abs_params(input, ABS_X, 0, MAX_12BIT, 0, 0);
 	input_set_abs_params(input, ABS_Y, 0, MAX_12BIT, 0, 0);
 
-	touchscreen_parse_properties(input, false, &sx8654->props);
+	touchscreen_parse_properties(input, false, &sx8654->props, NULL);
 
 	sx8654->client = client;
 	sx8654->input = input;
diff --git a/drivers/input/touchscreen/tsc200x-core.c b/drivers/input/touchscreen/tsc200x-core.c
index ce2fe30d6b8a..163dcf26f7d9 100644
--- a/drivers/input/touchscreen/tsc200x-core.c
+++ b/drivers/input/touchscreen/tsc200x-core.c
@@ -533,7 +533,7 @@ int tsc200x_probe(struct device *dev, int irq, const struct input_id *tsc_id,
 	input_set_abs_params(input_dev, ABS_PRESSURE,
 			     0, MAX_12BIT, TSC200X_DEF_P_FUZZ, 0);
 
-	touchscreen_parse_properties(input_dev, false, NULL);
+	touchscreen_parse_properties(input_dev, false, NULL, NULL);
 
 	/* Ensure the touchscreen is off */
 	tsc200x_stop_scan(ts);
diff --git a/drivers/input/touchscreen/zet6223.c b/drivers/input/touchscreen/zet6223.c
index 3b6f7ee1e38f..7ea836bda6aa 100644
--- a/drivers/input/touchscreen/zet6223.c
+++ b/drivers/input/touchscreen/zet6223.c
@@ -208,7 +208,7 @@ static int zet6223_probe(struct i2c_client *client,
 	input_set_abs_params(input, ABS_MT_POSITION_X, 0, ts->max_x, 0, 0);
 	input_set_abs_params(input, ABS_MT_POSITION_Y, 0, ts->max_y, 0, 0);
 
-	touchscreen_parse_properties(input, true, &ts->prop);
+	touchscreen_parse_properties(input, true, &ts->prop, NULL);
 
 	error = input_mt_init_slots(input, ts->fingernum,
 				    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
index b8d901099378..b747cf23c67a 100644
--- a/drivers/input/touchscreen/zinitix.c
+++ b/drivers/input/touchscreen/zinitix.c
@@ -438,7 +438,7 @@ static int zinitix_init_input_dev(struct bt541_ts_data *bt541)
 	input_set_abs_params(input_dev, ABS_MT_WIDTH_MAJOR, 0, 255, 0, 0);
 	input_set_abs_params(input_dev, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
 
-	touchscreen_parse_properties(input_dev, true, &bt541->prop);
+	touchscreen_parse_properties(input_dev, true, &bt541->prop, NULL);
 	if (!bt541->prop.max_x || !bt541->prop.max_y) {
 		dev_err(&bt541->client->dev,
 			"Touchscreen-size-x and/or touchscreen-size-y not set in dts\n");
diff --git a/include/linux/input/touchscreen.h b/include/linux/input/touchscreen.h
index fe66e2b58f62..396c3b704c7c 100644
--- a/include/linux/input/touchscreen.h
+++ b/include/linux/input/touchscreen.h
@@ -18,7 +18,14 @@ struct touchscreen_properties {
 };
 
 void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
-				  struct touchscreen_properties *prop);
+				  struct touchscreen_properties *prop,
+				  const char *settings_override);
+
+int touchscreen_property_read_u32(struct device *dev, const char *propname,
+				  const char *settings_override, u32 *val);
+
+bool touchscreen_property_read_bool(struct device *dev, const char *propname,
+				    const char *settings_override);
 
 void touchscreen_set_mt_pos(struct input_mt_pos *pos,
 			    const struct touchscreen_properties *prop,
-- 
2.31.1

