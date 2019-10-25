Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73E99E5598
	for <lists+linux-input@lfdr.de>; Fri, 25 Oct 2019 23:05:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725783AbfJYVFA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 25 Oct 2019 17:05:00 -0400
Received: from freundtech.com ([78.47.86.165]:46980 "EHLO freundtech.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725283AbfJYVFA (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 25 Oct 2019 17:05:00 -0400
Received: from arch-desktop.local (unknown [IPv6:2a02:8071:2b91:e400:8dde:ba23:ec46:35e3])
        by freundtech.com (Postfix) with ESMTPSA id CF4DD1E6127;
        Fri, 25 Oct 2019 23:04:58 +0200 (CEST)
From:   Adrian Freund <adrian@freund.io>
To:     linux-input@vger.kernel.org
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Adrian Freund <adrian@freund.io>
Subject: [PATCH v3] HID: logitech: Add MX Master 3 Mouse
Date:   Fri, 25 Oct 2019 22:59:29 +0200
Message-Id: <20191025205928.87295-1-adrian@freund.io>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds support for the Logitech MX Master 3 Mouse using the
Logitech Unifying Receiver and Bluetooth LE.

Signed-off-by: Adrian Freund <adrian@freund.io>
---
v3:
  - rebased on top of https://patchwork.kernel.org/project/linux-input/list/?series=190445
  - Added bluetooth id

v2:
  - added Signed-off-by line
---
 drivers/hid/hid-logitech-hidpp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 23baf9b09c48..74f2517d88d5 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -3793,6 +3793,8 @@ static const struct hid_device_id hidpp_devices[] = {
 	{ LDJ_DEVICE(0x4071), .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
 	{ /* Mouse Logitech MX Master 2S */
 	  LDJ_DEVICE(0x4069), .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
+	{ /* Mouse Logitech MX Master 3 */
+	  LDJ_DEVICE(0x4082), .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
 	{ /* Mouse Logitech Performance MX */
 	  LDJ_DEVICE(0x101a), .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_1P0 },
 	{ /* Keyboard logitech K400 */
@@ -3854,6 +3856,9 @@ static const struct hid_device_id hidpp_devices[] = {
 	  .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb01e),
 	  .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
+	{ /* MX Master 3 mouse over Bluetooth */
+	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb023),
+	  .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
 	{}
 };
 
-- 
2.23.0

