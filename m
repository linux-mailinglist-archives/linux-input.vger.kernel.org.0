Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA3251BB0CF
	for <lists+linux-input@lfdr.de>; Mon, 27 Apr 2020 23:55:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbgD0Vzx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Apr 2020 17:55:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726182AbgD0Vzx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Apr 2020 17:55:53 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C16BC03C1A7
        for <linux-input@vger.kernel.org>; Mon, 27 Apr 2020 14:55:53 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id x77so9664039pfc.0
        for <linux-input@vger.kernel.org>; Mon, 27 Apr 2020 14:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QwWrKenZ8k5J4q1qBIr58HlyfL2ByZs2Ssa6TCedrSk=;
        b=LbaJb+ki6pK6wQO0c2DyS9Atvm8JE6MKeoBDclHbQycrzujPTZPNaK6yfuGS3UUBu/
         MInl24vMoRUBTYFpBgQQbK46u9WS6P1ReSzyapOuUjnUuuNUi6RCCGHwAfTpbIGsUaQD
         pZuvHsXY0pF9NwVYLOImYaZhrERGyHEWxmM18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QwWrKenZ8k5J4q1qBIr58HlyfL2ByZs2Ssa6TCedrSk=;
        b=VYVUtBwtzj4k/kOI/OxZo6PsKPjnvNFgW9ZDe3BC75qN6f04Tf0+PH/u4JtN9wf14a
         pLQtZcePMsv43pnYRXAmIXTJ95AkLoXbfUcQMqj4OfS2d9RnTjhhRVR3e60cTH2nxKBe
         E8DL1Q7Z6+lOGTLJHie8Cjo+sCTh/HYkan/TgC5llIwVDLOOfONnQs3OfGe6icG7E/co
         gfXloMtTygjXZb3IURaxKn7MWvjE6d9odD7S3YpRAbWfuLKpr4UftMsQPhnXGwJn++4y
         ZaAiqd9bE/qOwpjIdlOQFvFQ4pwYm9nNFVuBW0lEACAg4DB+43M6CKnxBizpdfouT8Y2
         njtQ==
X-Gm-Message-State: AGi0PuZvdW/98H6/hAyefNzKVHGjrhkhx3v7Jv44AcSEhhhZzIqgRT61
        MkB6ZUeDc61qYM6M/ja7DzeJHw==
X-Google-Smtp-Source: APiQypIWIg1lh3l6rgxN7SYiYVoPklma36XNRFiHNukzSWdE1PdM5v8sHQNeaE1NgWaTUlxWGHzTWw==
X-Received: by 2002:a62:c1c1:: with SMTP id i184mr27417512pfg.18.1588024552819;
        Mon, 27 Apr 2020 14:55:52 -0700 (PDT)
Received: from evgreen-glaptop.cheshire.ch ([2601:646:c780:1404:1c5a:73fa:6d5a:5a3c])
        by smtp.gmail.com with ESMTPSA id f99sm244273pjg.22.2020.04.27.14.55.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 27 Apr 2020 14:55:52 -0700 (PDT)
From:   Evan Green <evgreen@chromium.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Evan Green <evgreen@chromium.org>, stable@vger.kernel.org,
        Nick Desaulniers <nick.desaulniers@gmail.com>,
        Allison Randal <allison@lohutok.net>,
        Andrew Duggan <aduggan@synaptics.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Enrico Weigelt <info@metux.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: synaptics-rmi4 - Really fix attn_data use-after-free
Date:   Mon, 27 Apr 2020 14:55:48 -0700
Message-Id: <20200427145537.1.Ic8f898e0147beeee2c005ee7b20f1aebdef1e7eb@changeid>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fix a use-after-free noticed by running with KASAN enabled. If
rmi_irq_fn() is run twice in a row, then rmi_f11_attention() (among
others) will end up reading from drvdata->attn_data.data, which was
freed and left dangling in rmi_irq_fn().

Commit 55edde9fff1a ("Input: synaptics-rmi4 - prevent UAF reported by
KASAN") correctly identified and analyzed this bug. However the attempted
fix only NULLed out a local variable, missing the fact that
drvdata->attn_data is a struct, not a pointer.

NULL out the correct pointer in the driver data to prevent the attention
functions from copying from it.

Fixes: 55edde9fff1a ("Input: synaptics-rmi4 - prevent UAF reported by KASAN")
Fixes: b908d3cd812a ("Input: synaptics-rmi4 - allow to add attention data")

Signed-off-by: Evan Green <evgreen@chromium.org>

Cc: stable@vger.kernel.org
Cc: Nick Desaulniers <nick.desaulniers@gmail.com>
---

 drivers/input/rmi4/rmi_driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/rmi4/rmi_driver.c b/drivers/input/rmi4/rmi_driver.c
index 190b9974526bb..c18e1a25bca6e 100644
--- a/drivers/input/rmi4/rmi_driver.c
+++ b/drivers/input/rmi4/rmi_driver.c
@@ -205,7 +205,7 @@ static irqreturn_t rmi_irq_fn(int irq, void *dev_id)
 
 	if (count) {
 		kfree(attn_data.data);
-		attn_data.data = NULL;
+		drvdata->attn_data.data = NULL;
 	}
 
 	if (!kfifo_is_empty(&drvdata->attn_fifo))
-- 
2.24.1

