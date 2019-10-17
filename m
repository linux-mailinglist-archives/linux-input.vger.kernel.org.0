Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56C9FDB889
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2019 22:43:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503574AbfJQUnp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Oct 2019 16:43:45 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42160 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502552AbfJQUmo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Oct 2019 16:42:44 -0400
Received: by mail-pg1-f195.google.com with SMTP id f14so2007056pgi.9;
        Thu, 17 Oct 2019 13:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rw40Y7pRi4fTQvKbY/v46MITEUGL/XAU6ul7eCZwlVo=;
        b=sosHBIU0RsMqX17uO+wNzNK+kTy+a2nIFoJViL+RO0PmnZeS5wLogNIhsI6ZFet+U0
         C8T94GZQOS4cgMpAQ/aUOb3LZ60rTrnwBD5ubj9FE0ZndFOgELM3lw+FnioxXNUR4AQ+
         488KaZljXNL/XiQS5gYiEm0PU0eHrYUhAKlOqzRwv3okyPruZVB2DZ+Lir3uMZzQZsVS
         wHKseAUYgWvgZMZGpkz1L8lJaO7EacPEQpJalDbuLKRQ1PChklT8VmBA/0FBQJBHuiXV
         /WOB/wtEw95TcmXnjM8ZZxYeYLPJpp7cN+1amGmo8MihmpH8MaHIkQ64lfha4BkRt9Ma
         6Bfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rw40Y7pRi4fTQvKbY/v46MITEUGL/XAU6ul7eCZwlVo=;
        b=gKtPbzLnFBXMPzfTBPSen+5VeDpXWrB9ycfAvVb7GTGKYXfpUvcXrtvcD/NgF3pSSs
         czKg8q92SglH3bspWfmuk+qnEWXPF/BGRlO1CIAYda1kVjloG09ddOZLDJH4r7U06No7
         4KAqgdRDvvfOX8spefkQ4F9i4vrdd3VvWdteqRNaa6UDtSSOuBxjlBASwpl1Tk+pYf1H
         jKLO8oOl2IZAfmgLRhnFsv9BbzOwKvT5AvBFIKsWs0NKS4/RywB9ugQcT3vQ4KdQbxco
         2dRxmuzUR1CTK4jmteqDMndb16iU+nEU07oRrbLFCSQHxH+uNYqBbiqhVpXxslKTpJi5
         DUog==
X-Gm-Message-State: APjAAAX0QA9cq7+MTPJPiVLC0Hr1eYxY6RjPzQA0Mej/bkGk50rwueTh
        o7dB18gO8EFcRKfiBcHWtJZLMeWm
X-Google-Smtp-Source: APXvYqwtsuKuPXZsa6pO5sz5LSSNVN+NQpd7xgf5wX3/YM8FzUSQ7oSB8pkq6qaUhvZnucZLxfiB+A==
X-Received: by 2002:a17:90a:a407:: with SMTP id y7mr6561565pjp.124.1571344961518;
        Thu, 17 Oct 2019 13:42:41 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id b3sm4626365pfd.125.2019.10.17.13.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 13:42:40 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
Subject: [PATCH 15/22] Input: rb532_button - switch to using managed resources
Date:   Thu, 17 Oct 2019 13:42:09 -0700
Message-Id: <20191017204217.106453-16-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
In-Reply-To: <20191017204217.106453-1-dmitry.torokhov@gmail.com>
References: <20191017204217.106453-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Using devm API allows us to clean up error handling paths and drop the
remove() method.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

 drivers/input/misc/rb532_button.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/input/misc/rb532_button.c b/drivers/input/misc/rb532_button.c
index 4412055f8761..3c43024f4527 100644
--- a/drivers/input/misc/rb532_button.c
+++ b/drivers/input/misc/rb532_button.c
@@ -58,7 +58,7 @@ static int rb532_button_probe(struct platform_device *pdev)
 	struct input_polled_dev *poll_dev;
 	int error;
 
-	poll_dev = input_allocate_polled_device();
+	poll_dev = devm_input_allocate_polled_device(&pdev->dev);
 	if (!poll_dev)
 		return -ENOMEM;
 
@@ -68,34 +68,18 @@ static int rb532_button_probe(struct platform_device *pdev)
 	poll_dev->input->name = "rb532 button";
 	poll_dev->input->phys = "rb532/button0";
 	poll_dev->input->id.bustype = BUS_HOST;
-	poll_dev->input->dev.parent = &pdev->dev;
-
-	dev_set_drvdata(&pdev->dev, poll_dev);
 
 	input_set_capability(poll_dev->input, EV_KEY, RB532_BTN_KSYM);
 
 	error = input_register_polled_device(poll_dev);
-	if (error) {
-		input_free_polled_device(poll_dev);
+	if (error)
 		return error;
-	}
-
-	return 0;
-}
-
-static int rb532_button_remove(struct platform_device *pdev)
-{
-	struct input_polled_dev *poll_dev = dev_get_drvdata(&pdev->dev);
-
-	input_unregister_polled_device(poll_dev);
-	input_free_polled_device(poll_dev);
 
 	return 0;
 }
 
 static struct platform_driver rb532_button_driver = {
 	.probe = rb532_button_probe,
-	.remove = rb532_button_remove,
 	.driver = {
 		.name = DRV_NAME,
 	},
-- 
2.23.0.866.gb869b98d4c-goog

