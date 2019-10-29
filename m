Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BFEAE8242
	for <lists+linux-input@lfdr.de>; Tue, 29 Oct 2019 08:22:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733045AbfJ2HWT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Oct 2019 03:22:19 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:7825 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728167AbfJ2HWS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Oct 2019 03:22:18 -0400
IronPort-SDR: rWZnC7O4qZjMiw3WyqamdzLyijiIP7pEHftklK8tFg1CQCrn3SJ5O6NN3Thf7a3AGLkt2kX8FS
 1qV8xis3J+pkqMSJ43Ny8GwahzdFGSdRz5Rm263ETvWTbUu9axnhzy7zgEOcaI6MB2qiBNfqVS
 MsIHe7Y4Th1VM5uRgs5cVjShDxgQwA3YHmO6HNjNw15lVbptWvfnpYDuYgWvkVh1XWgb86ky0q
 5JYfKnG75LbnnloGynYUMj4PkjQurzB+MK825p+M5x3WfGZmYzBxuDIRhBwggMoJKHSiq7+EOJ
 G60=
X-IronPort-AV: E=Sophos;i="5.68,243,1569312000"; 
   d="scan'208";a="44509427"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 28 Oct 2019 23:22:17 -0800
IronPort-SDR: CP72SiwXNrJcY//zdX0jcHJqgmB9iGCrejkxNZzvRWkD6LWNsiX+lDu7ALtHkbjz0AzpgVlYu6
 edK1yadBLrJYcl+iLrvUfpiKGVX1SGs+VLC2rqTGKkPQSJzdcOkMAGWJXLjhg+cfmSiapERfas
 bOg64U/qNji8QGXSQh2ZdRCgsXvC74zAEQ83+xm77pSlXxBXiCJWKEH69678SxcE7gvDAo4HND
 ujTJfMeXws/xRieQU9IjqiV4AAGpHxSrYRBPMjeJAKtayP69AnndnQdML8ogbTtLfIYfpXNL0n
 zvc=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <erosca@de.adit-jv.com>,
        <Andrew_Gabbasov@mentor.com>
Subject: [PATCH v4 34/48] input: atmel_mxt_ts: Add Missing Delay for reset handling of Atmel touch panel controller in detachable displays.
Date:   Tue, 29 Oct 2019 16:19:56 +0900
Message-ID: <20191029072010.8492-35-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029072010.8492-1-jiada_wang@mentor.com>
References: <20191029072010.8492-1-jiada_wang@mentor.com>
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
index 8708bbb877cf..f8c273bd1429 100644
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

