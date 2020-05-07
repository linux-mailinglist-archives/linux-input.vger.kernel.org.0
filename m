Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD62B1C9436
	for <lists+linux-input@lfdr.de>; Thu,  7 May 2020 17:13:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbgEGPNI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 May 2020 11:13:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726495AbgEGPNH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 7 May 2020 11:13:07 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBE99C05BD43;
        Thu,  7 May 2020 08:13:07 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id v63so3120408pfb.10;
        Thu, 07 May 2020 08:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1ZAU8RJ54KgdAB52+f9Z7ufUtSpBYmgCgDBOG+cMuYE=;
        b=QjhJ7i5GuF+bCeVINbD/t4Un/z7ffvXwFDf89h7BmlpxAaG8DJjT48/slkf/BMUtzz
         MfvDoU4TVtUx0wh4Y9XQUplIxpslIjg8HuSidJeiUkZ02K/oZAtZnSuHhsDvIgPzE/sm
         yFJIGhjKcv6s9QH+dbFqyVMQYTEKOgcO/fjNKeblQ9GCHiqrdqHjcO+Bo/KP4qkme04A
         PRFR08MQH2TctWzfBmTqWXi4RXsgBmA9shX+ZVRCmT9PBvKq1WcqWt0gjCl9xbzzbydD
         XKoblPomTEy3GD64iAMdoBFN1BV/p8yXXxExO53SWkHPhLIrTq6mIX6TNx2W2aeE1XeY
         U0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1ZAU8RJ54KgdAB52+f9Z7ufUtSpBYmgCgDBOG+cMuYE=;
        b=Xd6frzxMKDhz7bR7S+06cOgJMynfUmvojkfCpsBQSwwAjSFYN1FMsThOtI4ndbGpiw
         kAIWErWJkgeamPJiB//Ssg21c7mKnM+EgCt/J2YP1+CU7CKi8zeNTpVrqYyUvWddTFUC
         TftCOmb/PBf3WPV6nu8UZc+1s8rsKZCKjKmHI3vjJgfYE5mRsNZRDOGcfnTvWyOoTkQy
         VXEbp5zZzW/ZVXyiB679hKvplEEOijqSLC4o/qsEJs6pKfWUbIbVEhtvtL7ScDWo9Hsb
         RbMKLOYpC9pEjMRrjKSGpt3a2zaTdSq7foIW+mhdnV3SN6DbxzYvmJx4A3SPi6m1wVG5
         jnYg==
X-Gm-Message-State: AGi0PuY20GMYbwEH1HsPKyIfW2v6LeHclXerrGhaLzBDsTAKlgjgcglh
        ntGuwHjHpE7GUgV0Ivm4GFY=
X-Google-Smtp-Source: APiQypLh7vPZxj8lM5PWxfqMeI7I1WfHpATd46t0DuKukW9mHO65KqaevP4URujV0wgory7rOk+96w==
X-Received: by 2002:aa7:8ecd:: with SMTP id b13mr14510119pfr.191.1588864387288;
        Thu, 07 May 2020 08:13:07 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.gmail.com with ESMTPSA id i190sm5215759pfe.114.2020.05.07.08.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 08:13:06 -0700 (PDT)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        patches@opensource.cirrus.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH] Input: wm831x-ts - add missed input_unregister_device
Date:   Thu,  7 May 2020 23:12:59 +0800
Message-Id: <20200507151259.792697-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This driver calls input_register_device() in probe, but misses
input_unregister_device() in remove.
Add the missed function call to fix it.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 drivers/input/touchscreen/wm831x-ts.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/touchscreen/wm831x-ts.c b/drivers/input/touchscreen/wm831x-ts.c
index 607d1aeb595d..db09dd473ada 100644
--- a/drivers/input/touchscreen/wm831x-ts.c
+++ b/drivers/input/touchscreen/wm831x-ts.c
@@ -379,6 +379,7 @@ static int wm831x_ts_remove(struct platform_device *pdev)
 {
 	struct wm831x_ts *wm831x_ts = platform_get_drvdata(pdev);
 
+	input_unregister_device(wm831x_ts->input_dev);
 	free_irq(wm831x_ts->pd_irq, wm831x_ts);
 	free_irq(wm831x_ts->data_irq, wm831x_ts);
 
-- 
2.26.2

