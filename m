Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B76F5253F09
	for <lists+linux-input@lfdr.de>; Thu, 27 Aug 2020 09:24:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728114AbgH0HYe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Aug 2020 03:24:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:33090 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728029AbgH0HYb (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Aug 2020 03:24:31 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 40DFC22BEA;
        Thu, 27 Aug 2020 07:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598513071;
        bh=QuoT6VS26Unir/WzzWse5ajubkYxK3aWXlHrQVEpwWg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=uWe6Q2kcJfZMrEQSrUvMiFOrHuCPKj4kRMlNSzbn8RE/9nxI333/gqFoYZOrEyJLz
         PcS3aODX9J3tQoYRo6YBZTDxeTjAGPNovxk+NZWJ/eys1b2n++JLKXrT+8Y3FAcbWN
         WrBKwv2SaoDk5O/MRuj3V4NX3Yhe/y4v9Of2hxLw=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        H Hartley Sweeten <hartleys@visionengravers.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/4] Input: twl4030_keypad - Fix handling of platform_get_irq() error
Date:   Thu, 27 Aug 2020 09:24:19 +0200
Message-Id: <20200827072420.22848-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200827072420.22848-1-krzk@kernel.org>
References: <20200827072420.22848-1-krzk@kernel.org>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

platform_get_irq() returns -ERRNO on error.  In such case comparison
to 0 would pass the check.

Fixes: 7abf38d6d13c ("Input: twl4030-keypad - add device tree support")
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/input/keyboard/twl4030_keypad.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/twl4030_keypad.c b/drivers/input/keyboard/twl4030_keypad.c
index af3a6824f1a4..c971a06c2c6a 100644
--- a/drivers/input/keyboard/twl4030_keypad.c
+++ b/drivers/input/keyboard/twl4030_keypad.c
@@ -376,10 +376,8 @@ static int twl4030_kp_probe(struct platform_device *pdev)
 	}
 
 	kp->irq = platform_get_irq(pdev, 0);
-	if (!kp->irq) {
-		dev_err(&pdev->dev, "no keyboard irq assigned\n");
-		return -EINVAL;
-	}
+	if (kp->irq < 0)
+		return kp->irq;
 
 	error = matrix_keypad_build_keymap(keymap_data, NULL,
 					   TWL4030_MAX_ROWS,
-- 
2.17.1

