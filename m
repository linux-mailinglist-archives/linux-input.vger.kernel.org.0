Return-Path: <linux-input+bounces-15621-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E91BF2138
	for <lists+linux-input@lfdr.de>; Mon, 20 Oct 2025 17:24:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A7B118C045A
	for <lists+linux-input@lfdr.de>; Mon, 20 Oct 2025 15:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E5E22676F4;
	Mon, 20 Oct 2025 15:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CglEuZqJ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766D3253F07;
	Mon, 20 Oct 2025 15:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760973818; cv=none; b=JJOuO1+/Z/bsFVHrpLDLNza9c6+tCtb9KkAVIfRzHjFSH7UcNJHCbO8b7lCCBmzYSCg/H/FbU9m8lB9Hg5MO6EOQbERhLHRT0bNhByTJ54seT5u2gSrpszREAxcYR2MVotV/BH5TDArJyMqDUcgfdVPem5T75RlLLliI4ZpLnqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760973818; c=relaxed/simple;
	bh=l8Wx1x9BG8D26KtZKH4D0hJqaiMFIUtK96WwDu/UeGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ta+avqXUeJ5qAviZ7GrYr3h5htTdQrb2gfNvXZ4JK1KJmBHDZhHV7PQH4ehf2We8wtNgRjUYXZ8vtt1CXChKillTZhMg3ThqxGNgZIYHFQrUEPt+eOJ4zIWYnMcvCNaid9nSMGPrWewv+1WnLneYsGF7gvq2PZ3TgeKWQIDmpT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CglEuZqJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7B9EC116B1;
	Mon, 20 Oct 2025 15:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760973818;
	bh=l8Wx1x9BG8D26KtZKH4D0hJqaiMFIUtK96WwDu/UeGE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CglEuZqJLbpg+W55X9HuWhqM913nxSPnBJrrsatkcOOahcUVbw+5ep35Ya8rSg7Qb
	 ns9FWLU48Lr75pfymc/ei9Tk09i3pE9HHUEnzFyDmumwhhbG0PCHrsKgn6Xoj+OdQm
	 PycbLNi3K3UF4CYUiG7p2NGNGRcnlr7xiriQ7FsjZU9IBCzX6aovosJroFFHFxtO18
	 yeprwoeb32WrI+OZNHW536s4odMoxb/9Fe2YCv7fEeB5+ueon6uo+i7lJYN3cKaUx5
	 kTv9lsjsmTU8lL6bkA3kBukvjvFctb+owI6hESSDdnTrz4PlCehNaYZl+Zu64QTim3
	 RoEtNH6AmCX1A==
From: Hans de Goede <hansg@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/2] platform/x86: dell-wmi-base: Handle electronic privacy screen on/off events
Date: Mon, 20 Oct 2025 17:23:31 +0200
Message-ID: <20251020152331.52870-3-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020152331.52870-1-hansg@kernel.org>
References: <20251020152331.52870-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add handling for events for the electronic privacy screen found on some
models (e.g. Dell Latitude 7300) being toggled on/off.

Emit KEY_EPRIVACY_SCREEN_OFF / KEY_EPRIVACY_SCREEN_ON events for this so
that userspace can show the usual on-screen-display (OSD) notification for
eprivacy screen on/off to the user.

Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/platform/x86/dell/dell-wmi-base.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/platform/x86/dell/dell-wmi-base.c b/drivers/platform/x86/dell/dell-wmi-base.c
index 841a5414d28a..28076929d6af 100644
--- a/drivers/platform/x86/dell/dell-wmi-base.c
+++ b/drivers/platform/x86/dell/dell-wmi-base.c
@@ -365,6 +365,13 @@ static const struct key_entry dell_wmi_keymap_type_0012[] = {
 	/* Backlight brightness change event */
 	{ KE_IGNORE, 0x0003, { KEY_RESERVED } },
 
+	/*
+	 * Electronic privacy screen toggled, extended data gives state,
+	 * separate entries for on/off see handling in dell_wmi_process_key().
+	 */
+	{ KE_KEY, 0x000c, { KEY_EPRIVACY_SCREEN_OFF } },
+	{ KE_KEY, 0x000c, { KEY_EPRIVACY_SCREEN_ON } },
+
 	/* Ultra-performance mode switch request */
 	{ KE_IGNORE, 0x000d, { KEY_RESERVED } },
 
@@ -435,6 +442,11 @@ static int dell_wmi_process_key(struct wmi_device *wdev, int type, int code, u16
 				      "Dell tablet mode switch",
 				      SW_TABLET_MODE, !buffer[0]);
 		return 1;
+	} else if (type == 0x0012 && code == 0x000c && remaining > 0) {
+		/* Eprivacy toggle, switch to "on" key entry for on events */
+		if (buffer[0] == 2)
+			key++;
+		used = 1;
 	} else if (type == 0x0012 && code == 0x000d && remaining > 0) {
 		value = (buffer[2] == 2);
 		used = 1;
-- 
2.51.0


