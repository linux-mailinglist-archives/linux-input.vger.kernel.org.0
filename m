Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F1F52B0A5F
	for <lists+linux-input@lfdr.de>; Thu, 12 Nov 2020 17:43:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728900AbgKLQnR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Nov 2020 11:43:17 -0500
Received: from mx2.suse.de ([195.135.220.15]:46660 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727739AbgKLQnR (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Nov 2020 11:43:17 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id B625EAFCB;
        Thu, 12 Nov 2020 16:43:15 +0000 (UTC)
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     u.kleine-koenig@pengutronix.de, linux-kernel@vger.kernel.org
Cc:     f.fainelli@gmail.com, linux-pwm@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        wahrenst@gmx.net, linux-input@vger.kernel.org,
        dmitry.torokhov@gmail.com, gregkh@linuxfoundation.org,
        devel@driverdev.osuosl.org, p.zabel@pengutronix.de,
        linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
        linux-clk@vger.kernel.org, sboyd@kernel.org,
        linux-rpi-kernel@lists.infradead.org, bgolaszewski@baylibre.com,
        andy.shevchenko@gmail.com,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: [PATCH v4 06/11] soc: bcm: raspberrypi-power: Release firmware handle on unbind
Date:   Thu, 12 Nov 2020 17:36:24 +0100
Message-Id: <20201112163630.17177-7-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201112163630.17177-1-nsaenzjulienne@suse.de>
References: <20201112163630.17177-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Use devm_rpi_firmware_get() so as to make sure we release RPi's firmware
interface when unbinding the device.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
---

Changes since v2:
 - Use devm_rpi_firmware_get(), instead of remove function

 drivers/soc/bcm/raspberrypi-power.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/bcm/raspberrypi-power.c b/drivers/soc/bcm/raspberrypi-power.c
index 5d1aacdd84ef..068715d6e66d 100644
--- a/drivers/soc/bcm/raspberrypi-power.c
+++ b/drivers/soc/bcm/raspberrypi-power.c
@@ -177,7 +177,7 @@ static int rpi_power_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	rpi_domains->fw = rpi_firmware_get(fw_np);
+	rpi_domains->fw = devm_rpi_firmware_get(&pdev->dev, fw_np);
 	of_node_put(fw_np);
 	if (!rpi_domains->fw)
 		return -EPROBE_DEFER;
-- 
2.29.2

