Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 669BA2B036D
	for <lists+linux-input@lfdr.de>; Thu, 12 Nov 2020 12:05:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727803AbgKLLFO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Nov 2020 06:05:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727909AbgKLLCV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Nov 2020 06:02:21 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13962C0617A7
        for <linux-input@vger.kernel.org>; Thu, 12 Nov 2020 03:02:21 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id b6so5535230wrt.4
        for <linux-input@vger.kernel.org>; Thu, 12 Nov 2020 03:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iYWVqLY7S/76cWfEGdUmj7rrU+UasLzWnb4c5U8gOxE=;
        b=FgtdmpwRrYsOn8FUB6Hpe4ElccdLfhBVC2lRp8Urqj16+B+T7tXk0ftLggcVea+k/9
         kVtlIgJ6EmASjM5YMA9fShkGvjbb02+DqpQzJI9cKIsHwyhJ+OzMZg9A6GQmMwaw/s5l
         6Y/n8AlPUlcwj8qkQXt3v2yIGNzRyfaDvTFTvJHCh5/EUjyaVRt16voCY1nEEVrLtHnu
         fs09xCf/l9CPRADbvxCSJv0Oc06iM88odOaY9rvrDzGMP3NV6BFkf2Rr23JswoIttinf
         ynccuJ7ur86ricWzBi2VmX9vehCGi7N8QVIxGHzJzOn6o2MtA9ZMQb9qwl4lAgCljwyL
         MDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iYWVqLY7S/76cWfEGdUmj7rrU+UasLzWnb4c5U8gOxE=;
        b=uDWjIt/eas69KusQx8g7Qpr/gm6aN9zIHoc8Ta12GV4rNTUI0Y8/5xCUxNw0745sBh
         je6TBfQJAV1V0ffbyaUP5MGyLexqSLCutrzzh4oQmDgfUB2jAyyQ3ZSlbLazgOaF6sy4
         O4izmza2hwdbLCb/20WxOVi2QDEFnoRGBr+PqrQBkxvBhBol+EoWTdeQKACaAf+LxWBW
         8s7k19R3bGgNTl96V/fYET4VnI/14fn+6CrKXsQwHsuiXBifNl00O08eL0/e+FjXKrij
         0AH5wEjskvWXQzOuA28ZH+pNkuc7n9NanlwN+LGQjR5K8ybEBZGXeHol3bicpoQsxm9X
         eUcQ==
X-Gm-Message-State: AOAM530i2pjNh1i4L/fMeHFQZsY2CB06WcuSbwN/p1Mgvm149lr1yE/s
        +gFjyQw5oqOg00usTo41pJWeyA==
X-Google-Smtp-Source: ABdhPJzsfgHXHWLswyYB1RNmQMzrGY50nkRCRdx70M8c5gZjLUnS+JHYkd6dWaToI58kESLJp+ye3g==
X-Received: by 2002:adf:8063:: with SMTP id 90mr21087244wrk.148.1605178939843;
        Thu, 12 Nov 2020 03:02:19 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id x81sm6515329wmg.5.2020.11.12.03.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 03:02:19 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Brown <broonie@opensource.wolfsonmicro.com>,
        patches@opensource.cirrus.com, linux-input@vger.kernel.org
Subject: [PATCH 09/15] input: misc: wm831x-on: Source file headers are not good candidates for kernel-doc
Date:   Thu, 12 Nov 2020 11:01:58 +0000
Message-Id: <20201112110204.2083435-10-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112110204.2083435-1-lee.jones@linaro.org>
References: <20201112110204.2083435-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/input/misc/wm831x-on.c:30: warning: cannot understand function prototype: 'struct wm831x_on '

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: patches@opensource.cirrus.com
Cc: linux-input@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/input/misc/wm831x-on.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/misc/wm831x-on.c b/drivers/input/misc/wm831x-on.c
index 1b44de265a0ad..a42fe041b73c6 100644
--- a/drivers/input/misc/wm831x-on.c
+++ b/drivers/input/misc/wm831x-on.c
@@ -1,4 +1,4 @@
-/**
+/*
  * wm831x-on.c - WM831X ON pin driver
  *
  * Copyright (C) 2009 Wolfson Microelectronics plc
-- 
2.25.1

