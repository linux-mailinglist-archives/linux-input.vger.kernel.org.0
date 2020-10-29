Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9227229E52E
	for <lists+linux-input@lfdr.de>; Thu, 29 Oct 2020 08:54:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731087AbgJ2Hxa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Oct 2020 03:53:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732500AbgJ2HxM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Oct 2020 03:53:12 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCF15C0613D5;
        Thu, 29 Oct 2020 00:53:11 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id x23so914846plr.6;
        Thu, 29 Oct 2020 00:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=POqi5GI8PXCAEIumwbfgkVMeF0jFDXuMARK3jktwUMo=;
        b=t5ghjlIe1x+GGwGk6PMTTunm8mYIrUZqTLDRcRKy6WoRSwIWR/vdzeMfQIHMDE6OFC
         tzKahgXXCWi58P92eiKvyET5OWr8U1SyiGs+kItcteNBEcwB/ZpH1zXATilrHxwuzdXG
         venOMuw7WGvN5wHh1p2mjLljCYNxBeISo7fosRQR9sNXn571OhCOsPGMeH8hQtckAf98
         qoe6GWi12ouIrfwSZ6mcdAeAniHEcieXbBUhr58e8dYBTSVDj4j2+6kRXIhd7PnhbHi9
         PDmROUg8LSzpV2e6Q1Ysza9E1cdsT/ClPqkCYx5Qnqja18mrnKwxszQHIILUBaJU9d2W
         CXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=POqi5GI8PXCAEIumwbfgkVMeF0jFDXuMARK3jktwUMo=;
        b=jcJJXQRZmc3CDFCBjHvTx5+wcIr++3rNXtcXnjDUKxeEpAATnA/xtZq6/a5LoXGoBD
         3vm5Te1DxNJWkZR/h7zaPz+vTZ6ZhdOPZEY5cyc//0mzUDKSnF2uk9AzUDFqN8ZI5AgZ
         aduepgYqTljHxcW4bs7iTzr87L2kvYfLq2kft9V/lTnWwljijdXzJbwdJ+8OLYv/yyWR
         wTqSF00diy1XJxP6dZCKtKsaqdtcs12aCOY60QDhfeJx33KK14zO+KhaYR58YD+JhNSP
         LNZusbEiqoq79gEj/iISGA3p6MIWAeru2yXJ5HmWj2+7JSV0kFQeZCZoPa52giGoBnYo
         ol6A==
X-Gm-Message-State: AOAM533ZWHKmlTq4xj1Ah0tmJzaux0TapIwro1C5leqvxBPltT+rJ9Cv
        cDKTMZtKG9Kqyah1MbsHWNVL8FWsf4E2bn74
X-Google-Smtp-Source: ABdhPJzycuJcoGnnb21OCUbDPFd7vpKcuT91sTtQLPEuuPzWngueUd5Uql+OpvkfM1wi036LsEiPzA==
X-Received: by 2002:a17:902:7088:b029:d6:8072:9ce1 with SMTP id z8-20020a1709027088b02900d680729ce1mr3150919plk.11.1603957991256;
        Thu, 29 Oct 2020 00:53:11 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
        by smtp.gmail.com with ESMTPSA id d26sm1873937pfo.82.2020.10.29.00.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 00:53:10 -0700 (PDT)
From:   Coiby Xu <coiby.xu@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK
        , TOUCHSCREEN)...), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/3] Input: nomadik-ske-keypad: remove unnecessary CONFIG_PM_SLEEP
Date:   Thu, 29 Oct 2020 15:52:36 +0800
Message-Id: <20201029075236.228335-3-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201029075236.228335-1-coiby.xu@gmail.com>
References: <20201029075236.228335-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SIMPLE_DEV_PM_OPS has already took good care of CONFIG_PM_CONFIG.

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 drivers/input/keyboard/nomadik-ske-keypad.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/input/keyboard/nomadik-ske-keypad.c b/drivers/input/keyboard/nomadik-ske-keypad.c
index 608446e14614..b3052c8fa5d2 100644
--- a/drivers/input/keyboard/nomadik-ske-keypad.c
+++ b/drivers/input/keyboard/nomadik-ske-keypad.c
@@ -386,7 +386,6 @@ static int ske_keypad_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int ske_keypad_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -414,7 +413,6 @@ static int ske_keypad_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static SIMPLE_DEV_PM_OPS(ske_keypad_dev_pm_ops,
 			 ske_keypad_suspend, ske_keypad_resume);
-- 
2.28.0

