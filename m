Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93626547CDD
	for <lists+linux-input@lfdr.de>; Mon, 13 Jun 2022 00:54:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237326AbiFLWyo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 12 Jun 2022 18:54:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232947AbiFLWyn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 12 Jun 2022 18:54:43 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AA5D2ED76
        for <linux-input@vger.kernel.org>; Sun, 12 Jun 2022 15:54:42 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id r187-20020a1c44c4000000b0039c76434147so3675327wma.1
        for <linux-input@vger.kernel.org>; Sun, 12 Jun 2022 15:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SKAkQViAdRuOToS1jTPqYUOr96qpyy/hFrwPV/nZpG0=;
        b=WbWAuNfjG7guI+83hP3n2CxHTj+7uluMVdEtQ2aOJ5ewVR8hvITJTc4CuuYUp2ps9t
         MQk9f69/E19D1zYpfZz8POg14H0fpz7a3FuKtHSx8zhggwKVmIvXh1vOB8o/zDqC2TLg
         Y3USelqxsbaTRdj7j+cnoqeJLg5AfK2N3h9KaPVuVSNkuDguA6LBHwU7ttrla8m3CHgD
         qB9FMbhnQh9TFNeaZOwwmaxfVda181uIOLXvrDctM/llpCLT3dD2nwmMFqjiDW5Z7r6j
         JknDBmSFiV49ckYNmTQNtD6NHpakvxkkOQegfbuNS7nYVXbbL8gN4+SuR6ZyCnGameCX
         Rv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SKAkQViAdRuOToS1jTPqYUOr96qpyy/hFrwPV/nZpG0=;
        b=MeKhs6HvGUegfWYDdosIZtyWxNvw/V1sonZqI+mYAdWwJUawHH4JezSpSHxKGUclhg
         sijj3n3Nz3K6KD23iE2CqGsnKOfxN0vIJ7C88Urb7Nw6WIzej6ApG10sRE+Iq9lJ5vCJ
         Y5EoSr6cO68c8tdLiam9wwR5O/U55ZLoPZ1bG1KrYPG1wqCvnSgUxraAR4mSWcJJHpqa
         YLHGXuhMTFnFLv6MkrfJoOmidZ71sANlC9XIOcSXr2q9LSNpGlCVUepzt5ZKGgI6hqJv
         7mXKP4PEYFHa9rV29s86DgyGrT+cXCMFyjJ74L9HDqf6Zx7waSOeM9iYQ1FMyHs2uS03
         h2Bg==
X-Gm-Message-State: AOAM532XHK7UyHNAJiEvoS8kXBDeIJlh2pSUFWyaF409f6ytSqxz3GCO
        qLO2wjuPrG8U0ugM1Gfe6c/91blZ/vk=
X-Google-Smtp-Source: ABdhPJxsHHf0YzQ8L1quXNbKfGwnPlTP7i88SrGOvEsLjG7vy47NIi6Fbf6FKXHjhLyVRJpRSDyPIA==
X-Received: by 2002:a05:600c:4f95:b0:39c:7bd0:d47d with SMTP id n21-20020a05600c4f9500b0039c7bd0d47dmr11301707wmq.17.1655074480575;
        Sun, 12 Jun 2022 15:54:40 -0700 (PDT)
Received: from morpheus.home.roving-it.com (3.e.2.0.0.0.0.0.0.0.0.0.0.0.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681::2e3])
        by smtp.googlemail.com with ESMTPSA id o6-20020a05600c510600b0039748be12dbsm11159737wms.47.2022.06.12.15.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jun 2022 15:54:40 -0700 (PDT)
From:   Peter Robinson <pbrobinson@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Joseph Chen <chenjh@rock-chips.com>,
        linux-input@vger.kernel.org
Cc:     Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] input: misc: rk805-pwrkey: Fix module autoloading
Date:   Sun, 12 Jun 2022 23:54:37 +0100
Message-Id: <20220612225437.3628788-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add the module alias so the rk805-pwrkey driver will
autoload when built as a module.

Fixes: 5a35b85c2d92 ("Input: add power key driver for Rockchip RK805 PMIC")
Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/input/misc/rk805-pwrkey.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/misc/rk805-pwrkey.c b/drivers/input/misc/rk805-pwrkey.c
index 3fb64dbda1a2..76873aa005b4 100644
--- a/drivers/input/misc/rk805-pwrkey.c
+++ b/drivers/input/misc/rk805-pwrkey.c
@@ -98,6 +98,7 @@ static struct platform_driver rk805_pwrkey_driver = {
 };
 module_platform_driver(rk805_pwrkey_driver);
 
+MODULE_ALIAS("platform:rk805-pwrkey");
 MODULE_AUTHOR("Joseph Chen <chenjh@rock-chips.com>");
 MODULE_DESCRIPTION("RK805 PMIC Power Key driver");
 MODULE_LICENSE("GPL");
-- 
2.36.1

