Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC82A34E38F
	for <lists+linux-input@lfdr.de>; Tue, 30 Mar 2021 10:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231124AbhC3Iyu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Mar 2021 04:54:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231194AbhC3Iyg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Mar 2021 04:54:36 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93374C061764
        for <linux-input@vger.kernel.org>; Tue, 30 Mar 2021 01:54:35 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id b4so22621652lfi.6
        for <linux-input@vger.kernel.org>; Tue, 30 Mar 2021 01:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zjK96CKPYhWJsRojqqw/3kO0UdS2THfbIH/lD9qwZRI=;
        b=y3UM4XVZ+jolBdJ/j2UQym3ri6kZusUPIXy9i/t2h7HkTqDKc8B0EH6ho6JZFnNqdY
         2anbTQKIuOfI+OokvQEwlK1M561LxC3ZY5Q138ixoagINf27ZM1p4hk/GKCsVafEPrA/
         snqKm8xpDjN5Levl/VI6UIZpH1JwmufJfBp8ZQ8beTP0plHsT+lB/CDusgwYMR596sOa
         BDYmfPmsWv6khM1A1Q98QpQ9xR6P1d6ZtXdYnR5ymNxocqlUOgLD1BFh4WM9HEf64k19
         whEZdFQ4aoQ1J5ueZ/onoAH8XtuGNkbfbJVos0ufAa+/SNge2TijYNMwW/5ros+tOfE/
         uB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zjK96CKPYhWJsRojqqw/3kO0UdS2THfbIH/lD9qwZRI=;
        b=ZqemHoZQa6IIGG/CYi13zKjFYvikZE12r7aB8kL62lWfPuW+MnhieotGpzkpAYqjbz
         VgEFueHrORWTamndIDK3PmtDi+qqVTght8ljIMFpt2N572zxNSMcYdrs6rwUcup4f2Vn
         Y5H1BCXkQFYS4J4+AtAoOPgjBL1rGZTMzkOGZgjw0WYTFQsuQm+dfwbQ+6CKl3oEMQ8z
         +xubSgsAa4bBMgxAnCEba5kY+N1MVVTrmhBYNFdFKVcl+jKk939ax9W3eXYZM7FDALdh
         8GizUrLq96XrdGXyYpT8oLVYe/15gZdqSWfsDvJRAgufxZ7pUCp7ocy19bryva03FFQF
         0WdQ==
X-Gm-Message-State: AOAM531Q+yLqD+dytuJtm7PebDxiOJiJQJPtGUxX1iY7Tx+hKvYLexIN
        0NtqsLgH6xXhBqvNmIEK0qvJbA==
X-Google-Smtp-Source: ABdhPJwn7SaguG9aC/k122h2si0lUK9dsQowlHLj1hPRA4VWzKxMUseXKlu2rkXzzYyP6VdxwdH4Qw==
X-Received: by 2002:a19:7412:: with SMTP id v18mr18359157lfe.234.1617094474159;
        Tue, 30 Mar 2021 01:54:34 -0700 (PDT)
Received: from localhost.localdomain (c-14cb225c.014-348-6c756e10.bbcust.telenor.se. [92.34.203.20])
        by smtp.gmail.com with ESMTPSA id 201sm2104238lfm.108.2021.03.30.01.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 01:54:33 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Ferruh Yigit <fery@cypress.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Javier Martinez Canillas <javier@dowhile0.org>
Cc:     Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 5/7] Input: cyttsp - Drop the phys path
Date:   Tue, 30 Mar 2021 10:54:22 +0200
Message-Id: <20210330085424.2244653-6-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210330085424.2244653-1-linus.walleij@linaro.org>
References: <20210330085424.2244653-1-linus.walleij@linaro.org>
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

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
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

