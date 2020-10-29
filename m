Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14E7F29E535
	for <lists+linux-input@lfdr.de>; Thu, 29 Oct 2020 08:55:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731310AbgJ2HxD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Oct 2020 03:53:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731305AbgJ2HxC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Oct 2020 03:53:02 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD90DC0613D5;
        Thu, 29 Oct 2020 00:53:01 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id b3so1680418pfo.2;
        Thu, 29 Oct 2020 00:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u3va1Ez95tLxe7I4EBUOomxp6Dx6b4nK5o9+B/9QkHU=;
        b=YuPqF+6jqoeWyST2cJPjf+tufRoIdJD1Xru32JECwI70d2Be/a2ERXtMxyl4IjN0u8
         xNdB7zXl8YNe6JlTDL7EG42r2dRPdK1FUTQjtlBAJfhEDGZd/JdVMJW3/pKwp4GROCI1
         ngUc8Yv9maDb3S2BLSLBlsgHT4/RD35b+n/P+MVYvi5jsf/ND6xwiaYHJJ+YfaclcFhq
         +LtcTzMxQta9esEU34VdSR3WKpYJgF9KNLPiop0P6RXq0/xGL1T0g62q+X6LHr/mvyqM
         c4Pm/836NltauBgy7j9uHcQYRgM4zAe1PfAptM83NgHBRxHBiZgegy55MT902NVHmVjB
         rePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u3va1Ez95tLxe7I4EBUOomxp6Dx6b4nK5o9+B/9QkHU=;
        b=duwUcdo6fVIcQqiOaor7CpA+FVbP1ms4zMjI4oWr79IXDydihNUry4X0FkeDpUUWrm
         RMLvoz78P0WP487WgRlufP94+xX2aL2BISE3Vx3xx3K5u5jWZY5uTAKxfEv0OA+jqaKq
         c6IbmIeLHKwUEfAIGZamDDG07GDq/llkQJJmx6F39gtaGGzhVT5wFpuTD7YTXf1rHwNb
         PT8bLhQWiy0EHq9jYNT9RWOiZJgFwNwAMiwZaagwHQvUYHqfZVKhIHcbCLeVd4WdfZwj
         EpQXv9FuxKjjOjL7hO1a3BYtjBBQ8W/6nQ177GqncW6D6JpHTYi7uaJ4ga4ZfZPpBWwx
         Nfkg==
X-Gm-Message-State: AOAM531TJe2nawpKNGP39YEX8MXtOB0igzkEi+/IOMj/m78ei7RYOg0n
        XEujV5WO/IoqgISkIs9ygO37AnmiPUrgfw0B
X-Google-Smtp-Source: ABdhPJw04Cu5XWVDsW0UysOQkmcLmPHHCNYdjXYIiu8PjMiHvpPpHmU49K3wO9cFs9rQhWIzHRoMnA==
X-Received: by 2002:a17:90a:7d16:: with SMTP id g22mr3055511pjl.135.1603957981496;
        Thu, 29 Oct 2020 00:53:01 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
        by smtp.gmail.com with ESMTPSA id q35sm1880601pja.28.2020.10.29.00.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 00:53:01 -0700 (PDT)
From:   Coiby Xu <coiby.xu@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK
        , TOUCHSCREEN)...), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/3] Input: adp5589: remove unnecessary CONFIG_PM_SLEEP
Date:   Thu, 29 Oct 2020 15:52:35 +0800
Message-Id: <20201029075236.228335-2-coiby.xu@gmail.com>
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
 drivers/input/keyboard/adp5589-keys.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index eb0e9cd66bcb..50f94984e055 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -1077,7 +1077,6 @@ static int adp5589_remove(struct i2c_client *client)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int adp5589_suspend(struct device *dev)
 {
 	struct adp5589_kpad *kpad = dev_get_drvdata(dev);
@@ -1109,7 +1108,6 @@ static int adp5589_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static SIMPLE_DEV_PM_OPS(adp5589_dev_pm_ops, adp5589_suspend, adp5589_resume);
 
-- 
2.28.0

