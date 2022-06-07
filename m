Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2487953911B
	for <lists+linux-input@lfdr.de>; Tue, 31 May 2022 14:50:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233439AbiEaMui (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 May 2022 08:50:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344384AbiEaMuc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 May 2022 08:50:32 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E6717628E
        for <linux-input@vger.kernel.org>; Tue, 31 May 2022 05:50:29 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 67-20020a1c1946000000b00397382b44f4so1137363wmz.2
        for <linux-input@vger.kernel.org>; Tue, 31 May 2022 05:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YLlRUeN/TOrT2ebBiIFjsBEVkxm8B/bhYM4k20ZOGZg=;
        b=4y4HAEoKzbTSyTgajffhR2aDVgvpwQKNHVxtafAMmAzhwZgy8J0N+SW//gQNXEYCHE
         NOLtKIE4XCpn5KLcohuK1SQ41zRLV3svSj7hpHmwuYMg0vGfPCvniT2Rd1wkoKZKk0dv
         C83w1q8MipD7OFVbXuMhCq/HhwtEIYcOsSTLEuFLOtAR97BhFb0/7gPafVrMJFy4kIAE
         S5eJhPqZUeFsmEy0QK2cWGESre3hOUpIQI1H2v/zJOHcxtzEvX4atcMhFnYEQO6629MS
         xoQ73MjWqKzoIdnaPFLNJTuX55lurDtcyd5BvscNsJRUFvRAza8ah3KhcMpZm3mhReVh
         YHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YLlRUeN/TOrT2ebBiIFjsBEVkxm8B/bhYM4k20ZOGZg=;
        b=1QdLCvBPE5HdNlFZ9Ch1S8DWSOVp/eftNZNkvs1cLO3p/5GRgpHxIrWXD7CVbU5XJS
         hEuaj8MEkdpr4G7iENTXkspsP2sGT8Enkm8ajYiPgzCeTZMUbS2FyTgLdokpQI7Swy7i
         e/28rdckTGFXpfXXw9CcwSjrUJCNWhalMgYxqhmvLwc9+8fFXStmD1XxShs4xYU/u4iR
         HGcyux3ZmeR4Oen0c8k6C3a2lnQpgGTkWQQsFyMZVHtubJf829+nV/8s3bBv29EdHdGi
         2Am9H/oMS+9GQ5Oxyd8+aCXpuh/t4Fh8Q5hBbl9voVEXbCbusR/JMLG9ivvNXkgGYrZH
         92nA==
X-Gm-Message-State: AOAM531B5r+zFotf6+L8owzDmEzy0Yx/BJ9wNiqg42OqVXQv+iNJRMwx
        E4fs2y/Kezd4Ig9lpbVESMry1A==
X-Google-Smtp-Source: ABdhPJyI3B52WGxQAocPAuXIiOIrcAUAGmzuyTmzC1BOgLKoCbjxKRJR7BzukFIiGKNeJhICcrjYjQ==
X-Received: by 2002:a05:600c:1492:b0:397:4afc:cc76 with SMTP id c18-20020a05600c149200b003974afccc76mr23694357wmh.124.1654001428114;
        Tue, 31 May 2022 05:50:28 -0700 (PDT)
Received: from helium.lan ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id i13-20020adfaacd000000b0020fc40d006bsm11475019wrc.17.2022.05.31.05.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 05:50:27 -0700 (PDT)
From:   Fabien Parent <fparent@baylibre.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] Input: mtk-pmic-keys: add MT6357 support
Date:   Tue, 31 May 2022 14:49:59 +0200
Message-Id: <20220531124959.202787-8-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531124959.202787-1-fparent@baylibre.com>
References: <20220531124959.202787-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add PMIC Keys support on MT6357 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---

This commit depends on 
https://lore.kernel.org/all/20220415153629.1817202-1-fparent@baylibre.com/

 drivers/input/keyboard/mtk-pmic-keys.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index 609b87afd020..3a256c885a3b 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -9,6 +9,7 @@
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/mfd/mt6323/registers.h>
+#include <linux/mfd/mt6357/registers.h>
 #include <linux/mfd/mt6358/registers.h>
 #include <linux/mfd/mt6397/core.h>
 #include <linux/mfd/mt6397/registers.h>
@@ -87,6 +88,17 @@ static const struct mtk_pmic_keys_pdata mt6358_pdata = {
 	.has_key_release_irqs = true,
 };
 
+static const struct mtk_pmic_keys_pdata mt6357_regs = {
+	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6357_TOPSTATUS,
+		0x2, MT6357_PSC_TOP_INT_CON0, 0x5),
+	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6357_TOPSTATUS,
+		0x8, MT6357_PSC_TOP_INT_CON0, 0xa),
+	.pmic_rst_reg = MT6357_TOP_RST_MISC,
+	.has_key_release_irqs = true,
+};
+
 struct mtk_pmic_keys_info {
 	struct mtk_pmic_keys *keys;
 	const struct mtk_pmic_keys_regs *regs;
@@ -261,6 +273,9 @@ static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
 	}, {
 		.compatible = "mediatek,mt6323-keys",
 		.data = &mt6323_pdata,
+	}, {
+		.compatible = "mediatek,mt6357-keys",
+		.data = &mt6357_regs,
 	}, {
 		.compatible = "mediatek,mt6358-keys",
 		.data = &mt6358_pdata,
-- 
2.36.1

