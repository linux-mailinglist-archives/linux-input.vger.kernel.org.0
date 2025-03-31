Return-Path: <linux-input+bounces-11401-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FB6A76996
	for <lists+linux-input@lfdr.de>; Mon, 31 Mar 2025 17:13:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DA70189140F
	for <lists+linux-input@lfdr.de>; Mon, 31 Mar 2025 15:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09AF622D4F6;
	Mon, 31 Mar 2025 14:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CbpAYX2u"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D216522D4EF;
	Mon, 31 Mar 2025 14:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743432861; cv=none; b=jw3OJMnzZ/LGfAtmhjs+J4A24/sdRcK5Vw8ba7xr0eimAMMNt+4QD4c7U4knflUjy0nDcw4BUEEHBgA34xbXFmHXmkV5FtcEbJBRx/Dd017bGVqazyk0YEpVhRZPirgWYXm1gyyIFUSihNDWzVKk5w59ohYXhmHiBi5Iy+wk/MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743432861; c=relaxed/simple;
	bh=bR9loiAosq18/UmjopG2hMorkY4VpSBlgHvbcZ/wMOY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fWcSnGyeXsNsNFS/1/odp5H3curdHGdAZhSinI312yHOWm5VHFdY/qz4iroDFwvKQuykWgFfkKS6QU5kp7AZBV+4RV5Bl5Lz4T7jKvBKV/hDV5FE6WrTCdcJUiUFqEzMX6fkeeG+jyHm7zIt/D17SJC+WBanrjv4DXB1EA0vig8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CbpAYX2u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6EAEC4CEED;
	Mon, 31 Mar 2025 14:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743432861;
	bh=bR9loiAosq18/UmjopG2hMorkY4VpSBlgHvbcZ/wMOY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CbpAYX2uzZNtYmzYz6/m52LnYCXJX6XwVQICM8lpveYY6Qc33TZ8nzTzYblzF94Nq
	 +DHHsiz5br81BmHoZaad+b/19WofceCOBMdc585yjmEe6wK3O+jWLjrCZkmyuPD6Qz
	 CxhrBD1wOygL7hRq8sM48X/QSKXUyFXCzuAiPA14EiNd+yTBbuGtoRmbKB88cD4IoR
	 8kf5rInxWjiFSutuTKwslQk3oszYFh+rdIn6UGf4MWNZlH/8G5Qqwj+LZ+ViogIHqX
	 MGna2wSEqPQlJH7jEfQUXYcLSlZH798SbG8kYZTBWWvcsc0V/mgx2xAOetq7hEqaFK
	 vRNas+2ubycFQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
	=?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>,
	Paul Dino Jones <paul@spacefreak18.xyz>,
	=?UTF-8?q?Crist=C3=B3ferson=20Bueno?= <cbueno81@gmail.com>,
	Pablo Cisneros <patchkez@protonmail.com>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.13 08/24] HID: pidff: Add hid_pidff_init_with_quirks and export as GPL symbol
Date: Mon, 31 Mar 2025 10:53:48 -0400
Message-Id: <20250331145404.1705141-8-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250331145404.1705141-1-sashal@kernel.org>
References: <20250331145404.1705141-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.9
Content-Transfer-Encoding: 8bit

From: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>

[ Upstream commit 36de0164bbaff1484288e84ac5df5cff00580263 ]

This lays out a way to provide an initial set of quirks to enable before
device initialization takes place. GPL symbol export needed for the
possibility of building HID drivers which use this function as modules.

Adding a wrapper function to ensure compatibility with the old behavior
of hid_pidff_init.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Michał Kopeć <michal@nozomi.space>
Reviewed-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Cristóferson Bueno <cbueno81@gmail.com>
Tested-by: Pablo Cisneros <patchkez@protonmail.com>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/usbhid/hid-pidff.c | 15 ++++++++++++++-
 include/linux/hid.h            |  2 ++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 5a57ba0d7026a..b8c2ba0a930c2 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -1268,8 +1268,9 @@ static int pidff_check_autocenter(struct pidff_device *pidff,
 
 /*
  * Check if the device is PID and initialize it
+ * Set initial quirks
  */
-int hid_pidff_init(struct hid_device *hid)
+int hid_pidff_init_with_quirks(struct hid_device *hid, __u32 initial_quirks)
 {
 	struct pidff_device *pidff;
 	struct hid_input *hidinput = list_entry(hid->inputs.next,
@@ -1291,6 +1292,7 @@ int hid_pidff_init(struct hid_device *hid)
 		return -ENOMEM;
 
 	pidff->hid = hid;
+	pidff->quirks = initial_quirks;
 
 	hid_device_io_start(hid);
 
@@ -1369,3 +1371,14 @@ int hid_pidff_init(struct hid_device *hid)
 	kfree(pidff);
 	return error;
 }
+EXPORT_SYMBOL_GPL(hid_pidff_init_with_quirks);
+
+/*
+ * Check if the device is PID and initialize it
+ * Wrapper made to keep the compatibility with old
+ * init function
+ */
+int hid_pidff_init(struct hid_device *hid)
+{
+	return hid_pidff_init_with_quirks(hid, 0);
+}
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 89a4dee377292..31dfe9ed5394b 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1224,8 +1224,10 @@ void hid_quirks_exit(__u16 bus);
 
 #ifdef CONFIG_HID_PID
 int hid_pidff_init(struct hid_device *hid);
+int hid_pidff_init_with_quirks(struct hid_device *hid, __u32 initial_quirks);
 #else
 #define hid_pidff_init NULL
+#define hid_pidff_init_with_quirks NULL
 #endif
 
 /* HID PIDFF quirks */
-- 
2.39.5


