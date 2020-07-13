Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B06E21CC65
	for <lists+linux-input@lfdr.de>; Mon, 13 Jul 2020 02:25:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728523AbgGMAY4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 12 Jul 2020 20:24:56 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:63768 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728198AbgGMAY4 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 12 Jul 2020 20:24:56 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4B4ktY68XxzMK;
        Mon, 13 Jul 2020 02:24:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1594599893; bh=reGzsv6o0SzGu0kgFqBp5wQTdWo8aH1udGsrZ3tTDzI=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=k/No+edIG1o08k2rPYLpVIdrL7iK7V6gB7NSAx7vTtPsbCkIQYwP15lBeiN6w8t+u
         9RqJLid2ZxwNUjLFZNeayT4E6Tny8XPQH/4pKefUceNCPmbBs5b55iqcQPoPVY/LzF
         uuv/t9n7yT4lVSV7DUo9qyI2bJYLFzOzZtSkCYbgAUJlM5vIVia7oeaedgMKVzLSJy
         2+QKAP4WTTWek8RmKCcM+EF6SAiiqn9hWPrEbZdjcVhe2+yDraKS/wj0a5GQeQICmH
         sK2sRUxURtDvSG+g31MfZVnU4osiYYU/SB9io/u9KlYVuegL3Kp5vb2oF8Wd3LrNnT
         64lC2/yPgXT6w==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.3 at mail
Date:   Mon, 13 Jul 2020 02:24:53 +0200
Message-Id: <033014c56453b84d367dc6cd14f1dddabb057d9b.1594599118.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1594599118.git.mirq-linux@rere.qmqm.pl>
References: <cover.1594599118.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v6 1/5] input: elants: document some registers and values
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        James Chen <james.chen@emc.com.tw>,
        Scott Liu <scott.liu@emc.com.tw>,
        Henrik Rydberg <rydberg@bitmath.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add information found in downstream kernels, to make the code less
magic. Fix comment spelling along the way.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Tested-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/input/touchscreen/elants_i2c.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index 5477a5718202..fa4a2f6b69c6 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -82,7 +82,7 @@
 
 #define HEADER_REPORT_10_FINGER	0x62
 
-/* Header (4 bytes) plus 3 fill 10-finger packets */
+/* Header (4 bytes) plus 3 full 10-finger packets */
 #define MAX_PACKET_SIZE		169
 
 #define BOOT_TIME_DELAY_MS	50
@@ -97,6 +97,10 @@
 #define E_INFO_PHY_SCAN		0xD7
 #define E_INFO_PHY_DRIVER	0xD8
 
+/* FW write command, 0x54 0x?? 0x0, 0x01 */
+#define E_POWER_STATE_SLEEP	0x50
+#define E_POWER_STATE_RESUME	0x58
+
 #define MAX_RETRIES		3
 #define MAX_FW_UPDATE_RETRIES	30
 
@@ -268,8 +272,8 @@ static int elants_i2c_calibrate(struct elants_data *ts)
 {
 	struct i2c_client *client = ts->client;
 	int ret, error;
-	static const u8 w_flashkey[] = { 0x54, 0xC0, 0xE1, 0x5A };
-	static const u8 rek[] = { 0x54, 0x29, 0x00, 0x01 };
+	static const u8 w_flashkey[] = { CMD_HEADER_WRITE, 0xC0, 0xE1, 0x5A };
+	static const u8 rek[] = { CMD_HEADER_WRITE, 0x29, 0x00, 0x01 };
 	static const u8 rek_resp[] = { CMD_HEADER_REK, 0x66, 0x66, 0x66 };
 
 	disable_irq(client->irq);
@@ -1382,7 +1386,9 @@ static int __maybe_unused elants_i2c_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct elants_data *ts = i2c_get_clientdata(client);
-	const u8 set_sleep_cmd[] = { 0x54, 0x50, 0x00, 0x01 };
+	const u8 set_sleep_cmd[] = {
+		CMD_HEADER_WRITE, E_POWER_STATE_SLEEP, 0x00, 0x01
+	};
 	int retry_cnt;
 	int error;
 
@@ -1419,7 +1425,9 @@ static int __maybe_unused elants_i2c_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct elants_data *ts = i2c_get_clientdata(client);
-	const u8 set_active_cmd[] = { 0x54, 0x58, 0x00, 0x01 };
+	const u8 set_active_cmd[] = {
+		CMD_HEADER_WRITE, E_POWER_STATE_RESUME, 0x00, 0x01
+	};
 	int retry_cnt;
 	int error;
 
-- 
2.20.1

