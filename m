Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F45E39231B
	for <lists+linux-input@lfdr.de>; Thu, 27 May 2021 01:15:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233302AbhEZXRI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 May 2021 19:17:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232367AbhEZXRI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 May 2021 19:17:08 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16398C061574
        for <linux-input@vger.kernel.org>; Wed, 26 May 2021 16:15:36 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id f30so5080661lfj.1
        for <linux-input@vger.kernel.org>; Wed, 26 May 2021 16:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0DjTaqYVmw4sFTfSYb46C13BK1sRLGmvwIDf0owRwSk=;
        b=TynxlRzqScTpSMQ7lnK75RqB4QCwli44vGogJISQvqvE2WpcR3mse6HlIPnY5SR7H3
         NrFVcTUWMF4LxwyqVik6lITXkqcFD+40f3xxfevXQAdc8quqdVXCXb389iT5w8DnGjc+
         fB62x8ToPwcivGsHhT9dMEro0+BijzgYRwX/8H4v6dZ+HPQI898S7VxMF+ph40V7NiJv
         KaEKnD9ATFbvGdP+7ZpFT5DhBz7u14bLWxya+J99IYGX7zH075y8riCVdlGGWnoeKxJc
         hHcM0pBW+UAM36igd9DRAgS6ry2EP+EvcoyWq+4qtNrk7jXbmBdWJtGxHc1XzcgULXJz
         uMig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0DjTaqYVmw4sFTfSYb46C13BK1sRLGmvwIDf0owRwSk=;
        b=j5ezo1A8QA5FhrVxtqpyTqKKMbNWxdMVIuwv4sGaUUDZhW1CyCzZUTnTqILN8HEcaK
         xgW7B4aXLQyrkhxPLshOtCY5GR7sY0fWbRiW2n+LtoUVlTKgLkBBgT67fcMnCsPxq5h9
         9TCsLYSMy4b8HpVmYAHh6/fzoT4XH6niENC3oSy+Y1shQ684X+8z8veS/kWQoYQZi3Zv
         rhN4HK35D/AKvzhUrgIhe7L3z+tdOKo/M2hOlsRi56Re6UOZyESja/fEXg3cvIjMVT/u
         8lJZ2OyZV40jfLqsFq7CJoecIjtFMjAm+M7I5Dm19qRdLzBbUrvZlv3nHIs6dAUqie2x
         Cx+w==
X-Gm-Message-State: AOAM531Hb1rMnnAR0pywP/Q0Imkap85EvZj9/zOCrGy8IvfeFM7ABrwu
        PzH0FzoVQ29xoW+dWx+pMZHy0A==
X-Google-Smtp-Source: ABdhPJy9t7tEQt4AuVXnvkjKfiZOct3SxdkpZrgX3V8PFgfAaoGVzTwtCHMxJ7W3cDywisr+EcjMeA==
X-Received: by 2002:a05:6512:33cc:: with SMTP id d12mr324813lfg.42.1622070934436;
        Wed, 26 May 2021 16:15:34 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id w21sm35415lfl.117.2021.05.26.16.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 16:15:34 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Ferruh Yigit <fery@cypress.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Javier Martinez Canillas <javier@dowhile0.org>
Cc:     Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/3 v6] Input: cyttsp - Obtain regulators
Date:   Thu, 27 May 2021 01:03:52 +0200
Message-Id: <20210526230352.1433537-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526230352.1433537-1-linus.walleij@linaro.org>
References: <20210526230352.1433537-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The CYTTSP TMA340 chips have two supplies: VCPIN and
VDD for analog and digital voltage respectively.
Add some minimal code to obtain and enable these
regulators if need be.

Reviewed-by: Javier Martinez Canillas <javier@dowhile0.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v5->v6:
- Move enablement right after fetching the regulators.
- Use a devm_add_action_or_reset() hook to turn the regulator
  off.
ChangeLog v3->v5:
- Rebase on v5.13-rc1
ChangeLog v1->v3:
- Collect Javier's reviewed-by.
---
 drivers/input/touchscreen/cyttsp_core.c | 35 +++++++++++++++++++++++++
 drivers/input/touchscreen/cyttsp_core.h |  2 ++
 2 files changed, 37 insertions(+)

diff --git a/drivers/input/touchscreen/cyttsp_core.c b/drivers/input/touchscreen/cyttsp_core.c
index 106dd4962785..d9debcdeeec7 100644
--- a/drivers/input/touchscreen/cyttsp_core.c
+++ b/drivers/input/touchscreen/cyttsp_core.c
@@ -22,6 +22,7 @@
 #include <linux/slab.h>
 #include <linux/property.h>
 #include <linux/gpio/consumer.h>
+#include <linux/regulator/consumer.h>
 
 #include "cyttsp_core.h"
 
@@ -608,6 +609,14 @@ static int cyttsp_parse_properties(struct cyttsp *ts)
 	return 0;
 }
 
+static void cyttsp_disable_regulators(void *_ts)
+{
+	struct cyttsp *ts = _ts;
+
+	regulator_bulk_disable(ARRAY_SIZE(ts->regulators),
+			       ts->regulators);
+}
+
 struct cyttsp *cyttsp_probe(const struct cyttsp_bus_ops *bus_ops,
 			    struct device *dev, int irq, size_t xfer_buf_size)
 {
@@ -628,6 +637,32 @@ struct cyttsp *cyttsp_probe(const struct cyttsp_bus_ops *bus_ops,
 	ts->bus_ops = bus_ops;
 	ts->irq = irq;
 
+	/*
+	 * VCPIN is the analog voltage supply
+	 * VDD is the digital voltage supply
+	 */
+	ts->regulators[0].supply = "vcpin";
+	ts->regulators[1].supply = "vdd";
+	error = devm_regulator_bulk_get(dev, ARRAY_SIZE(ts->regulators),
+					ts->regulators);
+	if (error) {
+		dev_err(dev, "Failed to get regulators: %d\n", error);
+		return ERR_PTR(error);
+	}
+
+	error = regulator_bulk_enable(ARRAY_SIZE(ts->regulators),
+				      ts->regulators);
+	if (error) {
+		dev_err(dev, "Cannot enable regulators: %d\n", error);
+		return ERR_PTR(error);
+	}
+
+	error = devm_add_action_or_reset(dev, cyttsp_disable_regulators, ts);
+	if (error) {
+		dev_err(dev, "failed to install chip disable handler\n");
+		return ERR_PTR(error);
+	}
+
 	ts->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(ts->reset_gpio)) {
 		error = PTR_ERR(ts->reset_gpio);
diff --git a/drivers/input/touchscreen/cyttsp_core.h b/drivers/input/touchscreen/cyttsp_core.h
index 9bc4fe7e6ac5..8eba9d8ba74a 100644
--- a/drivers/input/touchscreen/cyttsp_core.h
+++ b/drivers/input/touchscreen/cyttsp_core.h
@@ -23,6 +23,7 @@
 #include <linux/types.h>
 #include <linux/device.h>
 #include <linux/input/cyttsp.h>
+#include <linux/regulator/consumer.h>
 
 #define CY_NUM_RETRY		16 /* max number of retries for read ops */
 
@@ -122,6 +123,7 @@ struct cyttsp {
 	enum cyttsp_state state;
 	bool suspended;
 
+	struct regulator_bulk_data regulators[2];
 	struct gpio_desc *reset_gpio;
 	bool use_hndshk;
 	u8 act_dist;
-- 
2.31.1

