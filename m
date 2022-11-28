Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91B4263A61C
	for <lists+linux-input@lfdr.de>; Mon, 28 Nov 2022 11:30:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229965AbiK1Kaz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Nov 2022 05:30:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230328AbiK1Kao (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Nov 2022 05:30:44 -0500
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81A091A82D
        for <linux-input@vger.kernel.org>; Mon, 28 Nov 2022 02:30:40 -0800 (PST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id F16B2201396;
        Mon, 28 Nov 2022 11:30:38 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 8812620138E;
        Mon, 28 Nov 2022 11:30:38 +0100 (CET)
Received: from local (shlinux2.ap.freescale.net [10.192.224.44])
        by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 58558181D0C4;
        Mon, 28 Nov 2022 18:30:37 +0800 (+08)
From:   haibo.chen@nxp.com
To:     dmitry.torokhov@gmail.com
Cc:     inan@distec.de, robh@kernel.org, linux-input@vger.kernel.org,
        haibo.chen@nxp.com, carlos.song@nxp.com, linux-imx@nxp.com
Subject: [PATCH] input: touchscreen: exc300: read the second frame during the interrupt line keep low
Date:   Mon, 28 Nov 2022 18:08:30 +0800
Message-Id: <1669630110-11022-1-git-send-email-haibo.chen@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Haibo Chen <haibo.chen@nxp.com>

For the EETI EXC series, it support up to 10 points, two consecutive frames
need to read. But for each frame, need to be read when the interrupt line
keep in low level, otherwise, the read frame always get all 0xff data.

The hardware behavior for this touch device is it only support the low level
trigger method, when irq line change to low level, usr need to read the
first frame, and then the irq line return to high level, after about 320us,
the irq line change to low level, then usr need to read the second frame.

Without this patch, we always find the second frame is readed during the irq
line keep in high level, through the i2c logic analyzer, we see the data in
the second frame is all 0xFF. This is because usr read the second frame
immediately after the first frame in the same irq handler. But the irq line
will back to high level after the first frame and keep about 320us. This
behavior is wrong, and even worse, in some probability, this wrong behavior
will cause the touch device stuck, can't generate interrupt any more, which
means the interrupt line always keep high even after touch the screen.

This patch change to read only one frame in one irq handler. For the case
need to read two frames, in the first irq handler, save the total contact
number, then in the second irq handler, report the leftover contact.

Fixes: 7e577a17f2ee ("Input: add I2C attached EETI EXC3000 multi touch driver")
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 drivers/input/touchscreen/exc3000.c | 40 ++++++++++++++---------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/drivers/input/touchscreen/exc3000.c b/drivers/input/touchscreen/exc3000.c
index 4b7eee01c6aa..eae7844e33db 100644
--- a/drivers/input/touchscreen/exc3000.c
+++ b/drivers/input/touchscreen/exc3000.c
@@ -75,9 +75,10 @@ struct exc3000_data {
 	struct touchscreen_properties prop;
 	struct gpio_desc *reset;
 	struct timer_list timer;
-	u8 buf[2 * EXC3000_LEN_FRAME];
+	u8 buf[EXC3000_LEN_FRAME];
 	struct completion wait_event;
 	struct mutex query_lock;
+	u8 slots_in_second_frame;
 };
 
 static void exc3000_report_slots(struct input_dev *input,
@@ -137,40 +138,37 @@ static int exc3000_read_frame(struct exc3000_data *data, u8 *buf)
 static int exc3000_handle_mt_event(struct exc3000_data *data)
 {
 	struct input_dev *input = data->input;
-	int ret, total_slots;
+	int ret, slots, total_slots;
 	u8 *buf = data->buf;
 
 	total_slots = buf[3];
-	if (!total_slots || total_slots > EXC3000_NUM_SLOTS) {
+	if (total_slots > EXC3000_NUM_SLOTS) {
 		ret = -EINVAL;
 		goto out_fail;
 	}
 
-	if (total_slots > EXC3000_SLOTS_PER_FRAME) {
-		/* Read 2nd frame to get the rest of the contacts. */
-		ret = exc3000_read_frame(data, buf + EXC3000_LEN_FRAME);
-		if (ret)
-			goto out_fail;
-
-		/* 2nd chunk must have number of contacts set to 0. */
-		if (buf[EXC3000_LEN_FRAME + 3] != 0) {
-			ret = -EINVAL;
-			goto out_fail;
-		}
-	}
+	/*
+	 * If the total slots is larger than 5, which means there
+	 * is a second frame need to read in the next interrupt.
+	 */
+	if (total_slots > EXC3000_SLOTS_PER_FRAME)
+		data->slots_in_second_frame = total_slots - EXC3000_SLOTS_PER_FRAME;
 
 	/*
 	 * We read full state successfully, no contacts will be "stuck".
 	 */
 	del_timer_sync(&data->timer);
 
-	while (total_slots > 0) {
-		int slots = min(total_slots, EXC3000_SLOTS_PER_FRAME);
+	/*
+	 * For the second frame, the number of contact must be 0, so
+	 * need to use the contacts saved in the previous first frame.
+	 */
+	if (total_slots == 0)
+		slots = data->slots_in_second_frame;
+	else
+		slots = min(total_slots, EXC3000_SLOTS_PER_FRAME);
 
-		exc3000_report_slots(input, &data->prop, buf + 4, slots);
-		total_slots -= slots;
-		buf += EXC3000_LEN_FRAME;
-	}
+	exc3000_report_slots(input, &data->prop, buf + 4, slots);
 
 	input_mt_sync_frame(input);
 	input_sync(input);
-- 
2.34.1

