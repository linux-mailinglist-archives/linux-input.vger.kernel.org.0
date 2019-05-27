Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 800162B8CD
	for <lists+linux-input@lfdr.de>; Mon, 27 May 2019 18:15:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbfE0QP2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 May 2019 12:15:28 -0400
Received: from ironport.klsmartin.com ([212.211.191.11]:19886 "EHLO
        ironport.klsmartin.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726432AbfE0QP2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 May 2019 12:15:28 -0400
X-Greylist: delayed 429 seconds by postgrey-1.27 at vger.kernel.org; Mon, 27 May 2019 12:15:19 EDT
X-IronPort-AV: E=Sophos;i="5.60,519,1549926000"; 
   d="scan'208";a="1674683"
Received: from unknown (HELO hera.klsmartin.com) ([172.30.5.66])
  by ironport.klsmartin.com with ESMTP/TLS/DHE-RSA-AES256-SHA; 27 May 2019 18:08:22 +0200
Received: from SUMMAIL01.UMK.KLS.zentral ([172.25.1.63])
        by hera.klsmartin.com (8.14.3/8.13.1/SuSE Linux 0.7) with ESMTP id x4RG8DfK028509;
        Mon, 27 May 2019 18:08:15 +0200
Received: from UML026.UMK.KLS.zentral (172.25.2.60) by
 SUMMAIL01.UMK.KLS.zentral (172.25.1.63) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 27 May 2019 18:08:15 +0200
From:   Leif Middelschulte <leif.middelschulte@klsmartin.com>
To:     <dmitry.torokhov@gmail.com>, <devicetree@vger.kernel.org>
CC:     <linux-input@vger.kernel.org>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>,
        Leif Middelschulte <leif.middelschulte@klsmartin.com>
Subject: [PATCH 04/10] Input: stmpe-ts - implement resolution support
Date:   Mon, 27 May 2019 18:07:30 +0200
Message-ID: <20190527160736.30569-5-leif.middelschulte@klsmartin.com>
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

The resolution is calculated based on the devicetree property
`touchscreen-{x,y}-mm`. It matches the prosa definition given in
uapi/linux/input.h.

Beware that the resolution is affected, if window-tracking
parameters are applied.

Signed-off-by: Leif Middelschulte <leif.middelschulte@klsmartin.com>
---
 drivers/input/touchscreen/stmpe-ts.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/stmpe-ts.c b/drivers/input/touchscreen/stmpe-ts.c
index 6917237bd6c6..1f11043a04df 100644
--- a/drivers/input/touchscreen/stmpe-ts.c
+++ b/drivers/input/touchscreen/stmpe-ts.c
@@ -102,7 +102,7 @@ struct stmpe_touch {
 	struct {
 		u32 x;
 		u32 y;
-	}	min;
+	}	size_in_mm, min;
 };
 
 static int __stmpe_reset_fifo(struct stmpe *stmpe)
@@ -346,6 +346,10 @@ static void stmpe_ts_get_platform_info(struct platform_device *pdev,
 	u32 val;
 	u16 wdw[4];
 
+	// use sensible (with regards to calculations) default values
+	ts->size_in_mm.x = 1;
+	ts->size_in_mm.y = 1;
+
 	if (np) {
 		if (!of_property_read_u32(np, "st,sample-time", &val))
 			ts->stmpe->sample_time = val;
@@ -373,6 +377,10 @@ static void stmpe_ts_get_platform_info(struct platform_device *pdev,
 			ts->wdw.bottom_left.y = wdw[3] & XY_MASK;
 			ts->wdw_from_dt = true;
 		}
+		if (!of_property_read_u32(np, "touchscreen-x-mm", &val))
+			ts->size_in_mm.x = val;
+		if (!of_property_read_u32(np, "touchscreen-y-mm", &val))
+			ts->size_in_mm.y = val;
 		touchscreen_parse_properties(ts->idev, false, &ts->props);
 	}
 }
@@ -384,6 +392,7 @@ static int stmpe_input_probe(struct platform_device *pdev)
 	struct input_dev *idev;
 	int error;
 	int ts_irq;
+	int resolution;
 
 	ts_irq = platform_get_irq_byname(pdev, "FIFO_TH");
 	if (ts_irq < 0)
@@ -430,8 +439,12 @@ static int stmpe_input_probe(struct platform_device *pdev)
 	input_set_capability(idev, EV_KEY, BTN_TOUCH);
 	input_set_abs_params(idev,
 		ABS_X, ts->min.x, ts->props.max_x, 0, 0);
+	resolution = (ts->props.max_x - ts->min.x) / ts->size_in_mm.x;
+	input_abs_set_res(idev, ABS_X, resolution);
 	input_set_abs_params(idev,
 		ABS_Y, ts->min.y, ts->props.max_y, 0, 0);
+	resolution = (ts->props.max_y - ts->min.y) / ts->size_in_mm.y;
+	input_abs_set_res(idev, ABS_Y, resolution);
 	input_set_abs_params(idev, ABS_PRESSURE, 0x0, 0xff, 0, 0);
 
 	error = input_register_device(idev);
-- 
2.21.0

