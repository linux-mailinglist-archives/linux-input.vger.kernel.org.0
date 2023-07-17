Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC9C1756D0D
	for <lists+linux-input@lfdr.de>; Mon, 17 Jul 2023 21:20:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231247AbjGQTUX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Jul 2023 15:20:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231268AbjGQTUV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Jul 2023 15:20:21 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD26E1B6
        for <linux-input@vger.kernel.org>; Mon, 17 Jul 2023 12:20:19 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-55be1ce1669so3001083a12.1
        for <linux-input@vger.kernel.org>; Mon, 17 Jul 2023 12:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1689621619; x=1692213619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BxqwFQEaz103YnifoW7TQwaLwgL55Tbq0Xq1x3fktnE=;
        b=HHmpKiFkCjm8jzgl4DBC6GDyEBq5T45I0kyUdpFpKtrlD+BNBKWjt6o5ew9+Ht9wiJ
         IZ6bImH/l+xf6Dqijf9XJoKIivqIQ+m+ehaDhaURY8R9Fpu+0dWgPJ9TPWB0eULt3dip
         4Kx9tXszZSkr9e5p4anTIeTT0SPVfWQJUmyGFwB1RpRQM11ij3+7Tvevjaxp7hGWHPgP
         A0yvmLvCI3oYQsls6fdKjlyJJjllDdJEnRrIYdo7NGfSaL+s7crWYJ5o5ting0j8Ob2z
         322tvBMn2llX00gVe6tG2smoODlrHAHE8DKNlSdqxVV+bG4e7iBpbs10dw5Bm59E+jt4
         5FbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689621619; x=1692213619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BxqwFQEaz103YnifoW7TQwaLwgL55Tbq0Xq1x3fktnE=;
        b=COlOF9+9ScUDEeNVAXoc5y9JJPo7k9R3ruyWwqbU39W71WF322b3TtGlVlp9cvpTkU
         h9aDzp8WiCGFx5m5rtK2YdRlLCDL0KFh+1vKMM07v3DE6PbIgGP0KXDC69HaDvQnl6Yf
         iJQKbffJ2T95qdnVvNg1DO2w2f7DFbLL4fFVq8ZpxPK4hZotvTUiV1SHD3uZC9pynUZ7
         Tq5TjxSCX9GC/CwZTQFo+ZJYGGYfoQhVdP/UJrXUODckxyacSmLeWkbXXNK4xLgxw7C4
         4H2bglPaVDoRPVn3fm3LmMvRZbJGrwIoGFROdRvEKyFdiIaTIdJzqH6BgB4HlA6UL2aH
         qG0Q==
X-Gm-Message-State: ABy/qLYgwFTNPL+9Z12CVxXJl7T3Bk2y+sji1ppV/U9pE3MkSqKopUZm
        cwPWshaYkl+Qh35jLDt9BLqRfv+1ueWfJ705dDWsuw==
X-Google-Smtp-Source: APBJJlGpQ4X2bd9Mkelc2f+lFzN3mJwwaLKT8hO7m8OnO26LTRp3GdmtUwkSiRXB1c8xCmnsLgU7EA==
X-Received: by 2002:a17:90b:4b01:b0:267:a6c5:e601 with SMTP id lx1-20020a17090b4b0100b00267a6c5e601mr519626pjb.1.1689621619335;
        Mon, 17 Jul 2023 12:20:19 -0700 (PDT)
Received: from sw06.internal.sifive.com ([64.62.193.194])
        by smtp.gmail.com with ESMTPSA id y8-20020a17090322c800b001b850c9af71sm210400plg.285.2023.07.17.12.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 12:20:18 -0700 (PDT)
From:   Samuel Holland <samuel.holland@sifive.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Support Opensource <support.opensource@diasemi.com>
Cc:     Samuel Holland <samuel.holland@sifive.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: da9063 - add wakeup support
Date:   Mon, 17 Jul 2023 12:20:03 -0700
Message-Id: <20230717192004.1304287-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Mark the IRQ as a wake IRQ so it will be enabled during system suspend.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 drivers/input/misc/da9063_onkey.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/input/misc/da9063_onkey.c b/drivers/input/misc/da9063_onkey.c
index b14a389600c9..74808bae326a 100644
--- a/drivers/input/misc/da9063_onkey.c
+++ b/drivers/input/misc/da9063_onkey.c
@@ -10,6 +10,7 @@
 #include <linux/input.h>
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
+#include <linux/pm_wakeirq.h>
 #include <linux/workqueue.h>
 #include <linux/regmap.h>
 #include <linux/of.h>
@@ -251,6 +252,14 @@ static int da9063_onkey_probe(struct platform_device *pdev)
 		return error;
 	}
 
+	error = dev_pm_set_wake_irq(&pdev->dev, irq);
+	if (error)
+		dev_warn(&pdev->dev,
+			 "Failed to set IRQ %d as a wake IRQ: %d\n",
+			 irq, error);
+	else
+		device_init_wakeup(&pdev->dev, true);
+
 	error = input_register_device(onkey->input);
 	if (error) {
 		dev_err(&pdev->dev,
-- 
2.40.1

