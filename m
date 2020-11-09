Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA8E2AC236
	for <lists+linux-input@lfdr.de>; Mon,  9 Nov 2020 18:28:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731841AbgKIR2t (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Nov 2020 12:28:49 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:1381 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731634AbgKIR2t (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 9 Nov 2020 12:28:49 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4CVHz3362MzTg;
        Mon,  9 Nov 2020 18:28:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1604942927; bh=nLwavT2NA5+jIA2IuW6zD/l5oswZ/ngNahOWEbWGrOQ=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=HxjM3Q0hwLScDtmMX5LDO2s9nm2aLpP5C7QYWaj1PdAilcDhAq6UH2PgfdaBw7qTg
         ji3goqS3TNJ+W9q2Ysic2XhMjjTtnEpJm8akqUnXE+Hg4QNx31NdURbIPpiQxpSlz9
         3Ute+7OMramr9SM81XzQeOnXcjDu+YhMRtJupNCrXxtBXDwbsPeK5r7rUIR9vpPd99
         7K6JGTDAcjIY8GI2mi16MqZvJxBTl64XUDBjzC5T3xGnKjBt6QkZToK8BqimBuzgGZ
         Go+HzgAHmcA5CA2CrV8uRhErw+Ftzo8nQdVNjCdT+zWVCVilPoRGh8ncVpvoDu+uRc
         JspujQ7dmzTzg==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date:   Mon, 09 Nov 2020 18:28:46 +0100
Message-Id: <76ce45c4a488036f94547d45fc4a964b83c6e381.1604942771.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1604942771.git.mirq-linux@rere.qmqm.pl>
References: <cover.1604942771.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH RESEND v8 4/4] input: elants: support 0x66 reply opcode for
 reporting touches
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Johnny Chuang <johnny.chuang.emc@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Peter Hutterer <peter.hutterer@who-t.net>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Dmitry Osipenko <digetx@gmail.com>

eKTF3624 touchscreen firmware uses two variants of the reply opcodes for
reporting touch events: one is 0x63 (used by older firmware) and other is
0x66 (used by newer firmware). The 0x66 variant is equal to 0x63 of
eKTH3500, while 0x63 needs small adjustment of the touch pressure value.

Nexus 7 tablet device has eKTF3624 touchscreen and it uses 0x66 opcode for
reporting touch events, let's support it now. Other devices, eg. ASUS TF300T,
use 0x63.

Note: CMD_HEADER_REK is used for replying to calibration requests, it has
the same 0x66 opcode number which eKTF3624 uses for reporting touches.
The calibration replies are handled separately from the the rest of the
commands in the driver by entering into ELAN_WAIT_RECALIBRATION state
and thus this change shouldn't change the old behavior.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Tested-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/input/touchscreen/elants_i2c.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index c24d8cdc4251..1cbda6f20d07 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -61,6 +61,15 @@
 #define QUEUE_HEADER_NORMAL	0X63
 #define QUEUE_HEADER_WAIT	0x64
 
+/*
+ * Depending on firmware version, eKTF3624 touchscreens may utilize one of
+ * these opcodes for the touch events: 0x63 and 0x66. The 0x63 is used by
+ * older firmware version and differs from 0x66 such that touch pressure
+ * value needs to be adjusted. The 0x66 opcode of newer firmware is equal
+ * to 0x63 of eKTH3500.
+ */
+#define QUEUE_HEADER_NORMAL2	0x66
+
 /* Command header definition */
 #define CMD_HEADER_WRITE	0x54
 #define CMD_HEADER_READ		0x53
@@ -1052,7 +1061,6 @@ static irqreturn_t elants_i2c_irq(int irq, void *_dev)
 		switch (ts->buf[FW_HDR_TYPE]) {
 		case CMD_HEADER_HELLO:
 		case CMD_HEADER_RESP:
-		case CMD_HEADER_REK:
 			break;
 
 		case QUEUE_HEADER_WAIT:
@@ -1072,6 +1080,7 @@ static irqreturn_t elants_i2c_irq(int irq, void *_dev)
 			break;
 
 		case QUEUE_HEADER_NORMAL:
+		case QUEUE_HEADER_NORMAL2:
 			report_count = ts->buf[FW_HDR_COUNT];
 			if (report_count == 0 || report_count > 3) {
 				dev_err(&client->dev,
-- 
2.20.1

