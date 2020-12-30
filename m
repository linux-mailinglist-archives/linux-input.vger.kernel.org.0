Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C173F2E789E
	for <lists+linux-input@lfdr.de>; Wed, 30 Dec 2020 13:45:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726644AbgL3Mo7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Dec 2020 07:44:59 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:34142 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726547AbgL3Mo7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Dec 2020 07:44:59 -0500
Received: from 1-171-218-216.dynamic-ip.hinet.net ([1.171.218.216] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1kuapr-0002uP-42; Wed, 30 Dec 2020 12:44:15 +0000
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     Kai-Heng Feng <kai.heng.feng@canonical.com>,
        linux-input@vger.kernel.org (open list:HID CORE LAYER),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] HID: multitouch: Enable multi-input for Synaptics pointstick/touchpad device
Date:   Wed, 30 Dec 2020 20:44:07 +0800
Message-Id: <20201230124407.41186-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Pointstick and its left/right buttons on HP EliteBook 850 G7 need
multi-input quirk to work correctly.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 drivers/hid/hid-multitouch.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index d670bcd57bde..0743ef51d3b2 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -2054,6 +2054,10 @@ static const struct hid_device_id mt_devices[] = {
 		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
 			USB_VENDOR_ID_SYNAPTICS, 0xce08) },
 
+	{ .driver_data = MT_CLS_WIN_8_FORCE_MULTI_INPUT,
+		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
+			USB_VENDOR_ID_SYNAPTICS, 0xce09) },
+
 	/* TopSeed panels */
 	{ .driver_data = MT_CLS_TOPSEED,
 		MT_USB_DEVICE(USB_VENDOR_ID_TOPSEED2,
-- 
2.29.2

