Return-Path: <linux-input+bounces-10123-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 64ABBA3A8CF
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 21:26:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D386D174AF4
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 20:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63D581DD0EF;
	Tue, 18 Feb 2025 20:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J3AKXNPz"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D221DC9B8;
	Tue, 18 Feb 2025 20:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739910318; cv=none; b=gwNZNojGAA3BsI2I8KEM6UBZ1D14Z1TBepTM//dhL86ZMagnfEz+xv8Fi+7PrDdzSI6g++lfBPWvhicbJnrI7yVpIMmTCfDOJHd4MMbM0YCNOVXFz5LLTsZJoIpkEgXTxRUEwsaJXJ6rtyHE+8OTzqU9L+Ti9VYkGJvj83p05tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739910318; c=relaxed/simple;
	bh=C5BPq89M2RP3x6D7xri/ACzwZFJAcWpV4c9Opb8ihyc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d4w7cQCvBdAGP5Zf+GdnTU1qQ3goWtgLy2iNnDnTq/bYHM/bgXWEO6sz1Qd7Huapm/ERb8Q+6nPa7836ZAwRe3TpQl6M4nK9FKYQR0wS+z6B2H7JfIRo+MjlDZ+2QdbwnCKcUAo5d86GpHU3TBOaIAroz9h8UdLCE6F/Nbhf5sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J3AKXNPz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6DF4C4CEE2;
	Tue, 18 Feb 2025 20:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739910317;
	bh=C5BPq89M2RP3x6D7xri/ACzwZFJAcWpV4c9Opb8ihyc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J3AKXNPznWyXOMNDqP6SSWvwTq+I/KAgjIb9iFZZXQpzf4wdLv2FCTBD6DmwqOyD8
	 45VeMMSIvT8XB7xRSyKTNuNZyxhmfO0r6nAlYKb3CZoIqCpyovEr+nnXewCJCa4gKY
	 8ivZoZ0YMfDLYxDnQQWTN9Gk4QuZrLLMskTPRekbS3G7B//F5GDylSPUzmRTJhqg1L
	 fy4JvkX5zzAaNNdedbL4Ql8s0jeOOuzpreTGVOloEM18i0WNhNUCf1D4AO3vVEpOdK
	 e+n/moC6gRPuwIWoaQK8l06s1pwNBLeL2kon925IpK83r7BY3+MGC0bRKQ51Cz1Aoi
	 L2J3ixsraKDWQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Daniel Brackenbury <daniel.brackenbury@gmail.com>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.13 08/31] HID: topre: Fix n-key rollover on Realforce R3S TKL boards
Date: Tue, 18 Feb 2025 15:24:28 -0500
Message-Id: <20250218202455.3592096-8-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250218202455.3592096-1-sashal@kernel.org>
References: <20250218202455.3592096-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.3
Content-Transfer-Encoding: 8bit

From: Daniel Brackenbury <daniel.brackenbury@gmail.com>

[ Upstream commit 9271af9d846c7e49c8709b58d5853cb73c00b193 ]

Newer model R3* Topre Realforce keyboards share an issue with their older
R2 cousins where a report descriptor fixup is needed in order for n-key
rollover to work correctly, otherwise only 6-key rollover is available.
This patch adds some new hardware IDs for the R3S 87-key keyboard and
makes amendments to the existing hid-topre driver in order to change the
correct byte in the new model.

Signed-off-by: Daniel Brackenbury <daniel.brackenbury@gmail.com>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/Kconfig     | 3 ++-
 drivers/hid/hid-ids.h   | 1 +
 drivers/hid/hid-topre.c | 7 +++++++
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 4d2a89d65b658..363c860835d35 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1167,7 +1167,8 @@ config HID_TOPRE
 	tristate "Topre REALFORCE keyboards"
 	depends on HID
 	help
-	  Say Y for N-key rollover support on Topre REALFORCE R2 108/87 key keyboards.
+	  Say Y for N-key rollover support on Topre REALFORCE R2 108/87 key and
+          Topre REALFORCE R3S 87 key keyboards.
 
 config HID_THINGM
 	tristate "ThingM blink(1) USB RGB LED"
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 43a6f1d243a62..4df0bfc3c8413 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1300,6 +1300,7 @@
 #define USB_VENDOR_ID_TOPRE			0x0853
 #define USB_DEVICE_ID_TOPRE_REALFORCE_R2_108			0x0148
 #define USB_DEVICE_ID_TOPRE_REALFORCE_R2_87			0x0146
+#define USB_DEVICE_ID_TOPRE_REALFORCE_R3S_87			0x0313
 
 #define USB_VENDOR_ID_TOPSEED		0x0766
 #define USB_DEVICE_ID_TOPSEED_CYBERLINK	0x0204
diff --git a/drivers/hid/hid-topre.c b/drivers/hid/hid-topre.c
index 848361f6225df..ccedf8721722e 100644
--- a/drivers/hid/hid-topre.c
+++ b/drivers/hid/hid-topre.c
@@ -29,6 +29,11 @@ static const __u8 *topre_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		hid_info(hdev,
 			"fixing up Topre REALFORCE keyboard report descriptor\n");
 		rdesc[72] = 0x02;
+	} else if (*rsize >= 106 && rdesc[28] == 0x29 && rdesc[29] == 0xe7 &&
+				    rdesc[30] == 0x81 && rdesc[31] == 0x00) {
+		hid_info(hdev,
+			"fixing up Topre REALFORCE keyboard report descriptor\n");
+		rdesc[31] = 0x02;
 	}
 	return rdesc;
 }
@@ -38,6 +43,8 @@ static const struct hid_device_id topre_id_table[] = {
 			 USB_DEVICE_ID_TOPRE_REALFORCE_R2_108) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_TOPRE,
 			 USB_DEVICE_ID_TOPRE_REALFORCE_R2_87) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_TOPRE,
+			 USB_DEVICE_ID_TOPRE_REALFORCE_R3S_87) },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, topre_id_table);
-- 
2.39.5


