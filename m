Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D9297C9BC0
	for <lists+linux-input@lfdr.de>; Sun, 15 Oct 2023 23:12:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230410AbjJOVMI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 15 Oct 2023 17:12:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230423AbjJOVMI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 15 Oct 2023 17:12:08 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 265A5E6
        for <linux-input@vger.kernel.org>; Sun, 15 Oct 2023 14:12:06 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40684f53ef3so42152045e9.3
        for <linux-input@vger.kernel.org>; Sun, 15 Oct 2023 14:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697404324; x=1698009124; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IPbEl3a+GSATMX0xKBiAaSsckvKrX/yZx29OiKgfOoY=;
        b=KXFLYNrzBP3XG8vUv7Qbe+R1hjLRsIqAms2bO9LN8Vegz5NCA7qgUhxSK7QyuQSGkX
         AL7y3DiPrSeSMfkw4ZbPf7xpXXD6YIGT25Nu3afhuYeFjEg9B5somdQAQGqSgJOgFHWG
         HbzOTv7OAz5hswSKa90FBNj6yLBgSpnDOhckIxIM/U/FJ8FALtNXq0EVEbnLHLhe1Gc4
         0d7h0tYuVOwvZyqsvWHV8q4503Ibwu45gX347cFDjZvRMWWSW4ZFiQEorwhDC/UC6iP4
         nEVoihm5giG1MnMd/RbKomJT/Iq970mFehyN+6Y4Q6C1LkzdiFyNLnZ38trSUHC5Bci8
         pFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697404324; x=1698009124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IPbEl3a+GSATMX0xKBiAaSsckvKrX/yZx29OiKgfOoY=;
        b=rzjO57nO/J5LZjXP9GQalvKMs80wRhQM0v9gM9eBwHEOJ7O8840zvIg9oDfqc8uRwH
         NRJiWryQZJH3OpJO8hNXzOF0o1FK3rHE1bvVXEJxxfSgELS2A2sKXmye1cmb6gYPieaI
         jTfsNhY7TmI0cZroHDNM43NPn1rjP3GhBxQjf6jTT8ADy8cGglQbXgTelUWaSgrrlZyS
         typb+zo6+F638By7S6enVeBl2low3M5V8dMjGD1HJOxU84xpNM+XNoekupDRM0atdhtz
         ijyDvvd78eqAHAnIzzoz03gFKl0nKChd7yZHJ1o5+SYd82oFlwsiYx4JdAJdpdx04Ccm
         xkug==
X-Gm-Message-State: AOJu0YwXsJI5ce8X741KZCZlyaVuacOQVHyNbIrixXGqyT/OqArYmDAL
        /y4hZdsrL5DwDy7cCSn3CkBXRw==
X-Google-Smtp-Source: AGHT+IHLJHyAK/IO20D8onfVloDRBZUxAlFnFPYdQTpisAb4QgFcWRCH0lk29htFCqoCn4DWbBKf4g==
X-Received: by 2002:adf:ec0f:0:b0:32d:9787:53b6 with SMTP id x15-20020adfec0f000000b0032d978753b6mr6634785wrn.44.1697404324598;
        Sun, 15 Oct 2023 14:12:04 -0700 (PDT)
Received: from lion.localdomain (host-2-99-112-229.as13285.net. [2.99.112.229])
        by smtp.gmail.com with ESMTPSA id z17-20020a5d4d11000000b0032d9548240fsm8456734wrt.82.2023.10.15.14.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 14:12:04 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
Date:   Sun, 15 Oct 2023 22:11:55 +0100
Subject: [PATCH v2 7/7] Input: synaptics-rmi4 - support fallback values for
 PDT descriptor bytes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230929-caleb-rmi4-quirks-v2-7-b227ac498d88@linaro.org>
References: <20230929-caleb-rmi4-quirks-v2-0-b227ac498d88@linaro.org>
In-Reply-To: <20230929-caleb-rmi4-quirks-v2-0-b227ac498d88@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Vincent Huang <vincent.huang@tw.synaptics.com>
Cc:     methanal <baclofen@tuta.io>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Caleb Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.13-dev-46309
X-Developer-Signature: v=1; a=openpgp-sha256; l=5774;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=XfJQ2GHO50MV7MnlNjDjRwUK62lemo3DJeS3CYiDH+I=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhlSd0LmvBLLdNWwX3vp/WSfrp/zSkOdvei56XD6c9+H8A
 6f2TtWsjlIWBkEOBlkxRRbxE8ssm9ZettfYvuACzBxWJpAhDFycAjARpgaG/8kbZsrIOyv4uoc7
 8NR5/DmnXbF2d+ixat5yaUFPjjzLdIb/Jc1PXvQ9CdybLueks5BVbv+nnMuBnqkc53tDmBguyoU
 /BwA=
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: methanal <baclofen@tuta.io>

Some replacement displays include third-party touch ICs which do not
expose the function number and the interrupt status in its PDT entries.

OnePlus 6 (original touch IC)
  rmi4_i2c 12-0020: read 6 bytes at 0x00e3: 0 (2b 22 0d 06 01 01)

OnePlus 6 (aftermarket touch IC)
  rmi4_i2c 12-0020: read 6 bytes at 0x00e3: 0 (2c 23 0d 06 00 00)

Introduce a new devicetree property `syna,pdt-desc` which can be used to
provide platform-specific fallback values for users with a replacement
display with an aftermarket touch IC.

Signed-off-by: methanal <baclofen@tuta.io>
[codeflow adjustments, checkpatch fixes, wording]
Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 drivers/input/rmi4/rmi_driver.c | 67 ++++++++++++++++++++++++++++++++++++++---
 drivers/input/rmi4/rmi_driver.h |  2 ++
 include/linux/rmi.h             |  3 ++
 3 files changed, 67 insertions(+), 5 deletions(-)

diff --git a/drivers/input/rmi4/rmi_driver.c b/drivers/input/rmi4/rmi_driver.c
index 22f0b35bb70b..f1c09fdb8d73 100644
--- a/drivers/input/rmi4/rmi_driver.c
+++ b/drivers/input/rmi4/rmi_driver.c
@@ -461,9 +461,10 @@ static int rmi_driver_reset_handler(struct rmi_device *rmi_dev)
 	return 0;
 }
 
-static int rmi_read_pdt_entry(struct rmi_device *rmi_dev,
-			      struct pdt_entry *entry, u16 pdt_address)
+static int rmi_read_pdt_entry(struct rmi_device *rmi_dev, struct pdt_entry *entry,
+			      struct pdt_scan_state *state, u16 pdt_address)
 {
+	const struct rmi_device_platform_data *pdata = rmi_get_platform_data(rmi_dev);
 	u8 buf[RMI_PDT_ENTRY_SIZE];
 	int error;
 
@@ -474,6 +475,21 @@ static int rmi_read_pdt_entry(struct rmi_device *rmi_dev,
 		return error;
 	}
 
+	if (pdata->pdt_fallback_size > state->pdt_count * RMI_OF_PDT_DESC_CELLS + 1) {
+		/* Use the description bytes from DT */
+		buf[5] = pdata->pdt_fallback_desc[state->pdt_count * RMI_OF_PDT_DESC_CELLS];
+		buf[4] = pdata->pdt_fallback_desc[state->pdt_count * RMI_OF_PDT_DESC_CELLS + 1];
+
+		error = rmi_read_block(rmi_dev, pdt_address, buf,
+				RMI_PDT_ENTRY_SIZE - 2);
+		if (error) {
+			dev_err(&rmi_dev->dev,
+					"Read PDT entry at %#06x failed, code: %d.\n",
+					pdt_address, error);
+			return error;
+		}
+	}
+
 	entry->page_start = pdt_address & RMI4_PAGE_MASK;
 	entry->query_base_addr = buf[0];
 	entry->command_base_addr = buf[1];
@@ -551,7 +567,7 @@ static int rmi_scan_pdt_page(struct rmi_device *rmi_dev,
 	int retval;
 
 	for (addr = pdt_start; addr >= pdt_end; addr -= RMI_PDT_ENTRY_SIZE) {
-		error = rmi_read_pdt_entry(rmi_dev, &pdt_entry, addr);
+		error = rmi_read_pdt_entry(rmi_dev, &pdt_entry, state, addr);
 		if (error)
 			return error;
 
@@ -1028,9 +1044,11 @@ static int rmi_driver_remove(struct device *dev)
 }
 
 #ifdef CONFIG_OF
-static int rmi_driver_of_probe(struct device *dev,
+static int rmi_driver_of_probe(struct rmi_device *rmi_dev,
 				struct rmi_device_platform_data *pdata)
 {
+	struct device *dev = rmi_dev->xport->dev;
+	u8 buf[RMI_PDT_ENTRY_SIZE];
 	int retval;
 
 	retval = rmi_of_property_read_u32(dev, &pdata->reset_delay_ms,
@@ -1038,6 +1056,45 @@ static int rmi_driver_of_probe(struct device *dev,
 	if (retval)
 		return retval;
 
+	/*
+	 * In some aftermerket touch ICs, the first PDT entry is empty and
+	 * the function number register is 0. If so, the platform
+	 * may have provided backup PDT entries in the device tree.
+	 */
+
+	retval = rmi_read_block(rmi_dev, PDT_START_SCAN_LOCATION,
+			buf, RMI_PDT_ENTRY_SIZE);
+	if (retval) {
+		dev_err(dev, "Read PDT entry at %#06x failed, code: %d.\n",
+			PDT_START_SCAN_LOCATION, retval);
+		return retval;
+	}
+
+	if (!RMI4_END_OF_PDT(buf[5]))
+		return 0;
+
+	pdata->pdt_fallback_size = of_property_count_u8_elems(dev->of_node,
+						  "syna,pdt-fallback-desc");
+
+	/* The rmi4 driver would fail later anyway, so just error out now. */
+	if (pdata->pdt_fallback_size == -EINVAL) {
+		dev_err(dev, "First PDT entry is empty and no backup values provided\n");
+		return -EINVAL;
+	}
+
+	if (pdata->pdt_fallback_size < 0) {
+		dev_err(dev, "syna,pdt-fallback-desc property was not specified properly: %d\n",
+			pdata->pdt_fallback_size);
+		return pdata->pdt_fallback_size;
+	}
+
+	pdata->pdt_fallback_desc = devm_kzalloc(dev, pdata->pdt_fallback_size, GFP_KERNEL);
+
+	retval = of_property_read_u8_array(dev->of_node, "syna,pdt-fallback-desc",
+		pdata->pdt_fallback_desc, pdata->pdt_fallback_size);
+	if (retval < 0)
+		return retval;
+
 	return 0;
 }
 #else
@@ -1163,7 +1220,7 @@ static int rmi_driver_probe(struct device *dev)
 	pdata = rmi_get_platform_data(rmi_dev);
 
 	if (rmi_dev->xport->dev->of_node) {
-		retval = rmi_driver_of_probe(rmi_dev->xport->dev, pdata);
+		retval = rmi_driver_of_probe(rmi_dev, pdata);
 		if (retval)
 			return retval;
 	}
diff --git a/drivers/input/rmi4/rmi_driver.h b/drivers/input/rmi4/rmi_driver.h
index e1a5412f2f8f..2531c32d6163 100644
--- a/drivers/input/rmi4/rmi_driver.h
+++ b/drivers/input/rmi4/rmi_driver.h
@@ -31,6 +31,8 @@
 #define RMI_PDT_FUNCTION_VERSION_MASK   0x60
 #define RMI_PDT_INT_SOURCE_COUNT_MASK   0x07
 
+#define RMI_OF_PDT_DESC_CELLS 2
+
 #define PDT_START_SCAN_LOCATION 0x00e9
 #define PDT_END_SCAN_LOCATION	0x0005
 #define RMI4_END_OF_PDT(id) ((id) == 0x00 || (id) == 0xff)
diff --git a/include/linux/rmi.h b/include/linux/rmi.h
index ab7eea01ab42..974597960b5e 100644
--- a/include/linux/rmi.h
+++ b/include/linux/rmi.h
@@ -214,6 +214,9 @@ struct rmi_device_platform_data {
 	int reset_delay_ms;
 	int irq;
 
+	u8 *pdt_fallback_desc;
+	int pdt_fallback_size;
+
 	struct rmi_device_platform_data_spi spi_data;
 
 	/* function handler pdata */

-- 
2.42.0

