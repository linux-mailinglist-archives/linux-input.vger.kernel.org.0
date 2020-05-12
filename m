Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4773C1D024A
	for <lists+linux-input@lfdr.de>; Wed, 13 May 2020 00:27:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731551AbgELW1U (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 May 2020 18:27:20 -0400
Received: from vps.xff.cz ([195.181.215.36]:41814 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731156AbgELW1U (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 May 2020 18:27:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1589322129; bh=8NnK5CsraaZezbyEm3ALbCdiOU7kYIlUQyLKmB3n8RA=;
        h=From:To:Cc:Subject:Date:References:From;
        b=SO6+Q+T41K4T2JL05TZZ2IY/e+nGZgKFEXLbxmq9QBlFYcu5A7X8teO00J4r4Tw2U
         wS6ZXVfwNFYJ1j+H58opUYdoszBJijDY3fkwh22g1xi3N0quarcGWyHpL3Wy1+Rn3G
         /0+dNsie3axkhfAn8fV8ZjFo/1jrPmHs7umY8phQ=
From:   Ondrej Jirman <megous@megous.com>
To:     linux-sunxi@googlegroups.com,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     Ondrej Jirman <megous@megous.com>, Luca Weiss <luca@z3ntu.xyz>,
        Tomas Novotny <tomas@novotny.cz>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/4] input: gpio-vibra: Allow to use vcc-supply alone to control the vibrator
Date:   Wed, 13 May 2020 00:22:03 +0200
Message-Id: <20200512222205.1456300-3-megous@megous.com>
In-Reply-To: <20200512222205.1456300-1-megous@megous.com>
References: <20200512222205.1456300-1-megous@megous.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Make enable-gpio optional to allow using this driver with
boards that have vibrator connected to a power supply without
intermediate gpio based enable circuitry.

Signed-off-by: Ondrej Jirman <megous@megous.com>
---
 drivers/input/misc/gpio-vibra.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/input/misc/gpio-vibra.c b/drivers/input/misc/gpio-vibra.c
index f79f75595dd7..f11877f04b43 100644
--- a/drivers/input/misc/gpio-vibra.c
+++ b/drivers/input/misc/gpio-vibra.c
@@ -121,7 +121,8 @@ static int gpio_vibrator_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	vibrator->gpio = devm_gpiod_get(&pdev->dev, "enable", GPIOD_OUT_LOW);
+	vibrator->gpio = devm_gpiod_get_optional(&pdev->dev, "enable",
+						 GPIOD_OUT_LOW);
 	err = PTR_ERR_OR_ZERO(vibrator->gpio);
 	if (err) {
 		if (err != -EPROBE_DEFER)
-- 
2.26.2

