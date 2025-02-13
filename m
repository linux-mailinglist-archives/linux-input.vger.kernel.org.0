Return-Path: <linux-input+bounces-10020-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A853A3495F
	for <lists+linux-input@lfdr.de>; Thu, 13 Feb 2025 17:15:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E2E53ACDC9
	for <lists+linux-input@lfdr.de>; Thu, 13 Feb 2025 16:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C504200B89;
	Thu, 13 Feb 2025 16:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="muKJc5EI"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2CB19AD93;
	Thu, 13 Feb 2025 16:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739462929; cv=none; b=UPEfg4f8fHS10Px2O/+ek6FPawiLTa19Bo79NEayk16TufSFL0/1dzGlFIcu0/MqiiGyP5fELC1ewF+hHUZbkPDbGi0FBRaPbkKBpYkr4SCGjzaV63Rbr65nsttwYSmaLm3eGrfXOxOWrVIbopm7y6eu/6z0lps1jZuys0DZAmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739462929; c=relaxed/simple;
	bh=+3dGEXxe1J9c8jze7I42nDGbJ+yy6cckMRbHsaZ5cnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YwB4Oe/5J/prqZ7AzK9degluhW5lYHKMOgiF9AZCFCpTyQf8K7TCWpFNu2r1Lu+ibHkPj75FKX2ux2O7cojBRXX1fkBW6A4FX/YIDzb9hx9Y8nGbZD6satPfQJlri57MfyNY2dBp9HinJqK0RYQsKH6FJ5N2Fazym+uH6l0QNGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=muKJc5EI; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from wse-pc.fritz.box (pd9e59260.dip0.t-ipconnect.de [217.229.146.96])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id D303A2FC0177;
	Thu, 13 Feb 2025 17:08:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1739462918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0ymx5FJjRZUlDUtXNEhGGI4i4e1P/l6fPNUrTmYEgLY=;
	b=muKJc5EIBeiC7D3bJ1bwRkgl5uZ2fB9el32gHyy93myP28GYoeY0YEFpQufEVRa6RWGNiR
	SWfb9m40FekwFOYLwPnAl6bnF8f70SMLnmpdNYAkrvVb8+E33TNtlsP26fsQ39GueP4+pd
	m+KXcDNOYd5pgMMiAYunEG/4eEBqPCQ=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] Input: i8042: Swap old quirk combination with new quirk for more devices
Date: Thu, 13 Feb 2025 16:47:12 +0100
Message-ID: <20250213160832.74484-4-wse@tuxedocomputers.com>
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

We could not activly retest these devices because we no longer have them in
our archive, but based on the other old Clevo barebones we tested where the
new quirk had the same or a better behaviour I think it would be good to
apply it on these too.

Cc: <stable@vger.kernel.org>
Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/input/serio/i8042-acpipnpio.h | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/input/serio/i8042-acpipnpio.h b/drivers/input/serio/i8042-acpipnpio.h
index d4ff34d36b42c..78e0d9c20800d 100644
--- a/drivers/input/serio/i8042-acpipnpio.h
+++ b/drivers/input/serio/i8042-acpipnpio.h
@@ -1175,22 +1175,19 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
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
@@ -1257,8 +1254,7 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "NJ50_70CU"),
 		},
-		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
-					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
+		.driver_data = (void *)(SERIO_QUIRK_FORCENORESTORE)
 	},
 	{
 		.matches = {
@@ -1275,16 +1271,14 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
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
@@ -1295,8 +1289,7 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
 		.matches = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "P65_P67H"),
 		},
-		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
-					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
+		.driver_data = (void *)(SERIO_QUIRK_FORCENORESTORE)
 	},
 	{
 		/*
@@ -1307,8 +1300,7 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
 		.matches = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "P65_67RP"),
 		},
-		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
-					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
+		.driver_data = (void *)(SERIO_QUIRK_FORCENORESTORE)
 	},
 	{
 		/*
@@ -1330,8 +1322,7 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
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


