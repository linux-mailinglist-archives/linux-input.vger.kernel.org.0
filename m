Return-Path: <linux-input+bounces-10222-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F167A4033F
	for <lists+linux-input@lfdr.de>; Sat, 22 Feb 2025 00:02:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F07003B9B20
	for <lists+linux-input@lfdr.de>; Fri, 21 Feb 2025 23:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 566CE204F6F;
	Fri, 21 Feb 2025 23:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="XA5fK0+k"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CD81FBC99;
	Fri, 21 Feb 2025 23:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740178920; cv=none; b=Kr4Sp2QcDgMYFqtzJP5D3W1K3JNVO8i7OiseFt0Hkhnd1mYhO3sWNEN854EnZFajZK3Z48Ki4uDuEU2QCgBlhUlY8nL9CMfbqh3WPZjsB47O1ew83zeRFa0/htFmO8AqKJLoUBya9+XVb2EJy4dm3Nfj7272SZtHXdcYDeKkRVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740178920; c=relaxed/simple;
	bh=DegeoGwVYljjNqey6muh/VN0r5oPKh/ANQQodhqzJes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jEN8EGYG43cj8G9mHDcxZQ+puIPRNaw919jODJdVROxUEkSIF6ACCfoZ9re2I9/ZiJBxvs95oHAnb25k18HFJ18Aiac5RjIpdtUyjbPlCAX1Ue3VutbrFvYhd7BBKkzjzFKWxh3L+IYb55yh3EEa0iXueAdhOMIQvaMmwChKgaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=XA5fK0+k; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from wse-pc.fritz.box (pd9e59f4f.dip0.t-ipconnect.de [217.229.159.79])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 5E2682FC0185;
	Sat, 22 Feb 2025 00:01:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1740178915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tHhmzhr7Ziur0krdvCYRc2Lh7LuD7GacPURNA5oynU4=;
	b=XA5fK0+kLTlvPBJNVVcySMoJwKlt8Gwk0nLuCLe7C+PA1mvb5isD2zmyxzJFTnLgycsEC2
	Po0fbd3QPu6q/GVq8IN7wuPOfZXW3jcocdOCqU4RGlYjKxlrUeQhwrrtyNhg5sIBNVTMMD
	i8hrfGtvoMMWxm7oqMkkoXmUinQRfwc=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] Input: i8042: Add required quirks for missing old boardnames
Date: Sat, 22 Feb 2025 00:01:23 +0100
Message-ID: <20250221230137.70292-2-wse@tuxedocomputers.com>
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

The PB71RD keyboard is sometimes laggy after resume and the PC70DR, PB51RF,
P640RE, and PCX0DX_GN20 keyboard is sometimes unresponsive after resume.
This quirk fixes that.

Cc: stable@vger.kernel.org
Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/input/serio/i8042-acpipnpio.h | 30 +++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/input/serio/i8042-acpipnpio.h b/drivers/input/serio/i8042-acpipnpio.h
index a764248ea11d3..57a6eec4c2a5d 100644
--- a/drivers/input/serio/i8042-acpipnpio.h
+++ b/drivers/input/serio/i8042-acpipnpio.h
@@ -1260,6 +1260,12 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
 		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
 					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "P640RE"),
+		},
+		.driver_data = (void *)(SERIO_QUIRK_FORCENORESTORE)
+	},
 	{
 		/*
 		 * This is only a partial board_name and might be followed by
@@ -1335,6 +1341,24 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
 		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
 					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "PB51RF"),
+		},
+		.driver_data = (void *)(SERIO_QUIRK_FORCENORESTORE)
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "PB71RD"),
+		},
+		.driver_data = (void *)(SERIO_QUIRK_FORCENORESTORE)
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "PC70DR"),
+		},
+		.driver_data = (void *)(SERIO_QUIRK_FORCENORESTORE)
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "PCX0DX"),
@@ -1342,6 +1366,12 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
 		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
 					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "PCX0DX_GN20"),
+		},
+		.driver_data = (void *)(SERIO_QUIRK_FORCENORESTORE)
+	},
 	/* See comment on TUXEDO InfinityBook S17 Gen6 / Clevo NS70MU above */
 	{
 		.matches = {
-- 
2.43.0


