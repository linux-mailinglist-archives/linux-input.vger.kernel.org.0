Return-Path: <linux-input+bounces-10231-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77049A40A72
	for <lists+linux-input@lfdr.de>; Sat, 22 Feb 2025 18:00:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5316B3B32EF
	for <lists+linux-input@lfdr.de>; Sat, 22 Feb 2025 17:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BCC12080F5;
	Sat, 22 Feb 2025 17:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="Zt0iJR9m"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D7D1C860E;
	Sat, 22 Feb 2025 17:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740243620; cv=none; b=naDzONncAscxkjCvl/kmEilAdjl5erYxRh5NzLsI27tWMc6WUfTkFPDlUxdSdmUwOqHc/mig2AofBzcvaI5Z0lUCFYU9tZYTRb6qCVso0GDGvtVwYM8O9ESP6om/UDGaQpHQOH6lTUcOHytXrz2zAu+Ko5d/hrY8qi2uyTg+vGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740243620; c=relaxed/simple;
	bh=ZkUEcdYGZQKuYlNcXG9JSCRwue4pV8vdoR9c/NOHw7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bm28VmbRARO+qXHpcaZ9l8YE1upFKVOZKxHJULuF6du+jzLvcHgNZ4Sc6hQOdMEmLdAMxk/ZhNs8ojOCWWSlzYmWjMJhTVRLCrOF1Vz4sJ9M9U0IRJuBFizgHAgZUM0DWN6VrEeZdpRrDUTRRaYfCr+4WmaAy7QJGyAEJIjr1NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=Zt0iJR9m; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 751032E08FB2;
	Sat, 22 Feb 2025 19:00:15 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1740243616;
	bh=3KNfyvrWguwDufA2Rlp/0Gyge9UZEjjpRLvRAk8hbRw=; h=From:To:Subject;
	b=Zt0iJR9mc1LWIPpEgKnsBmj52HQmSRiQEv1cDX38XOJKtq8GhbhE+a4jdlK07V6No
	 97KRaPjjxqC6opsjt6bN6mfvlm6ZkRRrHZS4IkQ+VzzHeyzpHfp6+NwRFt7SXISfUI
	 +V0sHpmYuuv2P2FGERPPk6lOpJop/SSrCg/NaJDI=
Authentication-Results: linux1587.grserver.gr;
	spf=pass (sender IP is 2a05:f6c2:511b:0:cbc0:999f:73ad:33bd) smtp.mailfrom=lkml@antheas.dev smtp.helo=localhost.localdomain
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	pgriffais@valvesoftware.com,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH 2/3] Input: xpad - add support for TECNO Pocket Go
Date: Sat, 22 Feb 2025 18:00:09 +0100
Message-ID: <20250222170010.188761-3-lkml@antheas.dev>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250222170010.188761-1-lkml@antheas.dev>
References: <20250222170010.188761-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174024361628.6821.7986412694389545355@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

TECNO Pocket Go is a kickstarter handheld by
manufacturer TECNO Mobile. It poses a unique
feature: it does not have a display. Instead,
the handheld is essentially a pc in a
controller. As customary, it has an xpad
endpoint, a keyboard endpoint, and a vendor
endpoint for its vendor software.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/input/joystick/xpad.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index a67b493c7702..1a64cd576c66 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -375,6 +375,7 @@ static const struct xpad_device {
 	{ 0x2563, 0x058d, "OneXPlayer Gamepad", 0, XTYPE_XBOX360 },
 	{ 0x294b, 0x3303, "Snakebyte GAMEPAD BASE X", 0, XTYPE_XBOXONE },
 	{ 0x294b, 0x3404, "Snakebyte GAMEPAD RGB X", 0, XTYPE_XBOXONE },
+	{ 0x2993, 0x2001, "TECNO Pocket Go", 0, XTYPE_XBOX360 },
 	{ 0x2dc8, 0x2000, "8BitDo Pro 2 Wired Controller fox Xbox", 0, XTYPE_XBOXONE },
 	{ 0x2dc8, 0x3106, "8BitDo Ultimate Wireless / Pro 2 Wired Controller", 0, XTYPE_XBOX360 },
 	{ 0x2dc8, 0x310a, "8BitDo Ultimate 2C Wireless Controller", 0, XTYPE_XBOX360 },
@@ -531,6 +532,7 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOX360_VENDOR(0x2563),		/* OneXPlayer Gamepad */
 	XPAD_XBOX360_VENDOR(0x260d),		/* Dareu H101 */
        XPAD_XBOXONE_VENDOR(0x294b),            /* Snakebyte */
+	XPAD_XBOX360_VENDOR(0x2993),		/* TECNO Mobile */
 	XPAD_XBOX360_VENDOR(0x2c22),		/* Qanba Controllers */
 	XPAD_XBOX360_VENDOR(0x2dc8),            /* 8BitDo Pro 2 Wired Controller */
 	XPAD_XBOXONE_VENDOR(0x2dc8),		/* 8BitDo Pro 2 Wired Controller for Xbox */
-- 
2.48.1


