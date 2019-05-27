Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07C222B8C8
	for <lists+linux-input@lfdr.de>; Mon, 27 May 2019 18:15:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726645AbfE0QPX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 May 2019 12:15:23 -0400
Received: from ironport.klsmartin.com ([212.211.191.11]:19886 "EHLO
        ironport.klsmartin.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726432AbfE0QPX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 May 2019 12:15:23 -0400
X-Greylist: delayed 429 seconds by postgrey-1.27 at vger.kernel.org; Mon, 27 May 2019 12:15:19 EDT
X-IronPort-AV: E=Sophos;i="5.60,519,1549926000"; 
   d="scan'208";a="1674681"
Received: from unknown (HELO hera.klsmartin.com) ([172.30.5.66])
  by ironport.klsmartin.com with ESMTP/TLS/DHE-RSA-AES256-SHA; 27 May 2019 18:08:16 +0200
Received: from SUMMAIL01.UMK.KLS.zentral ([172.25.1.63])
        by hera.klsmartin.com (8.14.3/8.13.1/SuSE Linux 0.7) with ESMTP id x4RG87iI028503;
        Mon, 27 May 2019 18:08:09 +0200
Received: from UML026.UMK.KLS.zentral (172.25.2.60) by
 SUMMAIL01.UMK.KLS.zentral (172.25.1.63) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 27 May 2019 18:08:09 +0200
From:   Leif Middelschulte <leif.middelschulte@klsmartin.com>
To:     <dmitry.torokhov@gmail.com>, <devicetree@vger.kernel.org>
CC:     <linux-input@vger.kernel.org>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>,
        Leif Middelschulte <leif.middelschulte@klsmartin.com>
Subject: [PATCH 02/10] Input: stmpe-ts - implement touch window configuration support
Date:   Mon, 27 May 2019 18:07:28 +0200
Message-ID: <20190527160736.30569-3-leif.middelschulte@klsmartin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190527160736.30569-1-leif.middelschulte@klsmartin.com>
References: <20190527160736.30569-1-leif.middelschulte@klsmartin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [172.25.2.60]
X-KSE-ServerInfo: SUMMAIL01.UMK.KLS.zentral, 9
X-KSE-AttachmentFiltering-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 27.05.2019 13:23:00
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Touch window tracking allows to pre-set a sub-window in the
touchscreen area such that any touch position that is outside
the sub-window is discarded.

Signed-off-by: Leif Middelschulte <leif.middelschulte@klsmartin.com>
---
 drivers/input/touchscreen/stmpe-ts.c | 96 +++++++++++++++++++++++++++-
 1 file changed, 94 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/stmpe-ts.c b/drivers/input/touchscreen/stmpe-ts.c
index cf9c9aa39f6e..6917237bd6c6 100644
--- a/drivers/input/touchscreen/stmpe-ts.c
+++ b/drivers/input/touchscreen/stmpe-ts.c
@@ -19,6 +19,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/input.h>
+#include <linux/input/touchscreen.h>
 #include <linux/slab.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
@@ -35,6 +36,10 @@
 #define STMPE_REG_FIFO_TH		0x4A
 #define STMPE_REG_FIFO_STA		0x4B
 #define STMPE_REG_FIFO_SIZE		0x4C
+#define STMPE_REG_WDW_TR_X		0x42
+#define STMPE_REG_WDW_TR_Y		0x44
+#define STMPE_REG_WDW_BL_X		0x46
+#define STMPE_REG_WDW_BL_Y		0x48
 #define STMPE_REG_TSC_DATA_XYZ		0x52
 #define STMPE_REG_TSC_FRACTION_Z	0x56
 #define STMPE_REG_TSC_I_DRIVE		0x58
@@ -82,6 +87,22 @@ struct stmpe_touch {
 	u8 settling;
 	u8 fraction_z;
 	u8 i_drive;
+	struct {
+	struct {
+		u16 x;
+		u16 y;
+	} top_right;
+	struct {
+		u16 x;
+		u16 y;
+	} bottom_left;
+	} wdw;
+	bool wdw_from_dt;
+	struct touchscreen_properties props;
+	struct {
+		u32 x;
+		u32 y;
+	}	min;
 };
 
 static int __stmpe_reset_fifo(struct stmpe *stmpe)
@@ -128,6 +149,27 @@ static void stmpe_work(struct work_struct *work)
 	input_sync(ts->idev);
 }
 
+static void stmpe_update_range_values(struct stmpe_touch *ts)
+{
+	u8 data_set[2];
+	/*
+	 * Calculate max_x and max_y based on window size configuration read
+	 * from touchscreen controller
+	 */
+	stmpe_block_read(ts->stmpe, STMPE_REG_WDW_TR_X, 2, data_set);
+	ts->wdw.top_right.x = (data_set[0] << 8) | (data_set[1]);
+	stmpe_block_read(ts->stmpe, STMPE_REG_WDW_TR_Y, 2, data_set);
+	ts->wdw.top_right.y = (data_set[0] << 8) | (data_set[1]);
+	stmpe_block_read(ts->stmpe, STMPE_REG_WDW_BL_X, 2, data_set);
+	ts->wdw.bottom_left.x = (data_set[0] << 8) | (data_set[1]);
+	stmpe_block_read(ts->stmpe, STMPE_REG_WDW_BL_Y, 2, data_set);
+	ts->wdw.bottom_left.y = (data_set[0] << 8) | (data_set[1]);
+	ts->min.x = ts->wdw.bottom_left.x;
+	ts->min.y = ts->wdw.bottom_left.y;
+	ts->props.max_x = ts->wdw.top_right.x;
+	ts->props.max_y = ts->wdw.top_right.y;
+}
+
 static irqreturn_t stmpe_ts_handler(int irq, void *data)
 {
 	u8 data_set[4];
@@ -212,6 +254,44 @@ static int stmpe_init_hw(struct stmpe_touch *ts)
 		return ret;
 	}
 
+	if (ts->wdw_from_dt) {
+		u8 data_set[2];
+
+		data_set[0] = ts->wdw.top_right.x >> 8;
+		data_set[1] = ts->wdw.top_right.x;
+		ret = stmpe_block_write(ts->stmpe,
+			STMPE_REG_WDW_TR_X, 2, data_set);
+		if (ret) {
+			dev_err(dev, "Could not configure touchscreen window's top right x value\n");
+			return ret;
+		}
+		data_set[0] = ts->wdw.top_right.y >> 8;
+		data_set[1] = ts->wdw.top_right.y;
+		ret = stmpe_block_write(ts->stmpe,
+			STMPE_REG_WDW_TR_Y, 2, data_set);
+		if (ret) {
+			dev_err(dev, "Could not configure touchscreen window's top right y value\n");
+			return ret;
+		}
+		data_set[0] = ts->wdw.bottom_left.x >> 8;
+		data_set[1] = ts->wdw.bottom_left.x;
+		ret = stmpe_block_write(ts->stmpe,
+			STMPE_REG_WDW_BL_X, 2, data_set);
+		if (ret) {
+			dev_err(dev, "Could not configure touchscreen window's bottom left x value\n");
+			return ret;
+		}
+		data_set[0] = ts->wdw.bottom_left.y >> 8;
+		data_set[1] = ts->wdw.bottom_left.y;
+		ret = stmpe_block_write(ts->stmpe,
+			STMPE_REG_WDW_BL_Y, 2, data_set);
+		if (ret) {
+			dev_err(dev, "Could not configure touchscreen window's bottom left y value\n");
+			return ret;
+		}
+	}
+	stmpe_update_range_values(ts);
+
 	ret = stmpe_set_bits(stmpe, STMPE_REG_TSC_I_DRIVE,
 			STMPE_I_DRIVE(0xff), STMPE_I_DRIVE(ts->i_drive));
 	if (ret) {
@@ -264,6 +344,7 @@ static void stmpe_ts_get_platform_info(struct platform_device *pdev,
 {
 	struct device_node *np = pdev->dev.of_node;
 	u32 val;
+	u16 wdw[4];
 
 	if (np) {
 		if (!of_property_read_u32(np, "st,sample-time", &val))
@@ -284,6 +365,15 @@ static void stmpe_ts_get_platform_info(struct platform_device *pdev,
 			ts->fraction_z = val;
 		if (!of_property_read_u32(np, "st,i-drive", &val))
 			ts->i_drive = val;
+		if (!of_property_read_u16_array(np, "st,window-tracking",
+			wdw, 4)) {
+			ts->wdw.top_right.x = wdw[0] & XY_MASK;
+			ts->wdw.top_right.y = wdw[1] & XY_MASK;
+			ts->wdw.bottom_left.x = wdw[2] & XY_MASK;
+			ts->wdw.bottom_left.y = wdw[3] & XY_MASK;
+			ts->wdw_from_dt = true;
+		}
+		touchscreen_parse_properties(ts->idev, false, &ts->props);
 	}
 }
 
@@ -338,8 +428,10 @@ static int stmpe_input_probe(struct platform_device *pdev)
 	input_set_drvdata(idev, ts);
 
 	input_set_capability(idev, EV_KEY, BTN_TOUCH);
-	input_set_abs_params(idev, ABS_X, 0, XY_MASK, 0, 0);
-	input_set_abs_params(idev, ABS_Y, 0, XY_MASK, 0, 0);
+	input_set_abs_params(idev,
+		ABS_X, ts->min.x, ts->props.max_x, 0, 0);
+	input_set_abs_params(idev,
+		ABS_Y, ts->min.y, ts->props.max_y, 0, 0);
 	input_set_abs_params(idev, ABS_PRESSURE, 0x0, 0xff, 0, 0);
 
 	error = input_register_device(idev);
-- 
2.21.0

