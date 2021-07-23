Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 623B63D40FA
	for <lists+linux-input@lfdr.de>; Fri, 23 Jul 2021 21:39:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbhGWS6e (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Jul 2021 14:58:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbhGWS6e (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Jul 2021 14:58:34 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0D2FC061575;
        Fri, 23 Jul 2021 12:39:06 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id a20so4469048plm.0;
        Fri, 23 Jul 2021 12:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=O07PofvR6wtYaFYmZwu709/uHQuZ+IXZRe89ZgE8wvI=;
        b=gYa6UGgHkK9IfA2M24dRu56uTGIC6QhmTUcIoEtE+4lTaa/dvK/NvIaE+yPovqUeWE
         fEswFlLpNRdFZATn9kCB5xhGI4VY/EDx5Pzc3SqSFbEIy81RunLggK5O7+aT5jBNmCnJ
         AMOWcKdp2YvXeUTkvA8RAtuSV+GIu0Ga1OUrZme7bcHmlzq6mKbYEb0lI33uEsnGpL5I
         MVkrYm1jqBEkdjiqTZ4qQvgrcTwRoGokoYmqyT/2xbdtsIGfJ4OBdUMcG9RDF9nx9qMv
         cAfHpw3LRAx1qDTkg/Yo3YiMJB3Anu1qao9mL8u5nEevIOyQ4mUlrNXvIfX2z6zNIIjC
         hveg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=O07PofvR6wtYaFYmZwu709/uHQuZ+IXZRe89ZgE8wvI=;
        b=podlusQ4Ubj+rMBPA0gjVAjgJw0HBSY/JW/GA5RjUH5K/SxwYG8jcRyYWIg2LDri3I
         05a6PDGpsSu8VwHRbB0T1L+LHi1sjBrJzyNUPG5Ws36a+gsQhK1ryOgohCVgxnsP6H7r
         m91ikdCRtMTgOLZOef3H73aRZT7QcOmF2VyVf1AhfOOAadlalgOadj7SGDyAKeCWdy1w
         9QFLkSGduOqwPjiwXpj245EyShKCDUPDhIJ3p7Yu5cYlV5EfTucYQT1EOl+mZj+R+w52
         dmsrafPUkylHmsZw4VHL1Cwy7pDLLcZJiBTbA3dlPMqBWe5FHO5Ssm0LLZwbIk1WQNIB
         HDow==
X-Gm-Message-State: AOAM530zQyoYMp96jacMn0rL/XEUz6tSM6eiloEhZjzmn/bLyTRGutOW
        SPbZ/hPQ0GC+g29iJYPsABouftD3ON8=
X-Google-Smtp-Source: ABdhPJzmMRQ5q99h3FuptuoSbN5dBTjPGKya8Oz3KXekh2m6ASBd9cdHW1D2VOc3gsvRG65Da+dirg==
X-Received: by 2002:a63:d311:: with SMTP id b17mr6209279pgg.332.1627069145721;
        Fri, 23 Jul 2021 12:39:05 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:55b1:90d5:6a79:755f])
        by smtp.gmail.com with ESMTPSA id j6sm38941894pgq.0.2021.07.23.12.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 12:39:04 -0700 (PDT)
Date:   Fri, 23 Jul 2021 12:39:02 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Collins <collinsd@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        satya priya <skakit@codeaurora.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Input: pm8941-pwrkey - fix comma vs semicolon issue
Message-ID: <YPsa1qCBn/SAmE5x@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

There is absolutely no reason to use comma operator in this code, 2
separate statements make much more sense.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/misc/pm8941-pwrkey.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/misc/pm8941-pwrkey.c b/drivers/input/misc/pm8941-pwrkey.c
index 10e3fc0eac6e..33609603245d 100644
--- a/drivers/input/misc/pm8941-pwrkey.c
+++ b/drivers/input/misc/pm8941-pwrkey.c
@@ -284,7 +284,7 @@ static int pm8941_pwrkey_probe(struct platform_device *pdev)
 	}
 
 	if (pwrkey->data->supports_ps_hold_poff_config) {
-		pwrkey->reboot_notifier.notifier_call = pm8941_reboot_notify,
+		pwrkey->reboot_notifier.notifier_call = pm8941_reboot_notify;
 		error = register_reboot_notifier(&pwrkey->reboot_notifier);
 		if (error) {
 			dev_err(&pdev->dev, "failed to register reboot notifier: %d\n",
-- 
2.32.0.432.gabb21c7263-goog


-- 
Dmitry
