Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A504F399932
	for <lists+linux-input@lfdr.de>; Thu,  3 Jun 2021 06:37:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbhFCEjf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Jun 2021 00:39:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbhFCEje (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 3 Jun 2021 00:39:34 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BED0C06175F;
        Wed,  2 Jun 2021 21:37:37 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id v12so2233966plo.10;
        Wed, 02 Jun 2021 21:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Lml8gDdVcBir/4+S7RISpcXFgqdlzoZ+ng9XmF/Tb4M=;
        b=cnsSp0vY49gsZ5hEcOCaS8jac47v0uDYaa3BCIAqIpdH4PFYan0Wsk9EW/lz50Ns0H
         qgQ6qoidT/NZl+UlwxuSDPz+/7x0paHb0apwJSlWlkDEJ/csV4gxsawscKo6WEtf8+aB
         IoTZ0HrclAkVKj7hND+GxE1Ltm2YotmQHTioeZlZDJ4rw0dtFZjAXtzVVq4W7x3xZD5U
         M7K1B9BgM7fc3/yS+92nmEBRc4DH2DvI/FPZyFwK6L8AkNComrFUa+Yu7nt0d/HGVsc4
         b6s3tHuaynKI5lhWnswn+9s3MAPHDLFlLGWU80UnItZvYKHZqOsfMK0NjjaLNUKpplmY
         8KBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Lml8gDdVcBir/4+S7RISpcXFgqdlzoZ+ng9XmF/Tb4M=;
        b=tKTsM4RKdT/LC1+635c597TA34rO3LDfnLHkwsOXPT9xwjdQDS98hfWC2zI/68K8CV
         IGwXtN0mHDfw4pCVetg8RPbuZ/0K/a1CYq/uGNLgyMN/lseY2WvkmnfE2BLM3VYtuk0K
         qHHXPlUsOQwNGVvmaamGj/aD/PGoDrolqopFQjLoU8UDPi64HAmulU4j/KeX5jZdBXjx
         x2DFx3OmuYo7fD6RyOt0kGgaR5VVzqSVHLWMX1a8CzOQoaOaOrb5048phPgNurQGYWfl
         b+BQ4bM5rAzM55AwmyniYwRA0U8jllG+hJtx79DIen9MYmxldF9/Z/cb65EKmbN3v3QZ
         nK7A==
X-Gm-Message-State: AOAM530XaXCCg9g5jI9EmSPy1BIIT/r2dxkGg3oiYz8uiahmzXvlsPD7
        AJw36mwHPv2FDYpPN9zac8QPHkroJM8=
X-Google-Smtp-Source: ABdhPJyM5PV+paY5MQb2INGlLRS4HQZ12puPJ5TGk9cgavjmWvgx4UVckaR9FXy8OjeJ1ORtQPgQcg==
X-Received: by 2002:a17:90a:bf15:: with SMTP id c21mr11851279pjs.206.1622695053301;
        Wed, 02 Jun 2021 21:37:33 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:fc6a:97ca:f00c:8377])
        by smtp.gmail.com with ESMTPSA id f28sm1132414pgb.12.2021.06.02.21.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 21:37:32 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] Input: cy8ctmg110_ts - do not hardcode as wakeup source
Date:   Wed,  2 Jun 2021 21:37:22 -0700
Message-Id: <20210603043726.3793876-3-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.32.0.rc0.204.g9fa02ecfa5-goog
In-Reply-To: <20210603043726.3793876-1-dmitry.torokhov@gmail.com>
References: <20210603043726.3793876-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Let platform specify whether the controller should be a wakeup source
by registering as I2C_CLIENT_WAKE.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/cy8ctmg110_ts.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/cy8ctmg110_ts.c b/drivers/input/touchscreen/cy8ctmg110_ts.c
index d83257284537..d83bf82f02d4 100644
--- a/drivers/input/touchscreen/cy8ctmg110_ts.c
+++ b/drivers/input/touchscreen/cy8ctmg110_ts.c
@@ -233,7 +233,7 @@ static int cy8ctmg110_probe(struct i2c_client *client,
 		goto err_free_irq;
 
 	i2c_set_clientdata(client, ts);
-	device_init_wakeup(&client->dev, 1);
+
 	return 0;
 
 err_free_irq:
-- 
2.32.0.rc0.204.g9fa02ecfa5-goog

