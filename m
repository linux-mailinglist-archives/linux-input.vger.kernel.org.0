Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FB56291EE1
	for <lists+linux-input@lfdr.de>; Sun, 18 Oct 2020 21:55:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728528AbgJRTTt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 18 Oct 2020 15:19:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:58836 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728507AbgJRTTs (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 18 Oct 2020 15:19:48 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F12DB2231B;
        Sun, 18 Oct 2020 19:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603048787;
        bh=uUyTXgI6jYAJU9AVM4orfdI8UW1gZrJHFWnZWdWwL7g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=R3mqBTYp4JP+VnAlqjWvL/UN2fkBXH8T/sg3843TCgqDtmtpvV7pVU4vi8o3xZEtc
         f1JIGvJSEY+qzXucyZK6Zr6JHRX7JxSNdfJYkNNoDSQ52nZkpBCWA6lA9bLluJ6pBc
         KrUwjq9cSp8qwZWOfgutRLNoK0hM0E6mIIoNqBFg=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>, Jiri Kosina <jkosina@suse.cz>,
        Sasha Levin <sashal@kernel.org>, linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 5.9 083/111] HID: ite: Add USB id match for Acer One S1003 keyboard dock
Date:   Sun, 18 Oct 2020 15:17:39 -0400
Message-Id: <20201018191807.4052726-83-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201018191807.4052726-1-sashal@kernel.org>
References: <20201018191807.4052726-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit 5bf2f2f331ad812c9b7eea6e14a3ea328acbffc0 ]

The Acer One S1003 2-in-1 keyboard dock uses a Synaptics S910xx touchpad
which is connected to an ITE 8910 USB keyboard controller chip.

This keyboard has the same quirk for its rfkill / airplane mode hotkey as
other keyboards with ITE keyboard chips, it only sends a single release
event when pressed and released, it never sends a press event.

This commit adds this keyboards USB id to the hid-ite id-table, fixing
the rfkill key not working on this keyboard. Note that like for the
Acer Aspire Switch 10 (SW5-012) the id-table entry matches on the
HID_GROUP_GENERIC generic group so that hid-ite only binds to the
keyboard interface and the mouse/touchpad interface is left untouched
so that hid-multitouch can bind to it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-ids.h | 1 +
 drivers/hid/hid-ite.c | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 6a6e2c1b60900..79495e218b7fc 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1124,6 +1124,7 @@
 #define USB_DEVICE_ID_SYNAPTICS_DELL_K12A	0x2819
 #define USB_DEVICE_ID_SYNAPTICS_ACER_SWITCH5_012	0x2968
 #define USB_DEVICE_ID_SYNAPTICS_TP_V103	0x5710
+#define USB_DEVICE_ID_SYNAPTICS_ACER_ONE_S1003	0x73f5
 #define USB_DEVICE_ID_SYNAPTICS_ACER_SWITCH5	0x81a7
 
 #define USB_VENDOR_ID_TEXAS_INSTRUMENTS	0x2047
diff --git a/drivers/hid/hid-ite.c b/drivers/hid/hid-ite.c
index 6c55682c59740..044a93f3c1178 100644
--- a/drivers/hid/hid-ite.c
+++ b/drivers/hid/hid-ite.c
@@ -44,6 +44,10 @@ static const struct hid_device_id ite_devices[] = {
 	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
 		     USB_VENDOR_ID_SYNAPTICS,
 		     USB_DEVICE_ID_SYNAPTICS_ACER_SWITCH5_012) },
+	/* ITE8910 USB kbd ctlr, with Synaptics touchpad connected to it. */
+	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
+		     USB_VENDOR_ID_SYNAPTICS,
+		     USB_DEVICE_ID_SYNAPTICS_ACER_ONE_S1003) },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, ite_devices);
-- 
2.25.1

