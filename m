Return-Path: <linux-input+bounces-10223-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76781A4033C
	for <lists+linux-input@lfdr.de>; Sat, 22 Feb 2025 00:02:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51CEB17A2BF
	for <lists+linux-input@lfdr.de>; Fri, 21 Feb 2025 23:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D33382063EF;
	Fri, 21 Feb 2025 23:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="cabzcWSv"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD2B1FF5EF;
	Fri, 21 Feb 2025 23:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740178920; cv=none; b=ecsbg3dKD6zFwQeg8jPYrF25I46jZFfIZU/L+PtCq2Bb9FPJ11EMKuR2Hd08XRuXaGHVLocVLzEAUXKxv4dRaQeH9yamLu6SeTCZ7ySMi+QWpogTvfd3AnEXEi/TxxqNXSdWCjIB+hneDqw1UwPjbWb2LaUlBKSmard1p2slWUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740178920; c=relaxed/simple;
	bh=OachKzT2qae4SgKkmWDuqmXctVhEzcBUNYqyh+eA2Ow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rtFgkLEI7mCiMuOjbVF3Of/G9oibjG1sAJG9AKYnY8zxWpzbKQ2DHFTwGCQgVDN1yw8Ed5/X6ba1nGHCrube1FvUmDEIIwPNr02YbDxVWRP89KJR5mT5RbDCBrHm0eBW9sgyZ8Jb1EQYMGP+eE8C2biDV/fXWRkknxb9/fjUaM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=cabzcWSv; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from wse-pc.fritz.box (pd9e59f4f.dip0.t-ipconnect.de [217.229.159.79])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 5E0432FC0187;
	Sat, 22 Feb 2025 00:01:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1740178916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1d/jtSUvd1W5JvrKkkLP0a8sNzVu0PMIg17cruqw1HQ=;
	b=cabzcWSvzXI0ZKYzinshoLn9LoG0EICCCkXZl1jnTLXqR8BBq4FIEdaiccWb32Mr7tOZ0Q
	UjTJfJCnMC3ZYIVFo19G8W+Olbf5wvxLm3IPd2e+78URIL8XxZGufHsGneNE0H0HJ5t4eY
	uh8dtpEg66JxRQwk5tNIcQhdW7FXn3U=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] Input: i8042: Swap old quirk combination with new quirk for more devices
Date: Sat, 22 Feb 2025 00:01:25 +0100
Message-ID: <20250221230137.70292-4-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250221230137.70292-1-wse@tuxedocomputers.com>
References: <20250221230137.70292-1-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some older Clevo barebones have problems like no or laggy keyboard after
resume or boot which can be fixed with the SERIO_QUIRK_FORCENORESTORE
quirk.

We could not activly retest these devices because we no longer have them in
our archive, but based on the other old Clevo barebones we tested where the
new quirk had the same or a better behaviour I think it would be good to
apply it on these too.

Cc: stable@vger.kernel.org
Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/input/serio/i8042-acpipnpio.h | 31 +++++++++------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/drivers/input/serio/i8042-acpipnpio.h b/drivers/input/serio/i8042-acpipnpio.h
index 9df1ef6032dd0..6ed9fc34948cb 100644
--- a/drivers/input/serio/i8042-acpipnpio.h
+++ b/drivers/input/serio/i8042-acpipnpio.h
@@ -1157,9 +1157,7 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
 	},
 	/*
 	 * A lot of modern Clevo barebones have touchpad and/or keyboard issues
-	 * after suspend fixable with nomux + reset + noloop + nopnp. Luckily,
-	 * none of them have an external PS/2 port so this can safely be set for
-	 * all of them.
+	 * after suspend fixable with the forcenorestore quirk.
 	 * Clevo barebones come with board_vendor and/or system_vendor set to
 	 * either the very generic string "Notebook" and/or a different value
 	 * for each individual reseller. The only somewhat universal way to
@@ -1175,22 +1173,19 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "LAPQC71B"),
 		},
-		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
-					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
+		.driver_data = (void *)(SERIO_QUIRK_FORCENORESTORE)
 	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "N140CU"),
 		},
-		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
-					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
+		.driver_data = (void *)(SERIO_QUIRK_FORCENORESTORE)
 	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "N141CU"),
 		},
-		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
-					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
+		.driver_data = (void *)(SERIO_QUIRK_FORCENORESTORE)
 	},
 	{
 		.matches = {
@@ -1250,8 +1245,7 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "NJ50_70CU"),
 		},
-		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
-					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
+		.driver_data = (void *)(SERIO_QUIRK_FORCENORESTORE)
 	},
 	{
 		.matches = {
@@ -1268,16 +1262,14 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
 		.matches = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "P65xH"),
 		},
-		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
-					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
+		.driver_data = (void *)(SERIO_QUIRK_FORCENORESTORE)
 	},
 	{
 		/* Clevo P650RS, 650RP6, Sager NP8152-S, and others */
 		.matches = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "P65xRP"),
 		},
-		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
-					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
+		.driver_data = (void *)(SERIO_QUIRK_FORCENORESTORE)
 	},
 	{
 		/*
@@ -1288,8 +1280,7 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
 		.matches = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "P65_P67H"),
 		},
-		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
-					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
+		.driver_data = (void *)(SERIO_QUIRK_FORCENORESTORE)
 	},
 	{
 		/*
@@ -1300,8 +1291,7 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
 		.matches = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "P65_67RP"),
 		},
-		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
-					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
+		.driver_data = (void *)(SERIO_QUIRK_FORCENORESTORE)
 	},
 	{
 		/*
@@ -1323,8 +1313,7 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
 		.matches = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "P67xRP"),
 		},
-		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
-					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
+		.driver_data = (void *)(SERIO_QUIRK_FORCENORESTORE)
 	},
 	{
 		.matches = {
-- 
2.43.0


