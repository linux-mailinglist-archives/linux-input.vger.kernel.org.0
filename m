Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FBC21A670C
	for <lists+linux-input@lfdr.de>; Mon, 13 Apr 2020 15:32:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729915AbgDMNc1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Apr 2020 09:32:27 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:28189 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729902AbgDMNc0 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Apr 2020 09:32:26 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4918gD1Zp2zxC;
        Mon, 13 Apr 2020 15:32:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1586784744; bh=AMVDMp6lBsSzyLxgYU09hkRV6UlojdPFirY5aL6jJf4=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=VhRHB66TY06ZRbrdI0ruTqdmDxzqAv9a86f6V1+CjW85mOX6YsDNy9Tvm59IpQQu/
         aPIvD8YV0EIulVpTHOvV85z0AGi1xei1O3hNTK4eWkryMRYPu2j7PYaXUhkbk2yPeg
         bskRKli43HqzPxqmbltyGwXmX5MqYn8oPgg2OSrQIlhHjhALveFba5xEkJiAhIxJAV
         Aa5fT7vgRu5WHgPiTM0GVXc/JFwY+M08rsj3kwh/zyInMkb4M0d2m1FUvUMaz6GJaU
         +grLFcyk/SX1KAUYCZOWsau7f59klrW+1nJaDYdNRm7JmltdQMkjwU1iCeNbJKTb/a
         +c2BlGk1aAMzg==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.2 at mail
Date:   Mon, 13 Apr 2020 15:32:23 +0200
Message-Id: <62e897b0d6f6054dae26c853a9a1f1fb6d3c420b.1586784389.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1586784389.git.mirq-linux@rere.qmqm.pl>
References: <cover.1586784389.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v3 3/9] input: elants: remove unused axes
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

Driver only ever reports MT events. Clear capabilities of all others.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Tested-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/input/touchscreen/elants_i2c.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index ddebd3741145..fcd3d189f184 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -1312,17 +1312,6 @@ static int elants_i2c_probe(struct i2c_client *client,
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
 	error = input_mt_init_slots(ts->input, MAX_CONTACT_NUM,
 				    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
-- 
2.20.1

