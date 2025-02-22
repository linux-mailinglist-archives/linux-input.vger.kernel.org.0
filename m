Return-Path: <linux-input+bounces-10225-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC86A40A29
	for <lists+linux-input@lfdr.de>; Sat, 22 Feb 2025 17:44:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 609ED17F7B2
	for <lists+linux-input@lfdr.de>; Sat, 22 Feb 2025 16:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41E982066F7;
	Sat, 22 Feb 2025 16:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="CQMXtrHy"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4A1142E7C;
	Sat, 22 Feb 2025 16:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740242612; cv=none; b=tiflwSb3VLJPrJsFLTar77GxnG747Efn8mFtxUYNQ/Yl1gDM8KcPANzLiGElmtbFb+Vn6KrhZ9spe1IcN3iPGPk0xYDTB8Xlf4lenqpQL2wjud67mNt7H4SL/iYzKb5geeZHH8GmqeEAqf9hHVCKos8w+P4n/X13Kya85jdjpoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740242612; c=relaxed/simple;
	bh=sKaJCrlE4BhC8aXTitf0KLJi1lsJHRtP1kQj7VcoykU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hm9DzQOytfzEmmn4mCuy6NrABXQhpIV0Yl8ft2rsYzHZuZZE47Lyuw4q7VdenObViIHaQG82F6sgCh+VhGMbR8VPgGTVoJNrlGxVbpQwjXqwQjnkkEp3Xz0LWmjHf0tlbu9UAm9WC4RDLFMw0Oui2P3ZEwSXggBGUOP4MBtl+PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=CQMXtrHy; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id CD16E2E08E40;
	Sat, 22 Feb 2025 18:43:26 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1740242608;
	bh=7+Hqnbi4CckbZ3UHVVHfYVF3W8+HsiCxr26i5tBF09I=; h=From:To:Subject;
	b=CQMXtrHydIix3StOybVVpUjr8EkyQz9+IPLyfRnu4qD+wWSDk2ONyUG8n658r7SMJ
	 t6F3UJoylPo8tguyXdHvtXz2MsGf1V4dP/QWyFywNrhVqu0C5t3X3PJXxSKxAPLzLw
	 DTv6xSRK0rWP5dp+SFFryRZgfOQ7io3rKUDOwpo4=
Authentication-Results: linux1587.grserver.gr;
	spf=pass (sender IP is 2a05:f6c2:511b:0:cbc0:999f:73ad:33bd) smtp.mailfrom=lkml@antheas.dev smtp.helo=localhost.localdomain
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH 1/5] drm: panel-orientation-quirks: Add OneXPlayer X1 AMD and
 Intel quirk
Date: Sat, 22 Feb 2025 17:43:17 +0100
Message-ID: <20250222164321.181340-2-lkml@antheas.dev>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250222164321.181340-1-lkml@antheas.dev>
References: <20250222164321.181340-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174024260789.17064.14098660200534887923@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

The OneXPlayer X1 series features a 2k 10.95 display with a portrait
orientation. Add a quirk to set the panel orientation to portrait mode
to both the Intel and AMD variants.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 4a73821b81f6..17b4f57d64d7 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -443,6 +443,24 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONE XPLAYER"),
 		},
 		.driver_data = (void *)&lcd1600x2560_leftside_up,
+	}, {	/* OneXPlayer X1 AMD */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER X1 A"),
+		},
+		.driver_data = (void *)&lcd1600x2560_leftside_up,
+	}, {	/* OneXPlayer X1 AMD Strix Point */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER X1Pro"),
+		},
+		.driver_data = (void *)&lcd1600x2560_leftside_up,
+	}, {	/* OneXPlayer X1 Intel */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER X1 i"),
+		},
+		.driver_data = (void *)&lcd1600x2560_leftside_up,
 	}, {	/* OrangePi Neo */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "OrangePi"),
-- 
2.48.1


