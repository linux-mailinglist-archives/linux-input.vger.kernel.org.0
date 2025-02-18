Return-Path: <linux-input+bounces-10133-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EEAA3A95C
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 21:40:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C02C3B8241
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 20:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F16FB1FCF60;
	Tue, 18 Feb 2025 20:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u2DL5A7x"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C111DC9B4;
	Tue, 18 Feb 2025 20:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739910407; cv=none; b=XQYyzrEMw3RYZ3Vmkz9b1Rfmc+tMxAkGFgVqqgRN0qBUDhzzyDJrmXP3bwKknhpSDxdxbRdm2pJSyCit/GloydTIElN237v55LhRKFFjiukvfkQ+u9/emtZCLamf+ZG7Hd3x9L8fcC2vDLSjZCHHqKuZCNO3ObDUSjDMooxOJ/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739910407; c=relaxed/simple;
	bh=QOeIS+1kV6nxGMmc6k7+FoWF4A/cERpD/XrVh86DxGY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Gm8tyCuOa80Ywj9xHmiNXSsQZrEQD1/NH3BL1k9Wn37rkboRO+evI70MQVCXmtO4MCVoLwjVeKnQplOMaksneqCm74HFBkNIwdDsKBj1KFWWSlyVYdGAsKCHHKwYXo/jlTRu1Mk5MFVKBk4YPjQ8wQOzdB5kcJlvnGYmer9R2Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u2DL5A7x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA3E7C4CEE2;
	Tue, 18 Feb 2025 20:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739910407;
	bh=QOeIS+1kV6nxGMmc6k7+FoWF4A/cERpD/XrVh86DxGY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u2DL5A7x3audT5beokFaIvjqEC9WDvbiTY4+omAJ04p80NFNecO4R5Vboo/zzJJAz
	 Mx98ZCTonDcDYC55WD3EOkUKRr2b/xgFV6ZLhFMazLoB2Knv81Ci2AT44U2Uq37y8I
	 koFBSkyo2Bf32GWEPRpqsVgqvGa7IEbgIjUEJp+D2oIc3barx32pGrJTGdyjr/uFi8
	 4LceyNiVhKPcJvYS2EWTbq1QSZxF5/+Ays6h0JsBa2XBq5ihWmBaY9o3u702SNwgUX
	 ybG4XeZ1y6W5lJLHajbJAlf/t7fCaF5I4UjXk3HVDcyLpUV87AlH0Ai8eKU9i3V1gM
	 GQGtsQE1yuAPg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alex Henrie <alexhenrie24@gmail.com>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 11/31] HID: apple: fix up the F6 key on the Omoton KB066 keyboard
Date: Tue, 18 Feb 2025 15:25:57 -0500
Message-Id: <20250218202619.3592630-11-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250218202619.3592630-1-sashal@kernel.org>
References: <20250218202619.3592630-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.15
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


