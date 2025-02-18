Return-Path: <linux-input+bounces-10125-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8B1A3A8DC
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 21:27:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C1DA174D65
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 20:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B54601DE3B1;
	Tue, 18 Feb 2025 20:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RG6V3GAV"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE3F1DE3AC;
	Tue, 18 Feb 2025 20:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739910322; cv=none; b=L+Hn4a4J5FqY0tedpPuZyQCIWeuEu2xR/4HawHzLGeMYTq9S5pftcNxjczs0XR0AXOk/2zl++6iKnCeo2mnPzo1LpfnhXBYgGGAlNdcEqOrLxj8iGUz2j5QrKJwRO/VZVVWUIrEqemHjlGGnRxBf65oYgwj46F/61G810CCgTh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739910322; c=relaxed/simple;
	bh=QOeIS+1kV6nxGMmc6k7+FoWF4A/cERpD/XrVh86DxGY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jnXDoDWL8RJlJmyv8WlypT0VrBAjx8a5mZmVFtklASrA6drlZR66fmk//HiUPxQnc8k6pSOiqVV3EZURDdI2ZHHMlvVTxkZthRiJBWkPTOdPYFt8j814y3IaGbnQWg6jRDXuMcKJDk10z/LHm+ZC8tqF4gH4r5h8Wh0xd19V+0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RG6V3GAV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D77AC4CEE2;
	Tue, 18 Feb 2025 20:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739910322;
	bh=QOeIS+1kV6nxGMmc6k7+FoWF4A/cERpD/XrVh86DxGY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RG6V3GAVMfQyd/Woum7yf+1ExyNuR3+PiDv21B0g750FZnVcGWRHYW999b4YA3J+R
	 njuuAyq/2m+okYeYsb3SE5z1+n60rM6aw4An5O+6/gm8If7VVlueWHk3sC4IAHs0Ic
	 RAmvG4VzLLiIcIgK9ChvjkmWDKrgc+7BVslG/7ij12vKbmw7HQYiN/GYJh7+aTU8Py
	 HeSWZUdVw5pU/diGBy6pblL+0XFDb1QcQZtiAuMzXMwT/BnQ7JJ6HngVMOixfd++n6
	 U3Fnefr9yhgxCzaZz73+1kSHhnZEbFKtgxG1FHSNmcpJIknKiymZO/xb5I4P69wHuv
	 Yw1Vwi8DsU46A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alex Henrie <alexhenrie24@gmail.com>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.13 11/31] HID: apple: fix up the F6 key on the Omoton KB066 keyboard
Date: Tue, 18 Feb 2025 15:24:31 -0500
Message-Id: <20250218202455.3592096-11-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250218202455.3592096-1-sashal@kernel.org>
References: <20250218202455.3592096-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.3
Content-Transfer-Encoding: 8bit

From: Alex Henrie <alexhenrie24@gmail.com>

[ Upstream commit 819083cb6eedcc8495cbf84845877bcc741b93b3 ]

The Omoton KB066 is an Apple A1255 keyboard clone (HID product code
05ac:022c). On both keyboards, the F6 key becomes Num Lock when the Fn
key is held. But unlike its Apple exemplar, when the Omoton's F6 key is
pressed without Fn, it sends the usage code 0xC0301 from the reserved
section of the consumer page instead of the standard F6 usage code
0x7003F from the keyboard page. The nonstandard code is translated to
KEY_UNKNOWN and becomes useless on Linux. The Omoton KB066 is a pretty
popular keyboard, judging from its 29,058 reviews on Amazon at time of
writing, so let's account for its quirk to make it more usable.

By the way, it would be nice if we could automatically set fnmode to 0
for Omoton keyboards because they handle the Fn key internally and the
kernel's Fn key handling creates undesirable side effects such as making
F1 and F2 always Brightness Up and Brightness Down in fnmode=1 (the
default) or always F1 and F2 in fnmode=2. Unfortunately I don't think
there's a way to identify Bluetooth keyboards more specifically than the
HID product code which is obviously inaccurate. Users of Omoton
keyboards will just have to set fnmode to 0 manually to get full Fn key
functionality.

Signed-off-by: Alex Henrie <alexhenrie24@gmail.com>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-apple.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 3c3f67d0bfcfe..49812a76b7edd 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -546,6 +546,9 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
 		}
 	}
 
+	if (usage->hid == 0xc0301) /* Omoton KB066 quirk */
+		code = KEY_F6;
+
 	if (usage->code != code) {
 		input_event_with_scancode(input, usage->type, code, usage->hid, value);
 
-- 
2.39.5


