Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9B3A4C22C0
	for <lists+linux-input@lfdr.de>; Thu, 24 Feb 2022 04:59:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229820AbiBXD7F (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 23 Feb 2022 22:59:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229815AbiBXD7E (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 23 Feb 2022 22:59:04 -0500
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88CD225D26F
        for <linux-input@vger.kernel.org>; Wed, 23 Feb 2022 19:58:35 -0800 (PST)
Received: by mail-pl1-x64a.google.com with SMTP id r19-20020a170902be1300b0014edf03f82eso357221pls.20
        for <linux-input@vger.kernel.org>; Wed, 23 Feb 2022 19:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=S/BktkTRg3IeOBKPRorlYf8cDypH5GwEH28l9JcLNGU=;
        b=ZQv2vKvk1pOFvbCHKtwEOcwunkRUKdEYXB3FRaaa1IRk3ge8LuaPQw3HhcCu12PSWn
         kfCVvYbvALDA+VKUM9caWeWM6Vi0SWRYp2nwzvQjeM4t0D+QyxLMhLkLCNlGm455POwQ
         GEtOAUlw0jbBFQTDccVh/sPZKHD0Is8L0KnY/3UFcE4KlnWmnTv1DgIg3wR9wYaP0j79
         aWlx8j+W2oMu5a6mOk3M71HzQv63tooHPxgF3QU4KD9NNYO7IfDVitzwHSskyRd2Mcq6
         ZFQHf1OMvGTZfeBMD+Jv1+6fn4xE4y/xEcb+gkgeBT7Q0YLFmvQceqMZm9Vc7O4ol467
         XS0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=S/BktkTRg3IeOBKPRorlYf8cDypH5GwEH28l9JcLNGU=;
        b=d0aGrChe1cR9XByfdd40K7IbAwXzuO9/78UnQs77c1Uvy0enIE7Ew9rsx9lQU+TrHm
         pGC7/kjmFTKQVZJtKQteZfezruJzrCppjtZWHHBB/Js2xaM6dGlLezgTLdqv9uaBXZco
         2Tu6xMeh7o9QpHwSJHA6Ky3zZj50xdsaNcjwUl+/oJr9J5DgYuJwUigHb3ZUubC00wt6
         0wWW0g5cgMKoS1cQmm8O+jRPsZVVMw1DBQ3j1eCTMzHJTJZIOhOXGXRITnCCMJwyArs8
         ckuwzutZwy63kpAS/LeT+h0pG51n8FK3ER1ugI+pqQiw2/zY62NRhIjMseXu1HaKvHTY
         7kEw==
X-Gm-Message-State: AOAM531b9OSYmuHa+88pOLry6ruavLZe4LwoIW5gKtD+zryik6i+7yeY
        FiRGb1Vjg7yag3bRBqBAvIznUU9YjLlDNA==
X-Google-Smtp-Source: ABdhPJwbv0RBFl9Vkc/6rlQfWONrAPccTmsZ4K0XwDlcMLb+tBigsUI7IXGaatRjiIPnuFbk9rpA/+7gWSR9dA==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:aa7:9911:0:b0:4e1:3a76:96f8 with SMTP id
 z17-20020aa79911000000b004e13a7696f8mr1055845pff.28.1645675114919; Wed, 23
 Feb 2022 19:58:34 -0800 (PST)
Date:   Thu, 24 Feb 2022 11:58:19 +0800
Message-Id: <20220224035819.1593730-1-davidgow@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.473.g83b2b277ed-goog
Subject: [PATCH] Input: samsung-keypad - Properly state IOMEM dependency
From:   David Gow <davidgow@google.com>
To:     Joonyoung Shim <jy0922.shim@samsung.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     David Gow <davidgow@google.com>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-um@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Make the samsung-keypad driver explicitly depend on CONFIG_IOMEM, as it
calls devm_ioremap(). This prevents compile errors in some configs (e.g,
allyesconfig/randconfig under UML):

/usr/bin/ld: drivers/input/keyboard/samsung-keypad.o: in function `samsung_keypad_probe':
samsung-keypad.c:(.text+0xc60): undefined reference to `devm_ioremap'

Signed-off-by: David Gow <davidgow@google.com>
---
 drivers/input/keyboard/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index 0c607da9ee10..5c98d5f996e4 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -556,7 +556,7 @@ config KEYBOARD_PMIC8XXX
 
 config KEYBOARD_SAMSUNG
 	tristate "Samsung keypad support"
-	depends on HAVE_CLK
+	depends on IOMEM && HAVE_CLK
 	select INPUT_MATRIXKMAP
 	help
 	  Say Y here if you want to use the keypad on your Samsung mobile
-- 
2.35.1.473.g83b2b277ed-goog

