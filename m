Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49F27502D0A
	for <lists+linux-input@lfdr.de>; Fri, 15 Apr 2022 17:40:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355301AbiDOPjr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Apr 2022 11:39:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356316AbiDOPjd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Apr 2022 11:39:33 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 089F83CFC5
        for <linux-input@vger.kernel.org>; Fri, 15 Apr 2022 08:37:04 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id l62-20020a1c2541000000b0038e4570af2fso5220973wml.5
        for <linux-input@vger.kernel.org>; Fri, 15 Apr 2022 08:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9jbG8zhZKbTiE7ZNDTYGG07uuZNvNsy0rqtU9fqaUgM=;
        b=r2+ahgDRgkvtXt6wiCkeTrKl7ytYvippEBpvGHj4DgfAHDnQMrEame754zG4uQVNsE
         rfI2ZE9y8R67O6QaTY0uE58yVfMG/3dl83oT5Q/98Q42/Seugf2HPqrvSDIeqnJXhRmR
         JekwubM7J5hX4B2qYKeVeSGEwlzYf58zMQtn9nBEDe1rdXtIQKQiX9qdA3zxGff3a6jg
         naVi5VnD0LlyhURGOhSfS0fXxKQ1hU5VerYHSSzSWNpDLOXAmt4HR7y2t4FiXZQQUzU+
         vNQPi6f4IFu0vX4u290SrXld80lfMhq/aJwIIZoaDIRg7W2gxjzk2zceNBtvKHx42W3M
         +eTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9jbG8zhZKbTiE7ZNDTYGG07uuZNvNsy0rqtU9fqaUgM=;
        b=TwIPQmsu188v4p1KuD+IeFlKV1WelLJfLCdikBmjJRc4cjTZ6hIv3znBv4pE4fZiMt
         uYayA+wsqsTMhq9Jtalzhbth84EhNIotvATyjloiyzi/H7QGyskTsmLurKgTMZwLcYPd
         myrklS6e5e8eG6Bj+rf4YAZTUXWZy5S2rGlfnodnDIPIBWj0BngK5quNF7kfZdt5IYpx
         wCTnvSCDRATkKHmJwBPnrvDhAGyYD3vwSl90MMS+anzv7T1wCzuwatxKA+ttUptny5mc
         xwiJ6z4Knr6AouVCnObGvapmrprE1fqZR6y5WrGDkkFvB+9kZhYQSYZ5Sh17gkulWU73
         D5CQ==
X-Gm-Message-State: AOAM531e7GmWgufh+ifInJip2fn/yiMNfL0LzXDpBriO/0zWE00Z00wx
        LzdCDYXi/0F7x8X1+B4/FEIBmw==
X-Google-Smtp-Source: ABdhPJyZ8vjESL1eqz3zOr0c6KrLsevpBtztK3bxcy3XYw0G+YAKg44wfGRodkrXogvKzjUSa6pUBQ==
X-Received: by 2002:a7b:c057:0:b0:37b:ebad:c9c8 with SMTP id u23-20020a7bc057000000b0037bebadc9c8mr3745781wmc.61.1650037022651;
        Fri, 15 Apr 2022 08:37:02 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id c24-20020a7bc018000000b0038a18068cf5sm8459292wmb.15.2022.04.15.08.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Apr 2022 08:37:02 -0700 (PDT)
From:   Fabien Parent <fparent@baylibre.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] Input: mtk-pmic-keys: add field to store if PMIC has key release IRQs
Date:   Fri, 15 Apr 2022 17:36:27 +0200
Message-Id: <20220415153629.1817202-6-fparent@baylibre.com>
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

The MT6358 PMIC is not the only PMIC to have release IRQs. In order to
support more PMIC that supports release IRQs, such as MT6357, MT6359,
and possibly others, let's add some field in the platform data to
indicate whether a PMIC support release keys.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
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
2.35.2

