Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC43A50FFAF
	for <lists+linux-input@lfdr.de>; Tue, 26 Apr 2022 15:54:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351209AbiDZN4r (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 26 Apr 2022 09:56:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351214AbiDZN4q (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 26 Apr 2022 09:56:46 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9A8315DD70
        for <linux-input@vger.kernel.org>; Tue, 26 Apr 2022 06:53:35 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id b19so25558820wrh.11
        for <linux-input@vger.kernel.org>; Tue, 26 Apr 2022 06:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bkk5Ygl1l/wbX+/eUZKIESTobqRlYl1nxsuZRgR+lKI=;
        b=d+7QdwI1hHNkuPP7Dgm83h5wwGS9Fqce3A7cHmZDBKGR5IsirTPoV48d/Dz3oq6Kah
         meYaPaOygODTJd3om2AA5jjPXpTGAdLm53n4+Dew/1KDsZnmpfltMuLDskTldHu5ow0L
         IY0oS2xhnpYfwNYH2VDuTtd5EmO9eyizrq+XAf6MSgJpyM32l9jLVJnElcfb1Amo+Wdk
         y8ksbIdvaPK/LaR7i1eJRCwLEnCsLA9LU1fnyGBhqNz8Hj2F3E02X7So1ooGAOEFMMIl
         p9P94JLa1vCdfxr0UbMrwculH7y/sxge0zyqD7zKl1BYcfN1a+Vtb/1KaR5r2xYuUmuG
         +KJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bkk5Ygl1l/wbX+/eUZKIESTobqRlYl1nxsuZRgR+lKI=;
        b=sfrnswvWfzM/eLjUxUrQd7NgHjwljv5HhWaSLDE/3BuR9jNJ7BZaUS0uC5Ap8cH8h8
         sxX8abEPUJHh62m2+4x5T2VolAk/E7EQHf6D0uwSzpK1VzmmhxRWHGMtpmk9gIBIRKrC
         fsNWzMFYXyt/C2M+PT9QvMf/vugxCQsqtCUX2hnxrO+HRXmcCUqgQHt92KQbI7UUC1CL
         uqdYh7GZSAcxNXmnuj7w5Yd+yfBXx+m/hA2RDLerE/cv39+uHrEjAtfPQ4Zlx26RIUgD
         uG1o61alr09aVWw/TrKxgE0mT1za1GDX3Z/AHGQk8x9RRY2+qHSk+CH1bbnNosPb56Q1
         tVHw==
X-Gm-Message-State: AOAM532TyzwZAcd95VC+7SUFciDOG57FfoqAlEIazYGKmYE62INh7/Kn
        qEp94NloRqjRvpnCYcGVkbQuqA==
X-Google-Smtp-Source: ABdhPJzQZ5VHGIGmfTiMBz/77oQOhAmCfc3t3E6VJQKoppd2IOaC5/QgKinJIlSUrlYxDxT8MuPdzw==
X-Received: by 2002:a5d:6208:0:b0:203:dde4:c76e with SMTP id y8-20020a5d6208000000b00203dde4c76emr18278379wru.273.1650981214291;
        Tue, 26 Apr 2022 06:53:34 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id m35-20020a05600c3b2300b00393ebe201a6sm5504775wms.44.2022.04.26.06.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 06:53:33 -0700 (PDT)
From:   Fabien Parent <fparent@baylibre.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Fabien Parent <fparent@baylibre.com>,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/8] Input: mtk-pmic-keys: add field to store if PMIC has key release IRQs
Date:   Tue, 26 Apr 2022 15:53:10 +0200
Message-Id: <20220426135313.245466-6-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220426135313.245466-1-fparent@baylibre.com>
References: <20220426135313.245466-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The MT6358 PMIC is not the only PMIC to have release IRQs. In order to
support more PMIC that supports release IRQs, such as MT6357, MT6359,
and possibly others, let's add some field in the platform data to
indicate whether a PMIC support release keys.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Tested-by: Mattijs Korpershoek <mkorpershoek@baylibre.com> # on mt8183-pumpkin
---
v2: no changes

 drivers/input/keyboard/mtk-pmic-keys.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index a0da644fe93d..609b87afd020 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -53,6 +53,7 @@ struct mtk_pmic_keys_regs {
 struct mtk_pmic_keys_pdata {
 	const struct mtk_pmic_keys_regs keys_regs[MTK_PMIC_MAX_KEY_COUNT];
 	u32 pmic_rst_reg;
+	bool has_key_release_irqs;
 };
 
 static const struct mtk_pmic_keys_pdata mt6397_pdata = {
@@ -83,6 +84,7 @@ static const struct mtk_pmic_keys_pdata mt6358_pdata = {
 		MTK_PMIC_KEYS_REGS(MT6358_TOPSTATUS,
 				   0x8, MT6358_PSC_TOP_INT_CON0, 0xa),
 	.pmic_rst_reg = MT6358_TOP_RST_MISC,
+	.has_key_release_irqs = true,
 };
 
 struct mtk_pmic_keys_info {
@@ -319,7 +321,7 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 			return keys->keys[index].irq;
 		}
 
-		if (of_device_is_compatible(node, "mediatek,mt6358-keys")) {
+		if (mtk_pmic_keys_pdata->has_key_release_irqs) {
 			keys->keys[index].irq_r = platform_get_irq_byname(pdev,
 									  irqnames_r[index]);
 
-- 
2.36.0

