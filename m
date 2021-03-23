Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60CD13455FB
	for <lists+linux-input@lfdr.de>; Tue, 23 Mar 2021 04:12:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbhCWDMD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Mar 2021 23:12:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229854AbhCWDL4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Mar 2021 23:11:56 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3314FC061574;
        Mon, 22 Mar 2021 20:11:56 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id l3so12820973pfc.7;
        Mon, 22 Mar 2021 20:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Bw6ou2b/UUycUrCjLZNqn1jGVnf+rIcT1GHyMvgdwWs=;
        b=grnyNldgVY5GQIMeIJThNbn9Nu2yUJBf6GhDhuHh56xhjaYn3gUlrqY/DNBzS2Fvx2
         OXPEhnGjqYt6zwlqHMD+HBsmWMGWnd1Tx7lm66c+xMRKxYDSzzIcpTtfl1fGpIXwinz9
         ajWysYojNuBc0k6bSsHRGOdp4ItFYheoiqBjHTtPznXp49hOcELGCumX8JtJ77TK2aq7
         I/z3rt0Kr1LYOwTYQoHlh8H35Uzt1ZvovpmtQwMg3iGjuWUbHFof2D8jmfsqrasauWwj
         dcflEvZADVnz5tIVerD4grcUUf8F4/K+kDqXUjUdH6yNdv94DpYyGqCTEYbN2/kn1Tyj
         YHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Bw6ou2b/UUycUrCjLZNqn1jGVnf+rIcT1GHyMvgdwWs=;
        b=Kyo1CaJxAkSsEXSO21zKBzG8BYFjZz3nBAIXSiTM+q5rLRnYoWvK/D294uvKSDVnPV
         kZl4jYuxD9hoqzv0ZHX1JVZaQWW17oHlcnQ86ZR8/h5jtJwsn37GU/o4fYwa7rv2Lr/1
         ojZAm47pz7O0YgaWsH6hkrdHKou+I3aTd8CXsPp0PdyPFUrxxs965j8+rOF3PlAxDUK+
         eQ5+bN9quAeXxKzaWQBDI1PRIADoDY/5ZQYFIgqks0W/QILgVmwNXPmt9/USijlMcU4k
         zl05DqOSSRnvtJ6nkdZvMVl3rJKNB0BJ1ZqTJ6eLulPUQkIOFPH1UkL0fiOrp12gOiyc
         myXg==
X-Gm-Message-State: AOAM5330cZoIJ3BmwbHHTv3DXS5v1wXgAQlEDeF4shYLMwPoR+zLwKMP
        t5cuCU8BGKLO1aft6wBg0d8=
X-Google-Smtp-Source: ABdhPJwyFLomFDo4Z64ZpHtMTUaxABzUSEM+1GRFnAaArnOJw5L4z5ZykQN2D8DUEvNOCG09TYMUtQ==
X-Received: by 2002:a63:ce15:: with SMTP id y21mr2200437pgf.4.1616469115402;
        Mon, 22 Mar 2021 20:11:55 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:499f:7361:582b:fd05])
        by smtp.gmail.com with ESMTPSA id v14sm724265pju.19.2021.03.22.20.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 20:11:54 -0700 (PDT)
Date:   Mon, 22 Mar 2021 20:11:51 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Jeff LaBundy <jeff@labundy.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/5] dt-bindings: input: touchscreen: Move helper
 bindings to core
Message-ID: <YFlcd7tsM7yNUTya@google.com>
References: <1611459776-23265-1-git-send-email-jeff@labundy.com>
 <1611459776-23265-4-git-send-email-jeff@labundy.com>
 <20210209162740.GA3874323@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210209162740.GA3874323@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Feb 09, 2021 at 10:27:40AM -0600, Rob Herring wrote:
> On Sat, Jan 23, 2021 at 09:42:54PM -0600, Jeff LaBundy wrote:
> > With the helper functions moving to /drivers/input/ following the
> > discussion in [1], touchscreen.yaml and touchscreen.txt are moved
> > one level up as well to maintain a consistent directory structure.
> > 
> > No changes are made to either file except to update the $id field
> > in touchscreen.yaml to reflect the new path. The handful of .yaml
> > bindings that reference the original relative path are updated as
> > well.
> > 
> > Last but not least, the handful of .txt bindings that included an
> > absolute path to touchscreen.txt are updated too.
> > 
> > [1] https://patchwork.kernel.org/patch/11924029/
> > 
> > Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> > ---
> > Changes in v2:
> >  - Added this patch to the series
> > 
> >  .../devicetree/bindings/input/elan_i2c.txt         |  2 +-
> >  .../devicetree/bindings/input/touchscreen.txt      |  1 +
> >  .../devicetree/bindings/input/touchscreen.yaml     | 83 ++++++++++++++++++++++
> >  .../bindings/input/touchscreen/ads7846.txt         |  2 +-
> >  .../bindings/input/touchscreen/bu21013.txt         |  2 +-
> >  .../input/touchscreen/cypress,cy8ctma140.yaml      |  2 +-
> >  .../bindings/input/touchscreen/edt-ft5x06.yaml     |  2 +-
> >  .../bindings/input/touchscreen/eeti,exc3000.yaml   |  2 +-
> >  .../input/touchscreen/elan,elants_i2c.yaml         |  2 +-
> >  .../bindings/input/touchscreen/goodix.yaml         |  2 +-
> >  .../bindings/input/touchscreen/iqs5xx.txt          |  2 +-
> >  .../bindings/input/touchscreen/mms114.txt          |  2 +-
> >  .../bindings/input/touchscreen/touchscreen.txt     |  1 -
> >  .../bindings/input/touchscreen/touchscreen.yaml    | 83 ----------------------
> >  14 files changed, 94 insertions(+), 94 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/input/touchscreen.txt
> >  create mode 100644 Documentation/devicetree/bindings/input/touchscreen.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
> >  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
> 
> No, I prefer the current structure. It's easier to find similar types of 
> h/w as-is. In fact, if you wanted to move keyboards/keypads to their own 
> subdir, I'd welcome that.

I agree that we should keep all touchscreens in the same subdirectory,
however the bindings in touchscreen.yaml are applicable to all touch
controllers and not only touchscreens, so I'd like to rename it to
touch-controller.yaml and move it to bindings/input/.

Is it possible to have bindings/input/touchscreen/touchscreen.yaml
include bindings/input/touch-controller.yaml?

I also want to get in the patch below where we accept not only
"touchscreen-*" properties that I want deprecate, but "touch-*'
properties. If we agree I will try to adjust bindings to reflect the new
names and mark old ones deprecated.

Thanks!

-- 
Dmitry


Input: rename touchscreen helper module to touch-helper

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Because functionality in drivers/input/touchscreen.c is applicable to all
touch controllers (i.e. not only to touchscreens but touchpads as well),
let's rename it to touch-helper.c and rename all APIs from touchscreen_*()
to touch_*() and accept properties with prefix "touch-*" as well as
"touchscreen-*".

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/Makefile             |    2 
 drivers/input/touch-helper.c       |  220 ++++++++++++++++++++++++++++++++++++
 drivers/input/touchscreen.c        |  207 ----------------------------------
 include/linux/input/touch-helper.h |   32 +++++
 include/linux/input/touchscreen.h  |   30 +++--
 5 files changed, 269 insertions(+), 222 deletions(-)
 create mode 100644 drivers/input/touch-helper.c
 delete mode 100644 drivers/input/touchscreen.c
 create mode 100644 include/linux/input/touch-helper.h

diff --git a/drivers/input/Makefile b/drivers/input/Makefile
index 037cc595106c..c81b16090437 100644
--- a/drivers/input/Makefile
+++ b/drivers/input/Makefile
@@ -7,7 +7,7 @@
 
 obj-$(CONFIG_INPUT)		+= input-core.o
 input-core-y := input.o input-compat.o input-mt.o input-poller.o ff-core.o
-input-core-y += touchscreen.o
+input-core-y += touch-helper.o
 
 obj-$(CONFIG_INPUT_FF_MEMLESS)	+= ff-memless.o
 obj-$(CONFIG_INPUT_SPARSEKMAP)	+= sparse-keymap.o
diff --git a/drivers/input/touch-helper.c b/drivers/input/touch-helper.c
new file mode 100644
index 000000000000..f29bb447c51f
--- /dev/null
+++ b/drivers/input/touch-helper.c
@@ -0,0 +1,220 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ *  Generic helper functions for touchscreens and other two-dimensional
+ *  pointing devices
+ *
+ *  Copyright (c) 2014 Sebastian Reichel <sre@kernel.org>
+ */
+
+#include <linux/property.h>
+#include <linux/input.h>
+#include <linux/input/mt.h>
+#include <linux/input/touch-helper.h>
+#include <linux/module.h>
+
+static const char * const prefixes[] = { "touch", "touchscreen" };
+
+static bool touch_get_prop_u32(struct device *dev,
+			       const char *property,
+			       unsigned int default_value,
+			       unsigned int *value)
+{
+	char propname[32];
+	u32 val;
+	int error;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(prefixes); i++) {
+		snprintf(propname, sizeof(propname),
+			 "%s-%s", prefixes[i], property);
+		error = device_property_read_u32(dev, propname, &val);
+		if (!error) {
+			*value = val;
+			return true;
+		}
+	}
+
+	*value = default_value;
+	return false;
+}
+
+static bool touch_get_prop_bool(struct device *dev, const char *property)
+{
+	char propname[32];
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(prefixes); i++) {
+		snprintf(propname, sizeof(propname),
+			 "%s-%s", prefixes[i], property);
+		if (device_property_read_bool(dev, propname))
+			return true;
+	}
+
+	return false;
+}
+
+static void touch_set_params(struct input_dev *dev, unsigned long axis,
+			     int min, int max, int fuzz)
+{
+	struct input_absinfo *absinfo;
+
+	if (!test_bit(axis, dev->absbit)) {
+		dev_warn(&dev->dev,
+			 "Parameters are specified but the axis %lu is not set up\n",
+			 axis);
+		return;
+	}
+
+	absinfo = &dev->absinfo[axis];
+	absinfo->minimum = min;
+	absinfo->maximum = max;
+	absinfo->fuzz = fuzz;
+}
+
+/**
+ * touch_parse_properties - parse common touch controller properties
+ * @input: input device that should be parsed
+ * @multitouch: specifies whether parsed properties should be applied to
+ *	single-touch or multi-touch axes
+ * @prop: pointer to a struct touch_properties into which to store
+ *	axis swap and invert info for use with touchscreen_report_x_y();
+ *	or %NULL
+ *
+ * This function parses common properties for touchi controllers and sets
+ * up the input device accordingly. The function keeps previously set up
+ * default values if no value is specified.
+ */
+void touch_parse_properties(struct input_dev *input, bool multitouch,
+			    struct touch_properties *prop)
+{
+	struct device *dev = input->dev.parent;
+	struct input_absinfo *absinfo;
+	unsigned int axis, axis_x, axis_y;
+	unsigned int minimum, maximum, fuzz;
+	bool data_present;
+
+	input_alloc_absinfo(input);
+	if (!input->absinfo)
+		return;
+
+	axis_x = multitouch ? ABS_MT_POSITION_X : ABS_X;
+	axis_y = multitouch ? ABS_MT_POSITION_Y : ABS_Y;
+
+	data_present = touch_get_prop_u32(dev, "min-x",
+					  input_abs_get_min(input, axis_x),
+					  &minimum) |
+		       touch_get_prop_u32(dev, "size-x",
+					  input_abs_get_max(input, axis_x) + 1,
+					  &maximum) |
+		       touch_get_prop_u32(dev, "fuzz-x",
+					  input_abs_get_fuzz(input, axis_x),
+					  &fuzz);
+	if (data_present)
+		touch_set_params(input, axis_x, minimum, maximum - 1, fuzz);
+
+	data_present = touch_get_prop_u32(dev, "min-y",
+					  input_abs_get_min(input, axis_y),
+					  &minimum) |
+		       touch_get_prop_u32(dev, "size-y",
+					  input_abs_get_max(input, axis_y) + 1,
+					  &maximum) |
+		       touch_get_prop_u32(dev, "fuzz-y",
+					  input_abs_get_fuzz(input, axis_y),
+					  &fuzz);
+	if (data_present)
+		touch_set_params(input, axis_y, minimum, maximum - 1, fuzz);
+
+	axis = multitouch ? ABS_MT_PRESSURE : ABS_PRESSURE;
+	data_present = touch_get_prop_u32(dev, "max-pressure",
+					  input_abs_get_max(input, axis),
+					  &maximum) |
+		       touch_get_prop_u32(dev, "fuzz-pressure",
+					  input_abs_get_fuzz(input, axis),
+					  &fuzz);
+	if (data_present)
+		touch_set_params(input, axis, 0, maximum, fuzz);
+
+	if (!prop)
+		return;
+
+	prop->max_x = input_abs_get_max(input, axis_x);
+	prop->max_y = input_abs_get_max(input, axis_y);
+
+	prop->invert_x = touch_get_prop_bool(dev, "inverted-x");
+	if (prop->invert_x) {
+		absinfo = &input->absinfo[axis_x];
+		absinfo->maximum -= absinfo->minimum;
+		absinfo->minimum = 0;
+	}
+
+	prop->invert_y = touch_get_prop_bool(dev, "inverted-y");
+	if (prop->invert_y) {
+		absinfo = &input->absinfo[axis_y];
+		absinfo->maximum -= absinfo->minimum;
+		absinfo->minimum = 0;
+	}
+
+	prop->swap_x_y = touch_get_prop_bool(dev, "swapped-x-y");
+	if (prop->swap_x_y)
+		swap(input->absinfo[axis_x], input->absinfo[axis_y]);
+}
+EXPORT_SYMBOL(touch_parse_properties);
+
+static void touch_apply_prop_to_x_y(const struct touch_properties *prop,
+				    unsigned int *x, unsigned int *y)
+{
+	if (prop->invert_x)
+		*x = prop->max_x - *x;
+
+	if (prop->invert_y)
+		*y = prop->max_y - *y;
+
+	if (prop->swap_x_y)
+		swap(*x, *y);
+}
+
+/**
+ * touch_set_mt_pos - Set input_mt_pos coordinates
+ * @pos: input_mt_pos to set coordinates of
+ * @prop: pointer to a struct touchscreen_properties
+ * @x: X coordinate to store in pos
+ * @y: Y coordinate to store in pos
+ *
+ * Adjust the passed in x and y values applying any axis inversion and
+ * swapping requested in the passed in struct touch_properties and store
+ * the result in a struct input_mt_pos.
+ */
+void touch_set_mt_pos(struct input_mt_pos *pos,
+		      const struct touch_properties *prop,
+		      unsigned int x, unsigned int y)
+{
+	touch_apply_prop_to_x_y(prop, &x, &y);
+	pos->x = x;
+	pos->y = y;
+}
+EXPORT_SYMBOL(touch_set_mt_pos);
+
+/**
+ * touch_report_pos - Report touch coordinates
+ * @input: input_device to report coordinates for
+ * @prop: pointer to a struct touch_properties
+ * @x: X coordinate to report
+ * @y: Y coordinate to report
+ * @multitouch: Report coordinates on single-touch or multi-touch axes
+ *
+ * Adjust the passed in x and y values applying any axis inversion and
+ * swapping requested in the passed in struct touch_properties and then
+ * report the resulting coordinates on the input_dev's x and y axis.
+ */
+void touch_report_pos(struct input_dev *input,
+		      const struct touch_properties *prop,
+		      unsigned int x, unsigned int y, bool multitouch)
+{
+	touch_apply_prop_to_x_y(prop, &x, &y);
+	input_report_abs(input, multitouch ? ABS_MT_POSITION_X : ABS_X, x);
+	input_report_abs(input, multitouch ? ABS_MT_POSITION_Y : ABS_Y, y);
+}
+EXPORT_SYMBOL(touch_report_pos);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Helper functions for touchscreens and other devices");
diff --git a/drivers/input/touchscreen.c b/drivers/input/touchscreen.c
deleted file mode 100644
index dd18cb917c4d..000000000000
--- a/drivers/input/touchscreen.c
+++ /dev/null
@@ -1,207 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- *  Generic helper functions for touchscreens and other two-dimensional
- *  pointing devices
- *
- *  Copyright (c) 2014 Sebastian Reichel <sre@kernel.org>
- */
-
-#include <linux/property.h>
-#include <linux/input.h>
-#include <linux/input/mt.h>
-#include <linux/input/touchscreen.h>
-#include <linux/module.h>
-
-static bool touchscreen_get_prop_u32(struct device *dev,
-				     const char *property,
-				     unsigned int default_value,
-				     unsigned int *value)
-{
-	u32 val;
-	int error;
-
-	error = device_property_read_u32(dev, property, &val);
-	if (error) {
-		*value = default_value;
-		return false;
-	}
-
-	*value = val;
-	return true;
-}
-
-static void touchscreen_set_params(struct input_dev *dev,
-				   unsigned long axis,
-				   int min, int max, int fuzz)
-{
-	struct input_absinfo *absinfo;
-
-	if (!test_bit(axis, dev->absbit)) {
-		dev_warn(&dev->dev,
-			 "Parameters are specified but the axis %lu is not set up\n",
-			 axis);
-		return;
-	}
-
-	absinfo = &dev->absinfo[axis];
-	absinfo->minimum = min;
-	absinfo->maximum = max;
-	absinfo->fuzz = fuzz;
-}
-
-/**
- * touchscreen_parse_properties - parse common touchscreen properties
- * @input: input device that should be parsed
- * @multitouch: specifies whether parsed properties should be applied to
- *	single-touch or multi-touch axes
- * @prop: pointer to a struct touchscreen_properties into which to store
- *	axis swap and invert info for use with touchscreen_report_x_y();
- *	or %NULL
- *
- * This function parses common properties for touchscreens and sets up the
- * input device accordingly. The function keeps previously set up default
- * values if no value is specified.
- */
-void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
-				  struct touchscreen_properties *prop)
-{
-	struct device *dev = input->dev.parent;
-	struct input_absinfo *absinfo;
-	unsigned int axis, axis_x, axis_y;
-	unsigned int minimum, maximum, fuzz;
-	bool data_present;
-
-	input_alloc_absinfo(input);
-	if (!input->absinfo)
-		return;
-
-	axis_x = multitouch ? ABS_MT_POSITION_X : ABS_X;
-	axis_y = multitouch ? ABS_MT_POSITION_Y : ABS_Y;
-
-	data_present = touchscreen_get_prop_u32(dev, "touchscreen-min-x",
-						input_abs_get_min(input, axis_x),
-						&minimum) |
-		       touchscreen_get_prop_u32(dev, "touchscreen-size-x",
-						input_abs_get_max(input,
-								  axis_x) + 1,
-						&maximum) |
-		       touchscreen_get_prop_u32(dev, "touchscreen-fuzz-x",
-						input_abs_get_fuzz(input, axis_x),
-						&fuzz);
-	if (data_present)
-		touchscreen_set_params(input, axis_x, minimum, maximum - 1, fuzz);
-
-	data_present = touchscreen_get_prop_u32(dev, "touchscreen-min-y",
-						input_abs_get_min(input, axis_y),
-						&minimum) |
-		       touchscreen_get_prop_u32(dev, "touchscreen-size-y",
-						input_abs_get_max(input,
-								  axis_y) + 1,
-						&maximum) |
-		       touchscreen_get_prop_u32(dev, "touchscreen-fuzz-y",
-						input_abs_get_fuzz(input, axis_y),
-						&fuzz);
-	if (data_present)
-		touchscreen_set_params(input, axis_y, minimum, maximum - 1, fuzz);
-
-	axis = multitouch ? ABS_MT_PRESSURE : ABS_PRESSURE;
-	data_present = touchscreen_get_prop_u32(dev,
-						"touchscreen-max-pressure",
-						input_abs_get_max(input, axis),
-						&maximum) |
-		       touchscreen_get_prop_u32(dev,
-						"touchscreen-fuzz-pressure",
-						input_abs_get_fuzz(input, axis),
-						&fuzz);
-	if (data_present)
-		touchscreen_set_params(input, axis, 0, maximum, fuzz);
-
-	if (!prop)
-		return;
-
-	prop->max_x = input_abs_get_max(input, axis_x);
-	prop->max_y = input_abs_get_max(input, axis_y);
-
-	prop->invert_x =
-		device_property_read_bool(dev, "touchscreen-inverted-x");
-	if (prop->invert_x) {
-		absinfo = &input->absinfo[axis_x];
-		absinfo->maximum -= absinfo->minimum;
-		absinfo->minimum = 0;
-	}
-
-	prop->invert_y =
-		device_property_read_bool(dev, "touchscreen-inverted-y");
-	if (prop->invert_y) {
-		absinfo = &input->absinfo[axis_y];
-		absinfo->maximum -= absinfo->minimum;
-		absinfo->minimum = 0;
-	}
-
-	prop->swap_x_y =
-		device_property_read_bool(dev, "touchscreen-swapped-x-y");
-	if (prop->swap_x_y)
-		swap(input->absinfo[axis_x], input->absinfo[axis_y]);
-}
-EXPORT_SYMBOL(touchscreen_parse_properties);
-
-static void
-touchscreen_apply_prop_to_x_y(const struct touchscreen_properties *prop,
-			      unsigned int *x, unsigned int *y)
-{
-	if (prop->invert_x)
-		*x = prop->max_x - *x;
-
-	if (prop->invert_y)
-		*y = prop->max_y - *y;
-
-	if (prop->swap_x_y)
-		swap(*x, *y);
-}
-
-/**
- * touchscreen_set_mt_pos - Set input_mt_pos coordinates
- * @pos: input_mt_pos to set coordinates of
- * @prop: pointer to a struct touchscreen_properties
- * @x: X coordinate to store in pos
- * @y: Y coordinate to store in pos
- *
- * Adjust the passed in x and y values applying any axis inversion and
- * swapping requested in the passed in touchscreen_properties and store
- * the result in a struct input_mt_pos.
- */
-void touchscreen_set_mt_pos(struct input_mt_pos *pos,
-			    const struct touchscreen_properties *prop,
-			    unsigned int x, unsigned int y)
-{
-	touchscreen_apply_prop_to_x_y(prop, &x, &y);
-	pos->x = x;
-	pos->y = y;
-}
-EXPORT_SYMBOL(touchscreen_set_mt_pos);
-
-/**
- * touchscreen_report_pos - Report touchscreen coordinates
- * @input: input_device to report coordinates for
- * @prop: pointer to a struct touchscreen_properties
- * @x: X coordinate to report
- * @y: Y coordinate to report
- * @multitouch: Report coordinates on single-touch or multi-touch axes
- *
- * Adjust the passed in x and y values applying any axis inversion and
- * swapping requested in the passed in touchscreen_properties and then
- * report the resulting coordinates on the input_dev's x and y axis.
- */
-void touchscreen_report_pos(struct input_dev *input,
-			    const struct touchscreen_properties *prop,
-			    unsigned int x, unsigned int y,
-			    bool multitouch)
-{
-	touchscreen_apply_prop_to_x_y(prop, &x, &y);
-	input_report_abs(input, multitouch ? ABS_MT_POSITION_X : ABS_X, x);
-	input_report_abs(input, multitouch ? ABS_MT_POSITION_Y : ABS_Y, y);
-}
-EXPORT_SYMBOL(touchscreen_report_pos);
-
-MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("Helper functions for touchscreens and other devices");
diff --git a/include/linux/input/touch-helper.h b/include/linux/input/touch-helper.h
new file mode 100644
index 000000000000..c9cafacf7a6e
--- /dev/null
+++ b/include/linux/input/touch-helper.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2014 Sebastian Reichel <sre@kernel.org>
+ */
+
+#ifndef _TOUCH_HELPER_H
+#define _TOUCH_HELPER_H
+
+struct input_dev;
+struct input_mt_pos;
+
+struct touch_properties {
+	unsigned int max_x;
+	unsigned int max_y;
+	bool invert_x;
+	bool invert_y;
+	bool swap_x_y;
+};
+
+void touch_parse_properties(struct input_dev *input, bool multitouch,
+			    struct touch_properties *prop);
+
+void touch_set_mt_pos(struct input_mt_pos *pos,
+		      const struct touch_properties *prop,
+		      unsigned int x, unsigned int y);
+
+void touch_report_pos(struct input_dev *input,
+		      const struct touch_properties *prop,
+		      unsigned int x, unsigned int y,
+		      bool multitouch);
+
+#endif
diff --git a/include/linux/input/touchscreen.h b/include/linux/input/touchscreen.h
index fe66e2b58f62..fa202ec436df 100644
--- a/include/linux/input/touchscreen.h
+++ b/include/linux/input/touchscreen.h
@@ -6,27 +6,29 @@
 #ifndef _TOUCHSCREEN_H
 #define _TOUCHSCREEN_H
 
-struct input_dev;
-struct input_mt_pos;
+#include <linux/input/touch-helper.h>
 
-struct touchscreen_properties {
-	unsigned int max_x;
-	unsigned int max_y;
-	bool invert_x;
-	bool invert_y;
-	bool swap_x_y;
-};
+#define touchscreen_properties touch_properties
 
 void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
-				  struct touchscreen_properties *prop);
+				  struct touch_properties *prop)
+{
+	touch_parse_properties(input, multitouch, prop);
+}
 
 void touchscreen_set_mt_pos(struct input_mt_pos *pos,
-			    const struct touchscreen_properties *prop,
-			    unsigned int x, unsigned int y);
+			    const struct touch_properties *prop,
+			    unsigned int x, unsigned int y)
+{
+	touch_set_mt_pos(pos, prop, x, y);
+}
 
 void touchscreen_report_pos(struct input_dev *input,
-			    const struct touchscreen_properties *prop,
+			    const struct touch_properties *prop,
 			    unsigned int x, unsigned int y,
-			    bool multitouch);
+			    bool multitouch)
+{
+	touch_report_pos(input, prop, x, y, multitouch);
+}
 
 #endif
