Return-Path: <linux-input+bounces-10019-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FFBA34914
	for <lists+linux-input@lfdr.de>; Thu, 13 Feb 2025 17:08:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 065DF7A06EC
	for <lists+linux-input@lfdr.de>; Thu, 13 Feb 2025 16:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCBA01FFC41;
	Thu, 13 Feb 2025 16:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="M8TsUpcC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0CC155326;
	Thu, 13 Feb 2025 16:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739462928; cv=none; b=oR5UX37fJUrcBujg+kusMF0YT4RA1uy28+klUyJi2ZhYxr7LGNSEwe/YCCbGmILjNoRudS/OjL1mwR1h7eFxIb0GurCGOGntsVr23df9enfepv8ubZ3R3h2z4Cmamp/szRrAEGfTtx5X3OPi7+iY3Nx20cRFt1t9J18JKZ8qDcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739462928; c=relaxed/simple;
	bh=yPAMxxGTrT8H0Bo8BpC2M4sOrTJMZapw3UWeayZE8tU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=btj5qq8T/cLs84wVMgVhumlAaA3DYo+jwBR45RSQkkqREtE5WzH6PJkymV+cIrBECmdvBu33foWRIDQupABseo2LamSWcXrE8FgFG0VBcQNnczRUs6uk4VuQhTcndIGQtOpfb51uuER92LLm7CNwAaTuiLNThtPe4nUNDes5pyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=M8TsUpcC; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from wse-pc.fritz.box (pd9e59260.dip0.t-ipconnect.de [217.229.146.96])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 5260C2FC0175;
	Thu, 13 Feb 2025 17:08:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1739462918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EwATY4OTi4AX0NNbg9JOVg6QGgVG8ET/pYC9cJrr+Bg=;
	b=M8TsUpcCdC8jKfWyTjecFTawd3WmXoGrobckjKoyp9EvL9S+jq+onKExlIvR0eD1QTa3jl
	esH4Wq80m4f9y/K+eJWcHN2APar/VVGMFo+hjBkn8sguNDSnmC0fpU3Iw6kjLVw9E9t1Aw
	UhMSPB9yyqT6Ni/+2nVMnbmP2BCK1+Y=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] Input: i8042: Swap old quirk combination with new quirk for severl devices
Date: Thu, 13 Feb 2025 16:47:11 +0100
Message-ID: <20250213160832.74484-3-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250213160832.74484-1-wse@tuxedocomputers.com>
References: <20250213160832.74484-1-wse@tuxedocomputers.com>
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

While the old quirk combination did not show negative effects on these
devices specifically, the new quirk works just as well and seems more
stable in general.

Cc: <stable@vger.kernel.org>
Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/input/serio/i8042-acpipnpio.h | 40 ++++++++++-----------------
 1 file changed, 14 insertions(+), 26 deletions(-)

diff --git a/drivers/input/serio/i8042-acpipnpio.h b/drivers/input/serio/i8042-acpipnpio.h
index a0a99f06c6685..d4ff34d36b42c 100644
--- a/drivers/input/serio/i8042-acpipnpio.h
+++ b/drivers/input/serio/i8042-acpipnpio.h
@@ -1080,16 +1080,14 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
 			DMI_MATCH(DMI_BOARD_NAME, "AURA1501"),
 		},
-		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
-					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
+		.driver_data = (void *)(SERIO_QUIRK_FORCENORESTORE)
 	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
 			DMI_MATCH(DMI_BOARD_NAME, "EDUBOOK1502"),
 		},
-		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
-					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
+		.driver_data = (void *)(SERIO_QUIRK_FORCENORESTORE)
 	},
 	{
 		/* Mivvy M310 */
@@ -1171,8 +1169,7 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "LAPQC71A"),
 		},
-		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
-					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
+		.driver_data = (void *)(SERIO_QUIRK_FORCENORESTORE)
 	},
 	{
 		.matches = {
@@ -1205,8 +1202,7 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "NH5xAx"),
 		},
-		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
-					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
+		.driver_data = (void *)(SERIO_QUIRK_FORCENORESTORE)
 	},
 	{
 		/*
@@ -1225,8 +1221,7 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "NL5xRU"),
 		},
-		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
-					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
+		.driver_data = (void *)(SERIO_QUIRK_FORCENORESTORE)
 	},
 	/*
 	 * At least one modern Clevo barebone has the touchpad connected both
@@ -1242,17 +1237,15 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "NS50MU"),
 		},
-		.driver_data = (void *)(SERIO_QUIRK_NOAUX | SERIO_QUIRK_NOMUX |
-					SERIO_QUIRK_RESET_ALWAYS | SERIO_QUIRK_NOLOOP |
-					SERIO_QUIRK_NOPNP)
+		.driver_data = (void *)(SERIO_QUIRK_NOAUX |
+					SERIO_QUIRK_FORCENORESTORE)
 	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "NS50_70MU"),
 		},
-		.driver_data = (void *)(SERIO_QUIRK_NOAUX | SERIO_QUIRK_NOMUX |
-					SERIO_QUIRK_RESET_ALWAYS | SERIO_QUIRK_NOLOOP |
-					SERIO_QUIRK_NOPNP)
+		.driver_data = (void *)(SERIO_QUIRK_NOAUX |
+					SERIO_QUIRK_FORCENORESTORE)
 	},
 	{
 		.matches = {
@@ -1326,8 +1319,7 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
 		.matches = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "P65_67RS"),
 		},
-		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
-					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
+		.driver_data = (void *)(SERIO_QUIRK_FORCENORESTORE)
 	},
 	{
 		/*
@@ -1345,8 +1337,7 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "PB50_70DFx,DDx"),
 		},
-		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
-					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
+		.driver_data = (void *)(SERIO_QUIRK_FORCENORESTORE)
 	},
 	{
 		.matches = {
@@ -1370,8 +1361,7 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "PCX0DX"),
 		},
-		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
-					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
+		.driver_data = (void *)(SERIO_QUIRK_FORCENORESTORE)
 	},
 	/* See comment on TUXEDO InfinityBook S17 Gen6 / Clevo NS70MU above */
 	{
@@ -1384,15 +1374,13 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "X170SM"),
 		},
-		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
-					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
+		.driver_data = (void *)(SERIO_QUIRK_FORCENORESTORE)
 	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "X170KM-G"),
 		},
-		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
-					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
+		.driver_data = (void *)(SERIO_QUIRK_FORCENORESTORE)
 	},
 	{
 		/*
-- 
2.43.0


