Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6E771B9175
	for <lists+linux-input@lfdr.de>; Sun, 26 Apr 2020 18:11:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgDZQLS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Apr 2020 12:11:18 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:37638 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726217AbgDZQLR (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Apr 2020 12:11:17 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 499CZW4BdVzDY;
        Sun, 26 Apr 2020 18:11:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1587917475; bh=3ZJYJwji4GFe5gxynVxKFtpPu5+djzYCZf9cg933BFY=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=CQYO9mfnSZdIzJMfsSGAMqVSbpFlkOkSFf064/4kfmea9/yXhVlTh1z4dRW5gYY+v
         FtYCtV7vqlYUfQQbNknEHIm/kY9KHyTEsxPxDMDvHQIui6PFLwJOAXRH6r4l1jJDk0
         KfNb0LsdD8X80xxNSPMj7qDIdX+a4y3rO7amc3+myKjphGRKVrgJCb45sVtleW+ejh
         Jp4vZTdUiM0Cxk1Wv47fZc5Vxg0KoTVqQFKf8y112iAXQJenM9uFfSaA6KTBt7kXyx
         FqWa/bgsOO3U/ThcD8dzVKH/wX3aVJxLmazuJ/9YecFuvx/ZkTXibzY99x+CFHnN5K
         rzLPicUDpgMOQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.2 at mail
Date:   Sun, 26 Apr 2020 18:11:14 +0200
Message-Id: <38acf072e94d6f7fa9066495c2479bb35bfa42d1.1587916846.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1587916846.git.mirq-linux@rere.qmqm.pl>
References: <cover.1587916846.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v4 07/10] input: elants: support 0x66 reply opcode for
 reporting touches
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     David Heidelberg <david@ixit.cz>,
        Dmitry Osipenko <digetx@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
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
Tested-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/input/touchscreen/elants_i2c.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index 34d5c1fb5bea..ece14cb39d63 100644
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
@@ -1050,7 +1059,6 @@ static irqreturn_t elants_i2c_irq(int irq, void *_dev)
 		switch (ts->buf[FW_HDR_TYPE]) {
 		case CMD_HEADER_HELLO:
 		case CMD_HEADER_RESP:
-		case CMD_HEADER_REK:
 			break;
 
 		case QUEUE_HEADER_WAIT:
@@ -1070,6 +1078,7 @@ static irqreturn_t elants_i2c_irq(int irq, void *_dev)
 			break;
 
 		case QUEUE_HEADER_NORMAL:
+		case QUEUE_HEADER_NORMAL2:
 			report_count = ts->buf[FW_HDR_COUNT];
 			if (report_count == 0 || report_count > 3) {
 				dev_err(&client->dev,
-- 
2.20.1

