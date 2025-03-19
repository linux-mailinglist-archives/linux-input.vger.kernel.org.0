Return-Path: <linux-input+bounces-10959-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFDAA68310
	for <lists+linux-input@lfdr.de>; Wed, 19 Mar 2025 03:13:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B9613A9E9A
	for <lists+linux-input@lfdr.de>; Wed, 19 Mar 2025 02:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4054320D517;
	Wed, 19 Mar 2025 02:13:11 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E94AE552;
	Wed, 19 Mar 2025 02:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742350391; cv=none; b=UQFz9wBcwz7BW4HqjES9FR4Kt375Sk+nLYsHgEACzrrh52IXrPS4oqOcmrrrC0kMWVY/SC/EEOunOkriYbFgNi6QiRoBdsysMyngICAl1GSP6+RmtOwLWaOTRVvsMtg2HcToGbtVIJWg7NZQDoZBF378lgavfHn/J7sB1+I5k6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742350391; c=relaxed/simple;
	bh=xL7vIMlF+v3VDv3x7sqjQd9ftg9++KnmGJoNBdsjUvE=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=pm/3UDjDOtc/Rh/yYJKI+uvlPhfi2NKH/z/LtPGPxJoCLu2Vdk88iqwCR6UswtzA2+MQADdLeNBpg3nOWa3xP6LrCJIDJBgKgJnx2iFw8tuMAs0XmdEfDb24Ya/1VLq5+Wy1GgU9OQXXf6vqIQKPAXaIuD/Q2L2QyQtcfX7VJok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4ZHXL15gWJz501h5;
	Wed, 19 Mar 2025 10:12:57 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl1.zte.com.cn with SMTP id 52J2CeR6065464;
	Wed, 19 Mar 2025 10:12:41 +0800 (+08)
	(envelope-from xie.ludan@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Wed, 19 Mar 2025 10:12:42 +0800 (CST)
Date: Wed, 19 Mar 2025 10:12:42 +0800 (CST)
X-Zmail-TransId: 2afb67da281affffffffb22-4844a
X-Mailer: Zmail v1.0
Message-ID: <20250319101242304iR6PbYo3hAvFto8weR2Ps@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <xie.ludan@zte.com.cn>
To: <bentiss@kernel.org>
Cc: <jikos@kernel.org>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <xu.xin16@zte.com.cn>,
        <yang.yang29@zte.com.cn>, <jiang.peng9@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBISUQ6IGFwcGxldGIta2JkOiBSZXBsYWNlIG1zZWNzX3RvX2ppZmZpZXMgd2l0aMKgc2Vjc190b19qaWZmaWVzIGZvciB0aW1lciBzZXR0aW5ncw==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 52J2CeR6065464
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67DA2829.009/4ZHXL15gWJz501h5

From: Peng Jiang <jiang.peng9@zte.com.cn>

The variables `appletb_tb_idle_timeout` and `appletb_tb_dim_timeout`
are already defined in seconds, so using `secs_to_jiffies` directly
makes the code more readable and consistent with the units used.

This is converted using scripts/coccinelle/misc/secs_to_jiffies.cocci with
the following Coccinelle rules:

@depends on patch@
expression E;
@@

-msecs_to_jiffies
+secs_to_jiffies
(E
- * \( 1000 \| MSEC_PER_SEC \)
)

Signed-off-by: Peng Jiang <jiang.peng9@zte.com.cn>
Signed-off-by: XieLudan <xie.ludan@zte.com.cn>
---
 drivers/hid/hid-appletb-kbd.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-appletb-kbd.c b/drivers/hid/hid-appletb-kbd.c
index d4b95aa3eecb..2f78db891cb9 100644
--- a/drivers/hid/hid-appletb-kbd.c
+++ b/drivers/hid/hid-appletb-kbd.c
@@ -172,7 +172,8 @@ static void appletb_inactivity_timer(struct timer_list *t)
 		if (!kbd->has_dimmed) {
 			backlight_device_set_brightness(kbd->backlight_dev, 1);
 			kbd->has_dimmed = true;
-			mod_timer(&kbd->inactivity_timer, jiffies + msecs_to_jiffies(appletb_tb_idle_timeout * 1000));
+			mod_timer(&kbd->inactivity_timer,
+				  jiffies + secs_to_jiffies(appletb_tb_idle_timeout));
 		} else if (!kbd->has_turned_off) {
 			backlight_device_set_brightness(kbd->backlight_dev, 0);
 			kbd->has_turned_off = true;
@@ -188,7 +189,8 @@ static void reset_inactivity_timer(struct appletb_kbd *kbd)
 			kbd->has_dimmed = false;
 			kbd->has_turned_off = false;
 		}
-		mod_timer(&kbd->inactivity_timer, jiffies + msecs_to_jiffies(appletb_tb_dim_timeout * 1000));
+		mod_timer(&kbd->inactivity_timer,
+			  jiffies + secs_to_jiffies(appletb_tb_dim_timeout));
 	}
 }

@@ -407,7 +409,8 @@ static int appletb_kbd_probe(struct hid_device *hdev, const struct hid_device_id
 	} else {
 		backlight_device_set_brightness(kbd->backlight_dev, 2);
 		timer_setup(&kbd->inactivity_timer, appletb_inactivity_timer, 0);
-		mod_timer(&kbd->inactivity_timer, jiffies + msecs_to_jiffies(appletb_tb_dim_timeout * 1000));
+		mod_timer(&kbd->inactivity_timer,
+			  jiffies + secs_to_jiffies(appletb_tb_dim_timeout));
 	}

 	kbd->inp_handler.event = appletb_kbd_inp_event;
-- 
2.25.1

