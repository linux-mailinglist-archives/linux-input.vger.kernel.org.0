Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A38AB15A3B1
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2020 09:46:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728662AbgBLIqe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Feb 2020 03:46:34 -0500
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:34515 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728642AbgBLIqe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Feb 2020 03:46:34 -0500
IronPort-SDR: 9+hPx7FG+WuQaZirnnQpDqYEVmKkmOwSIz9axa//AprH3dqwfo5R0albQ7VAFNzohaexh5k4Z8
 beRv9JteVYwZpEjGJlONtgSnPS/1kvADN/ATEt6gQcoz7SpM7VajWYhF87HvvM8WnVwa469W/A
 zDbroIBw+YHTf78g/GE9SLTflpxqqcmmOYszHClTrKlusnYEhVnZfW+I+VnNT77+feYOas4ZWa
 JSX7NBmF9q+uTI/24gMgdiLIG9WnUHkUt9vz1nIwjxm7+IirrF34Jhk96dIrwmm8iu+012eswI
 yfU=
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; 
   d="scan'208";a="45686274"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 12 Feb 2020 00:46:33 -0800
IronPort-SDR: 338N9LpBYCPreBsCB0iunxweU2EgUyR1i2ofs4QTLJKpKa9ii3Kv7giRv/Aoni14ydu1wGSLVC
 lvh+Yabozuc0/p5jcQ7A7beoNh/cKTHSbY0FYLCzrZe0SHWYbbyeJyxqWcfDYWhh0NKbIowAQQ
 h/knKwATCEbEf28ci3F9GDYYcxH2EYDQ0MWR4bVvnEGpKBGHJA/BJNJDYtmJ+dWukUNBaVvOzg
 qD81NNROr300cubnUUDqBtAXJNHTMT/62rOmI1YWRTvrybd/SOmYTIyCvkrvO4qoMy+56AOo+9
 tAg=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>, <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v7 34/48] input: atmel_mxt_ts: Add Missing Delay for reset handling of Atmel touch panel controller in detachable displays.
Date:   Wed, 12 Feb 2020 00:42:04 -0800
Message-ID: <20200212084218.32344-35-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212084218.32344-1-jiada_wang@mentor.com>
References: <20200212084218.32344-1-jiada_wang@mentor.com>
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
index b4ec565ee7dd..9f4212aedd11 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -4109,6 +4109,10 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
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

