Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4950A156AF1
	for <lists+linux-input@lfdr.de>; Sun,  9 Feb 2020 16:07:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727514AbgBIPHw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 9 Feb 2020 10:07:52 -0500
Received: from mail.z3ntu.xyz ([128.199.32.197]:48862 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727473AbgBIPHv (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 9 Feb 2020 10:07:51 -0500
X-Greylist: delayed 579 seconds by postgrey-1.27 at vger.kernel.org; Sun, 09 Feb 2020 10:07:51 EST
Received: from localhost.localdomain (80-110-126-226.cgn.dynamic.surfer.at [80.110.126.226])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 6FF16C1E6B;
        Sun,  9 Feb 2020 14:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1581260290; bh=fXokjl3buPKdcKP76ZQEdI/YJ/AlFiijGYDN80E3mRU=;
        h=From:To:Cc:Subject:Date;
        b=KdumcUU8EptO2zZQjBqOdje/PFw8e94CLMRhNsTu7vfZKgo7tOnxbyewCzJLEHPe7
         O8jWuTSJzxqnt8qlbdQm5B4hjuMYC/7rff91pkpNCesDUavRF9WYq9GA8PkRuQDbw2
         ktGuwumrS9Ah9P9/eQBaNuzuq9US/C5YKeFo6EqU=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-input@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, Luca Weiss <luca@z3ntu.xyz>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Marek Vasut <marex@denx.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Input: ili210x - fix return value of is_visible function
Date:   Sun,  9 Feb 2020 15:56:26 +0100
Message-Id: <20200209145628.649409-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The is_visible function expects the permissions associated with an
attribute of the sysfs group or 0 if an attribute is not visible.

Change the code to return the attribute permissions when the attribute
should be visible which resolves the warning:

  Attribute calibrate: Invalid permissions 01

Fixes: cc12ba1872c6 ("Input: ili210x - optionally show calibrate sysfs attribute")
Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 drivers/input/touchscreen/ili210x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index 37526baff8a6..199cf3daec10 100644
--- a/drivers/input/touchscreen/ili210x.c
+++ b/drivers/input/touchscreen/ili210x.c
@@ -351,7 +351,7 @@ static umode_t ili210x_calibrate_visible(struct kobject *kobj,
 	struct i2c_client *client = to_i2c_client(dev);
 	struct ili210x *priv = i2c_get_clientdata(client);
 
-	return priv->chip->has_calibrate_reg;
+	return priv->chip->has_calibrate_reg ? attr->mode : 0;
 }
 
 static const struct attribute_group ili210x_attr_group = {
-- 
2.25.0

