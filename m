Return-Path: <linux-input+bounces-11349-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD682A7537D
	for <lists+linux-input@lfdr.de>; Sat, 29 Mar 2025 00:54:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87DEB3B1131
	for <lists+linux-input@lfdr.de>; Fri, 28 Mar 2025 23:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D30A61DF747;
	Fri, 28 Mar 2025 23:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="HpaGw/Fc"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E3C6FBF
	for <linux-input@vger.kernel.org>; Fri, 28 Mar 2025 23:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743206046; cv=none; b=h9nFULqhruNBpXL4pyFniwa/TFpklXUhIw7T7WX8U84lWbi4HJAqroIg2eZvIw5tY0YIQOrftMO3iNu7BUYKISW1zbQuKIbC8z7sUUZvjlOkPKZzDSqJM+y2ELsjIszOtA1EW8988DXalix7Az72ICgx8XdY4KDmqd4x0y1ZAWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743206046; c=relaxed/simple;
	bh=5CZzBgtIvWjRBA6n9BzgufFcbF6Mzupx3ysCBkpAi+I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jS0Rhr5MxLDkpDRliekFvwrfvJkIk3RTVf5cbv6Bz6F9opY4CgEowe/GgyDxpJ2OUPN8ibdDbToto1pBjs7vMAC4f+8i3ZNNs+qUVh4j8Uw1IKDCprgqu4kZY7rUMdLrvwpjH8n600H3/KFMB+vY9fMZgxIqcWa8XVpuFBkaNBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=HpaGw/Fc; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1743205447; bh=5CZzBgtIvWjRBA6n9BzgufFcbF6Mzupx3ysCBkpAi+I=;
	h=From:To:Cc:Subject:Date:From;
	b=HpaGw/Fc+FATcfP8h34mrPNlHQ4ASEkxV6pHyHXAH3/a3QrZKvTTOroplPtV93det
	 8w+uQIQhuUIudDdOpX5K6Q/dEFFb8AzsoXYiKaudgfoaGpR8LVlueqGKXinbCh2Cxg
	 fWX4+4rs/WiFaFdxVfiocDZeZ8WW1rxveGNP+yC3YJQ8cXPMWIv7sTD/2IUxpsLh+e
	 oHK4KTUJ03/yj45en2woTsIodnvH0A2BxoQ4zauxrohyzsVk3snjJ6v40eW96I3fPs
	 oR7OmbeHc3hXpGSAYpkOir0sV09vsxy6CIEX/RZA5cmn/xHYINiS9Fl7pt4wvzT3DS
	 yEbbBJbfBz3nQ==
Received: from nebulosa.vulpes.eutheria.net (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id 3A685A01E;
	Fri, 28 Mar 2025 16:44:07 -0700 (PDT)
From: Vicki Pfau <vi@endrift.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH 1/5] Input: xpad - Fix two controller table values
Date: Fri, 28 Mar 2025 16:43:36 -0700
Message-ID: <20250328234345.989761-1-vi@endrift.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two controllers -- Mad Catz JOYTECH NEO SE Advanced and PDP Mirror's Edge
Official -- were missing the value of the mapping field, and thus wouldn't
detect properly.

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/input/joystick/xpad.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index c33e6f33265b..41b7c7c991cd 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -205,7 +205,7 @@ static const struct xpad_device {
 	{ 0x0738, 0x9871, "Mad Catz Portable Drum", 0, XTYPE_XBOX360 },
 	{ 0x0738, 0xb726, "Mad Catz Xbox controller - MW2", 0, XTYPE_XBOX360 },
 	{ 0x0738, 0xb738, "Mad Catz MVC2TE Stick 2", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
-	{ 0x0738, 0xbeef, "Mad Catz JOYTECH NEO SE Advanced GamePad", XTYPE_XBOX360 },
+	{ 0x0738, 0xbeef, "Mad Catz JOYTECH NEO SE Advanced GamePad", 0, XTYPE_XBOX360 },
 	{ 0x0738, 0xcb02, "Saitek Cyborg Rumble Pad - PC/Xbox 360", 0, XTYPE_XBOX360 },
 	{ 0x0738, 0xcb03, "Saitek P3200 Rumble Pad - PC/Xbox 360", 0, XTYPE_XBOX360 },
 	{ 0x0738, 0xcb29, "Saitek Aviator Stick AV8R02", 0, XTYPE_XBOX360 },
@@ -240,7 +240,7 @@ static const struct xpad_device {
 	{ 0x0e6f, 0x0146, "Rock Candy Wired Controller for Xbox One", 0, XTYPE_XBOXONE },
 	{ 0x0e6f, 0x0147, "PDP Marvel Xbox One Controller", 0, XTYPE_XBOXONE },
 	{ 0x0e6f, 0x015c, "PDP Xbox One Arcade Stick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
-	{ 0x0e6f, 0x015d, "PDP Mirror's Edge Official Wired Controller for Xbox One", XTYPE_XBOXONE },
+	{ 0x0e6f, 0x015d, "PDP Mirror's Edge Official Wired Controller for Xbox One", 0, XTYPE_XBOXONE },
 	{ 0x0e6f, 0x0161, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
 	{ 0x0e6f, 0x0162, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
 	{ 0x0e6f, 0x0163, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
-- 
2.48.1


