Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A1154BB42
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2019 16:20:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730747AbfFSOUw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 Jun 2019 10:20:52 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37522 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730809AbfFSOU0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 Jun 2019 10:20:26 -0400
Received: by mail-wr1-f68.google.com with SMTP id v14so3626552wrr.4
        for <linux-input@vger.kernel.org>; Wed, 19 Jun 2019 07:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5HyKzjCvcphbyNNVjsqXzUyUkExzumkqB7IfOWgPvTo=;
        b=NpRVQ17FE5ogKoQQdxGUdIBHv8s9KiTNDLw6TjNwtqmrDSa/H59OeSGW/8/xZt6sqx
         d2g4gqYlR0FSHvHrdWyDROEB0p0ZV5/Hmw0p/4fjYjnkah50Tzac3NmNfkUBoQPSIfUx
         GBnSl0tQnsP47cLz3hH8S7FF+pYLgQ92s49MY7UTKHM4KJtfisGXxXnhA+tcErqNU4qH
         3aV9K5QKBIITdl1HO8D9fSh6KMv3ObN6M+bDo2CwtseqdiVJxVJol2dnOhWZWHGVCYa7
         gzrSNlEEQMoW4XE+YfJojJEwo12iEhM3UyVY2dxAh4bsWIGtwfzgk4IOubb4D9qT/qbv
         CYrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5HyKzjCvcphbyNNVjsqXzUyUkExzumkqB7IfOWgPvTo=;
        b=nAOHWppbShfnroecSMFL1Q5HkxyIpdkTkuiwr8JagxuMDhGRdhBoVIcIsoCqPdzkV8
         iPGLiEiggHOfYXsG1QGoE7prrCCakNw8b8D+anTnpPYgzGN7+tjYRVx+WuzPZ4pEXPTZ
         pAAj4NcnAcu406k5dN+TBz0Q2G6Nbz72jUoCbEvDbWr30kiYvIQTuOe9i+F56oRFBP5j
         Eafur6ZZ8lelbUVUR+HY11hbSwDzMGSGOQa2YK0CQrrYeQLxOnYQVa+w2lKmUzhBfViW
         3tB5H32BQ2rI35m+QtgxcqR+Hpd072fK5cTkGYlFFTRJaUEo8ruTgra/FQRHJuw6EkyL
         JQtg==
X-Gm-Message-State: APjAAAUqryGvp+x5T/hjakCQ8jN2A4+GCKxxeC9q2uYBfEB2K3gIOfzl
        heinmZLf3h79F13pT0k9GRXDjw==
X-Google-Smtp-Source: APXvYqx6Yw2wyn2+H8rXu2ONXIf87Boyl/ltH9hFj1h3tSdJaTazjnpi0uNBoPDWXMZhECDHL1E6Qg==
X-Received: by 2002:adf:a345:: with SMTP id d5mr9180977wrb.234.1560954024807;
        Wed, 19 Jun 2019 07:20:24 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id o20sm24209979wrh.8.2019.06.19.07.20.23
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 19 Jun 2019 07:20:24 -0700 (PDT)
From:   Fabien Parent <fparent@baylibre.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, matthias.bgg@gmail.com,
        lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Fabien Parent <fparent@baylibre.com>
Subject: [PATCH v4 6/7] input: keyboard: mtk-pmic-keys: add MT6392 support
Date:   Wed, 19 Jun 2019 16:20:12 +0200
Message-Id: <20190619142013.20913-7-fparent@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190619142013.20913-1-fparent@baylibre.com>
References: <20190619142013.20913-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support for MT6392 PMIC's keys.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

V4:
	* Patch was previously sent separately but merge to this patch series
	  since there is a hard dependency on the MFD patch.

---
 drivers/input/keyboard/mtk-pmic-keys.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index 746ff06eaf8d..91ddf0dd5e44 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -9,6 +9,7 @@
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/mfd/mt6323/registers.h>
+#include <linux/mfd/mt6392/registers.h>
 #include <linux/mfd/mt6397/core.h>
 #include <linux/mfd/mt6397/registers.h>
 #include <linux/module.h>
@@ -74,6 +75,16 @@ static const struct mtk_pmic_regs mt6323_regs = {
 	.pmic_rst_reg = MT6323_TOP_RST_MISC,
 };
 
+static const struct mtk_pmic_regs mt6392_regs = {
+	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6392_CHRSTATUS,
+		0x2, MT6392_INT_MISC_CON, 0x10),
+	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6392_CHRSTATUS,
+		0x4, MT6392_INT_MISC_CON, 0x8),
+	.pmic_rst_reg = MT6392_TOP_RST_MISC,
+};
+
 struct mtk_pmic_keys_info {
 	struct mtk_pmic_keys *keys;
 	const struct mtk_pmic_keys_regs *regs;
@@ -229,6 +240,9 @@ static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
 	}, {
 		.compatible = "mediatek,mt6323-keys",
 		.data = &mt6323_regs,
+	}, {
+		.compatible = "mediatek,mt6392-keys",
+		.data = &mt6392_regs,
 	}, {
 		/* sentinel */
 	}
-- 
2.20.1

