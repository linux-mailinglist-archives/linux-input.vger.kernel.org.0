Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3971911B6E9
	for <lists+linux-input@lfdr.de>; Wed, 11 Dec 2019 17:04:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388197AbfLKQEK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Dec 2019 11:04:10 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:27065 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731730AbfLKQDZ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Dec 2019 11:03:25 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 47Y1tf3bQ3zr2;
        Wed, 11 Dec 2019 17:03:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1576080202; bh=N1DETPeiiOTp21rY2KPGTqO/jDYMMO2xX2UweoIqUmA=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=lQcMaYOBYanPCD12XvD4+y8YbC51HJJIXOSb0dmverlUR5cwNM0EVgN/R0GrOoM9G
         ohRPm0mrpYBcxUjEUvWFQkr5wc2NIGGShKc3lRQhkDitAAqHCQN091wkMlZztLFElw
         yv+N2a6qFfE4wNe7bNxmCqE/AoW1QU8meYZrAHEXaEbhf7YsCrPTPkm7XI383t3WmE
         ZkaHJuS/6Ki6iPAocIjdaalhX/UclDYdk5rIVL3tt4xWzUMe3IbbLj+oG3g2NQJC4k
         9WQvE12xNCvq0KnQ9zyuZ8zDnTrM/zyKfHOVSRrSJGCSD8urRr0Pp0UZSHvhTJlpNM
         DHGMYUh4X+Y5g==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.4 at mail
Date:   Wed, 11 Dec 2019 17:03:21 +0100
Message-Id: <fba33fca7c1e8a21cc1dc9e9aca975e871468e22.1576079249.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1576079249.git.mirq-linux@rere.qmqm.pl>
References: <cover.1576079249.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v2 3/9] input: elants: remove unused axes
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-kernel@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh-dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Driver only ever reports MT events. Clear capabilities of all others.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/input/touchscreen/elants_i2c.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index eadd26d5a06f..ab9d63239ff5 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -1251,17 +1251,6 @@ static int elants_i2c_probe(struct i2c_client *client,
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

