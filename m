Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F1D870FBB3
	for <lists+linux-input@lfdr.de>; Wed, 24 May 2023 18:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232133AbjEXQa1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 May 2023 12:30:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231494AbjEXQaZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 May 2023 12:30:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E648AE9
        for <linux-input@vger.kernel.org>; Wed, 24 May 2023 09:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684945779;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Q6Do9NIYnfXWIYHdJWdydT/KPHHp5JhgZ01zBif9ua4=;
        b=XlHYWa16511s8QAYVC2qh+mw+s8oGqyfijdlKeEaeQyouguM5Y87gc44T9UvI2lVkY6gcm
        9qjEi0igITjuEWO0UlxvCTH40Jom7OR/P7EfYjyT90G3tCzS+ij+JpnEASmUjYGx8bOGu7
        34XfJIP8ObA7uhe7bX0VNrkBNykjZhg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-se4EnBdXOLSKWADZ03ceJw-1; Wed, 24 May 2023 12:29:37 -0400
X-MC-Unique: se4EnBdXOLSKWADZ03ceJw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38538380673A;
        Wed, 24 May 2023 16:29:37 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.63])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A4F9B140E961;
        Wed, 24 May 2023 16:29:36 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 2/2] Input: novatek-nvt-ts - add touchscreen model number to description
Date:   Wed, 24 May 2023 18:29:35 +0200
Message-Id: <20230524162935.734255-2-hdegoede@redhat.com>
In-Reply-To: <20230524162935.734255-1-hdegoede@redhat.com>
References: <20230524162935.734255-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
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
index 143ff43c67ae..6527abc155c9 100644
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
index e7f30eeb91ca..c06b67d221f4 100644
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
2.40.1

