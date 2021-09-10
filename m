Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AED1406693
	for <lists+linux-input@lfdr.de>; Fri, 10 Sep 2021 06:50:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230221AbhIJEv6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Sep 2021 00:51:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230177AbhIJEv5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Sep 2021 00:51:57 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EB08C061574;
        Thu,  9 Sep 2021 21:50:47 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id oc9so559051pjb.4;
        Thu, 09 Sep 2021 21:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cjSmIHPUHZu3PXZxtunolSLa7lCsMSC8ZCX89a3t5/U=;
        b=dni72Vs90m2jtyPO9hgsKKXOBBcsnyujnePL+Fhu/R53skgeXbHxGUQ/d5x36QPa6y
         wyHdB8r+CcYMyOCNFTWNhsejCTTjyrGnqQKt43wmYElAe5Uviwn5+qzgrnucSxPQ9Mbh
         SRboZv4DuZvtZHPsz0F71/K8qSZ4ZRojMkiqqUzM8XwdLbhkZmORedf9UoqGjMdaQibx
         PD888Ez2zjUMq1/eqBBkLnUv2RISIYE4tjHeBMaD+S6xMY2TjoC7as+oqAVHJme2wzme
         Xq8pewP3r+ojuinLQemEJguYKiB1QPFlpby9QShF92CHhDk7goGNMQPJbbwZlCp9A5rh
         Cg1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cjSmIHPUHZu3PXZxtunolSLa7lCsMSC8ZCX89a3t5/U=;
        b=HqH5TihyhTsKw5bTtz15gFqaaf2u1T/3EdCAm5Bq5lD8icrx8OcKllWGx0CXXdZYZ3
         xgW0Ki/dyzv4LLnRzIE0637j/ar+2qkJ0Ovy8yutXFXzkO1AlpnZNVhvDALUrE/1RC48
         D/8R4aWjR8EJnXSsTORqF35E+n5QSOGNVJT5MK12dU+T6EV8BLdYFBphRmZrlN/CA/fl
         uPgOOO2f8Sk2+8rW54sOmmtRyXb7TalRNb/XScbc0jfnVVBr0lTtECcov59Z2MK7sOcP
         uCvA8BEHEx/iB+ZfNKZGJnzYgpLmf02fzFgNWy+wDI+hJaFpJ8zYT4rkgZtZ4jwsMC8m
         z2FQ==
X-Gm-Message-State: AOAM5336e3G1borsJ8LgvscFd/WwOzZ1GlwcwluEwInqW/dybjQBUS1x
        JWeY4F5QO6cSrIRYW+eNfTE=
X-Google-Smtp-Source: ABdhPJxBJVPI6rNNYaaewdYsXKDcyLBValdkgZjCqs4T0f6MWB7mrz1Z4RM1J4M7PoIZ4knrkfWVAg==
X-Received: by 2002:a17:90a:bb12:: with SMTP id u18mr7522504pjr.110.1631249446896;
        Thu, 09 Sep 2021 21:50:46 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:acdc:1d22:e20a:2796])
        by smtp.gmail.com with ESMTPSA id y4sm3555477pjw.57.2021.09.09.21.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 21:50:46 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Daniel Mack <daniel@zonque.org>,
        Marco Felsch <m.felsch@pengutronix.de>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] Input: ads7846 - do not attempt IRQ workaround when deferring probe
Date:   Thu,  9 Sep 2021 21:50:39 -0700
Message-Id: <20210910045039.4020199-3-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
In-Reply-To: <20210910045039.4020199-1-dmitry.torokhov@gmail.com>
References: <20210910045039.4020199-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

When request_irq() returns -EPORBE_DEFER we should abort probe and try
again later instead of trying to engage IRQ trigger workaround.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/ads7846.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
index 0f973351bc67..a25a77dd9a32 100644
--- a/drivers/input/touchscreen/ads7846.c
+++ b/drivers/input/touchscreen/ads7846.c
@@ -1361,7 +1361,7 @@ static int ads7846_probe(struct spi_device *spi)
 	err = devm_request_threaded_irq(dev, spi->irq,
 					ads7846_hard_irq, ads7846_irq,
 					irq_flags, dev->driver->name, ts);
-	if (err && !pdata->irq_flags) {
+	if (err && err != -EPROBE_DEFER && !pdata->irq_flags) {
 		dev_info(dev,
 			"trying pin change workaround on irq %d\n", spi->irq);
 		irq_flags |= IRQF_TRIGGER_RISING;
-- 
2.33.0.309.g3052b89438-goog

