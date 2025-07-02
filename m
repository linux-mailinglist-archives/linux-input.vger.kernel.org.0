Return-Path: <linux-input+bounces-13322-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBEEAF0965
	for <lists+linux-input@lfdr.de>; Wed,  2 Jul 2025 05:47:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E75D3BCEB1
	for <lists+linux-input@lfdr.de>; Wed,  2 Jul 2025 03:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4B451DED4A;
	Wed,  2 Jul 2025 03:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="odqwAnR6"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0DC15A848
	for <linux-input@vger.kernel.org>; Wed,  2 Jul 2025 03:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751428067; cv=none; b=Yg1b6SbvLc5gtk1YutVWmSZaznrVoJ5ovPzkWGBw3dwUV/rW6eBoqdnuDT2v9+NHFNP7j0KPU2I2lxkIzUqWGEY4xHlcjV4bbe6GBYP22AlLJjSvoeXFcGDfEJVoF7OEsdwv1rT9ZmE2G9DGTgKe5Pn9taFLVsLMZRqbYIsmsvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751428067; c=relaxed/simple;
	bh=QhzKxo2dJjydnebIIRiV0LWO6Ih6jOhHRzhVZwqCJxI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h/AaUeDQ/JFd8YAyn6swuebsV9tKVjxIWqBpVcCwFI+8KyoFLxn6ufbzV3H5MdchIfI7w8jBRTKrON6d9E8QY1jzkVh1g6BgsgP7/ByM7t7flAykVqV4pI0ZMcplrl/55YsXbdTuaYN7h/KnotoQcCqikAZWSnSH1uFKvSohnvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=odqwAnR6; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1751428064; bh=QhzKxo2dJjydnebIIRiV0LWO6Ih6jOhHRzhVZwqCJxI=;
	h=From:To:Cc:Subject:Date:From;
	b=odqwAnR6uusKUXrLr8J/xCwn7dpyx8jjlyXrx7GU2f0NS417Gh/6ubPTeL7HIAF4D
	 nHDTHgoD6UkF1NY+ttXxYP8ifpmi85kXO3MjFrNPQgQ2POn1ha+dEW+q4nFZlSJx15
	 htkXI7ZbQwcIvLKDnAG2jnamxjtRJl7t8TA1OVWDl425+TzmVJRggVWLYUk+AY5DYE
	 2aDX9kxxSddWoX9+BoX8N2I0gNkpXIs0A0yWjexd8Bfr2HZk5AUGlOUvdLhMJTb5i3
	 +Vb7bPJYRgvsyZU2xT0Ns7dXSrJvmD7wtXAlrYTuIaCchpyQ/+sQ0TDnfRlm+kRQ8u
	 XAo/YWr7Z5shg==
Received: from microtis.vulpes.eutheria.net (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id F1D20A01E;
	Tue,  1 Jul 2025 20:47:43 -0700 (PDT)
From: Vicki Pfau <vi@endrift.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH] HID: Fix debug name for BTN_GEAR_DOWN, BTN_GEAR_UP, BTN_WHEEL
Date: Tue,  1 Jul 2025 20:46:42 -0700
Message-ID: <20250702034642.124791-1-vi@endrift.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The name of BTN_GEAR_DOWN was WheelBtn and BTN_WHEEL was missing. Further,
BTN_GEAR_UP had a space in its name and no Btn, which is against convention.
This makes the names BtnGearDown, BtnGearUp, and BtnWheel, fixing the errors
and matching convention.

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/hid/hid-debug.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
index 8433306148d5..c6b6b1029540 100644
--- a/drivers/hid/hid-debug.c
+++ b/drivers/hid/hid-debug.c
@@ -3298,8 +3298,8 @@ static const char *keys[KEY_MAX + 1] = {
 	[BTN_TOUCH] = "Touch",			[BTN_STYLUS] = "Stylus",
 	[BTN_STYLUS2] = "Stylus2",		[BTN_TOOL_DOUBLETAP] = "ToolDoubleTap",
 	[BTN_TOOL_TRIPLETAP] = "ToolTripleTap",	[BTN_TOOL_QUADTAP] = "ToolQuadrupleTap",
-	[BTN_GEAR_DOWN] = "WheelBtn",
-	[BTN_GEAR_UP] = "Gear up",		[KEY_OK] = "Ok",
+	[BTN_GEAR_DOWN] = "BtnGearDown",	[BTN_GEAR_UP] = "BtnGearUp",
+	[BTN_WHEEL] = "BtnWheel",		[KEY_OK] = "Ok",
 	[KEY_SELECT] = "Select",		[KEY_GOTO] = "Goto",
 	[KEY_CLEAR] = "Clear",			[KEY_POWER2] = "Power2",
 	[KEY_OPTION] = "Option",		[KEY_INFO] = "Info",
-- 
2.49.0


