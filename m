Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B8EB36181C
	for <lists+linux-input@lfdr.de>; Fri, 16 Apr 2021 05:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237254AbhDPDST (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Apr 2021 23:18:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236990AbhDPDSS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Apr 2021 23:18:18 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74BFCC061574;
        Thu, 15 Apr 2021 20:17:53 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so13831449pjv.1;
        Thu, 15 Apr 2021 20:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=VI3t5ESF3PsNUZ1NJ3A1UYUYGbeRTCKjzBQtgFmOTfg=;
        b=vNPyQT9+tpNZ0xu455EDkmF7kUdPLbwzbuS8VYJs8oceeuvNSA/KT2g4WJohP8jA1H
         Ud4GmV9neYynCYgLQTbCI6k+g74+ZD9lhmpfs6QOf7wXUAzwZW7mKugiVxef/BimNd6M
         DpACe4R5mgzgxGQwACJzqexC/YiwfwrcbU+L1thHMbPzzcD3elFglNLrxlxLErstQb36
         /HGR9YmaDJMesEv3ohEbc1EhtBuqwX2Oo1gPTOHVLOY7r4iQzjI36XtCLbxyvWy02dXZ
         bD4QNYeKO0O/VcoBLFQqdiHklH5gthDzQwW0RpTgEYii7GCJUPW7v1WbmgjuajdC2qE7
         wXFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=VI3t5ESF3PsNUZ1NJ3A1UYUYGbeRTCKjzBQtgFmOTfg=;
        b=o4dZar+V3tKyoV2yG8LUrpK6q0I2ag0UlgoCfDi/wnnmuiNru3ECCPfIM2parKGSEN
         WAYQyOjykYMC9X3prb6Qfm1+HK0BrIqpC7JWuPceWmueXim9FpVCgUpoP+v92LP42PLm
         BVTw6lDmhnhJAkSP7oqrTStOgw3n5j8KAfQt9whSF1HX682LwyvUy749scClyPbQ8NVn
         JDrhByP8ZlXtb5KsXr5K0dfzcXAQw4gQi7kRGShogbLRaD6oB6budJtFeVHwhaMIpHI/
         0ADVuhxPwYQZF4PG+U5XV12mJ8ajG9PKhsjUTy9ZB5CYGm70/UdyE0oovGYxu0GqK4hE
         0EOA==
X-Gm-Message-State: AOAM532+G0gi5nitFkOfN5xNhMFoJNEq6w12QXfKGCQ9WEbV9lphk4RC
        DF1XYPhIXntjcQIHd0df7ik=
X-Google-Smtp-Source: ABdhPJxEGzCeuDLWhFr1dq91rTtma9D5cQka0/3gQBFBh723PI+Tgr1wUXyZt4fujGvu64MSBfwP4Q==
X-Received: by 2002:a17:90a:7783:: with SMTP id v3mr7382210pjk.177.1618543073024;
        Thu, 15 Apr 2021 20:17:53 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.180])
        by smtp.gmail.com with ESMTPSA id gd1sm3552411pjb.49.2021.04.15.20.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 20:17:52 -0700 (PDT)
From:   zhuguangqing83@gmail.com
To:     Bastien Nocera <hadess@hadess.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guangqing Zhu <zhuguangqing83@gmail.com>
Subject: [PATCH] Input: goodix - Fix missing IRQF_ONESHOT as only threaded handler
Date:   Fri, 16 Apr 2021 11:17:47 +0800
Message-Id: <20210416031747.28504-1-zhuguangqing83@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Guangqing Zhu <zhuguangqing83@gmail.com>

Coccinelle noticed:
drivers/input/touchscreen/goodix.c:497:8-33: ERROR: Threaded IRQ with no
primary handler requested without IRQF_ONESHOT

Signed-off-by: Guangqing Zhu <zhuguangqing83@gmail.com>
---
 drivers/input/touchscreen/goodix.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index c682b028f0a2..725d01e01328 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -496,7 +496,8 @@ static int goodix_request_irq(struct goodix_ts_data *ts)
 {
 	return devm_request_threaded_irq(&ts->client->dev, ts->client->irq,
 					 NULL, goodix_ts_irq_handler,
-					 ts->irq_flags, ts->client->name, ts);
+					 ts->irq_flags | IRQF_ONESHOT,
+					 ts->client->name, ts);
 }
 
 static int goodix_check_cfg_8(struct goodix_ts_data *ts, const u8 *cfg, int len)
@@ -1158,7 +1159,7 @@ static int goodix_configure_dev(struct goodix_ts_data *ts)
 		return error;
 	}
 
-	ts->irq_flags = goodix_irq_flags[ts->int_trigger_type] | IRQF_ONESHOT;
+	ts->irq_flags = goodix_irq_flags[ts->int_trigger_type];
 	error = goodix_request_irq(ts);
 	if (error) {
 		dev_err(&ts->client->dev, "request IRQ failed: %d\n", error);
-- 
2.17.1

