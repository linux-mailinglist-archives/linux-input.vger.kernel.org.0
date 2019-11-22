Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2F261067F3
	for <lists+linux-input@lfdr.de>; Fri, 22 Nov 2019 09:26:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbfKVI0P (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Nov 2019 03:26:15 -0500
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:23065 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726554AbfKVI0N (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Nov 2019 03:26:13 -0500
IronPort-SDR: O7W54g9Zc1mfeqZ7QL3yZZBXBaMiEr6piTzJiNHzHEsy+1De8bjC60CLhkp96WTeuMGH9wXCMb
 zqmQcCdmab/9gkY0D3ZfzY1q3bTWL+knnFUSjyWWuynTq7jhlhQUC4wJg2xhHqW2gFtwvmzlTa
 rg5othlFxXTMibkqKbXOn1ElH+AXsFXT8ZfC2MlRuh1gNLIaY35eixcKFOE2AR4Y/kwe/aRidU
 njK+6MXeyC0Ihx9eqAY4sjCYnUl8heC2vUsr8r98vZqYCLXIvhR7EMdcUboOPj7o1FpE/c1wQZ
 CRM=
X-IronPort-AV: E=Sophos;i="5.69,229,1571731200"; 
   d="scan'208";a="45291168"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 22 Nov 2019 00:26:12 -0800
IronPort-SDR: 95vGJvZy7P4A4RfrXVys4fungW696IkjKtZ4DNEoq8GnRe9DywS5XuVq2x3BNd5n0w0SuER+mI
 CCKnMtzqECMf+yNb8700wyq9twk/ldtKomgPZxre0NX0641+DodnG76Vk2Rv4e17LHw0rDW1oO
 ggBP37QNrolrvJyy5cDtLKCVE+9t2nQ4muur5WSveS9rZDIer0viqkfmrBAf7IeluerSUSe3EU
 kcW4lJEiP/HhMavlHIMDJYQJu5FbuNIz57kIFi721+RuRsNJrhEaCgiDG38azdETwptpWhHU/l
 Tjo=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v6 34/48] input: atmel_mxt_ts: Add Missing Delay for reset handling of Atmel touch panel controller in detachable displays.
Date:   Fri, 22 Nov 2019 17:23:48 +0900
Message-ID: <20191122082402.18173-35-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191122082402.18173-1-jiada_wang@mentor.com>
References: <20191122082402.18173-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
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
index f357d353447f..835cc7a29c2f 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -4112,6 +4112,10 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
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
2.17.1

