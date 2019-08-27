Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71F089DE12
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2019 08:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726392AbfH0Gbw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Aug 2019 02:31:52 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:23260 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726078AbfH0Gbv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Aug 2019 02:31:51 -0400
IronPort-SDR: rM8szdnqnpdowMRASMiT7GiozovzTuVkyrDnTskxcc9qXdA46jMhm2Q8cvvl8mnTT9ErsFsDOK
 wq+Ggbc1C8kPtO4cqRZKg1zLktj5K9XQnPcCEgr3YhNEVZTBv2qQJTM43F02a4PNOs/6PbEmuQ
 znAPVol9zeYiy0yE6yHSCRAf6ak+WL1fzefJvTK4HTOyY8KH8XtB+eKN1UdTsjYlz8jmGq0Mlb
 uDhykvRoLFDY/0cnAvtaGtAgr3euuXb2Co3QiCAwN+PptSsTlQ2Akxg4xOfahsg9Kmnqjrl2Cx
 wUA=
X-IronPort-AV: E=Sophos;i="5.64,436,1559548800"; 
   d="scan'208";a="40755047"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 26 Aug 2019 22:31:51 -0800
IronPort-SDR: obwh3dAek/mN4gfNTNS2gwva+G7gZsieakaFMHum431ICRCuYJ4WPsdYg9t7fKjYmZlhSIj9qL
 Y9cLBqpC+cxehAukCdbKdY5dT9zQq59ZjobGnDAIo98NwzQ6GIzNe2JQaVmN5UoBW+PHbIZs1r
 svrsmQLgzWnyFwpsa2l+3FoyZtBRVXabnziwEimYR5j85xynVZJjDx0f053MeIFjMhKLWewDeY
 88pGEZzryTWiiRWyYhAjjhsJl+XygcwnFSyn7srb7P9fI8+rFi/9nmG+vVaCIp62M0+mkFER0q
 8OQ=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v2 45/49] Input: atmel_mxt_ts: use gpiod_set_value_cansleep for reset pin
Date:   Tue, 27 Aug 2019 15:31:57 +0900
Message-ID: <20190827063201.21048-1-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: SVR-ORW-MBX-07.mgc.mentorg.com (147.34.90.207) To
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
index 58e54eb45cf0..1187e21a67e4 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -2487,7 +2487,7 @@ static void mxt_regulator_enable(struct mxt_data *data)
 	if (!data->reg_vdd || !data->reg_avdd)
 		return;
 
-	gpiod_set_value(data->reset_gpio, 0);
+	gpiod_set_value_cansleep(data->reset_gpio, 0);
 
 	error = regulator_enable(data->reg_vdd);
 	if (error)
@@ -2505,7 +2505,7 @@ static void mxt_regulator_enable(struct mxt_data *data)
 	 * voltage
 	 */
 	msleep(MXT_REGULATOR_DELAY);
-	gpiod_set_value(data->reset_gpio, 1);
+	gpiod_set_value_cansleep(data->reset_gpio, 1);
 	msleep(MXT_CHG_DELAY);
 
 retry_wait:
@@ -4311,7 +4311,7 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
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

