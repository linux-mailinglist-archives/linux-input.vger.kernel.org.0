Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11BDC4B3E2F
	for <lists+linux-input@lfdr.de>; Sun, 13 Feb 2022 23:55:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238615AbiBMWyt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 13 Feb 2022 17:54:49 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:59348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231864AbiBMWys (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 13 Feb 2022 17:54:48 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 619AE54BE2
        for <linux-input@vger.kernel.org>; Sun, 13 Feb 2022 14:54:42 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id g39so3961137lfv.10
        for <linux-input@vger.kernel.org>; Sun, 13 Feb 2022 14:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8vDmGE0ul8z7GAgdL9izNHaIAkPRRWA42mtdtZGmioM=;
        b=T0NNwv6rromcxu0vPCCPuxwxGE+9TdNKXX8BSeUfUShrn9hYEFjZVW3BiQqXJNA5Lx
         2otK1HCFPcbiE0TevjL5StOquujf9PEEk5Hcl/NkhrbzSHJn0NQV5a2tbs7ZXjmU8iwz
         Td/EKcFplJET0wmdCiUzbWwSYx9HXasiAl/ZyIvBp3t5mKVbyYN72nzYxPwX+qoh1pnx
         LbYpvLOiycnSfmZCNG1Lttu6Zisi3ROOWt66cmuODUxG6HhXCEE2bErgo3pdzqRjWyiP
         xh4A4fhXOuZVZ64cGgq3MYkSZpoocjaxqV8I0z1gU09z2LW6DmIQoaaCcG/XvLIumzRk
         nSHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8vDmGE0ul8z7GAgdL9izNHaIAkPRRWA42mtdtZGmioM=;
        b=c0B5swfz3tg3xvfPkQyAM2S6Ur2RxAVQhoQHeYAjmza2eWHLASeUaLgl8GWENO3QNK
         BrfH8UxVqfGuqnyXXlgk9ah2Y4L+F06WJ0N5Jonmehx9ZGchRk2bMoOcmrd1jz0EbWIG
         ZlFU69Fm5Ucjo+1NnSR0M8G7FOzxgu0QHY1BVR6HtTQ9Jtd0pk8aWOSPNFKQlpGxN9p+
         N5c9zMt0+JPRcs8+dKAD7dEZsg4gsVMhKP7fNo4NoOoDdzowB7VmdJO8P2xgVy6FD4Zr
         EpthSkule1WZgpuW8+/JEv3D651xDhHRORXZCvEN1/4IkIGM3S7R7g47ww5uqfEkD6fk
         hnng==
X-Gm-Message-State: AOAM530XR0ViXmrH1Juo9fmr4PW4p60elGpiFqZFKVRNquANGO+qRIeO
        SYh/W9vusc0M8MZg2F40TyZMOQ==
X-Google-Smtp-Source: ABdhPJxUMeBW0ckaT/L90Gs/+qThSJhvW8WrOg4bc02Bv/ERAW28MBMt0zzQqq/jlSgxmswX669YJg==
X-Received: by 2002:a05:6512:517:: with SMTP id o23mr9093672lfb.16.1644792880794;
        Sun, 13 Feb 2022 14:54:40 -0800 (PST)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id u18sm758906lfo.74.2022.02.13.14.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Feb 2022 14:54:40 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Nikita Travkin <nikita@trvn.ru>
Subject: [PATCH] Input: zinitix - Add BT404 compatible string
Date:   Sun, 13 Feb 2022 23:52:35 +0100
Message-Id: <20220213225235.812864-1-linus.walleij@linaro.org>
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

Cc: Nikita Travkin <nikita@trvn.ru>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/input/touchscreen/zinitix.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
index b7a9c3cbe0b2..dff24899855b 100644
--- a/drivers/input/touchscreen/zinitix.c
+++ b/drivers/input/touchscreen/zinitix.c
@@ -626,6 +626,7 @@ static SIMPLE_DEV_PM_OPS(zinitix_pm_ops, zinitix_suspend, zinitix_resume);
 
 #ifdef CONFIG_OF
 static const struct of_device_id zinitix_of_match[] = {
+	{ .compatible = "zinitix,bt404" },
 	{ .compatible = "zinitix,bt532" },
 	{ .compatible = "zinitix,bt541" },
 	{ }
-- 
2.34.1

