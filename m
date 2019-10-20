Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F110FDDF91
	for <lists+linux-input@lfdr.de>; Sun, 20 Oct 2019 18:45:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726511AbfJTQp5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 20 Oct 2019 12:45:57 -0400
Received: from freundtech.com ([78.47.86.165]:60172 "EHLO freundtech.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726504AbfJTQp4 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 20 Oct 2019 12:45:56 -0400
X-Greylist: delayed 396 seconds by postgrey-1.27 at vger.kernel.org; Sun, 20 Oct 2019 12:45:56 EDT
Received: from arch-desktop.local (unknown [IPv6:2a02:8071:2b91:e400:8dde:ba23:ec46:35e3])
        by freundtech.com (Postfix) with ESMTPSA id 249421E00B0;
        Sun, 20 Oct 2019 18:39:19 +0200 (CEST)
From:   Adrian Freund <adrian@freund.io>
To:     linux-input@vger.kernel.org
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Adrian Freund <adrian@freund.io>
Subject: [PATCH] HID: logitech: Add MX Master 3 Mouse
Date:   Sun, 20 Oct 2019 18:39:16 +0200
Message-Id: <20191020163916.911033-1-adrian@freund.io>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Adds support for the Logitech MX Master 3 Mouse to the HID++ driver when
connected by the Logitech Unifying Receiver.
This doesn't yet add support for using the mouse over bluetooth.
---
 drivers/hid/hid-logitech-hidpp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 0179f7ed77e5..e263085a0b82 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -3717,6 +3717,8 @@ static const struct hid_device_id hidpp_devices[] = {
 	{ LDJ_DEVICE(0x4071), .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
 	{ /* Mouse Logitech MX Master 2S */
 	  LDJ_DEVICE(0x4069), .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
+	{ /* Mouse Logitech MX Master 3 */
+	  LDJ_DEVICE(0x4082), .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
 	{ /* Mouse Logitech Performance MX */
 	  LDJ_DEVICE(0x101a), .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_1P0 },
 	{ /* Keyboard logitech K400 */
-- 
2.23.0

