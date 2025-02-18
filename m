Return-Path: <linux-input+bounces-10144-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD0DA3A9B8
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 21:47:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B28D16727E
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 20:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD8B722A7E2;
	Tue, 18 Feb 2025 20:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SauH6t48"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B2222A4FF;
	Tue, 18 Feb 2025 20:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739910512; cv=none; b=aEVvtD7bZjHFe0pa5KyICUDxv8+oyLFLq2fxlpZ+bPZby01XdBqoxMlEqEblnDs3N//EyZLiOHugHW3OoJGJnjn1W+/Tith+LK0D8DYp0FMbuW2GploHQnI68MYaiXi9Shc4axeDVZ9vO05lO4FiKsU/jMoCGaUHg0En6YBvEcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739910512; c=relaxed/simple;
	bh=J/Qb5MftE2ywSlTy7tabG2BpgHdW3ROhbCvDC/6PWMQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rKDGd1YdotGSTtvebRw+OpYaBmvMKfFujbHzgsm9z/vttw0s36tbqCgicaTY/BcGUsLAFkwOMabhBPk76CvGyo1V2tp1skrzrVdBxkq+NFcqcrj8XSncTgilvRm1t4rJVhnDeNDLWb0lJpPSDzpXqiRERp8puM+Iq8sv6UVGLyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SauH6t48; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 463FDC4CEE8;
	Tue, 18 Feb 2025 20:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739910512;
	bh=J/Qb5MftE2ywSlTy7tabG2BpgHdW3ROhbCvDC/6PWMQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SauH6t48NK9UQJB/PsPY8DgyYhULku3Y8R5dsKIdEH2FQXjb96JMCRsNcuat0LpkB
	 IkLD9cCVtqm1LHJr0rQRJ/ZJA9Bu+fSv5e2RRII2Ie+Yyc1xQ2pO3xsxPwjyyDVtCP
	 x1OehnDNmSMjmvOVCJIV84XhcNwl52Z4r69bkm/EchOqyNXa6dBX/wlroR6FomEasq
	 mQQK1ocevEohExER3halLcCeDd+toypAHJFRbeXELDdx+W8egbRVc5fU4Ra+V//FIh
	 iLklUgIYAQaAu/stoeVLorsfbL7/NqTC6A8I0aoQJ2KEuohazHwzw97ZAX4J3rkvP9
	 5tOKSXUF/MadQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alex Henrie <alexhenrie24@gmail.com>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 05/13] HID: apple: fix up the F6 key on the Omoton KB066 keyboard
Date: Tue, 18 Feb 2025 15:28:09 -0500
Message-Id: <20250218202819.3593598-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250218202819.3593598-1-sashal@kernel.org>
References: <20250218202819.3593598-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.128
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
index da8751601534f..86a5e09544c4a 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -497,6 +497,9 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
 		}
 	}
 
+	if (usage->hid == 0xc0301) /* Omoton KB066 quirk */
+		code = KEY_F6;
+
 	if (usage->code != code) {
 		input_event_with_scancode(input, usage->type, code, usage->hid, value);
 
-- 
2.39.5


