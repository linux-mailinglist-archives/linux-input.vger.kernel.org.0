Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F090E2C4312
	for <lists+linux-input@lfdr.de>; Wed, 25 Nov 2020 16:38:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729153AbgKYPfx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Nov 2020 10:35:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:53280 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725792AbgKYPfx (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Nov 2020 10:35:53 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A94C7206CA;
        Wed, 25 Nov 2020 15:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606318552;
        bh=tCPauijckKAUxxrQpZinVNNIqmG0cK/SIAZLG7Y4xcQ=;
        h=From:To:Cc:Subject:Date:From;
        b=OxEhw3GABRWCadfzNOTF0TamDwcnY1Zz1XtF9hKoWTMs57mR79L6Gl4C8osjtwimK
         iBCVNGMvJKh3TyvOXDRbj9i+pe/GUNgTMXjh5UTlPWilUYp/OHaHA0AIHXgnnbV+D2
         VIlfGy1VmYVaIP1XWcx0uZdnmCJQIJT7cuvE8PpQ=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Martijn van de Streek <martijn@zeewinde.xyz>,
        Jiri Kosina <jkosina@suse.cz>, Sasha Levin <sashal@kernel.org>,
        linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 5.9 01/33] HID: uclogic: Add ID for Trust Flex Design Tablet
Date:   Wed, 25 Nov 2020 10:35:18 -0500
Message-Id: <20201125153550.810101-1-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Martijn van de Streek <martijn@zeewinde.xyz>

[ Upstream commit 022fc5315b7aff69d3df2c953b892a6232642d50 ]

The Trust Flex Design Tablet has an UGTizer USB ID and requires the same
initialization as the UGTizer GP0610 to be detected as a graphics tablet
instead of a mouse.

Signed-off-by: Martijn van de Streek <martijn@zeewinde.xyz>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-ids.h            | 1 +
 drivers/hid/hid-uclogic-core.c   | 2 ++
 drivers/hid/hid-uclogic-params.c | 2 ++
 3 files changed, 5 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 79495e218b7fc..6b7f90a4721f0 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1297,6 +1297,7 @@
 
 #define USB_VENDOR_ID_UGTIZER			0x2179
 #define USB_DEVICE_ID_UGTIZER_TABLET_GP0610	0x0053
+#define USB_DEVICE_ID_UGTIZER_TABLET_GT5040	0x0077
 
 #define USB_VENDOR_ID_VIEWSONIC			0x0543
 #define USB_DEVICE_ID_VIEWSONIC_PD1011		0xe621
diff --git a/drivers/hid/hid-uclogic-core.c b/drivers/hid/hid-uclogic-core.c
index 86b568037cb8a..8e9c9e646cb7d 100644
--- a/drivers/hid/hid-uclogic-core.c
+++ b/drivers/hid/hid-uclogic-core.c
@@ -385,6 +385,8 @@ static const struct hid_device_id uclogic_devices[] = {
 				USB_DEVICE_ID_UCLOGIC_DRAWIMAGE_G3) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_UGTIZER,
 				USB_DEVICE_ID_UGTIZER_TABLET_GP0610) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_UGTIZER,
+				USB_DEVICE_ID_UGTIZER_TABLET_GT5040) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_UGEE,
 				USB_DEVICE_ID_UGEE_TABLET_G5) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_UGEE,
diff --git a/drivers/hid/hid-uclogic-params.c b/drivers/hid/hid-uclogic-params.c
index 7d20d1fcf8d20..d26d8cd98efcf 100644
--- a/drivers/hid/hid-uclogic-params.c
+++ b/drivers/hid/hid-uclogic-params.c
@@ -997,6 +997,8 @@ int uclogic_params_init(struct uclogic_params *params,
 		break;
 	case VID_PID(USB_VENDOR_ID_UGTIZER,
 		     USB_DEVICE_ID_UGTIZER_TABLET_GP0610):
+	case VID_PID(USB_VENDOR_ID_UGTIZER,
+		     USB_DEVICE_ID_UGTIZER_TABLET_GT5040):
 	case VID_PID(USB_VENDOR_ID_UGEE,
 		     USB_DEVICE_ID_UGEE_XPPEN_TABLET_G540):
 	case VID_PID(USB_VENDOR_ID_UGEE,
-- 
2.27.0

