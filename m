Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43E7B8FE13
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 10:38:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727222AbfHPIiA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 04:38:00 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:36144 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727181AbfHPIh7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 04:37:59 -0400
IronPort-SDR: F6auVD7j0JHaEkpGYj8yzP0VSoSQDp8aHW/B79PayPW5oy+p8QzfVZN6nFYUZV+kw3Jr6Pvw2T
 gZvPuYc98IatdGf6gCAKoV1Pzdzl4g9Kg8sVYXflk0pIk6fJGD+01V4mFEjmkWU//mo8SMEE2l
 LkcGFyiS0qCTr9eAWigBaLoDLqMb3mg091ohq9beaFQKyn6095H7zjs+K7IhOoHKd/aQzIzh35
 jzATgnrl9cNkVH1OyWCyw+Krw3q2umj51UyWUxER5jYv3RTq8ZcIX9LWVOTMV+02C0MVwQ2qr4
 J5g=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="40519182"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:37:58 -0800
IronPort-SDR: RQOieQCwrrHtrtHKYB8ypUiP/ke3cKMEUfuj4OpcOFq5rw+olNiWYD4BGWpJGo00jhsh9JSrJG
 86SyIL9xGUVenJCpWN2ket0lhXTmV8UAaI3oiza2Ix8VF8mHdbqOxMXbGgkJXqz5PsP5hqFey9
 P2vKa3KIMpb/MjJoLPPy+MJryh4gfAGQmXlopF5be4Oz+ObB1aj1IndpFk5DTVC4VEFXmMqGpb
 xRbZZcpjnnWZR2m8idsG+f5Psv+iAlKHaKWE+6+8sKOPn0A/b2L/5mPCHULRdRwyeNhs6fcum+
 n70=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v1 53/63] Input: atmel_mxt_ts: use gpiod_set_value_cansleep for reset pin
Date:   Fri, 16 Aug 2019 17:37:47 +0900
Message-ID: <20190816083757.19449-4-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190816083757.19449-1-jiada_wang@mentor.com>
References: <20190816083757.19449-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
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
index 5c980e74e6b0..79fc6561f6ad 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -2492,7 +2492,7 @@ static void mxt_regulator_enable(struct mxt_data *data)
 	if (!data->reg_vdd || !data->reg_avdd)
 		return;
 
-	gpiod_set_value(data->reset_gpio, 0);
+	gpiod_set_value_cansleep(data->reset_gpio, 0);
 
 	error = regulator_enable(data->reg_vdd);
 	if (error)
@@ -2510,7 +2510,7 @@ static void mxt_regulator_enable(struct mxt_data *data)
 	 * voltage
 	 */
 	msleep(MXT_REGULATOR_DELAY);
-	gpiod_set_value(data->reset_gpio, 1);
+	gpiod_set_value_cansleep(data->reset_gpio, 1);
 	msleep(MXT_CHG_DELAY);
 
 retry_wait:
@@ -4501,7 +4501,7 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		disable_irq(data->irq);
 	} else if (data->reset_gpio) {
 		msleep(MXT_RESET_GPIO_TIME);
-		gpiod_set_value(data->reset_gpio, 1);
+		gpiod_set_value_cansleep(data->reset_gpio, 1);
 		msleep(MXT_RESET_INVALID_CHG);
 	} else {
 		dev_dbg(&client->dev,
-- 
2.19.2

