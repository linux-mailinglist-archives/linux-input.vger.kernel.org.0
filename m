Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6360439238E
	for <lists+linux-input@lfdr.de>; Thu, 27 May 2021 02:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234964AbhE0AIa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 May 2021 20:08:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234152AbhE0AI1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 May 2021 20:08:27 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60716C061574;
        Wed, 26 May 2021 17:05:21 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id a7so1443990plh.3;
        Wed, 26 May 2021 17:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=dAagfPfme8wuHZ/z6Or4wIqyS0K4PCwBMNV6nbEnU6U=;
        b=sJ/mBM0yDTvxZEa2xj2wn7fWy1+6ZjmdS0Cmm5ccAVNovkUHfdrewvep7rCZRfUazT
         c/5aOq6xjk+FxWuj8WymrboEOQyLltTA536YQo17jhChE4sI7aTd0x1cybkc0/+7cE6U
         RP+M0uQeEtDCiArQxWkuwyz4wYUfraxfT4Puq7ACAEOtveogbH1fTWLr1aiewsVZ7XsJ
         dDHfN/zhNgZ+mFKTO0gC77TB3MzDyZpuSZNDnAZ7A0KH5OKJMujx6xhJzgUhoWB8XFjQ
         ugzCPSKmoYdfvnJmTQ3Mg2szOYAW7wramv3PeHUuUSUCrcQPS6Zkphngu1WSu2fO7Wl1
         YhSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=dAagfPfme8wuHZ/z6Or4wIqyS0K4PCwBMNV6nbEnU6U=;
        b=ojO3/R8YUIP8IaChpPpBfaTZ5RhY0a5FyGgad35em6tbACV3nNppbgtbyzifV6LLuy
         WQFPRx0dQY3wAeKJVzlyRiNMgvTicU2eOF4ARcyoSqu4ZyHlJbFGpNdvMCkHLkHOsU3N
         GeoU0RQjzW7KP4yJtX9ZlmjBrhcAJP1r7RqnxKmC3FsUtIUsQ/CRw1feUzMuATMgxAhD
         MkW7m0YmlkSu+iE5VYjhbIWByJcc4e6lO1/2HtAGcgWb7aUXQTE6CwaVYTofSlcfIpbs
         vocpts18pHKtzkZ6/3uvzKr7fg4CrTofoEhLVeWaaOWCNw0q2FcKXvAD1G5+YoazLAjO
         17XQ==
X-Gm-Message-State: AOAM532DGjMAL1URlnp6XNy4FaoJ2u4biaD+DiEsatNO1/OkVz7JSWy7
        52Nra1cLRF+YLiCtMfNyVJXR/SCP63U=
X-Google-Smtp-Source: ABdhPJyWVtNepw1QYUr4zt2amDlrEBOepl89mV6Bz7ipKiavJPZijxOXTr4GJh3uJugvqI+99NFGhA==
X-Received: by 2002:a17:90a:af8b:: with SMTP id w11mr763041pjq.228.1622073919615;
        Wed, 26 May 2021 17:05:19 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:2eca:168c:3933:43bc])
        by smtp.gmail.com with ESMTPSA id e22sm270461pfl.188.2021.05.26.17.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 17:05:18 -0700 (PDT)
Date:   Wed, 26 May 2021 17:05:15 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Javier Martinez Canillas <javier@dowhile0.org>,
        Barry Song <song.bao.hua@hisilicon.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Input: cyttsp - do not force interrupt trigger
Message-ID: <YK7iO96g+7yIC0l1@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Instead of forcing interrupt trigger to be "falling edge" let's rely on the
platform to set it up according to how it is set up on a given board based
on data in device tree or ACPI tables.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

Linus, Ferruh's email has been bouncing for ages, it looks like you have
the hardware and you are already looking over another Cypress touch
controller, mind if I put you down as a maintainer for this one as well?


 drivers/input/touchscreen/cyttsp_core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/cyttsp_core.c b/drivers/input/touchscreen/cyttsp_core.c
index d9debcdeeec7..a6352d79e23d 100644
--- a/drivers/input/touchscreen/cyttsp_core.c
+++ b/drivers/input/touchscreen/cyttsp_core.c
@@ -699,8 +699,7 @@ struct cyttsp *cyttsp_probe(const struct cyttsp_bus_ops *bus_ops,
 	}
 
 	error = devm_request_threaded_irq(dev, ts->irq, NULL, cyttsp_irq,
-					  IRQF_TRIGGER_FALLING | IRQF_ONESHOT |
-					  IRQF_NO_AUTOEN,
+					  IRQF_ONESHOT | IRQF_NO_AUTOEN,
 					  "cyttsp", ts);
 	if (error) {
 		dev_err(ts->dev, "failed to request IRQ %d, err: %d\n",
-- 
2.31.1.818.g46aad6cb9e-goog


-- 
Dmitry
