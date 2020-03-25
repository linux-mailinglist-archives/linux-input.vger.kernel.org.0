Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB2E3192A2D
	for <lists+linux-input@lfdr.de>; Wed, 25 Mar 2020 14:38:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728142AbgCYNhF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Mar 2020 09:37:05 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:34650 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728137AbgCYNhE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Mar 2020 09:37:04 -0400
IronPort-SDR: gAl5oJtwNvTB6AwHtU67aOhrOcJE5FcKSCuMGQyya7klbpDUYJ9zSISv3GvEBby/m1Qin2CIv3
 8z1PM61ghCVVLp9FPci7YtMxyMvOy2QBOJ7MQuHW052XvLKjem7/LBADOLtjKvUS8BFys3VzN7
 ZQLs++fvDr3u9aVfY6b5c3JamVCgEQVLyBBg1nvguQrbewpHiU2nHNbvc8o7RjF7nKsvJZV7bj
 GkUk8crpIs96lVgsNRSYSLFHWGIzz/qs4x3ylJ6JG4VvC1ZPxrmkuGrp3iU0QMYQaB39nH82/M
 eqM=
X-IronPort-AV: E=Sophos;i="5.72,304,1580803200"; 
   d="scan'208";a="47143564"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 25 Mar 2020 05:37:04 -0800
IronPort-SDR: qcJrniDKqNalMRFCagpZA/6edhMy0HJmwmvQ3VGocy2YF4WPqmXIe/Ia2i7EXTLOQHfaK+bBI9
 WcabvpRozLqI+DVkzJp6zBn+tH1QF71VdhADwUtZjRCw0+2hAD19dEb0F3SKlQw6zKWdWxonMo
 U47LPF4kekHBHzRXzT2dWJc6KPLiFdj3DzR1RSUR9Afkq+ZBVJsFpv4pAIF0TW4xDmf7+E9BVD
 zJ7z4wbgqzI36uWgum6N2J3GK2hjUeyoeG3zPDBr8SVR6Z42GZsEEcc1mXOvKqssK7fXhQf6R8
 Uto=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v9 51/55] Input: atmel_mxt_ts: use gpiod_set_value_cansleep for reset pin
Date:   Wed, 25 Mar 2020 06:33:30 -0700
Message-ID: <20200325133334.19346-52-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200325133334.19346-1-jiada_wang@mentor.com>
References: <20200325133334.19346-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Balasubramani Vivekanandan <balasubramani_vivekanandan@mentor.com>

In case of remote display, touch controller will be also remote.
In such cases, the reset pin of the touch controller will be
controlled through bridging ICs like Deserilizer and Serializer.
Therefore accessing the gpio pins require transactions with the
external IC. Using the function gpiod_set_value will print a
warning like below

WARNING: CPU: 0 PID: 576 at drivers/gpio/gpiolib.c:1441 gpiod_set_value+0x34/0x60()
CPU: 0 PID: 576 Comm: modprobe Not tainted 3.14.79-08377-g84ea22f-dirty #4
Backtrace:
[<80011c58>] (dump_backtrace) from [<80011e60>] (show_stack+0x18/0x1c)
[<80011e48>] (show_stack) from [<8052d7ac>] (dump_stack+0x7c/0x9c)
[<8052d730>] (dump_stack) from [<800241bc>] (warn_slowpath_common+0x74/0x9c)
[<80024148>] (warn_slowpath_common) from [<80024288>] (warn_slowpath_null+0x24/0x2c)
[<80024264>] (warn_slowpath_null) from [<8029e070>] (gpiod_set_value+0x34/0x60)
[<8029e03c>] (gpiod_set_value) from [<7f492e98>] (mxt_probe+0x1e0/0x718 [atmel_mxt_ts])
[<7f492cb8>] (mxt_probe [atmel_mxt_ts]) from [<803c4d34>] (i2c_device_probe+0xcc/0xec)
[<803c4c68>] (i2c_device_probe) from [<803252a0>] (driver_probe_device+0xc0/0x200)

Signed-off-by: Balasubramani Vivekanandan <balasubramani_vivekanandan@mentor.com>
Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Signed-off-by: Sanjeev Chugh <sanjeev_chugh@mentor.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 1cabe75df562..14bd64d194b0 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -2489,7 +2489,7 @@ static void mxt_regulator_enable(struct mxt_data *data)
 	if (!data->reg_vdd || !data->reg_avdd)
 		return;
 
-	gpiod_set_value(data->reset_gpio, 0);
+	gpiod_set_value_cansleep(data->reset_gpio, 0);
 
 	error = regulator_enable(data->reg_vdd);
 	if (error)
@@ -2507,7 +2507,7 @@ static void mxt_regulator_enable(struct mxt_data *data)
 	 * voltage
 	 */
 	msleep(MXT_REGULATOR_DELAY);
-	gpiod_set_value(data->reset_gpio, 1);
+	gpiod_set_value_cansleep(data->reset_gpio, 1);
 	msleep(MXT_CHG_DELAY);
 
 retry_wait:
@@ -4321,7 +4321,7 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		disable_irq(data->irq);
 	} else if (data->reset_gpio) {
 		msleep(MXT_RESET_GPIO_TIME);
-		gpiod_set_value(data->reset_gpio, 1);
+		gpiod_set_value_cansleep(data->reset_gpio, 1);
 		msleep(MXT_RESET_INVALID_CHG);
 	} else {
 		dev_dbg(&client->dev,
-- 
2.17.1

