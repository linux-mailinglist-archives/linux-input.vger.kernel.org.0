Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB23531DF7F
	for <lists+linux-input@lfdr.de>; Wed, 17 Feb 2021 20:20:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232650AbhBQTTm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Feb 2021 14:19:42 -0500
Received: from ec2-44-228-98-151.us-west-2.compute.amazonaws.com ([44.228.98.151]:58896
        "EHLO chill.innovation.ch" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232548AbhBQTTg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Feb 2021 14:19:36 -0500
Received: from localhost (localhost [127.0.0.1])
        by chill.innovation.ch (Postfix) with ESMTP id 423071B6410;
        Wed, 17 Feb 2021 19:07:31 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at chill.innovation.ch
Received: from chill.innovation.ch ([127.0.0.1])
        by localhost (chill.innovation.ch [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id gTv6AwvRv-QZ; Wed, 17 Feb 2021 19:07:30 +0000 (UTC)
From:   =?UTF-8?q?Ronald=20Tschal=C3=A4r?= <ronald@innovation.ch>
DKIM-Filter: OpenDKIM Filter v2.11.0 chill.innovation.ch B782B1B5EA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=innovation.ch;
        s=default; t=1613588850;
        bh=kG3doMqYTJAWa6Cik1eP36mmnCuyDrLmpJlt/5Wwi6s=;
        h=From:To:Cc:Subject:Date:From;
        b=Ry5z7xRdtVseBSrzLncqrNUO2Jpldl3OV6yCb2Q5YOI5emoBTaN8z7cx18X4oroVg
         O0bqaRIenMC6nzDk9bLaJ0uf50PpGQ9QeSu+P2bUL2qlNhc6svieDbgTxBf2BL2tXU
         ui9z0F0yw1y+sD1CDB/DU1oJCcdG0L4QrmrF0RPNpo3aLyH7+LsLX9RtaVVDNupnW8
         K0NDYUXmaUuSFdxugvvdiQs/q591YOK+1c3/gjHeNkOS9cvwiC460aZM2NdRkMutGL
         0xt+9EcqNsAXi/esy3r6Gf3ulmz/WaYcRtKzI7tGEEgZO1zGrbpN309c0EStKj5+N7
         bHm0rXznNNiXg==
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sergiu Cuciurean <sergiu.cuciurean@analog.com>,
        Lee Jones <lee.jones@linaro.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] Input: applespi: Don't wait for responses to commands indefinitely.
Date:   Wed, 17 Feb 2021 11:07:16 -0800
Message-Id: <20210217190718.11035-1-ronald@innovation.ch>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The response to a command may never arrive or it may be corrupted (and
hence dropped) for some reason. While exceedingly rare, when it did
happen it blocked all further commands. One way to fix this was to
do a suspend/resume. However, recovering automatically seems like a
nicer option. Hence this puts a time limit (1 sec) on how long we're
willing to wait for a response, after which we assume it got lost.

Signed-off-by: Ronald Tschalär <ronald@innovation.ch>
---
 drivers/input/keyboard/applespi.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/input/keyboard/applespi.c b/drivers/input/keyboard/applespi.c
index d22223154177f..8494bf610fd70 100644
--- a/drivers/input/keyboard/applespi.c
+++ b/drivers/input/keyboard/applespi.c
@@ -48,6 +48,7 @@
 #include <linux/efi.h>
 #include <linux/input.h>
 #include <linux/input/mt.h>
+#include <linux/ktime.h>
 #include <linux/leds.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
@@ -409,7 +410,7 @@ struct applespi_data {
 	unsigned int			cmd_msg_cntr;
 	/* lock to protect the above parameters and flags below */
 	spinlock_t			cmd_msg_lock;
-	bool				cmd_msg_queued;
+	ktime_t				cmd_msg_queued;
 	enum applespi_evt_type		cmd_evt_type;
 
 	struct led_classdev		backlight_info;
@@ -729,7 +730,7 @@ static void applespi_msg_complete(struct applespi_data *applespi,
 		wake_up_all(&applespi->drain_complete);
 
 	if (is_write_msg) {
-		applespi->cmd_msg_queued = false;
+		applespi->cmd_msg_queued = 0;
 		applespi_send_cmd_msg(applespi);
 	}
 
@@ -771,8 +772,16 @@ static int applespi_send_cmd_msg(struct applespi_data *applespi)
 		return 0;
 
 	/* check whether send is in progress */
-	if (applespi->cmd_msg_queued)
-		return 0;
+	if (applespi->cmd_msg_queued) {
+		if (ktime_ms_delta(ktime_get(), applespi->cmd_msg_queued) < 1000)
+			return 0;
+
+		dev_warn(&applespi->spi->dev, "Command %d timed out\n",
+			 applespi->cmd_evt_type);
+
+		applespi->cmd_msg_queued = 0;
+		applespi->write_active = false;
+	}
 
 	/* set up packet */
 	memset(packet, 0, APPLESPI_PACKET_SIZE);
@@ -869,7 +878,7 @@ static int applespi_send_cmd_msg(struct applespi_data *applespi)
 		return sts;
 	}
 
-	applespi->cmd_msg_queued = true;
+	applespi->cmd_msg_queued = ktime_get();
 	applespi->write_active = true;
 
 	return 0;
@@ -1921,7 +1930,7 @@ static int __maybe_unused applespi_resume(struct device *dev)
 	applespi->drain = false;
 	applespi->have_cl_led_on = false;
 	applespi->have_bl_level = 0;
-	applespi->cmd_msg_queued = false;
+	applespi->cmd_msg_queued = 0;
 	applespi->read_active = false;
 	applespi->write_active = false;
 
-- 
2.26.2

