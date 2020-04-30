Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0A751BFB66
	for <lists+linux-input@lfdr.de>; Thu, 30 Apr 2020 16:00:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728939AbgD3N7l (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 30 Apr 2020 09:59:41 -0400
Received: from thoth.sbs.de ([192.35.17.2]:39009 "EHLO thoth.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728236AbgD3N7l (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 30 Apr 2020 09:59:41 -0400
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
        by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 03UDld6f001650
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 30 Apr 2020 15:47:39 +0200
Received: from dev.vm7.ccp.siemens.com ([158.226.192.214])
        by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id 03UDlcbP025819;
        Thu, 30 Apr 2020 15:47:39 +0200
Received: from dev.vm7.ccp.siemens.com (localhost [127.0.0.1])
        by dev.vm7.ccp.siemens.com (Postfix) with ESMTP id CE5577097C1;
        Thu, 30 Apr 2020 15:40:12 +0200 (CEST)
From:   Andrej Valek <andrej.valek@siemens.com>
To:     linux-input@vger.kernel.org
Cc:     hadess@hadess.net, andrej.valek@siemens.com
Subject: [PATCH] Input: goodix - add option to disable firmware loading
Date:   Thu, 30 Apr 2020 15:39:26 +0200
Message-Id: <20200430133926.23393-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
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
index 02c75ea385e0..7a75e5137547 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -941,7 +941,9 @@ static int goodix_get_gpio_config(struct goodix_ts_data *ts)
 	default:
 		if (ts->gpiod_int && ts->gpiod_rst) {
 			ts->reset_controller_at_probe = true;
-			ts->load_cfg_from_disk = true;
+			/* Prevent cfg loading for each start */
+			ts->load_cfg_from_disk = !device_property_read_bool(dev,
+							     "touchscreen-do-not-load-fw");
 			ts->irq_pin_access_method = IRQ_PIN_ACCESS_GPIO;
 		}
 	}
-- 
2.20.1

