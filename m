Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAF4F2B8D9
	for <lists+linux-input@lfdr.de>; Mon, 27 May 2019 18:20:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbfE0QUP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 May 2019 12:20:15 -0400
Received: from ironport.klsmartin.com ([212.211.191.11]:28603 "EHLO
        ironport.klsmartin.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725991AbfE0QUP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 May 2019 12:20:15 -0400
X-IronPort-AV: E=Sophos;i="5.60,519,1549926000"; 
   d="scan'208";a="1674794"
Received: from unknown (HELO hera.klsmartin.com) ([172.30.5.66])
  by ironport.klsmartin.com with ESMTP/TLS/DHE-RSA-AES256-SHA; 27 May 2019 18:20:14 +0200
Received: from SUMMAIL01.UMK.KLS.zentral ([172.25.1.63])
        by hera.klsmartin.com (8.14.3/8.13.1/SuSE Linux 0.7) with ESMTP id x4RGK6Vl002847;
        Mon, 27 May 2019 18:20:08 +0200
Received: from UML026.UMK.KLS.zentral (172.25.2.60) by
 SUMMAIL01.UMK.KLS.zentral (172.25.1.63) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 27 May 2019 18:20:08 +0200
From:   Leif Middelschulte <leif.middelschulte@klsmartin.com>
To:     <dmitry.torokhov@gmail.com>, <devicetree@vger.kernel.org>
CC:     <linux-input@vger.kernel.org>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>,
        Leif Middelschulte <leif.middelschulte@klsmartin.com>
Subject: [PATCH 06/10] Input: stmpe-ts - implement XY acquisition mode
Date:   Mon, 27 May 2019 18:19:34 +0200
Message-ID: <20190527161938.31871-2-leif.middelschulte@klsmartin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190527161938.31871-1-leif.middelschulte@klsmartin.com>
References: <20190527160736.30569-1-leif.middelschulte@klsmartin.com>
 <20190527161938.31871-1-leif.middelschulte@klsmartin.com>
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

While the default acquisition covers the pressure (z) too,
the XY mode is only concerend with the horizontal and vertical
input position acquisition.
It uses dedicated registers for each axes to do so, while the
XYZ acquisition packs the read values more densely.

Signed-off-by: Leif Middelschulte <leif.middelschulte@klsmartin.com>
---
 drivers/input/touchscreen/stmpe-ts.c | 45 ++++++++++++++++++++++------
 1 file changed, 36 insertions(+), 9 deletions(-)

diff --git a/drivers/input/touchscreen/stmpe-ts.c b/drivers/input/touchscreen/stmpe-ts.c
index 1f11043a04df..152aac8b3ab7 100644
--- a/drivers/input/touchscreen/stmpe-ts.c
+++ b/drivers/input/touchscreen/stmpe-ts.c
@@ -40,11 +40,14 @@
 #define STMPE_REG_WDW_TR_Y		0x44
 #define STMPE_REG_WDW_BL_X		0x46
 #define STMPE_REG_WDW_BL_Y		0x48
+#define STMPE_REG_TSC_DATA_X		0x4D
+#define STMPE_REG_TSC_DATA_Y		0x4F
 #define STMPE_REG_TSC_DATA_XYZ		0x52
 #define STMPE_REG_TSC_FRACTION_Z	0x56
 #define STMPE_REG_TSC_I_DRIVE		0x58
 
 #define OP_MOD_XYZ			0
+#define OP_MOD_XY			1
 
 #define STMPE_TSC_CTRL_TSC_EN		(1<<0)
 
@@ -87,6 +90,7 @@ struct stmpe_touch {
 	u8 settling;
 	u8 fraction_z;
 	u8 i_drive;
+	u8 op_mod;
 	struct {
 	struct {
 		u16 x;
@@ -174,6 +178,7 @@ static irqreturn_t stmpe_ts_handler(int irq, void *data)
 {
 	u8 data_set[4];
 	int x, y, z;
+	bool report_pressure = false;
 	struct stmpe_touch *ts = data;
 
 	/*
@@ -191,18 +196,35 @@ static irqreturn_t stmpe_ts_handler(int irq, void *data)
 	stmpe_set_bits(ts->stmpe, STMPE_REG_TSC_CTRL,
 				STMPE_TSC_CTRL_TSC_EN, 0);
 
-	stmpe_block_read(ts->stmpe, STMPE_REG_TSC_DATA_XYZ, 4, data_set);
-
-	x = (data_set[0] << 4) | (data_set[1] >> 4);
-	y = ((data_set[1] & 0xf) << 8) | data_set[2];
-	z = data_set[3];
+	switch (ts->op_mod) {
+	case OP_MOD_XYZ:
+		stmpe_block_read(ts->stmpe,
+			STMPE_REG_TSC_DATA_XYZ, 4, data_set);
+		x = (data_set[0] << 4) | (data_set[1] >> 4);
+		y = ((data_set[1] & 0xf) << 8) | data_set[2];
+		z = data_set[3];
+		report_pressure = true;
+		break;
+	case OP_MOD_XY:
+		stmpe_block_read(ts->stmpe,
+			STMPE_REG_TSC_DATA_X, 2, data_set);
+		x = (data_set[0] << 8) | (data_set[1]);
+		stmpe_block_read(ts->stmpe,
+			STMPE_REG_TSC_DATA_Y, 2, data_set);
+		y = (data_set[0] << 8) | (data_set[1]);
+		break;
+	default:
+		goto _skip_input_events;
+	}
 
 	input_report_abs(ts->idev, ABS_X, x);
 	input_report_abs(ts->idev, ABS_Y, y);
-	input_report_abs(ts->idev, ABS_PRESSURE, z);
+	if (report_pressure)
+		input_report_abs(ts->idev, ABS_PRESSURE, z);
 	input_report_key(ts->idev, BTN_TOUCH, 1);
 	input_sync(ts->idev);
 
+_skip_input_events:
        /* flush the FIFO after we have read out our values. */
 	__stmpe_reset_fifo(ts->stmpe);
 
@@ -219,7 +241,7 @@ static irqreturn_t stmpe_ts_handler(int irq, void *data)
 static int stmpe_init_hw(struct stmpe_touch *ts)
 {
 	int ret;
-	u8 tsc_cfg, tsc_cfg_mask;
+	u8 tsc_cfg, tsc_cfg_mask, tsc_ctrl, tsc_ctrl_mask;
 	struct stmpe *stmpe = ts->stmpe;
 	struct device *dev = ts->dev;
 
@@ -306,10 +328,13 @@ static int stmpe_init_hw(struct stmpe_touch *ts)
 		return ret;
 	}
 
+	tsc_ctrl = STMPE_OP_MODE(ts->op_mod);
+	tsc_ctrl_mask = STMPE_OP_MODE(0xff);
+
 	ret = stmpe_set_bits(stmpe, STMPE_REG_TSC_CTRL,
-			STMPE_OP_MODE(0xff), STMPE_OP_MODE(OP_MOD_XYZ));
+			tsc_ctrl_mask, tsc_ctrl);
 	if (ret) {
-		dev_err(dev, "Could not set mode\n");
+		dev_err(dev, "Could not set control registers\n");
 		return ret;
 	}
 
@@ -357,6 +382,8 @@ static void stmpe_ts_get_platform_info(struct platform_device *pdev,
 			ts->stmpe->mod_12b = val;
 		if (!of_property_read_u32(np, "st,ref-sel", &val))
 			ts->stmpe->ref_sel = val;
+		if (!of_property_read_u32(np, "st,op-mod", &val))
+			ts->op_mod = val;
 		if (!of_property_read_u32(np, "st,adc-freq", &val))
 			ts->stmpe->adc_freq = val;
 		if (!of_property_read_u32(np, "st,ave-ctrl", &val))
-- 
2.21.0

