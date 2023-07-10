Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 818BB74D5BF
	for <lists+linux-input@lfdr.de>; Mon, 10 Jul 2023 14:37:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbjGJMhc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Jul 2023 08:37:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjGJMhc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Jul 2023 08:37:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDDEADD
        for <linux-input@vger.kernel.org>; Mon, 10 Jul 2023 05:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688992600;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4EunXTFPWohHEqIFyvUhfjkaDbMaDEO8C0ZO2BvgWDE=;
        b=L+geeiz/BgHKKM5xjqWG551u9qmFwrk4/Yc+LHtgfwn+5mKN2GkUuG7Jff1W3agWaHJl88
        Mjp3j/M9k/zyThD8/pBa9BplUVAOAeS4fmaCZLSm6VZAGgqUcIvVQudSDpN35xcMvWgm7u
        1Wzd5kDCEz7WN4zOGEb+vyqzTU3pu9A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-OhA7XoFkP5iB7vZ3DIxJeA-1; Mon, 10 Jul 2023 08:36:37 -0400
X-MC-Unique: OhA7XoFkP5iB7vZ3DIxJeA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF248104458D;
        Mon, 10 Jul 2023 12:36:36 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.195.29])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D77FAF66B5;
        Mon, 10 Jul 2023 12:36:35 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH resend 2/2] Input: novatek-nvt-ts - add touchscreen model number to description
Date:   Mon, 10 Jul 2023 14:36:33 +0200
Message-ID: <20230710123633.323937-2-hdegoede@redhat.com>
In-Reply-To: <20230710123633.323937-1-hdegoede@redhat.com>
References: <20230710123633.323937-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

A phoronix forum member actual found documentation on what the model
number for the touchscreen controller on the Acer Iconia One 7 B1-750 is.

Update the driver's description to include this.

Link: https://www.phoronix.com/forums/forum/hardware/general-hardware/1382535-10-years-later-linux-getting-a-touchscreen-driver-for-a-once-popular-tablet?p=1384707#post1384707
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/Kconfig          | 4 ++--
 drivers/input/touchscreen/novatek-nvt-ts.c | 8 +++-----
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index c2cbd332af1d..fb4c23917b69 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -655,10 +655,10 @@ config TOUCHSCREEN_MTOUCH
 	  module will be called mtouch.
 
 config TOUCHSCREEN_NOVATEK_NVT_TS
-	tristate "Novatek NVT-ts touchscreen support"
+	tristate "Novatek NT11205 touchscreen support"
 	depends on I2C
 	help
-	  Say Y here if you have a Novatek NVT-ts touchscreen.
+	  Say Y here if you have a Novatek NT11205 touchscreen.
 	  If unsure, say N.
 
 	  To compile this driver as a module, choose M here: the
diff --git a/drivers/input/touchscreen/novatek-nvt-ts.c b/drivers/input/touchscreen/novatek-nvt-ts.c
index 047e371448ce..1a797e410a3f 100644
--- a/drivers/input/touchscreen/novatek-nvt-ts.c
+++ b/drivers/input/touchscreen/novatek-nvt-ts.c
@@ -1,9 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Driver for Novatek i2c touchscreen controller as found on
- * the Acer Iconia One 7 B1-750 tablet. The Touchscreen controller
- * model-number is unknown. Android calls this a "NVT-ts" touchscreen,
- * but that may apply to other Novatek controller models too.
+ * Driver for Novatek NT11205 i2c touchscreen controller as found
+ * on the Acer Iconia One 7 B1-750 tablet.
  *
  * Copyright (c) 2023 Hans de Goede <hdegoede@redhat.com>
  */
@@ -296,6 +294,6 @@ static struct i2c_driver nvt_ts_driver = {
 
 module_i2c_driver(nvt_ts_driver);
 
-MODULE_DESCRIPTION("Novatek NVT-ts touchscreen driver");
+MODULE_DESCRIPTION("Novatek NT11205 touchscreen driver");
 MODULE_AUTHOR("Hans de Goede <hdegoede@redhat.com>");
 MODULE_LICENSE("GPL");
-- 
2.41.0

