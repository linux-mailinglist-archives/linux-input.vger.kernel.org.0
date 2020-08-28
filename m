Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F05CA255D35
	for <lists+linux-input@lfdr.de>; Fri, 28 Aug 2020 16:58:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728103AbgH1O6G (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 28 Aug 2020 10:58:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:54722 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728082AbgH1O6A (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 28 Aug 2020 10:58:00 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 83BFB2098B;
        Fri, 28 Aug 2020 14:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598626680;
        bh=6NKW0SsZH2UMJHW1u6L7PG/Ylu2jZT2JA43D3ueOJY0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=pV57CXXRRHTllUKPQ9Jt4z/qOLctkn9Zg/hsjM/bJMiR9d6XtfIF7yWKWp7nc2MBh
         N32z5EUXHCBRTgoj8s9u9s/McpKwWJZiEWkzyvBPSjnpVtGd1ATnOd02d+HjfFlFMF
         b2i4/WLFQdcWIJ9238uorm1EgL1CbgRXQEzNtNjY=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 4/4] Input: sun4i-ps2 - Fix handling of platform_get_irq() error
Date:   Fri, 28 Aug 2020 16:57:44 +0200
Message-Id: <20200828145744.3636-4-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200828145744.3636-1-krzk@kernel.org>
References: <20200828145744.3636-1-krzk@kernel.org>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

platform_get_irq() returns -ERRNO on error.  In such case comparison
to 0 would pass the check.

Fixes: e443631d20f5 ("Input: serio - add support for Alwinner A10/A20 PS/2 controller")
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. None
---
 drivers/input/serio/sun4i-ps2.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/input/serio/sun4i-ps2.c b/drivers/input/serio/sun4i-ps2.c
index a681a2c04e39..7da1ea8741fc 100644
--- a/drivers/input/serio/sun4i-ps2.c
+++ b/drivers/input/serio/sun4i-ps2.c
@@ -265,9 +265,8 @@ static int sun4i_ps2_probe(struct platform_device *pdev)
 
 	/* Get IRQ for the device */
 	irq = platform_get_irq(pdev, 0);
-	if (!irq) {
-		dev_err(dev, "no IRQ found\n");
-		error = -ENXIO;
+	if (irq < 0) {
+		error = irq;
 		goto err_disable_clk;
 	}
 
-- 
2.17.1

