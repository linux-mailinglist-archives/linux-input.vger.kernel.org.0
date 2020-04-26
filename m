Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A1DF1B9275
	for <lists+linux-input@lfdr.de>; Sun, 26 Apr 2020 19:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbgDZRry (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Apr 2020 13:47:54 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:6194 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726199AbgDZRrx (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Apr 2020 13:47:53 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 499Fjz3F62z11D;
        Sun, 26 Apr 2020 19:47:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1587923271; bh=Ml7ML5grvVGYphuVKQi2NhHQLiMQjmo33iGw5j3sT0M=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=kQuCp3wOxtGqhU1zzCKLEef5oSX7yC9Oj/Hg//NfcvI34Px31dG4IZ1deGyY3OiyJ
         v69DBDVS8FSpSd0dmPQ+0ntRxe8jnKj5hrrRAzc39AHrnKUv1E4JhnlRDT628dfNlE
         3niNJpGII6v78EVO259Ij/7q/UHXLKSX3uSCmQ+mvgsecV+LE4JrmotuH32K182AsG
         N84Ys7xxBbRkvM5Wq7i5uvLKdSwEsItRFrCn1n254Cu6iWJTiWXiq/aN/Di2Lxxv8J
         ahJxUfq2PsTbAUKQYj20dOwW/ql//VS3ymv7Fm+xQuJoQ0Bo8JyG2sp6/dDjIkVk3Y
         Dw+XdkUGuawMw==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.2 at mail
Date:   Sun, 26 Apr 2020 19:47:51 +0200
Message-Id: <49ea996878264f7c8bde25204e4ddf4b1e85ae71.1587923061.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1587923061.git.mirq-linux@rere.qmqm.pl>
References: <cover.1587923061.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v5 04/10] input: elants: override touchscreen info with DT
 properties
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     David Heidelberg <david@ixit.cz>,
        Dmitry Osipenko <digetx@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Allow overriding of information from hardware and support additional
common DT properties like axis inversion. This is required for eg.
Nexus 7 and TF300T where the programmed values in firmware differ
from reality.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
[moved "prop" before DMA buffer]
Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
v5: rebase against dtor/input/for-linus
---
 drivers/input/touchscreen/elants_i2c.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index 61a9098f35d2..d2be61ae6722 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -33,6 +33,7 @@
 #include <linux/slab.h>
 #include <linux/firmware.h>
 #include <linux/input/mt.h>
+#include <linux/input/touchscreen.h>
 #include <linux/acpi.h>
 #include <linux/of.h>
 #include <linux/gpio/consumer.h>
@@ -152,6 +153,7 @@ struct elants_data {
 	unsigned int y_res;
 	unsigned int x_max;
 	unsigned int y_max;
+	struct touchscreen_properties prop;
 
 	enum elants_state state;
 	enum elants_iap_mode iap_mode;
@@ -901,8 +903,7 @@ static void elants_i2c_mt_event(struct elants_data *ts, u8 *buf,
 
 			input_mt_slot(input, i);
 			input_mt_report_slot_state(input, tool_type, true);
-			input_event(input, EV_ABS, ABS_MT_POSITION_X, x);
-			input_event(input, EV_ABS, ABS_MT_POSITION_Y, y);
+			touchscreen_report_pos(input, &ts->prop, x, y, true);
 			input_event(input, EV_ABS, ABS_MT_PRESSURE, p);
 			input_event(input, EV_ABS, ABS_MT_TOUCH_MAJOR, w);
 
@@ -1331,6 +1332,8 @@ static int elants_i2c_probe(struct i2c_client *client,
 	input_abs_set_res(ts->input, ABS_MT_POSITION_Y, ts->y_res);
 	input_abs_set_res(ts->input, ABS_MT_TOUCH_MAJOR, 1);
 
+	touchscreen_parse_properties(ts->input, true, &ts->prop);
+
 	error = input_mt_init_slots(ts->input, MAX_CONTACT_NUM,
 				    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
 	if (error) {
-- 
2.20.1

