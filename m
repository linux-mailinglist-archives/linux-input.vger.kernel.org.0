Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19D16F45A8
	for <lists+linux-input@lfdr.de>; Fri,  8 Nov 2019 12:25:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730616AbfKHLY6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Nov 2019 06:24:58 -0500
Received: from smtp.asem.it ([151.1.184.197]:64272 "EHLO smtp.asem.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725730AbfKHLY5 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 8 Nov 2019 06:24:57 -0500
X-Greylist: delayed 304 seconds by postgrey-1.27 at vger.kernel.org; Fri, 08 Nov 2019 06:24:57 EST
Received: from webmail.asem.it
        by asem.it (smtp.asem.it)
        (SecurityGateway 5.5.0)
        with ESMTP id SG004227403.MSG 
        for <linux-input@vger.kernel.org>; Fri, 08 Nov 2019 12:19:50 +0100S
Received: from ASAS044.asem.intra (172.16.16.44) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35; Fri, 8
 Nov 2019 12:19:49 +0100
Received: from flavio-x.asem.intra (172.16.17.208) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server id 15.1.1261.35 via Frontend
 Transport; Fri, 8 Nov 2019 12:19:49 +0100
From:   Flavio Suligoi <f.suligoi@asem.it>
To:     rokhov <dmitry.torokhov@gmail.com>,
        Armijn Hemel <armijn@tjaldur.nl>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Flavio Suligoi <f.suligoi@asem.it>
Subject: [PATCH] input: ar1021: fix typo in preprocessor macro name
Date:   Fri, 8 Nov 2019 12:19:07 +0100
Message-ID: <1573211947-660-1-git-send-email-f.suligoi@asem.it>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-SGHeloLookup-Result: hardfail smtp.helo=webmail.asem.it (does not match 172.16.16.44)
X-SGSPF-Result: none (smtp.asem.it)
X-SGOP-RefID: str=0001.0A090207.5DC54F56.0033,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0 (_st=1 _vt=0 _iwf=0)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fix spelling mistake.

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---
 drivers/input/touchscreen/ar1021_i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/ar1021_i2c.c b/drivers/input/touchscreen/ar1021_i2c.c
index 28644f3..c0d5c24 100644
--- a/drivers/input/touchscreen/ar1021_i2c.c
+++ b/drivers/input/touchscreen/ar1021_i2c.c
@@ -13,7 +13,7 @@
 #include <linux/irq.h>
 #include <linux/interrupt.h>
 
-#define AR1021_TOCUH_PKG_SIZE	5
+#define AR1021_TOUCH_PKG_SIZE	5
 
 #define AR1021_MAX_X	4095
 #define AR1021_MAX_Y	4095
@@ -25,7 +25,7 @@
 struct ar1021_i2c {
 	struct i2c_client *client;
 	struct input_dev *input;
-	u8 data[AR1021_TOCUH_PKG_SIZE];
+	u8 data[AR1021_TOUCH_PKG_SIZE];
 };
 
 static irqreturn_t ar1021_i2c_irq(int irq, void *dev_id)
-- 
2.7.4

