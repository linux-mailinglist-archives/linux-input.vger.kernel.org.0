Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B4C3B4B1A
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 11:44:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729336AbfIQJni (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 05:43:38 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:20022 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729312AbfIQJni (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 05:43:38 -0400
IronPort-SDR: KluoOWF9ZpHvYtrPNsOgaVBfkufSM1NMewOtExBrTEPq/whk1zJh3SXNWArre3ddErZbkRG12K
 HfwzL/v/h/J2p6azhWpSH1pLdeRh4NvhNo5TQY5IQN3MbgjeHTG1zJ5wH8SiOREpdj0erokfg0
 WfSGlLGpntgU/tIhiFFk8oHSkFz1iisRTpUNlecnT9V7lo+ap1IpgFGVF3IiY8gkhWU4+aN6h8
 rQirhHGTSWl7scD698EMwJWsNtFAg5EGi4bJG5MSZBhv/RTMcI7Z7nU8h6K65VTBqNLvY3BWjF
 Vj0=
X-IronPort-AV: E=Sophos;i="5.64,515,1559548800"; 
   d="scan'208";a="41374280"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 17 Sep 2019 01:43:37 -0800
IronPort-SDR: 4EJJLKlNqeIod/SuZaiMUFZviidDd7wMdbEF3eKFUQ32Xhibv1GhwVx0femGNbaPuDv66jgPUl
 D5mfN79zz8bjjhpak4S2BQMK9Jik/OnrFZ00Xv3RRTselQ4eqZK+JiQij7FIt+cLD2Zz/9KhD+
 5WO1hNSPX7SUIwEs5+rbVEDeoEth5fpYeVy626ycAI7ZJ1MWML1QO57tNFORl3KyX5YJGDkmj8
 h1ER3dY8vg5etCU/jQkV3Twa7syCbWUs5VxAQl9gaBMRi1RCCGoA11caYDJxUh97KzVQhZV3UB
 tkw=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>
Subject: [PATCH v3 45/49] Input: atmel_mxt_ts: use gpiod_set_value_cansleep for reset pin
Date:   Tue, 17 Sep 2019 18:43:15 +0900
Message-ID: <20190917094319.18996-2-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190917094319.18996-1-jiada_wang@mentor.com>
References: <20190917094319.18996-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201) To
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
index 76bda6137bf7..8444f7292e29 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -2490,7 +2490,7 @@ static void mxt_regulator_enable(struct mxt_data *data)
 	if (!data->reg_vdd || !data->reg_avdd)
 		return;
 
-	gpiod_set_value(data->reset_gpio, 0);
+	gpiod_set_value_cansleep(data->reset_gpio, 0);
 
 	error = regulator_enable(data->reg_vdd);
 	if (error)
@@ -2508,7 +2508,7 @@ static void mxt_regulator_enable(struct mxt_data *data)
 	 * voltage
 	 */
 	msleep(MXT_REGULATOR_DELAY);
-	gpiod_set_value(data->reset_gpio, 1);
+	gpiod_set_value_cansleep(data->reset_gpio, 1);
 	msleep(MXT_CHG_DELAY);
 
 retry_wait:
@@ -4314,7 +4314,7 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
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

