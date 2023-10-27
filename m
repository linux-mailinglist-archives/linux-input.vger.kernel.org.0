Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4FE17D97AB
	for <lists+linux-input@lfdr.de>; Fri, 27 Oct 2023 14:18:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345599AbjJ0MSg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 Oct 2023 08:18:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345818AbjJ0MSf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 Oct 2023 08:18:35 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C6441A1
        for <linux-input@vger.kernel.org>; Fri, 27 Oct 2023 05:18:33 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c50906f941so30097741fa.2
        for <linux-input@vger.kernel.org>; Fri, 27 Oct 2023 05:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698409112; x=1699013912; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QpUWJTFpNjZIZmlXASTkiTbyMnR1l2jQNO9OKE0q/GM=;
        b=pE6+grLQaaewtp632izCFvBX+dXcwDo7OtL2ItcZZjGSGNb7RvQGXf6/e3wMOHLMVK
         po5ElzvZshbpk9gZJAmOFowWHMSi2s28Txvp4W4kC/zBQsA5SsPSdTC4eUOJDr01yXUA
         qWUO2dWVXSAZEOLL5jp82weY094cv0HgYO3itkcBHt0SapryzPlzaYNG0rx97qwA7o4U
         Pi+E1xR/1m6ZtXLCb0NqsN805AZ7UjXP64CULje2+KJhArmL5qH4/v4rR6+b7yZ4EiOD
         VbS2HMi55rGnSjpWmv9i208mF7lbJJIwwDJfjIzqTb9GlpTWxINRuHxl8P35Qr0T2oM4
         zw4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698409112; x=1699013912;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QpUWJTFpNjZIZmlXASTkiTbyMnR1l2jQNO9OKE0q/GM=;
        b=Ui/FsjtFaRSUexFQb2rNxRukEhfL/yp3Nh7F3Knzx9SrWl2OnuNmenczsd94jBTo4h
         PibX5urzYsMx0C0R0/rkT9oI70rwzY329UyttMeO3bvywtfuhuis2Xzw5ylfGo/bz3NO
         GK9Pm5i1XxFJPErk+VYpACyxmy+SehWAtFshp6kHxrj0qphJr6PNgmKKzPKHggnPu+W5
         EcBgY3tgP/nk1SeOyQDWT0+gOy2TYvUbH2Rz0G9afMFXEzHs+prEF79LJyjFpP1XD3xJ
         9awZqazkT0RZGeQfp/sKXB4EV1QOLmE+2ut/eo7rtyfvfAZ+3sBNMRfhcR8lP5AD7R9+
         SCUA==
X-Gm-Message-State: AOJu0YzIvQuouIkDg8faS9tK2t7/01d1aW0F1oLhty7cRUGKd9nTPVDF
        xS7xjUQyEUHv9zDvOVaUsFgdERwzeYYof5r7GVQ=
X-Google-Smtp-Source: AGHT+IHImjFD7lLH1TbPG7jI/g8XfCWe653u0TtNhH0Hv6ccJVrEwmTebgogehWeNAQTLInLhq/J5w==
X-Received: by 2002:a2e:8e67:0:b0:2bd:d34:d98a with SMTP id t7-20020a2e8e67000000b002bd0d34d98amr1702848ljk.44.1698409111745;
        Fri, 27 Oct 2023 05:18:31 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y20-20020a1c4b14000000b0040588d85b3asm4867476wma.15.2023.10.27.05.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 05:18:31 -0700 (PDT)
Date:   Fri, 27 Oct 2023 15:18:28 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Nick Dyer <nick@shmanahar.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        Christopher Heiny <cheiny@synaptics.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] Input: synaptics-rmi4 - fix use after free in
 rmi_unregister_function()
Message-ID: <706efd36-7561-42f3-adfa-dd1d0bd4f5a1@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The put_device() calls rmi_release_function() which frees "fn" so the
dereference on the next line "fn->num_of_irqs" is a use after free.
Move the put_device() to the end to fix this.

Fixes: 24d28e4f1271 ("Input: synaptics-rmi4 - convert irq distribution to irq_domain")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/input/rmi4/rmi_bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/rmi4/rmi_bus.c b/drivers/input/rmi4/rmi_bus.c
index f2e093b0b998..1b45b1d3077d 100644
--- a/drivers/input/rmi4/rmi_bus.c
+++ b/drivers/input/rmi4/rmi_bus.c
@@ -277,11 +277,11 @@ void rmi_unregister_function(struct rmi_function *fn)
 
 	device_del(&fn->dev);
 	of_node_put(fn->dev.of_node);
-	put_device(&fn->dev);
 
 	for (i = 0; i < fn->num_of_irqs; i++)
 		irq_dispose_mapping(fn->irq[i]);
 
+	put_device(&fn->dev);
 }
 
 /**
-- 
2.42.0

