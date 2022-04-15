Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3995502D15
	for <lists+linux-input@lfdr.de>; Fri, 15 Apr 2022 17:40:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348229AbiDOPjq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Apr 2022 11:39:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356324AbiDOPje (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Apr 2022 11:39:34 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79AFC3C712
        for <linux-input@vger.kernel.org>; Fri, 15 Apr 2022 08:37:05 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id x3so5114572wmj.5
        for <linux-input@vger.kernel.org>; Fri, 15 Apr 2022 08:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aOuA22Fnc3OP61xN2U3nVIxEXPTaTGZoGkevrFGNYyg=;
        b=DyqkpaQ0iLmMxTSpSfK+MHcWI4dG85kzMTTwtuWYeCRYtIbx5bXRyT07WmWzHsFmI+
         LI7CkRLc+ATmkIkjkRB9h7V4Mh98t7/3VuRbUF0WCDbS6f2SXmzSakByyD0Riyyh+BHk
         z5lhZdYKONmGFs7ue+eR/heV4ycjYDy1Q7Tc41VQvf4+ih15zXlglAOI8WCf6WOV2LnS
         6JnC6vlrDmKK02wcArS0L3jp8LUEjEwldHeD6qMv0Af21Wnar178mT4n7B4ByVi4nMAb
         UccU/HRTf1L9z8lDcTAvb9l2ETglTQ1praXDN3tBtyA2Dp/Hudnldqd4NOKzHhFW7Xqf
         Ql/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aOuA22Fnc3OP61xN2U3nVIxEXPTaTGZoGkevrFGNYyg=;
        b=FpEE0bhtPUBeq6dpCBX0t5Io8fv9vQGP7Yu0Tmt0dh6dCOEHyLFqyX4EuxTrCvIkmN
         KW50NENKSF9MWq/QCLcOhHQLbtoI0d21sIbEvPELUjmUDMIprqHm2Ek6FNYsTDhAgfS1
         KklAudSH23WDjGx5N3KDozrjH4G1F3LODdCK0wwL0v+yOKFEDYZt485fJF8DlRYt4Ulu
         55XS6vp7WJAFFEBxRKloEvpHcChErTSX3yYINWNZqeAN9y1HY5rNnm0ohk9wFMUcLB78
         51tV2JnilRKlevMAW267GCeE+kX6L+SgyaTkb/y/wXvfh7KCBi2cQ133j5Q06kuP5/xi
         pwqg==
X-Gm-Message-State: AOAM531vbQuxbDJSh3gl8fRNmLcdLep+f6830aBC3bRL1hQ7vV8yYRed
        8H6zaPj0lZomJYbT+uhAGfd/FA==
X-Google-Smtp-Source: ABdhPJx03NY3RAywsaD42S7tmhUjufCPfkN1P5jZuGzXIexElqoiAjwpZmPJGrrZ71UlLBgVNggQLw==
X-Received: by 2002:a7b:c384:0:b0:38e:6b47:58c4 with SMTP id s4-20020a7bc384000000b0038e6b4758c4mr3783287wmj.134.1650037024073;
        Fri, 15 Apr 2022 08:37:04 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id c24-20020a7bc018000000b0038a18068cf5sm8459292wmb.15.2022.04.15.08.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Apr 2022 08:37:03 -0700 (PDT)
From:   Fabien Parent <fparent@baylibre.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] Input: keyboard: mtk-pmic-keys: add support for MT6359
Date:   Fri, 15 Apr 2022 17:36:28 +0200
Message-Id: <20220415153629.1817202-7-fparent@baylibre.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220415153629.1817202-1-fparent@baylibre.com>
References: <20220415153629.1817202-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support for the MT6359 PMIC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index 609b87afd020..115ed4aaae81 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -10,6 +10,7 @@
 #include <linux/kernel.h>
 #include <linux/mfd/mt6323/registers.h>
 #include <linux/mfd/mt6358/registers.h>
+#include <linux/mfd/mt6359/registers.h>
 #include <linux/mfd/mt6397/core.h>
 #include <linux/mfd/mt6397/registers.h>
 #include <linux/module.h>
@@ -87,6 +88,17 @@ static const struct mtk_pmic_keys_pdata mt6358_pdata = {
 	.has_key_release_irqs = true,
 };
 
+static const struct mtk_pmic_keys_pdata mt6359_pdata = {
+	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6359_TOPSTATUS,
+		0x2, MT6359_PSC_TOP_INT_CON0, 0x5),
+	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6359_TOPSTATUS,
+		0x8, MT6359_PSC_TOP_INT_CON0, 0xa),
+	.pmic_rst_reg = MT6359_TOP_RST_MISC,
+	.has_key_release_irqs = true,
+};
+
 struct mtk_pmic_keys_info {
 	struct mtk_pmic_keys *keys;
 	const struct mtk_pmic_keys_regs *regs;
@@ -264,6 +276,9 @@ static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
 	}, {
 		.compatible = "mediatek,mt6358-keys",
 		.data = &mt6358_pdata,
+	}, {
+		.compatible = "mediatek,mt6359-keys",
+		.data = &mt6359_pdata,
 	}, {
 		/* sentinel */
 	}
-- 
2.35.2

