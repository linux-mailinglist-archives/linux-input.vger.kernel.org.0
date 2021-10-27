Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E8A143D0B8
	for <lists+linux-input@lfdr.de>; Wed, 27 Oct 2021 20:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243547AbhJ0S2G (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Oct 2021 14:28:06 -0400
Received: from box.trvn.ru ([194.87.146.52]:33939 "EHLO box.trvn.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243548AbhJ0S2F (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Oct 2021 14:28:05 -0400
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by box.trvn.ru (Postfix) with ESMTPSA id 2230C4047A;
        Wed, 27 Oct 2021 23:15:24 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
        t=1635358524; bh=8ur6ICJjhsS/B9AMUYVjZwUeQ8Fruu3EV0crM9k9t8g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RdM13EQS5ZdPyrCODJuOwTm1+Yjlly7H3j12t7/K6vo6zTyyY5rE4MniUZsZJ7c3b
         q3RGTxHp4thKHxqlvyjgkw65BJ6z83lQq7cOliBOosAIDzKRR/0uAlUOjX5nwHgj5p
         Aih+RRy3xCM25KoVH+2/QytGyVcXxrdD6u+wFNhpVAaPxr4ZlY8aXESogVORkR7U5W
         At6E0FQGiRBb0QdMDN1APu6LX6fJ0O+m21gmVfhf60X6DGUJup1GRWYOT379QffFx7
         C7/kMiS3S/v0yg6gajNQ97BtFrCL+X2mOxPT8FqEhtkl//BUtoMDQxsyHOuLXz8xcl
         G9W9sZO4Y8ZOQ==
From:   Nikita Travkin <nikita@trvn.ru>
To:     dmitry.torokhov@gmail.com
Cc:     robh+dt@kernel.org, Michael.Srba@seznam.cz,
        linus.walleij@linaro.org, broonie@kernel.org,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Nikita Travkin <nikita@trvn.ru>
Subject: [PATCH 1/6] input: touchscreen: zinitix: Make sure the IRQ is allocated before it gets enabled
Date:   Wed, 27 Oct 2021 23:13:45 +0500
Message-Id: <20211027181350.91630-2-nikita@trvn.ru>
In-Reply-To: <20211027181350.91630-1-nikita@trvn.ru>
References: <20211027181350.91630-1-nikita@trvn.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Since irq request is the last thing in the driver probe, it happens
later than the input device registration. This means that there is a
small time window where if the open method is called the driver will
attempt to enable not yet available irq.

Fix that by moving the irq request before the input device registration.

Fixes: 26822652c85e ("Input: add zinitix touchscreen driver")
Signed-off-by: Nikita Travkin <nikita@trvn.ru>
---
 drivers/input/touchscreen/zinitix.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
index b8d901099378..1e70b8d2a8d7 100644
--- a/drivers/input/touchscreen/zinitix.c
+++ b/drivers/input/touchscreen/zinitix.c
@@ -488,6 +488,15 @@ static int zinitix_ts_probe(struct i2c_client *client)
 		return error;
 	}
 
+	error = devm_request_threaded_irq(&client->dev, client->irq,
+					  NULL, zinitix_ts_irq_handler,
+					  IRQF_ONESHOT | IRQF_NO_AUTOEN,
+					  client->name, bt541);
+	if (error) {
+		dev_err(&client->dev, "Failed to request IRQ: %d\n", error);
+		return error;
+	}
+
 	error = zinitix_init_input_dev(bt541);
 	if (error) {
 		dev_err(&client->dev,
@@ -513,15 +522,6 @@ static int zinitix_ts_probe(struct i2c_client *client)
 		return -EINVAL;
 	}
 
-	error = devm_request_threaded_irq(&client->dev, client->irq,
-					  NULL, zinitix_ts_irq_handler,
-					  IRQF_ONESHOT | IRQF_NO_AUTOEN,
-					  client->name, bt541);
-	if (error) {
-		dev_err(&client->dev, "Failed to request IRQ: %d\n", error);
-		return error;
-	}
-
 	return 0;
 }
 
-- 
2.30.2

