Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AAA42AD210
	for <lists+linux-input@lfdr.de>; Tue, 10 Nov 2020 10:08:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729385AbgKJJIN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Nov 2020 04:08:13 -0500
Received: from thoth.sbs.de ([192.35.17.2]:40947 "EHLO thoth.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728048AbgKJJIM (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Nov 2020 04:08:12 -0500
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
        by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 0AA97xLr013465
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 10 Nov 2020 10:07:59 +0100
Received: from dev.vm7.ccp.siemens.com ([167.87.134.60])
        by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id 0AA97wZQ028869;
        Tue, 10 Nov 2020 10:07:59 +0100
Received: from mail3.siemens.de (localhost [127.0.0.1])
        by dev.vm7.ccp.siemens.com (Postfix) with ESMTP id 2C35270BAB5;
        Tue, 10 Nov 2020 10:07:57 +0100 (CET)
From:   Andrej Valek <andrej.valek@siemens.com>
To:     robh@kernel.org, nick@shmanahar.org, hadess@hadess.net,
        dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Andrej Valek <andrej.valek@siemens.com>
Subject: [PATCH v3 1/4] Input: goodix - add option to disable firmware loading
Date:   Tue, 10 Nov 2020 10:07:17 +0100
Message-Id: <20201110090720.6650-2-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201029170313.25529-2-andrej.valek@siemens.com>
References: <20201029170313.25529-1-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Firmware file loadind for GT911 controller takes too much time (~60s).
There is no check that configuration is the same which is already present.
This happens always during boot, which makes touchscreen unusable.

Add there an option to prevent firmware file loading, but keep it enabled
by default.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 drivers/input/touchscreen/goodix.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index 02c75ea385e08..52eb2ccb0de9a 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -941,7 +941,9 @@ static int goodix_get_gpio_config(struct goodix_ts_data *ts)
 	default:
 		if (ts->gpiod_int && ts->gpiod_rst) {
 			ts->reset_controller_at_probe = true;
-			ts->load_cfg_from_disk = true;
+			/* Prevent cfg loading for each start */
+			ts->load_cfg_from_disk = !device_property_read_bool(dev,
+						 "goodix,do-not-load-fw");
 			ts->irq_pin_access_method = IRQ_PIN_ACCESS_GPIO;
 		}
 	}
-- 
2.20.1

