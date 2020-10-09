Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A7F2288021
	for <lists+linux-input@lfdr.de>; Fri,  9 Oct 2020 03:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729946AbgJIB7T (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Oct 2020 21:59:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729285AbgJIB7T (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Oct 2020 21:59:19 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59D27C0613D2;
        Thu,  8 Oct 2020 18:59:19 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id b193so4997723pga.6;
        Thu, 08 Oct 2020 18:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=m8tXYX6yMdg1pPwjMEV0oogLxbSC8kTodLxyZ2BRuA0=;
        b=r55w+IbgikLzFsMPo2mvj1Yxg3a/kjLEd+cRj6v7uqSH1QIbz+ibGSeK+mS1t/7gkd
         ElBlPyaznvXegetow+8vvYMBYYWZV75aJ4sbfStXMt9EArJq2uape1LUgZzHMbQICKBJ
         ytqS4IWYRsntFl6Up8H4lN7xe1WZWwmQWj78l+qkyF0J9nEIU4XLLjXn9YAIaduFD9z9
         qcKglT9S8BAWnV04Ngsld6NpAgIxMMC6KZrOTgo98dS34xTSKvkf5h0mk2qqRnF0MXij
         EyVL+H4eSantP1eWXVT0//AJS4/aSdpM80v/Y4KQsT6DZWmCGsXGUE3EFJKEvWFRXE4c
         jKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=m8tXYX6yMdg1pPwjMEV0oogLxbSC8kTodLxyZ2BRuA0=;
        b=adSXJaCXIDPH6eQhwIXQgG4C76QzT8jxBYwUACrOV0XS0RlavD3uSpSLJhjkLp0uPF
         Kf2d5506gs0Rg+JLT/iURCH3sCFNCKr/izXyLLLPke7GS6fBDhndPbMuKGnq4TeGJUY5
         Dop80XeDWIwJbOpwCMbsu8Efuaa0rfDQi1DetjhlnsxUaV4pyXZURoGrfkpAKg94En7R
         9DjDQH/eQLbYCRfD1m1qf3irniicLyAfQwZbna/0sa2vwg1ZNfa4W54ozcydlqHbXgtl
         R3f73+X3oG0B3/9QT3/HJ58HwXQYndwK2mwqLxqCPZbfUiaRzejeHEhNYExog8o4H/cp
         PjNQ==
X-Gm-Message-State: AOAM533KhInI1+5EqGFvJOdUMrvVF1twkxwZnBQ1UUNEGt6vFnqMb8CH
        M7AU9QcvJBufeKBbydE3fQ==
X-Google-Smtp-Source: ABdhPJy1OBJ2OIY19laW9kg5XftEvqzH0W9sQuvopDrEvz4fihT7TDg6q4/yNRLkSCJSGJnCZy4pDw==
X-Received: by 2002:a63:541a:: with SMTP id i26mr1452597pgb.265.1602208758965;
        Thu, 08 Oct 2020 18:59:18 -0700 (PDT)
Received: from localhost.localdomain ([47.242.140.181])
        by smtp.gmail.com with ESMTPSA id 70sm9212304pfu.203.2020.10.08.18.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 18:59:18 -0700 (PDT)
From:   Pujin Shi <shipujin.t@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pujin Shi <shipujin.t@gmail.com>
Subject: [PATCH] Input: joystick/analog - mips has get_cycles()
Date:   Fri,  9 Oct 2020 09:59:06 +0800
Message-Id: <20201009015906.1281-1-shipujin.t@gmail.com>
X-Mailer: git-send-email 2.18.4
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixes:

drivers/input/joystick/analog.c:160:2: warning: #warning Precise timer not defined for this architecture. [-Wcpp]

Signed-off-by: Pujin Shi <shipujin.t@gmail.com>
---
 drivers/input/joystick/analog.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/input/joystick/analog.c b/drivers/input/joystick/analog.c
index 2b625ebef914..cdf54b5f519b 100644
--- a/drivers/input/joystick/analog.c
+++ b/drivers/input/joystick/analog.c
@@ -147,7 +147,8 @@ static unsigned int get_time_pit(void)
 #define GET_TIME(x)	do { x = (unsigned int)rdtsc(); } while (0)
 #define DELTA(x,y)	((y)-(x))
 #define TIME_NAME	"TSC"
-#elif defined(__alpha__) || defined(CONFIG_ARM) || defined(CONFIG_ARM64) || defined(CONFIG_PPC) || defined(CONFIG_RISCV)
+#elif defined(__alpha__) || defined(CONFIG_ARM) || defined(CONFIG_ARM64) || \
+	defined(CONFIG_PPC) || defined(CONFIG_RISCV) || defined(CONFIG_MIPS)
 #define GET_TIME(x)	do { x = get_cycles(); } while (0)
 #define DELTA(x,y)	((y)-(x))
 #define TIME_NAME	"get_cycles"
-- 
2.18.1

