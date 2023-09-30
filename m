Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B12E97B427E
	for <lists+linux-input@lfdr.de>; Sat, 30 Sep 2023 19:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234604AbjI3RJ2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 30 Sep 2023 13:09:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234606AbjI3RJ1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 30 Sep 2023 13:09:27 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FED1FA
        for <linux-input@vger.kernel.org>; Sat, 30 Sep 2023 10:09:25 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-406619b53caso13166805e9.1
        for <linux-input@vger.kernel.org>; Sat, 30 Sep 2023 10:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696093763; x=1696698563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k0VJ6C8kG7GHegHfpPJdNysCaTwmqIvJ6WSm4iQqP4U=;
        b=bN1dM71rpawhTXzZAEAYAQKQur1WgJHyflo7LnEVEh5wl9FN9miyIahdzmHT1gW009
         UqgJisEvP4netDUyz192qReFz8tqGrbn1Uz1/GMZ15otOpDrddcPiLw7bKTn9afeTce6
         cNsavNEQ/dq78j17O2dcVQ1yf4PS4WV5KfCJkJwrUbOx0VCmFyMGVw7OUDyjYWwvRzWq
         cvQ4OGpFwtk3Tju7d7KmAF86RuBVveqsASHS6ueKSJxAUCiIcs014cokAEn9hY0CdcKV
         X/GoojIYYl1FidMctMes6FsMTI6jJDv4a510gogfTaL9rtD29gkudIT6bVehIL0PAlcj
         Oxng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696093763; x=1696698563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k0VJ6C8kG7GHegHfpPJdNysCaTwmqIvJ6WSm4iQqP4U=;
        b=e0udbe0biHPzZfVbYnm+D1fm+bJUAKzZwDymkugdgto3C7PVM27GW22bpabQPb/kZH
         XfcS5GQVETVhnx+ykIQqP/pvpTcZxxtpNtCC65eYOcCumGe7DhNUDfkTIwdr6bw29gRn
         AbQDFh5Qwf2XMtjpNGD+/4mvkt/Jy2c4TkqLMgfPBnyPr2C3DPIA04WWmURHotAb5PmP
         QGYCeJhTIfQdjybOgzaLE1sLc0AnugSQ7dA3si396jrNA5YRNQgsvb+pCNzoipgKKyk6
         7YCCgEYtUDW55dgIEOWqR0GjNv3rDm0AFPxJQF5EUuIxAfjdUs1Ks4OZONYCPfnoPjI3
         yzTw==
X-Gm-Message-State: AOJu0YzwbRhV8FyGUhMT567KPgShvngF7UCE+v5ygtAEyQ9tJ1rxqe2h
        sLXbLXvOuAfi1TIgk6fhCJuCCA==
X-Google-Smtp-Source: AGHT+IHCLGk8syzqpqer7HrIAq6wGcQZLbCD1JNGfQ9k8s4oWvFVHyyykKCDg2ojj8BP8dZ1x6vFkg==
X-Received: by 2002:a7b:c454:0:b0:405:959e:dc6f with SMTP id l20-20020a7bc454000000b00405959edc6fmr6477462wmi.37.1696093763725;
        Sat, 30 Sep 2023 10:09:23 -0700 (PDT)
Received: from lion.localdomain (host-2-99-112-229.as13285.net. [2.99.112.229])
        by smtp.gmail.com with ESMTPSA id y21-20020a7bcd95000000b00405c7591b09sm3756368wmj.35.2023.09.30.10.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Sep 2023 10:09:23 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
Date:   Sat, 30 Sep 2023 18:08:49 +0100
Subject: [PATCH 5/7] Input: synaptics-rmi4 - don't do unaligned reads in
 IRQ context
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230929-caleb-rmi4-quirks-v1-5-cc3c703f022d@linaro.org>
References: <20230929-caleb-rmi4-quirks-v1-0-cc3c703f022d@linaro.org>
In-Reply-To: <20230929-caleb-rmi4-quirks-v1-0-cc3c703f022d@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Vincent Huang <vincent.huang@tw.synaptics.com>
Cc:     methanal <baclofen@tuta.io>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Caleb Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.13-dev-46309
X-Developer-Signature: v=1; a=openpgp-sha256; l=2497;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=c8t4Dh0FV7IAxRxCe06lGztnMxn5LYVPeNtEfmL+ltU=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhlSJMDu1Jdef656ZYaLx/1NLEht7+33t1JKe8wbpq9yuN
 h04pL26o5SFQZCDQVZMkUX8xDLLprWX7TW2L7gAM4eVCWQIAxenAEykIoHhv/eynL+V5h6bVXVW
 LjLmecSg8iCe2U8wYUF2jpTARDabEob/OeUV9z+lbku3fzbJa+qDgkkTWxdlRUecXGZrJHmAKf4
 0IwA=
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: methanal <baclofen@tuta.io>

Some replacement displays include third-party touch ICs which incur a
significant penalty (1-2 seconds) when doing certain unaligned reads.
This is enough to break functionality when it happens in the hot path,
so adjust the interrupt handler to not read from an unaligned address.

Signed-off-by: methanal <baclofen@tuta.io>
Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
This solution does wind up doing the unaligned reads on the CPU instead,
although I'm not sure how significant of a penalty this is in practise.
---
 drivers/input/rmi4/rmi_driver.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/input/rmi4/rmi_driver.c b/drivers/input/rmi4/rmi_driver.c
index cd3e4e77ab9b..58bf3dfbf81c 100644
--- a/drivers/input/rmi4/rmi_driver.c
+++ b/drivers/input/rmi4/rmi_driver.c
@@ -136,9 +136,14 @@ static int rmi_process_interrupt_requests(struct rmi_device *rmi_dev)
 		return 0;
 
 	if (!data->attn_data.data) {
+		/*
+		 * Read the device status register as well and ignore it.
+		 * Some aftermarket ICs have issues with interrupt requests
+		 * otherwise.
+		 */
 		error = rmi_read_block(rmi_dev,
-				data->f01_container->fd.data_base_addr + 1,
-				data->irq_status, data->num_of_irq_regs);
+				data->f01_container->fd.data_base_addr,
+				data->irq_status - 1, data->num_of_irq_regs + 1);
 		if (error < 0) {
 			dev_err(dev, "Failed to read irqs, code=%d\n", error);
 			return error;
@@ -1083,16 +1088,17 @@ int rmi_probe_interrupts(struct rmi_driver_data *data)
 	data->num_of_irq_regs = (data->irq_count + 7) / 8;
 
 	size = BITS_TO_LONGS(data->irq_count) * sizeof(unsigned long);
-	data->irq_memory = devm_kcalloc(dev, size, 4, GFP_KERNEL);
+	data->irq_memory = devm_kzalloc(dev, size * 4 + 1, GFP_KERNEL);
 	if (!data->irq_memory) {
 		dev_err(dev, "Failed to allocate memory for irq masks.\n");
 		return -ENOMEM;
 	}
 
-	data->irq_status	= data->irq_memory + size * 0;
-	data->fn_irq_bits	= data->irq_memory + size * 1;
-	data->current_irq_mask	= data->irq_memory + size * 2;
-	data->new_irq_mask	= data->irq_memory + size * 3;
+	/* The first byte is reserved for the device status register */
+	data->irq_status	= data->irq_memory + size * 0 + 1;
+	data->fn_irq_bits	= data->irq_memory + size * 1 + 1;
+	data->current_irq_mask	= data->irq_memory + size * 2 + 1;
+	data->new_irq_mask	= data->irq_memory + size * 3 + 1;
 
 	return retval;
 }

-- 
2.42.0

