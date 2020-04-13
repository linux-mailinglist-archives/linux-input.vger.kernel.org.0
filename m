Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 857E01A6701
	for <lists+linux-input@lfdr.de>; Mon, 13 Apr 2020 15:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729860AbgDMNc2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Apr 2020 09:32:28 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:12998 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729903AbgDMNc1 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Apr 2020 09:32:27 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4918gD65Wpz110;
        Mon, 13 Apr 2020 15:32:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1586784744; bh=gfzIawhJlxLIBRezClLnvJLSwST+I6+I/qdvxoNWpAQ=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=h83tSHDcdVt64xH0jnSckpnnZWKtedh4s1TYVapkdIS03GcDZ5wWEXSRxxpgUmwUy
         sZ/ASjFGWjUBM05bRfq2kpxf9bsYC2T3VJqt2p8IjBiKgZNE2+8OajL4E2PKW7jWDk
         yqgXZvc0nuyKJhWqN6T9GoTb8wzn3D6YmfevShY3y+b4YzqAG8hB3cVRuUFyPa13uk
         OcIsMLBBokThsVhZ4AzvMhYXNE3HAPK8zKYVUReGfls0hBtc1eyJcdydUYDWnYc7zq
         hZkW02l4mKP8kuBC0smUOS2T61Gh8YQkQNXij1GMVKSUMwmmAJ8yATUTR/+/SGa8vO
         hCxEZCpW+4U5A==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.2 at mail
Date:   Mon, 13 Apr 2020 15:32:24 +0200
Message-Id: <cb3834494e837289fa792615925f06dbd91c1f75.1586784389.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1586784389.git.mirq-linux@rere.qmqm.pl>
References: <cover.1586784389.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v3 4/9] input: elants: override touchscreen info with DT
 properties
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     Dmitry Osipenko <digetx@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>,
        David Heidelberg <david@ixit.cz>
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
 drivers/input/touchscreen/elants_i2c.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index fcd3d189f184..87d686ce08f2 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -32,6 +32,7 @@
 #include <linux/slab.h>
 #include <linux/firmware.h>
 #include <linux/input/mt.h>
+#include <linux/input/touchscreen.h>
 #include <linux/acpi.h>
 #include <linux/of.h>
 #include <linux/gpio/consumer.h>
@@ -150,6 +151,7 @@ struct elants_data {
 	unsigned int y_res;
 	unsigned int x_max;
 	unsigned int y_max;
+	struct touchscreen_properties prop;
 
 	enum elants_state state;
 	enum elants_iap_mode iap_mode;
@@ -894,8 +896,7 @@ static void elants_i2c_mt_event(struct elants_data *ts, u8 *buf,
 
 			input_mt_slot(input, i);
 			input_mt_report_slot_state(input, MT_TOOL_FINGER, true);
-			input_event(input, EV_ABS, ABS_MT_POSITION_X, x);
-			input_event(input, EV_ABS, ABS_MT_POSITION_Y, y);
+			touchscreen_report_pos(input, &ts->prop, x, y, true);
 			input_event(input, EV_ABS, ABS_MT_PRESSURE, p);
 			input_event(input, EV_ABS, ABS_MT_TOUCH_MAJOR, w);
 
@@ -1329,6 +1330,8 @@ static int elants_i2c_probe(struct i2c_client *client,
 	input_abs_set_res(ts->input, ABS_MT_POSITION_Y, ts->y_res);
 	input_abs_set_res(ts->input, ABS_MT_TOUCH_MAJOR, 1);
 
+	touchscreen_parse_properties(ts->input, true, &ts->prop);
+
 	error = input_register_device(ts->input);
 	if (error) {
 		dev_err(&client->dev,
-- 
2.20.1

