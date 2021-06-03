Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A00E3399934
	for <lists+linux-input@lfdr.de>; Thu,  3 Jun 2021 06:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbhFCEjg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Jun 2021 00:39:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbhFCEjg (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 3 Jun 2021 00:39:36 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECDFCC06174A;
        Wed,  2 Jun 2021 21:37:35 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id 27so4182461pgy.3;
        Wed, 02 Jun 2021 21:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CJvO80dxevF+V+lMZl/68xv8hBdr0mxfCcEJ+eTeeJY=;
        b=CQD+vd4lD1BGkwLrBGhuYoAwIkA9y+lLMucLQDXYYJ+cbh9G8DiXZqh+69Dg7mgj3z
         +DiUcaURoXL3pLABHYHKc9I1U5HG9fZaUy5IP5Dw+oNeK9ifZO9SuYY2EMs4iHFRoRja
         nnwfZh22nfkwito3OIrpY7AjVg7yazKu/Fkk4xZCjjkgHyMBkUHkvzzWq9159ptOkmbT
         +xuxDyeKZ4ufFv64zavRbmrx/GfhmP8AYHH5iaAL0bgY0niSio7vI/MtFvpbU368F194
         BBHj/8HXc0LlLqzw6kUnWRLNE2WXVcmH9ErigFCioptV8Ei11Wz8hU51BPVOlZS0qqzu
         NjUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CJvO80dxevF+V+lMZl/68xv8hBdr0mxfCcEJ+eTeeJY=;
        b=Htv/2npLkkLIG0UCtvJQDjHv6+8xFTqY/gADfuW6kK2Oc9YSy8aSi0+MqdnRhBgKpT
         mKBF3048okf5v4cS2lBaPpffXP6djFr0WRPR7iVN6mH0Pe1PzfIGypuwxXBNL4Mv8DBk
         K8LEi5IlHopXT9bey/cdxlUW4IAZtzs3c62TqQ4E7MdT3yvw8R7fUi/odzA/359VJ3VC
         PL8Ig8SACKZv+jRtkz5KZgz9YUIUmMKVQOa3it9GrlHAQr4QGJHQKKYO4RVlkvoJzI3e
         dvteS8a9dwF9/QIe6LzGKSFFzWEB4vFa8BzRwD0PqkZqS9miri4Hnx1SiyoHLCdswnhG
         gRTA==
X-Gm-Message-State: AOAM531oMrIVoLEVwwXTzjoRAcL0qN0TuT5U2qZEmXsOtFQoJI6ALZbF
        G19dcAy8B1H0uxuXJfXJT5ALjIL+bUw=
X-Google-Smtp-Source: ABdhPJwdfuMI4uJCwI/uX6HJR2P3I9ZA/XJstWxIOnJdtFZrCB0XHvL5dQGCRl73nRE0cqrUtI/qHg==
X-Received: by 2002:a62:1d0f:0:b029:2d5:3ec2:feb8 with SMTP id d15-20020a621d0f0000b02902d53ec2feb8mr31091467pfd.19.1622695054800;
        Wed, 02 Jun 2021 21:37:34 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:fc6a:97ca:f00c:8377])
        by smtp.gmail.com with ESMTPSA id f28sm1132414pgb.12.2021.06.02.21.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 21:37:34 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] Input: cy8ctmg110_ts - let I2C core configure wake interrupt
Date:   Wed,  2 Jun 2021 21:37:23 -0700
Message-Id: <20210603043726.3793876-4-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.32.0.rc0.204.g9fa02ecfa5-goog
In-Reply-To: <20210603043726.3793876-1-dmitry.torokhov@gmail.com>
References: <20210603043726.3793876-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I2C core already configures interrupt as wakeup source when device is
registered using I2C_CLIENT_WAKE flag, so let's rely on it instead of
configuring it ourselves.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/cy8ctmg110_ts.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/cy8ctmg110_ts.c b/drivers/input/touchscreen/cy8ctmg110_ts.c
index d83bf82f02d4..f8d7ab3b6c25 100644
--- a/drivers/input/touchscreen/cy8ctmg110_ts.c
+++ b/drivers/input/touchscreen/cy8ctmg110_ts.c
@@ -254,12 +254,11 @@ static int __maybe_unused cy8ctmg110_suspend(struct device *dev)
 	struct i2c_client *client = to_i2c_client(dev);
 	struct cy8ctmg110 *ts = i2c_get_clientdata(client);
 
-	if (device_may_wakeup(&client->dev))
-		enable_irq_wake(client->irq);
-	else {
+	if (!device_may_wakeup(&client->dev)) {
 		cy8ctmg110_set_sleepmode(ts, true);
 		cy8ctmg110_power(ts, false);
 	}
+
 	return 0;
 }
 
@@ -268,12 +267,11 @@ static int __maybe_unused cy8ctmg110_resume(struct device *dev)
 	struct i2c_client *client = to_i2c_client(dev);
 	struct cy8ctmg110 *ts = i2c_get_clientdata(client);
 
-	if (device_may_wakeup(&client->dev))
-		disable_irq_wake(client->irq);
-	else {
+	if (!device_may_wakeup(&client->dev)) {
 		cy8ctmg110_power(ts, true);
 		cy8ctmg110_set_sleepmode(ts, false);
 	}
+
 	return 0;
 }
 
-- 
2.32.0.rc0.204.g9fa02ecfa5-goog

