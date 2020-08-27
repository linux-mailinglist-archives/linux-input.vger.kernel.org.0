Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2EC4253F05
	for <lists+linux-input@lfdr.de>; Thu, 27 Aug 2020 09:24:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728145AbgH0HYe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Aug 2020 03:24:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:33190 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728079AbgH0HYe (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Aug 2020 03:24:34 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 99D8322CAE;
        Thu, 27 Aug 2020 07:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598513073;
        bh=21SE16AO2Es2A0sU9De9UcqocFt/7Hk8g8DosPEVjfY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Xw9u5SeO93ZZx+JOSuMX/gbqTO3X6kMuoQYc4Ye86pEPZIiWSEzt9kYa0u7NxqBM2
         lwH7M3bbO0srhU4CLwJFw0EZAE0+2oV9FdfNFqtd3My5plcK27QVjNggTHDeC3u//o
         EQhIzI+1E5r2YQ3Kgem8UfhIDztvYAUatAMPfUFQ=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        H Hartley Sweeten <hartleys@visionengravers.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/4] Input: sun4i-ps2 - Fix handling of platform_get_irq() error
Date:   Thu, 27 Aug 2020 09:24:20 +0200
Message-Id: <20200827072420.22848-4-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200827072420.22848-1-krzk@kernel.org>
References: <20200827072420.22848-1-krzk@kernel.org>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

platform_get_irq() returns -ERRNO on error.  In such case comparison
to 0 would pass the check.

Fixes: e443631d20f5 ("Input: serio - add support for Alwinner A10/A20 PS/2 controller")
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
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

