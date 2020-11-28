Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D5032C7227
	for <lists+linux-input@lfdr.de>; Sat, 28 Nov 2020 23:06:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387849AbgK1VuZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 28 Nov 2020 16:50:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730118AbgK1Sh7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 28 Nov 2020 13:37:59 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9975C02A18E
        for <linux-input@vger.kernel.org>; Sat, 28 Nov 2020 04:37:26 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id d20so10907887lfe.11
        for <linux-input@vger.kernel.org>; Sat, 28 Nov 2020 04:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e4VRle5XYJGMSXH05W51yvLETuLs3J9IHLNDYKySqxc=;
        b=HEcSZCUpbimBKnJL9fn5HiDpNtUOkNUHYcYl48Q9ZBfPef2Kvub5oaTkNffhD1YYn7
         LzqSRnydWU1gItOpT2jPXWRYGgN6xZJvM6P82x7l3XR3ce5KYy5MfIKwdTfx+Yl3AcG/
         M7AM/EyW4XoqnUpg4fHJpAUmZHx04uMjkitq4QhrKkWe1gyacQvlOBieWC8DaOX+mWVj
         srEJSA7PD5Qx58De2YFTEkoqhzAcDx0D9sOYKe8YEtxtify0mzVhg4EmDKlI+uul2Dvk
         B/LPewOPbouMrnDMkiiLGcYGF22Ztl6eWnShj08OpQEMrX/rjYjdbtwaXLv8rZSEYAsS
         0PVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e4VRle5XYJGMSXH05W51yvLETuLs3J9IHLNDYKySqxc=;
        b=e5qXM4IGA/ehNP7v+6EzrPxKE/GjmIhTXpxVb2BKA0mFrHm24EZ3Vyju2l7tPIk2DB
         ndZSCkZvJNnNtcuJyucDuKiq2py4RLmPuVz+8q29nt8xOJldH2JpbRPKQCvOrXumDExZ
         TkQvQcUS5i/zfeIM3kmZ7ZcxiQzkj5ISENtvMFJIXE8byEFKsAtXZmnl/RRgUEoWuOjN
         n56QqpXde0ooimlb6asFItDN7N6oXYv1L9F7djPgtfq/IHkug3MV08QtUOpzMsNpKyuI
         1MTAuOuoZ7G//TVqZ2cI3rDFuR6AlCC1ev/MRZgvD1i39IJvTZkba+SS2YBwBAjRIern
         VsyA==
X-Gm-Message-State: AOAM530AmYQKyn35yaWCNZX+pE6lg2Fc05IzwvrzZVpM5NCAQrblGt4M
        rsd4Qe06BnZhUZ7QXlgoLOg7MQ==
X-Google-Smtp-Source: ABdhPJzMzZuL3ggPZ12LGo8Ys/UFdF1C1kph2R9aP2Gg5nJXFTmn5HnT4Lh3Hm/nZl/5yDqH5SexIQ==
X-Received: by 2002:ac2:5939:: with SMTP id v25mr5385426lfi.490.1606567045318;
        Sat, 28 Nov 2020 04:37:25 -0800 (PST)
Received: from localhost.bredbandsbolaget (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id f24sm1364239ljc.54.2020.11.28.04.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2020 04:37:24 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andre <andre.muller@web.de>, Nick Dyer <nick.dyer@itdev.co.uk>,
        Jiada Wang <jiada_wang@mentor.com>, stable@vger.kernel.org
Subject: [PATCH] Input: atmel_mxt_ts - Fix lost interrupts
Date:   Sat, 28 Nov 2020 13:37:20 +0100
Message-Id: <20201128123720.929948-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

After commit 74d905d2d38a devices requiring the workaround
for edge triggered interrupts stopped working.

This is because the "data" state container defaults to
*not* using the workaround, but the workaround gets used
*before* the check of whether it is needed or not. This
semantic is not obvious from just looking on the patch,
but related to the program flow.

The hardware needs the quirk to be used before even
proceeding to check if the quirk is needed.

This patch makes the quirk be used until we determine
it is *not* needed.

Cc: Andre <andre.muller@web.de>
Cc: Nick Dyer <nick.dyer@itdev.co.uk>
Cc: Jiada Wang <jiada_wang@mentor.com>
Cc: stable@vger.kernel.org
Fixes: 74d905d2d38a ("Input: atmel_mxt_ts - only read messages in mxt_acquire_irq() when necessary")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index e34984388791..f25b2f6038a7 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -1297,8 +1297,6 @@ static int mxt_check_retrigen(struct mxt_data *data)
 	int val;
 	struct irq_data *irqd;
 
-	data->use_retrigen_workaround = false;
-
 	irqd = irq_get_irq_data(data->irq);
 	if (!irqd)
 		return -EINVAL;
@@ -1313,8 +1311,10 @@ static int mxt_check_retrigen(struct mxt_data *data)
 		if (error)
 			return error;
 
-		if (val & MXT_COMMS_RETRIGEN)
+		if (val & MXT_COMMS_RETRIGEN) {
+			data->use_retrigen_workaround = false;
 			return 0;
+		}
 	}
 
 	dev_warn(&client->dev, "Enabling RETRIGEN workaround\n");
@@ -3117,6 +3117,7 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	data = devm_kzalloc(&client->dev, sizeof(struct mxt_data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
+	data->use_retrigen_workaround = true;
 
 	snprintf(data->phys, sizeof(data->phys), "i2c-%u-%04x/input0",
 		 client->adapter->nr, client->addr);
-- 
2.26.2

