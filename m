Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7CFB1B9276
	for <lists+linux-input@lfdr.de>; Sun, 26 Apr 2020 19:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726249AbgDZRry (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Apr 2020 13:47:54 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:35248 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726163AbgDZRrw (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Apr 2020 13:47:52 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 499Fjy6ZN8zwy;
        Sun, 26 Apr 2020 19:47:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1587923271; bh=mskidBsclqFcBTsNzthkgNf+6hGPUgTRnXCBqGY/AR8=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=dQjlUsj2NMurEWjE5Dhk5kAVgOGyX0o7vmTdFKJfTOz8SqeQ62PJB5I7gQUwrJb7Y
         y7PcntVm+JhWNB8R/AvjMPm+DN3UnTv8A8iTTzBkS7kJTOykWeCZ3qlzGyNLExAGGI
         QiSkTImsEW67JsQU0yuG3lQHLD7dODbD4zWr/7byIprTfzyFeSvM8V72eOp28trmEp
         wj2tNEHyKPZAz12T0p135GaeVJ1FN5KJA5O+HPNkRevm5xZmQVwJnPX74sgSodcd2H
         EPN44CXEuPDekaykwHFOWDUn9lR0ugIXjUcl//TngTTUfDIqJ3t2e2pSzA6aEVIv+J
         xLpscAh6lANqQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.2 at mail
Date:   Sun, 26 Apr 2020 19:47:50 +0200
Message-Id: <d5eee8cd305adb144a11264d70da94f7b6570366.1587923061.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1587923061.git.mirq-linux@rere.qmqm.pl>
References: <cover.1587923061.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v5 03/10] input: elants: remove unused axes
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

Driver only ever reports MT events and input_mt_init_slots() sets up
emulated axes already.  Clear the capabilities not generated directly
and move MT axes setup, so they are visible by input_mt_init_slots().

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Tested-by: Dmitry Osipenko <digetx@gmail.com>
---
v4: reword commitmsg; reorder axis setup
---
 drivers/input/touchscreen/elants_i2c.c | 26 ++++++++------------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index 6c2b336d92bf..61a9098f35d2 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -1319,25 +1319,7 @@ static int elants_i2c_probe(struct i2c_client *client,
 	ts->input->name = "Elan Touchscreen";
 	ts->input->id.bustype = BUS_I2C;
 
-	__set_bit(BTN_TOUCH, ts->input->keybit);
-	__set_bit(EV_ABS, ts->input->evbit);
-	__set_bit(EV_KEY, ts->input->evbit);
-
-	/* Single touch input params setup */
-	input_set_abs_params(ts->input, ABS_X, 0, ts->x_max, 0, 0);
-	input_set_abs_params(ts->input, ABS_Y, 0, ts->y_max, 0, 0);
-	input_set_abs_params(ts->input, ABS_PRESSURE, 0, 255, 0, 0);
-	input_abs_set_res(ts->input, ABS_X, ts->x_res);
-	input_abs_set_res(ts->input, ABS_Y, ts->y_res);
-
 	/* Multitouch input params setup */
-	error = input_mt_init_slots(ts->input, MAX_CONTACT_NUM,
-				    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
-	if (error) {
-		dev_err(&client->dev,
-			"failed to initialize MT slots: %d\n", error);
-		return error;
-	}
 
 	input_set_abs_params(ts->input, ABS_MT_POSITION_X, 0, ts->x_max, 0, 0);
 	input_set_abs_params(ts->input, ABS_MT_POSITION_Y, 0, ts->y_max, 0, 0);
@@ -1349,6 +1331,14 @@ static int elants_i2c_probe(struct i2c_client *client,
 	input_abs_set_res(ts->input, ABS_MT_POSITION_Y, ts->y_res);
 	input_abs_set_res(ts->input, ABS_MT_TOUCH_MAJOR, 1);
 
+	error = input_mt_init_slots(ts->input, MAX_CONTACT_NUM,
+				    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
+	if (error) {
+		dev_err(&client->dev,
+			"failed to initialize MT slots: %d\n", error);
+		return error;
+	}
+
 	error = input_register_device(ts->input);
 	if (error) {
 		dev_err(&client->dev,
-- 
2.20.1

