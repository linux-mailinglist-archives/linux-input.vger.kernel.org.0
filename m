Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 710F64B5E61
	for <lists+linux-input@lfdr.de>; Tue, 15 Feb 2022 00:42:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232191AbiBNXmq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Feb 2022 18:42:46 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:58160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231168AbiBNXmq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Feb 2022 18:42:46 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 782C78E
        for <linux-input@vger.kernel.org>; Mon, 14 Feb 2022 15:42:37 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id p22so101187lfu.5
        for <linux-input@vger.kernel.org>; Mon, 14 Feb 2022 15:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0Z0FfG1ykCKcmpIu2G79IsVdESaAM44mApUWMkb8ROM=;
        b=zOes3wrMz1OMU4uQ/YhFYKqPOXcHK4VaklbiSf6Lh0WK7bUv7uKj40V8yEo0Itb5C4
         +0FURY/3wgt2kPN6nEEfwEFWONL183YvHrsOJ+Gv8TLe+ceftDXGcqyLO3mIwza0z82V
         qsHsdP4HaJ2ZX8wufS7+QTUbzERRsx1v9p03a6KhfPh2KA4Z2MZiG0rb6KaZ9pcZuKtm
         b/JeSDfE8IFpzX7G1Ywxg42q87wIZnzWgsspSgEpaMq+7VTf9cW0ZjE5ZuDvY/4X17nM
         Nyfu80jpkgsm1RSHx3hb4g93c9Z0e1wrubkE2v/1WBLVVwY2mnw8AaUtBUyR0QQCNUpZ
         gKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0Z0FfG1ykCKcmpIu2G79IsVdESaAM44mApUWMkb8ROM=;
        b=QBkmlvnywKmWBWWqonhnHqLIzEGHBHbCU128yS/H6ceblO8wU96lKrQIyUm81OKRrO
         H1kFbe8yKTRZtwybWc1XvVEXR25ml0SddV9nv17LkJSWAgBzxn/6n99yj/3lmwm8Uc5g
         H1D//3o7O091bc7FDQPINSmOXXlyDHWEe9MmqiF5jiGAJS59cVANGkbaGM65cY2ziqG5
         sDiCe8wowuKIeim5wHpumgJ02r6NY5fYofRl58WlezdFYbiQ5SK/ah6xQUz/wnCrne8L
         z7BTKeyW3QH6e/QjvLjL7o0O1+y23VULutxDrD9v8gKuO24IUuBiy8E87m5ijsbJ4Svm
         y2rA==
X-Gm-Message-State: AOAM531ncg7j/aCY66RuiM+qa8B2kurF7fXz4+nsZCmBZigKwcV40K6q
        m0MThm2RkYwmvwGYvSObYoqA9Xx2r/bmHenw
X-Google-Smtp-Source: ABdhPJy8ArYhAp2618Km4rBeYCJVfY3bpJ6HKG4cElRJFM+ZOWFFtg4lzzHxXiDaUJTTkb3fpQ0sFw==
X-Received: by 2002:a05:6512:130f:: with SMTP id x15mr1043968lfu.651.1644882155846;
        Mon, 14 Feb 2022 15:42:35 -0800 (PST)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id x6sm4300116lfn.91.2022.02.14.15.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 15:42:35 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Nikita Travkin <nikita@trvn.ru>
Subject: [PATCH v2] Input: zinitix - Add new compatible strings
Date:   Tue, 15 Feb 2022 00:40:33 +0100
Message-Id: <20220214234033.1052681-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This driver works just fine with the BT404 version of the touchscreen
as well. Tested on the Samsung GT-I8160 (Codina) mobile phone.

Add all the new variants from the binding document so people can
easily test them, we believe most of them work more or less.

Cc: Nikita Travkin <nikita@trvn.ru>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Add all the new compatibles
---
 drivers/input/touchscreen/zinitix.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
index 7c82c4f5fa6b..129ebc810de8 100644
--- a/drivers/input/touchscreen/zinitix.c
+++ b/drivers/input/touchscreen/zinitix.c
@@ -571,8 +571,20 @@ static SIMPLE_DEV_PM_OPS(zinitix_pm_ops, zinitix_suspend, zinitix_resume);
 
 #ifdef CONFIG_OF
 static const struct of_device_id zinitix_of_match[] = {
+	{ .compatible = "zinitix,bt402" },
+	{ .compatible = "zinitix,bt403" },
+	{ .compatible = "zinitix,bt404" },
+	{ .compatible = "zinitix,bt412" },
+	{ .compatible = "zinitix,bt413" },
+	{ .compatible = "zinitix,bt431" },
+	{ .compatible = "zinitix,bt432" },
+	{ .compatible = "zinitix,bt531" },
 	{ .compatible = "zinitix,bt532" },
+	{ .compatible = "zinitix,bt538" },
 	{ .compatible = "zinitix,bt541" },
+	{ .compatible = "zinitix,bt548" },
+	{ .compatible = "zinitix,bt554" },
+	{ .compatible = "zinitix,at100" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, zinitix_of_match);
-- 
2.34.1

