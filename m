Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AAE19DDFD
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2019 08:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726037AbfH0Gao (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Aug 2019 02:30:44 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:48270 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbfH0Gao (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Aug 2019 02:30:44 -0400
IronPort-SDR: IVq4+vL0g27g7eHTWppHhllu89hc58PzILx9e8Bp8/FcMycz0impvt4j1IUR1/KHdFW0aIdvwd
 9oPJ2WCQf6QTTyRA+MBrN3qyaaPH4FqW0s5hYdRtVnOZctUwmpGlLQhQXkaEM/7PMafB9kfGZS
 XZN61jkp526CYJQZdchTDoXEdtbu2AcVS8J4YMqGD3xkFivFzSGl91Oe4f9QydjOlldF9KCIMb
 6J4KS+Xux1SMmFXmzW//7nfDxgf0H9OfLbI+O+3RB/akS4O9l59G3v+4G7usZZbS07slYQg/Om
 LQw=
X-IronPort-AV: E=Sophos;i="5.64,436,1559548800"; 
   d="scan'208";a="40784625"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 26 Aug 2019 22:30:43 -0800
IronPort-SDR: ok9gt8NT1LNLyxrO9DC4XsXUqCJTjCfNVGCXyB4e0D0lNG7xsOdhXjKbogfShNUFt4QKFGkEV8
 9GraVNv+BgB95ISZvBlCE70681tIq+bLARbvwWR2ZKv+49Tjh1NcjHQU4b/AjqTiPeC0Qx6rRq
 Qf3mCHX6aAhC+bt8SZO7+C4b6Lozfruff4QhXexnBieaGdwPnpY1jsBIfqQ28ECzX/M5mzig1T
 UDPvB+Q+14Ui3Yz83sT/H55mGBoUjxL0fHRodhKjGKoq6zw0QNXQzCifWJCeojs1ni5usZYEtt
 /tg=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v2 35/49] input: atmel_mxt_ts: Add Missing Delay for reset handling of Atmel touch panel controller in detachable displays.
Date:   Tue, 27 Aug 2019 15:30:40 +0900
Message-ID: <20190827063054.20883-1-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: keerthikumarp <Keerthikumar.Padmanabha@in.bosch.com>

In case of attached display, the touchpanel reset is controlled
via imx gpio's from  atmel driver and the delay between
touchpanel reset and the time at which the chip becomes capable to
communicate with the host processor, has be taken care.

However in case of detachable displays, the touchpanel reset is
controlled via a deserializer gpio which is triggered just before
the atmel driver is probed.The delay between touchpanel reset and
the time at which the chip becomes capable to communicate (as
specified in datasheet) was not being accounted for. This patch
introduces that delay.

Signed-off-by: keerthikumarp <Keerthikumar.Padmanabha@in.bosch.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 35f41bfa70d5..192cf47ff5f4 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -4110,6 +4110,10 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		msleep(MXT_RESET_GPIO_TIME);
 		gpiod_set_value(data->reset_gpio, 1);
 		msleep(MXT_RESET_INVALID_CHG);
+	} else {
+		dev_dbg(&client->dev,
+			"atmel reset pin not found in device tree");
+		msleep(MXT_RESET_TIME);
 	}
 
 	error = mxt_initialize(data);
-- 
2.19.2

