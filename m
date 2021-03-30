Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9680334E391
	for <lists+linux-input@lfdr.de>; Tue, 30 Mar 2021 10:55:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231269AbhC3Iyw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Mar 2021 04:54:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231313AbhC3Iyp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Mar 2021 04:54:45 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DD9AC061762
        for <linux-input@vger.kernel.org>; Tue, 30 Mar 2021 01:54:33 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id w28so1663735lfn.2
        for <linux-input@vger.kernel.org>; Tue, 30 Mar 2021 01:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xL6erVnxQRl61MXnF85N/4HssiewiDMqKG8DTl4YuT0=;
        b=sJqtEpMbZ/peEhed9U3nZGgfwzRFiyq986U+KtAl3UM0Dni1Aj22f4aBffF0lrBv1V
         BrMxyl6kwKrpEweT8OcsyVcKZs5rxgBJXREnq/F8P/+k3wjgN3JZY/RPcFfWnwZJ/4qT
         5A7V+n0WcER/Moecomig/XBCpSoYYqMJ+JHHJgceawpxXcHM9OEenKxiE0EjrBxCxIFz
         BFVqb1s9/sfQah99Nel3rgIxRYkSVnfEeRDaxJs3xPrPa13p/qT4tGEGrFoC6QeLVjPF
         fROqq0NrsX/qTLeateLqeSbpACaYv+7NWCktiY14clX7bOTHSuYN++vebXfDLjeIQRg0
         ZzMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xL6erVnxQRl61MXnF85N/4HssiewiDMqKG8DTl4YuT0=;
        b=BF8iNKK//Gw9iaWte7F34OYilN6/tG9UWNIbnKxYF60nT8TvPo8pB0enKcLzRQx98c
         qQoIm/mETkkYHjl0WFsd3jeLVHXJnk7uF4T/Vb240t90NAeVoWPVgB1UYBkJtX1znlQq
         xLdpvmiKL7kDsfKZszZ7tTHhHJCas+jsMFVkGSfpdPxaSNeoxfuyxvy/QwdDkqdJVMV7
         wGY7OLLC5UkmoJGwLT1URN+rBBKYyQvG1L2hsUkeTOX/z+q/Q6WzLaI8X7vZpFi5VnIF
         S5yh3kgV7p0EKp6PRUCGEicnOyk147sQBsClBtcfC42RRAqNBpywk0sudp9Fc6wMW6l8
         q/ew==
X-Gm-Message-State: AOAM532U0WY0yU+u/MgoZoHYcoRagJG9tn4HyTSajIJakhDXXVacymur
        z+t3Pct5jUKfFuMSTRbOlBhZmA==
X-Google-Smtp-Source: ABdhPJwhzmbw2j9LiMsjkq3AjDbCRNB/p+csQitEWdgfuA3+edUtVN8OYpy35tGo7Yd/fwFlycNWyw==
X-Received: by 2002:a19:915:: with SMTP id 21mr18514597lfj.270.1617094471072;
        Tue, 30 Mar 2021 01:54:31 -0700 (PDT)
Received: from localhost.localdomain (c-14cb225c.014-348-6c756e10.bbcust.telenor.se. [92.34.203.20])
        by smtp.gmail.com with ESMTPSA id 201sm2104238lfm.108.2021.03.30.01.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 01:54:30 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Ferruh Yigit <fery@cypress.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Javier Martinez Canillas <javier@dowhile0.org>
Cc:     Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/7] Input: cyttsp - Error message on boot mode exit error
Date:   Tue, 30 Mar 2021 10:54:20 +0200
Message-Id: <20210330085424.2244653-4-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210330085424.2244653-1-linus.walleij@linaro.org>
References: <20210330085424.2244653-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Provide a proper error message when attempting to exit
boot loader mode and failing, which is something that
happened to me.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/input/touchscreen/cyttsp_core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/cyttsp_core.c b/drivers/input/touchscreen/cyttsp_core.c
index a19d7cce95ca..91f8f38b3f06 100644
--- a/drivers/input/touchscreen/cyttsp_core.c
+++ b/drivers/input/touchscreen/cyttsp_core.c
@@ -410,8 +410,10 @@ static int cyttsp_power_on(struct cyttsp *ts)
 	if (GET_BOOTLOADERMODE(ts->bl_data.bl_status) &&
 	    IS_VALID_APP(ts->bl_data.bl_status)) {
 		error = cyttsp_exit_bl_mode(ts);
-		if (error)
+		if (error) {
+			dev_err(ts->dev, "failed to exit bootloader mode\n");
 			return error;
+		}
 	}
 
 	if (GET_HSTMODE(ts->bl_data.bl_file) != CY_OPERATE_MODE ||
-- 
2.29.2

