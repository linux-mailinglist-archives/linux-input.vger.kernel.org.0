Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C3532538B6
	for <lists+linux-input@lfdr.de>; Wed, 26 Aug 2020 22:04:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726734AbgHZUEn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Aug 2020 16:04:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:34210 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726609AbgHZUEm (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Aug 2020 16:04:42 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B38762078D;
        Wed, 26 Aug 2020 20:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598472282;
        bh=BuazxSfj/OEU27FnFDQ+WViB1Hj50ORDU+tcOTvq3vo=;
        h=From:To:Cc:Subject:Date:From;
        b=gs2ilaArdue+FNQexN+90DECakO3Kso/luPtxQYNRGLQ5PxSV0hFnmMeeZTFfaJ/j
         XGSXpOuP6QgR+LRNeE76d+16f0VNzPd1ocT/KPuwevnLasrhad3DRdFc8Tuy6iYAnS
         MYTzzy1fPY/fcfIt3gi66/XLTTnSv6xokhDO5ZaQ=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v2] Input: bcm-keypad - Simplify with dev_err_probe()
Date:   Wed, 26 Aug 2020 22:04:36 +0200
Message-Id: <20200826200436.30669-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe() and devm_clk_get_optional().  Less code and the error
value gets printed.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>

---

Changes since v1:
1. Use also devm_clk_get_optional()
---
 drivers/input/keyboard/bcm-keypad.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/input/keyboard/bcm-keypad.c b/drivers/input/keyboard/bcm-keypad.c
index 2b771c3a5578..23e11b4efd13 100644
--- a/drivers/input/keyboard/bcm-keypad.c
+++ b/drivers/input/keyboard/bcm-keypad.c
@@ -376,17 +376,11 @@ static int bcm_kp_probe(struct platform_device *pdev)
 		return PTR_ERR(kp->base);
 
 	/* Enable clock */
-	kp->clk = devm_clk_get(&pdev->dev, "peri_clk");
+	kp->clk = devm_clk_get_optional(&pdev->dev, "peri_clk");
 	if (IS_ERR(kp->clk)) {
-		error = PTR_ERR(kp->clk);
-		if (error != -ENOENT) {
-			if (error != -EPROBE_DEFER)
-				dev_err(&pdev->dev, "Failed to get clock\n");
-			return error;
-		}
-		dev_dbg(&pdev->dev,
-			"No clock specified. Assuming it's enabled\n");
-		kp->clk = NULL;
+		return dev_err_probe(&pdev->dev, error, "Failed to get clock\n");
+	} else if (!kp->clk) {
+		dev_dbg(&pdev->dev, "No clock specified. Assuming it's enabled\n");
 	} else {
 		unsigned int desired_rate;
 		long actual_rate;
-- 
2.17.1

