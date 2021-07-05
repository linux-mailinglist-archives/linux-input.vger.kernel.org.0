Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6E343BBF93
	for <lists+linux-input@lfdr.de>; Mon,  5 Jul 2021 17:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232461AbhGEPcd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 5 Jul 2021 11:32:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:57732 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232409AbhGEPcU (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 5 Jul 2021 11:32:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C1E6261995;
        Mon,  5 Jul 2021 15:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625498983;
        bh=Y4dQMYFhm95GjcowETDtuXSFX9tZyDZ2F+uM++JTHrw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KFd1Nd+tl/rIY0lXFtrt0sJtX+hLEx2+4VSUltsRHAPuMJVZEwMSww9M1zy2F65fv
         cL9snH175l7xX2a08Z969l6JSZkomu+zcfpG4BINwHlppbd3m4qsZg47hk+5Tk+o3r
         829aQNBmSVkW0TJnTuRHgYGn1tHUptLzV9+6lOn5cOuFqk8TBsh0jB6p3axpFT8hit
         stI0dLQDNiakkOse8o9yRZ9XGzgGMbQCW4HxSd1bUTzu2RBtRxpIKvg454IF0kyCzt
         E9lfPtti/5YmKBn9ouddOt8hz7Lv+0TA1r7951fl/HMdlvBgFh34CnY4ba8VwuQNOA
         VgpiqF+nu2izg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Zoltan Tamas Vajda <zoltan.tamas.vajda@gmail.com>,
        Jiri Kosina <jkosina@suse.cz>, Sasha Levin <sashal@kernel.org>,
        linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 24/52] HID: hid-input: add Surface Go battery quirk
Date:   Mon,  5 Jul 2021 11:28:45 -0400
Message-Id: <20210705152913.1521036-24-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210705152913.1521036-1-sashal@kernel.org>
References: <20210705152913.1521036-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Zoltan Tamas Vajda <zoltan.tamas.vajda@gmail.com>

[ Upstream commit b5539722eb832441f309642fe5102cc3536f92b8 ]

The Elantech touchscreen/digitizer in the Surface Go mistakenly reports
having a battery. This results in a low battery message every time you
try to use the pen.

This patch adds a quirk to ignore the non-existent battery and
gets rid of the false low battery messages.

Signed-off-by: Zoltan Tamas Vajda <zoltan.tamas.vajda@gmail.com>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-ids.h   | 1 +
 drivers/hid/hid-input.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 03978111d944..06168f485722 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -397,6 +397,7 @@
 #define USB_DEVICE_ID_HP_X2_10_COVER	0x0755
 #define I2C_DEVICE_ID_HP_SPECTRE_X360_15	0x2817
 #define USB_DEVICE_ID_ASUS_UX550_TOUCHSCREEN	0x2706
+#define I2C_DEVICE_ID_SURFACE_GO_TOUCHSCREEN	0x261A
 
 #define USB_VENDOR_ID_ELECOM		0x056e
 #define USB_DEVICE_ID_ELECOM_BM084	0x0061
diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index e982d8173c9c..bf5e728258c1 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -326,6 +326,8 @@ static const struct hid_device_id hid_battery_quirks[] = {
 	  HID_BATTERY_QUIRK_IGNORE },
 	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_HP_SPECTRE_X360_15),
 	  HID_BATTERY_QUIRK_IGNORE },
+	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_SURFACE_GO_TOUCHSCREEN),
+	  HID_BATTERY_QUIRK_IGNORE },
 	{}
 };
 
-- 
2.30.2

