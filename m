Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E2D22A93D7
	for <lists+linux-input@lfdr.de>; Fri,  6 Nov 2020 11:12:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbgKFKMd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Nov 2020 05:12:33 -0500
Received: from thoth.sbs.de ([192.35.17.2]:51290 "EHLO thoth.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726010AbgKFKMd (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 6 Nov 2020 05:12:33 -0500
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
        by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 0A6ACIan003171
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 6 Nov 2020 11:12:18 +0100
Received: from dev.vm7.ccp.siemens.com ([139.22.40.104])
        by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id 0A6ACHAl009302;
        Fri, 6 Nov 2020 11:12:17 +0100
Received: from dev.vm7.ccp.siemens.com (localhost [127.0.0.1])
        by dev.vm7.ccp.siemens.com (Postfix) with ESMTP id 3422970FF8B;
        Fri,  6 Nov 2020 11:06:56 +0100 (CET)
From:   Andrej Valek <andrej.valek@siemens.com>
To:     robh@kernel.org, nick@shmanahar.org, hadess@hadess.net,
        dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Andrej Valek <andrej.valek@siemens.com>
Subject: [PATCH v2 3/3] Input: goodix - add option to disable firmware loading
Date:   Fri,  6 Nov 2020 11:05:39 +0100
Message-Id: <20201106100539.6646-4-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201029170313.25529-1-andrej.valek@siemens.com>
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
 drivers/input/touchscreen/goodix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index 44336ecd2acd..41f8eb8963b1 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -943,7 +943,7 @@ static int goodix_get_gpio_config(struct goodix_ts_data *ts)
 			ts->reset_controller_at_probe = true;
 			/* Prevent cfg loading for each start */
 			ts->load_cfg_from_disk = !device_property_read_bool(dev,
-						 "touchscreen-do-not-load-fw");
+						 "goodix-do-not-load-fw");
 			ts->irq_pin_access_method = IRQ_PIN_ACCESS_GPIO;
 		}
 	}
-- 
2.20.1

