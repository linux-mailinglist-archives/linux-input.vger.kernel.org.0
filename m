Return-Path: <linux-input+bounces-9563-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8CFA1CADF
	for <lists+linux-input@lfdr.de>; Sun, 26 Jan 2025 16:35:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2F6047A1F34
	for <lists+linux-input@lfdr.de>; Sun, 26 Jan 2025 15:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCDC12153EC;
	Sun, 26 Jan 2025 15:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S6K9wqqL"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D70B214A9E;
	Sun, 26 Jan 2025 15:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737903781; cv=none; b=G9mM0L8tR1iMfCy9IrvLtDp1jOX1JqMqnh2nKR9z6BzpCKr36iYZa2x1zK1oAxuFxtpK15BfckmM3kx2WyaePJdTcEJ/ovj5bEqsy31fNAD8mPJGJNdaXQWodVxszLXbBR5JWJcoTyGc1t325eKbq+D6cc7VOVz2g6J/jlgkDSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737903781; c=relaxed/simple;
	bh=qBZkjaeQxQ07wNcU2MYWYdT6WrviT3pRyCwB3X08wnc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n5XBwZ3Jv7fcfDui2GWABweUNLJxTvLjmlpfQvdyfiSme+aqTCVaVb+x/G13Nelbp0nlGaQELX6/AafPOCequGtJU1NH9ZkDdYhVtiGXi/1KZlL73Rhq8SN2EHPl3DIj5byfDtYfHseZdy+88mT0l9ZDAFy5pq7kCDLO1o5JbCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S6K9wqqL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12C27C4CED3;
	Sun, 26 Jan 2025 15:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737903781;
	bh=qBZkjaeQxQ07wNcU2MYWYdT6WrviT3pRyCwB3X08wnc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S6K9wqqL9j/aRjpcUBDV9MXCpI1mQJzaV4Z6V4ea665bawNH95+Dab5J/6zvfK468
	 Usuo3FejkpXeHzodjrpiAdwiQgpkpfrrVu/PAcISN5YXevaTqC8t0Syae+F2Nim9EH
	 f14t53qe+mFk402Meqyh/ttX9OFuV14QSNHKNjXh0tjJPF3uBhSzznPQXoUYssY00H
	 NQWuEfJ8IS678s9y9pBOZZt5Udbx4QbRDHGNvKp8XpmRlHuL092+ewsa7RmvmwaTol
	 pvlLuRaeWo2tfE8UeRyO+wFuORkH+uue9jy2aPXkGxjDTNn7xIyyZq+8FfzCWjxJJS
	 oYcVXz+W1d0ow==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: "Luke D. Jones" <luke@ljones.dev>,
	Connor Belli <connorbelli2003@gmail.com>,
	Jan Schmidt <jan@centricular.com>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 23/29] HID: hid-asus: Disable OOBE mode on the ProArt P16
Date: Sun, 26 Jan 2025 10:02:04 -0500
Message-Id: <20250126150210.955385-23-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126150210.955385-1-sashal@kernel.org>
References: <20250126150210.955385-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.11
Content-Transfer-Encoding: 8bit

From: "Luke D. Jones" <luke@ljones.dev>

[ Upstream commit 53078a736fbc60e5d3a1e14f4cd4214003815026 ]

The new ASUS ProArt 16" laptop series come with their keyboards stuck in
an Out-Of-Box-Experience mode. While in this mode most functions will
not work such as LED control or Fn key combos. The correct init sequence
is now done to disable this OOBE.

This patch addresses only the ProArt series so far and it is unknown if
there may be others, in which case a new quirk may be required.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
Co-developed-by: Connor Belli <connorbelli2003@gmail.com>
Signed-off-by: Connor Belli <connorbelli2003@gmail.com>
Tested-by: Jan Schmidt <jan@centricular.com>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-asus.c                     | 26 ++++++++++++++++++++++
 include/linux/platform_data/x86/asus-wmi.h |  5 +++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index a4b47319ad8ea..bcdd168cdc6d7 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -432,6 +432,26 @@ static int asus_kbd_get_functions(struct hid_device *hdev,
 	return ret;
 }
 
+static int asus_kbd_disable_oobe(struct hid_device *hdev)
+{
+	const u8 init[][6] = {
+		{ FEATURE_KBD_REPORT_ID, 0x05, 0x20, 0x31, 0x00, 0x08 },
+		{ FEATURE_KBD_REPORT_ID, 0xBA, 0xC5, 0xC4 },
+		{ FEATURE_KBD_REPORT_ID, 0xD0, 0x8F, 0x01 },
+		{ FEATURE_KBD_REPORT_ID, 0xD0, 0x85, 0xFF }
+	};
+	int ret;
+
+	for (size_t i = 0; i < ARRAY_SIZE(init); i++) {
+		ret = asus_kbd_set_report(hdev, init[i], sizeof(init[i]));
+		if (ret < 0)
+			return ret;
+	}
+
+	hid_info(hdev, "Disabled OOBE for keyboard\n");
+	return 0;
+}
+
 static void asus_schedule_work(struct asus_kbd_leds *led)
 {
 	unsigned long flags;
@@ -534,6 +554,12 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
 		ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
 		if (ret < 0)
 			return ret;
+
+		if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
+			ret = asus_kbd_disable_oobe(hdev);
+			if (ret < 0)
+				return ret;
+		}
 	} else {
 		/* Initialize keyboard */
 		ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 365e119bebaa2..783e2a336861b 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -184,6 +184,11 @@ static const struct dmi_system_id asus_use_hid_led_dmi_ids[] = {
 			DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Flow"),
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "ProArt P16"),
+		},
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "GA403U"),
-- 
2.39.5


