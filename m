Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDDD0106807
	for <lists+linux-input@lfdr.de>; Fri, 22 Nov 2019 09:27:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727734AbfKVI0u (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Nov 2019 03:26:50 -0500
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:62619 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727072AbfKVI0u (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Nov 2019 03:26:50 -0500
IronPort-SDR: jpUFIyIQEBPfuQmA8XEoNm7PTEtv4Fc+Sfmd9j3IiPsJrH+91ZBTXYQ/SP/eSsXsoFU3csoLhj
 J4AJRxKv6i6VhJbk0eAxHYY3o3C6pidv+qtqC6ujHy4yUVrcbBr1Z4MXhYKtp70OSHF/tbP1Ph
 baAzIvbPoDsT5cbVgNGEGA6HVMeZeC0cbGyGhiOmYbVB6oNWp40TuT491BHUeL8cKBUBB4HeGH
 cP1LQ4Beh3DCHvJV20Ccia0CKbczybIq4CoZ7TgrStQr0vsbs7T90FzRBRqHlUxGZBsqo6OYsE
 Pq4=
X-IronPort-AV: E=Sophos;i="5.69,229,1571731200"; 
   d="scan'208";a="43457655"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 22 Nov 2019 00:26:49 -0800
IronPort-SDR: qConjet9okaLhLlqlQgHx8OwITqHCYCmT43hNJlIKqK8RAQYJlIumZXQ2hYRO8anrLXkMynRJI
 pI7Eb9cTk3ipbbmhLe38YlWRnojOHc8hoxuY5EoPMk4rXZqEptteN6fHFHfIoKearnvfhmRRzy
 GSV/OVxgzSPrRN6zxrYng5zcnBeCk7sjvhY9jmevNFyS3h9aEez+x8uv6EYfnsUNdphXFbuGtk
 ciiK3H7Qz3JpCEISBNmM9XiFT7eAa+sDupap9iQD/cJwZ4rUVNQVb298/o0P4Qc9Elf9KyF5eU
 PG8=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v6 44/48] Input: atmel_mxt_ts: use gpiod_set_value_cansleep for reset pin
Date:   Fri, 22 Nov 2019 17:23:58 +0900
Message-ID: <20191122082402.18173-45-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191122082402.18173-1-jiada_wang@mentor.com>
References: <20191122082402.18173-1-jiada_wang@mentor.com>
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
index 0e4a870fafa5..78903806c0b4 100644
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
@@ -4313,7 +4313,7 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
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

