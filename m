Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9262B11B6E1
	for <lists+linux-input@lfdr.de>; Wed, 11 Dec 2019 17:04:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731398AbfLKQD6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Dec 2019 11:03:58 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:17810 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388809AbfLKQD2 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Dec 2019 11:03:28 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 47Y1tj1TTTzwT;
        Wed, 11 Dec 2019 17:03:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1576080205; bh=Oy1VvPQHyP5QeFjH7svcEiAPSnLBrr+l7IoFFshlf3Y=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=LEw3E0wqPNydVX/ZrXBs0IBb9pg5KK3a+T+LbXtW5igMe6IBi+K1bq4hXsIg21AUm
         VODV0aAF98Cwgb+g3cRWn7SjOOBlLp7+Wz2wxVk3AQWzXUEzu05I2LkKa+Y3CTQcVA
         c5l8vPZsbrAtk9GXRrjhi43kzavr7vpp0RM99Axxu3mA3unVnaeAFwHSE6QhD9J6Xb
         ku4J5dYV7/HsJX+C4iVeEwzmuv/xH0Rk5WEOzCp0SI8mNjwM/kbs5gL8GCSoX/R8E0
         zN6wJyZgwjVjexs0VOt0eX800yb4GER2OV5aZhjHEae11QUMoanFZJOK0Jplz5+8Vi
         6AHpepuqnm5zw==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.4 at mail
Date:   Wed, 11 Dec 2019 17:03:24 +0100
Message-Id: <fb5d7ea800dbbd908ff5a497bb02055ab7fe7ea8.1576079249.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1576079249.git.mirq-linux@rere.qmqm.pl>
References: <cover.1576079249.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v2 7/9] input: elants: support 0x66 reply opcode for reporting
 touches
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh-dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>
Sender: linux-input-owner@vger.kernel.org
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
Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/input/touchscreen/elants_i2c.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index 1c3eb49a22e4..d750eb97c912 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -60,6 +60,15 @@
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
@@ -990,7 +999,6 @@ static irqreturn_t elants_i2c_irq(int irq, void *_dev)
 		switch (ts->buf[FW_HDR_TYPE]) {
 		case CMD_HEADER_HELLO:
 		case CMD_HEADER_RESP:
-		case CMD_HEADER_REK:
 			break;
 
 		case QUEUE_HEADER_WAIT:
@@ -1010,6 +1018,7 @@ static irqreturn_t elants_i2c_irq(int irq, void *_dev)
 			break;
 
 		case QUEUE_HEADER_NORMAL:
+		case QUEUE_HEADER_NORMAL2:
 			report_count = ts->buf[FW_HDR_COUNT];
 			if (report_count == 0 || report_count > 3) {
 				dev_err(&client->dev,
-- 
2.20.1

