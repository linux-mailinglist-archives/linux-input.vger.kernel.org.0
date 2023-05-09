Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A26156FCF9F
	for <lists+linux-input@lfdr.de>; Tue,  9 May 2023 22:36:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229773AbjEIUgZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 9 May 2023 16:36:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231467AbjEIUgW (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 9 May 2023 16:36:22 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E2385279
        for <linux-input@vger.kernel.org>; Tue,  9 May 2023 13:36:08 -0700 (PDT)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 2B2D485ED2;
        Tue,  9 May 2023 22:36:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1683664566;
        bh=bJsCzanjEWtqcJxkb4czKEBhG2YTxxK4GhQOaCaC3E0=;
        h=From:To:Cc:Subject:Date:From;
        b=saH/U5Y52AG4a+qM3pwwhOr75cPNWKEU33miexJ2UWD03UcSX10ma94z5uDFbDAHg
         jqs1nUP1b90NxFN5HtUjbKyy3pz5rbUfoaOWn7jiWi3ic6gRveeSojts7N4+fGdpIX
         5Tw3VXkKdlcLTsyxjBn1CNe2tm1JBdq7LvtJLDo4wIa0oD+OYbWUM8n3AsZ95Sv3hS
         CpgW/gC14cSNP0t4xAR82kDsA1rNCncTnSZmDtj0HPknTfcSaTwxw1vvL57fnQJEcR
         43YYK9bBPmBwXIOS2bz6HLgCbakMSl/nxcDS7U6CdBu02gQawtd/dZbxl+RXiMdzcb
         qzxgEptls9yoQ==
From:   Marek Vasut <marex@denx.de>
To:     linux-input@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Michael Hennerich <michael.hennerich@analog.com>
Subject: [PATCH] Input: adxl34x - do not hardcode interrupt trigger type
Date:   Tue,  9 May 2023 22:35:55 +0200
Message-Id: <20230509203555.549158-1-marex@denx.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Instead of hardcoding IRQ trigger type to IRQF_TRIGGER_HIGH, let's
respect the settings specified in the firmware description.

Fixes: e27c729219ad2 ("Input: add driver for ADXL345/346 Digital Accelerometers")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>
Cc: linux-input@vger.kernel.org
---
 drivers/input/misc/adxl34x.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/misc/adxl34x.c b/drivers/input/misc/adxl34x.c
index eecca671b5884..a3f45e0ee0c75 100644
--- a/drivers/input/misc/adxl34x.c
+++ b/drivers/input/misc/adxl34x.c
@@ -817,8 +817,7 @@ struct adxl34x *adxl34x_probe(struct device *dev, int irq,
 	AC_WRITE(ac, POWER_CTL, 0);
 
 	err = request_threaded_irq(ac->irq, NULL, adxl34x_irq,
-				   IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
-				   dev_name(dev), ac);
+				   IRQF_ONESHOT, dev_name(dev), ac);
 	if (err) {
 		dev_err(dev, "irq %d busy?\n", ac->irq);
 		goto err_free_mem;
-- 
2.39.2

