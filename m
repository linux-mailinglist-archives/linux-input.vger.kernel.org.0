Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CFEC17822B
	for <lists+linux-input@lfdr.de>; Tue,  3 Mar 2020 20:03:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731494AbgCCSJW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Mar 2020 13:09:22 -0500
Received: from mga12.intel.com ([192.55.52.136]:8618 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732589AbgCCSJV (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 3 Mar 2020 13:09:21 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Mar 2020 10:09:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,511,1574150400"; 
   d="scan'208";a="386871957"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 03 Mar 2020 10:09:19 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 7882A17C; Tue,  3 Mar 2020 20:09:18 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/5] Input: of_touchscreen - explicitly choose axis
Date:   Tue,  3 Mar 2020 20:09:13 +0200
Message-Id: <20200303180917.12563-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The 'axis + 1' calculation is implicit and potentially error prone.
Moreover, few lines before the axis is set explicitly for both X and Y.

Do the same when retrieving different properties for X and Y.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/input/touchscreen/of_touchscreen.c | 35 +++++++++++-----------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/drivers/input/touchscreen/of_touchscreen.c b/drivers/input/touchscreen/of_touchscreen.c
index e16ec4c7043a..97342e14b4f1 100644
--- a/drivers/input/touchscreen/of_touchscreen.c
+++ b/drivers/input/touchscreen/of_touchscreen.c
@@ -66,7 +66,7 @@ void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
 {
 	struct device *dev = input->dev.parent;
 	struct input_absinfo *absinfo;
-	unsigned int axis;
+	unsigned int axis, axis_x, axis_y;
 	unsigned int minimum, maximum, fuzz;
 	bool data_present;
 
@@ -74,33 +74,34 @@ void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
 	if (!input->absinfo)
 		return;
 
-	axis = multitouch ? ABS_MT_POSITION_X : ABS_X;
+	axis_x = multitouch ? ABS_MT_POSITION_X : ABS_X;
+	axis_y = multitouch ? ABS_MT_POSITION_Y : ABS_Y;
+
 	data_present = touchscreen_get_prop_u32(dev, "touchscreen-min-x",
-						input_abs_get_min(input, axis),
+						input_abs_get_min(input, axis_x),
 						&minimum) |
 		       touchscreen_get_prop_u32(dev, "touchscreen-size-x",
 						input_abs_get_max(input,
-								  axis) + 1,
+								  axis_x) + 1,
 						&maximum) |
 		       touchscreen_get_prop_u32(dev, "touchscreen-fuzz-x",
-						input_abs_get_fuzz(input, axis),
+						input_abs_get_fuzz(input, axis_x),
 						&fuzz);
 	if (data_present)
-		touchscreen_set_params(input, axis, minimum, maximum - 1, fuzz);
+		touchscreen_set_params(input, axis_x, minimum, maximum - 1, fuzz);
 
-	axis = multitouch ? ABS_MT_POSITION_Y : ABS_Y;
 	data_present = touchscreen_get_prop_u32(dev, "touchscreen-min-y",
-						input_abs_get_min(input, axis),
+						input_abs_get_min(input, axis_y),
 						&minimum) |
 		       touchscreen_get_prop_u32(dev, "touchscreen-size-y",
 						input_abs_get_max(input,
-								  axis) + 1,
+								  axis_y) + 1,
 						&maximum) |
 		       touchscreen_get_prop_u32(dev, "touchscreen-fuzz-y",
-						input_abs_get_fuzz(input, axis),
+						input_abs_get_fuzz(input, axis_y),
 						&fuzz);
 	if (data_present)
-		touchscreen_set_params(input, axis, minimum, maximum - 1, fuzz);
+		touchscreen_set_params(input, axis_y, minimum, maximum - 1, fuzz);
 
 	axis = multitouch ? ABS_MT_PRESSURE : ABS_PRESSURE;
 	data_present = touchscreen_get_prop_u32(dev,
@@ -117,15 +118,13 @@ void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
 	if (!prop)
 		return;
 
-	axis = multitouch ? ABS_MT_POSITION_X : ABS_X;
-
-	prop->max_x = input_abs_get_max(input, axis);
-	prop->max_y = input_abs_get_max(input, axis + 1);
+	prop->max_x = input_abs_get_max(input, axis_x);
+	prop->max_y = input_abs_get_max(input, axis_y);
 
 	prop->invert_x =
 		device_property_read_bool(dev, "touchscreen-inverted-x");
 	if (prop->invert_x) {
-		absinfo = &input->absinfo[axis];
+		absinfo = &input->absinfo[axis_x];
 		absinfo->maximum -= absinfo->minimum;
 		absinfo->minimum = 0;
 	}
@@ -133,7 +132,7 @@ void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
 	prop->invert_y =
 		device_property_read_bool(dev, "touchscreen-inverted-y");
 	if (prop->invert_y) {
-		absinfo = &input->absinfo[axis + 1];
+		absinfo = &input->absinfo[axis_y];
 		absinfo->maximum -= absinfo->minimum;
 		absinfo->minimum = 0;
 	}
@@ -141,7 +140,7 @@ void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
 	prop->swap_x_y =
 		device_property_read_bool(dev, "touchscreen-swapped-x-y");
 	if (prop->swap_x_y)
-		swap(input->absinfo[axis], input->absinfo[axis + 1]);
+		swap(input->absinfo[axis_x], input->absinfo[axis_y]);
 }
 EXPORT_SYMBOL(touchscreen_parse_properties);
 
-- 
2.25.1

