Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63E6E2C43A9
	for <lists+linux-input@lfdr.de>; Wed, 25 Nov 2020 16:43:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730445AbgKYPgJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Nov 2020 10:36:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:53518 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730420AbgKYPgJ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Nov 2020 10:36:09 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5979320BED;
        Wed, 25 Nov 2020 15:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606318568;
        bh=yHSAuWvarhHnzBKfK31tOI4gNfsowSUP5J5DKDVzLzg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LeZKwcBIp1NoB7l5f4KLbjHLH9AnPuB3X/DhRZuACjcmbhYKkjDuik+BtBFxHkTwz
         BeAOpp0dmcrp6iYzhyk9y/pZFHY+F0GWejnfZbr517XUBR0baJBCjMAdZuwvvk9f7M
         gJ+zYih3uFYSLAbQVmGSI2YcWXWyb5mOcWgQYhtY=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Sasha Levin <sashal@kernel.org>, linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 5.9 13/33] HID: Add Logitech Dinovo Edge battery quirk
Date:   Wed, 25 Nov 2020 10:35:30 -0500
Message-Id: <20201125153550.810101-13-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201125153550.810101-1-sashal@kernel.org>
References: <20201125153550.810101-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit 7940fb035abd88040d56be209962feffa33b03d0 ]

The battery status is also being reported by the logitech-hidpp driver,
so ignore the standard HID battery status to avoid reporting the same
info twice.

Note the logitech-hidpp battery driver provides more info, such as properly
differentiating between charging and discharging. Also the standard HID
battery info seems to be wrong, reporting a capacity of just 26% after
fully charging the device.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-ids.h   | 1 +
 drivers/hid/hid-input.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 96e84a51f6b2c..a6d63a7590434 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -749,6 +749,7 @@
 #define USB_VENDOR_ID_LOGITECH		0x046d
 #define USB_DEVICE_ID_LOGITECH_AUDIOHUB 0x0a0e
 #define USB_DEVICE_ID_LOGITECH_T651	0xb00c
+#define USB_DEVICE_ID_LOGITECH_DINOVO_EDGE_KBD	0xb309
 #define USB_DEVICE_ID_LOGITECH_C007	0xc007
 #define USB_DEVICE_ID_LOGITECH_C077	0xc077
 #define USB_DEVICE_ID_LOGITECH_RECEIVER	0xc101
diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 9770db624bfaf..4dca113924593 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -319,6 +319,9 @@ static const struct hid_device_id hid_battery_quirks[] = {
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_ASUSTEK,
 		USB_DEVICE_ID_ASUSTEK_T100CHI_KEYBOARD),
 	  HID_BATTERY_QUIRK_IGNORE },
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH,
+		USB_DEVICE_ID_LOGITECH_DINOVO_EDGE_KBD),
+	  HID_BATTERY_QUIRK_IGNORE },
 	{}
 };
 
-- 
2.27.0

