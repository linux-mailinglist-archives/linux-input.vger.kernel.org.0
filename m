Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 309EA358447
	for <lists+linux-input@lfdr.de>; Thu,  8 Apr 2021 15:12:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231295AbhDHNMl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Apr 2021 09:12:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229741AbhDHNMj (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Apr 2021 09:12:39 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19184C061760
        for <linux-input@vger.kernel.org>; Thu,  8 Apr 2021 06:12:28 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id r20so2204195ljk.4
        for <linux-input@vger.kernel.org>; Thu, 08 Apr 2021 06:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gWnMMOyBwTpMyNgPfLl+lFBRxHprbgaokPK7N7UcYDg=;
        b=VZY4iqsxyv24QnKqvm0O7bzEesG1GFM8yHhOnP5g9JaQWJQUp9n1F8SaGukTh2jfYX
         APhljNM9obpYmmyGMhaV1m7+6UdCzNBzeAG8DjpiA1dSneMgN8A9jL3SvnJstMhWA6c6
         eSazsC8Ion40BL+him4SaygJ9PajPhKwZFRSnR4Bmj/lXm5HH3l8b41wn136BEPNwpRn
         AbHDzuuQQ5p6UBKJ9dH0dNr1kz9bhMKy42Eg8lulMpU+7nSyfSHUJ44uWpZhz7ZDy6XW
         Ecpi7wkulub79bfirlFA4uX/pgYNXsVWqUAYoFxkB7wqh+q7OxzC6eMFauMsKi43FkOe
         mgCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gWnMMOyBwTpMyNgPfLl+lFBRxHprbgaokPK7N7UcYDg=;
        b=pvmZxz8L45aS36V8vnnXjH5cMQmVTKg2yFjd+/kRfEUmbkFnUhF5+ZWFSQK4ukrxDV
         qHCARWXGsojiMrO5M9HWvyqg5FnGJfbLGq9uHJVZvSa7eMD7alahB36skxzYgGY6AiJo
         vZY2hPwup19f1sU7MtCANI84N9Q9CF/ORogcS6ihtIZxqCfTJmxdjYjlwVHQyM0VxQmH
         a+a5wp0v333uu8xM0zuCf4rFfIx7TWev0aEgkOeaShWtDHAvlef4Ycb2yVBrkGP//q4R
         OqRCG3o5zm4XeSc36/74b2ZV2DRNJZHEvaTUx+L+q/DZee5b8R90ZZjlKFe2JKOZ1yvT
         HuZQ==
X-Gm-Message-State: AOAM530gZE1gczAxFrObN3LIOCP+Uxf6/dmE1D6x1nWbeYj76jup5tri
        8m294f8Omb1+G5fphnigRLrAPRBEJfnXqgye
X-Google-Smtp-Source: ABdhPJzeS8xewYBLq3ybg9r0CJQ3SnPlPUvUarKhZtQPzr7sFVjcSw6U3a2g6d2ZePZECZLePWZDzA==
X-Received: by 2002:a2e:8508:: with SMTP id j8mr5632482lji.270.1617887545448;
        Thu, 08 Apr 2021 06:12:25 -0700 (PDT)
Received: from localhost.localdomain (c-14cb225c.014-348-6c756e10.bbcust.telenor.se. [92.34.203.20])
        by smtp.gmail.com with ESMTPSA id z7sm126936ljm.102.2021.04.08.06.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 06:12:25 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Ferruh Yigit <fery@cypress.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Javier Martinez Canillas <javier@dowhile0.org>
Cc:     Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 6/8 v3] Input: cyttsp - Drop the phys path
Date:   Thu,  8 Apr 2021 15:11:51 +0200
Message-Id: <20210408131153.3446138-7-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210408131153.3446138-1-linus.walleij@linaro.org>
References: <20210408131153.3446138-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

When I test to use the CY8CTMA340 with PostmarketOS I don't
have any problem whatsoever in dropping this phys path,
it finds and uses the touchscreen just as well. I suppose
it is because userspace is using modern input libraries.

I challenge the maintainers to point out a valid and still
used userspace that actually need this. I say we drop it.

Reviewed-by: Javier Martinez Canillas <javier@dowhile0.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v3:
- Collect Javier's Reviewed-by
---
 drivers/input/touchscreen/cyttsp_core.c | 2 --
 drivers/input/touchscreen/cyttsp_core.h | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/input/touchscreen/cyttsp_core.c b/drivers/input/touchscreen/cyttsp_core.c
index 84f4f1c1a220..8ae9f00e5e31 100644
--- a/drivers/input/touchscreen/cyttsp_core.c
+++ b/drivers/input/touchscreen/cyttsp_core.c
@@ -655,10 +655,8 @@ struct cyttsp *cyttsp_probe(const struct cyttsp_bus_ops *bus_ops,
 		return ERR_PTR(error);
 
 	init_completion(&ts->bl_ready);
-	snprintf(ts->phys, sizeof(ts->phys), "%s/input0", dev_name(dev));
 
 	input_dev->name = "Cypress TTSP TouchScreen";
-	input_dev->phys = ts->phys;
 	input_dev->id.bustype = bus_ops->bustype;
 	input_dev->dev.parent = ts->dev;
 
diff --git a/drivers/input/touchscreen/cyttsp_core.h b/drivers/input/touchscreen/cyttsp_core.h
index c102a094e888..8eba9d8ba74a 100644
--- a/drivers/input/touchscreen/cyttsp_core.h
+++ b/drivers/input/touchscreen/cyttsp_core.h
@@ -115,7 +115,6 @@ struct cyttsp {
 	struct device *dev;
 	int irq;
 	struct input_dev *input;
-	char phys[32];
 	const struct cyttsp_bus_ops *bus_ops;
 	struct cyttsp_bootloader_data bl_data;
 	struct cyttsp_sysinfo_data sysinfo_data;
-- 
2.29.2

