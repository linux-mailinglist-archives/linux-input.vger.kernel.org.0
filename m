Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1473352ECA3
	for <lists+linux-input@lfdr.de>; Fri, 20 May 2022 14:51:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349577AbiETMvt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 20 May 2022 08:51:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349572AbiETMvp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 20 May 2022 08:51:45 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 317A92EA1E;
        Fri, 20 May 2022 05:51:44 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id 8FBD81F462B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1653051103;
        bh=QOwsebbE+upK+gVJVhJOnLLBda4LVPYp2RLtMhPVfBM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kvyz47qav2Xdemr7tAjD4VetXMYQoqNOwqLFnVEnrn6pbZ3gWfOKdt4ivXsFod/mL
         Src1tfD33PCWy4b/3iPGp/p7T+PgnzxyRCoUXFcgg0pjVpwSfyVOWIRehudhAjJ0xS
         2UaBjW373IJJ48wH5VdcIEiuhkb6MI3E5eLJxBS4qldLh+hPBPDDT7DMDv7QXzGblg
         cEV4o0RTJRbsYyhOU47RP3xGex1eHSeRsrSMBRxs4LT5SY+k8hdQuDsMp4aM0mEOj7
         7kSGzdI7bIg3JDsg8OBQxCfq8weuRp/r8fB88fXO7+94UdnCZF6yQ8jbYHj2vuYgnS
         p6XB6Bn5RxhCg==
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
To:     dmitry.torokhov@gmail.com
Cc:     matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        mkorpershoek@baylibre.com, linux-input@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] Input: mtk-pmic-keys - Use regmap_{set,clear}_bits where possible
Date:   Fri, 20 May 2022 14:51:29 +0200
Message-Id: <20220520125132.229191-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520125132.229191-1-angelogioacchino.delregno@collabora.com>
References: <20220520125132.229191-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Instead of always using regmap_update_bits(), let's go for the shorter
regmap_set_bits() and regmap_clear_bits() where possible.

No functional change.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 24 ++++++------------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index 8e4fa7cd16e6..83d0b90cc8cb 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -157,28 +157,16 @@ static void mtk_pmic_keys_lp_reset_setup(struct mtk_pmic_keys *keys,
 
 	switch (long_press_mode) {
 	case LP_ONEKEY:
-		regmap_update_bits(keys->regmap, pmic_rst_reg,
-				   MTK_PMIC_PWRKEY_RST,
-				   MTK_PMIC_PWRKEY_RST);
-		regmap_update_bits(keys->regmap, pmic_rst_reg,
-				   MTK_PMIC_HOMEKEY_RST,
-				   0);
+		regmap_set_bits(keys->regmap, pmic_rst_reg, MTK_PMIC_PWRKEY_RST);
+		regmap_clear_bits(keys->regmap, pmic_rst_reg, MTK_PMIC_HOMEKEY_RST);
 		break;
 	case LP_TWOKEY:
-		regmap_update_bits(keys->regmap, pmic_rst_reg,
-				   MTK_PMIC_PWRKEY_RST,
-				   MTK_PMIC_PWRKEY_RST);
-		regmap_update_bits(keys->regmap, pmic_rst_reg,
-				   MTK_PMIC_HOMEKEY_RST,
-				   MTK_PMIC_HOMEKEY_RST);
+		regmap_set_bits(keys->regmap, pmic_rst_reg, MTK_PMIC_PWRKEY_RST);
+		regmap_set_bits(keys->regmap, pmic_rst_reg, MTK_PMIC_HOMEKEY_RST);
 		break;
 	case LP_DISABLE:
-		regmap_update_bits(keys->regmap, pmic_rst_reg,
-				   MTK_PMIC_PWRKEY_RST,
-				   0);
-		regmap_update_bits(keys->regmap, pmic_rst_reg,
-				   MTK_PMIC_HOMEKEY_RST,
-				   0);
+		regmap_clear_bits(keys->regmap, pmic_rst_reg, MTK_PMIC_PWRKEY_RST);
+		regmap_clear_bits(keys->regmap, pmic_rst_reg, MTK_PMIC_HOMEKEY_RST);
 		break;
 	default:
 		break;
-- 
2.35.1

