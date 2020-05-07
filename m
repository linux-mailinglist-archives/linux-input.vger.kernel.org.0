Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 388A51C9423
	for <lists+linux-input@lfdr.de>; Thu,  7 May 2020 17:12:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbgEGPMW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 May 2020 11:12:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726074AbgEGPMW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 7 May 2020 11:12:22 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 732A0C05BD43;
        Thu,  7 May 2020 08:12:22 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id 207so2936060pgc.6;
        Thu, 07 May 2020 08:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=96jnTCBD83Wv0PAJTE2BBo0VXx5TqKQi9pMzwgM4Bvo=;
        b=qkcIoMnyddwZz6l2iGAXDhyexKTgNnQAW9lafUYWDMhTepNj8Sta9ZXm4w3wyB2AST
         1AJTMdMBajSvLBhvM16D9KgIqtXbBuhudE+UHuISqWO+qY00UPgJD8yJPr8DZ8rCOMzJ
         c2ItNvJ+ttYCUdfWTOe3xXVOp6Iplo5z9il0iU+Oml333s/6CXcW4Jgp77xvzRrLQgL+
         /ncoVKcoluCYvfQGspde7NgrHxWuU1aOLIThVKDHkx9x8j/6bqj2QsmqLDnPEMdzRg9Z
         Fznfhyk50qoESkluSuANZvefs7UgpLkAYOsCejb35HG+Jd3EE+CfYyOZaeuDWCVW5Z2i
         9hqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=96jnTCBD83Wv0PAJTE2BBo0VXx5TqKQi9pMzwgM4Bvo=;
        b=Ncheoe5nAQVwqD1DgdZWLslJtsE79c3Plbh2WlEskmNn2BaxZPULmLRfDWPEauoKm0
         LP7C3lErfzFdhCgUgRo197xWg9Dm/myYg7Y8moEqWbvJx7c/QXFlM6hUT43an8mjwXDU
         8ydgdSN5ccH5JBWHzUM5V63dTk5CHqremIF6y/1E3nu545z0EZYZn+yllYFm06JIdTRs
         3zOGxTKmS0OlLVvqVDF1krLSx0get/IEdfZEGktVJnp2cElHroeWO5KOI62+1og3M+H+
         Hp1UvkHyU6B0LOcq+XcE4K7qtsvVLrYAARhCkBhWWRWXaz3+ko/cyDTMPmv8p4J6taTf
         CpZg==
X-Gm-Message-State: AGi0PuYGEvVJ7HD9hAaWlm5SMN9Qj2J4osDL4fyBjBm0IuFm9fnHYChP
        NB5uRAAjJzzg5FLJ5XRQOjM=
X-Google-Smtp-Source: APiQypJdokPYKCL5kUn4xIRQIDNKHKOdREr5Pgq69HVLtf4k/OCqHfoHoqbZ9uKHEKRIlSnCEIMzsA==
X-Received: by 2002:a63:6e81:: with SMTP id j123mr12541889pgc.333.1588864342098;
        Thu, 07 May 2020 08:12:22 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.gmail.com with ESMTPSA id a196sm5276794pfd.184.2020.05.07.08.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 08:12:21 -0700 (PDT)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH] Input: stmpe-ts - add missed input_unregister_device
Date:   Thu,  7 May 2020 23:12:13 +0800
Message-Id: <20200507151213.792640-1-hslester96@gmail.com>
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
 drivers/input/touchscreen/stmpe-ts.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/touchscreen/stmpe-ts.c b/drivers/input/touchscreen/stmpe-ts.c
index 7e16fcfe3b95..5e62b466629b 100644
--- a/drivers/input/touchscreen/stmpe-ts.c
+++ b/drivers/input/touchscreen/stmpe-ts.c
@@ -350,6 +350,7 @@ static int stmpe_ts_remove(struct platform_device *pdev)
 {
 	struct stmpe_touch *ts = platform_get_drvdata(pdev);
 
+	input_unregister_device(ts->idev);
 	stmpe_disable(ts->stmpe, STMPE_BLOCK_TOUCHSCREEN);
 
 	return 0;
-- 
2.26.2

