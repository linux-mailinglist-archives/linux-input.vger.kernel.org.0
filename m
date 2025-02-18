Return-Path: <linux-input+bounces-10139-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E6DA3A9AB
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 21:46:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 815DE3ADEFE
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 20:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FC93215F79;
	Tue, 18 Feb 2025 20:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cgkytQ4Y"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16597215F6B;
	Tue, 18 Feb 2025 20:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739910481; cv=none; b=BIfAsCEke0Ksz0bTgqIvsERNyVynict3HkXGuUmsI3mxE05z3uAbl7sBMqU1h+j8/6T6u6TfeD6sm0pfTSIJs/q6h/Xn2KTenfQGaioGuwQ/w2qcpnlZ0nKHM9rauwRud3V9GJweASiwBhXUFbTSMhnw5s1Ocfg2M3RTbxYGLk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739910481; c=relaxed/simple;
	bh=yW4pEsb3j28bL9dOj45mONs4S21+tH5Ra7TxCNGoXNg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eF5aP6s1VJEUBKOCV07jCQlDHhRGH3K5E+vOhdp/pPX4FKxdBzRZHgmf12KsmibzWuU65g8DqGXz9DXP//PU51B2u1nbpJfHvOTmSpD4+592WXW1GHUHTJSrnhE02LWzDm70iqwgHOwgFYd6CZeGv72WZOB9iZAPoWgCeJkY308=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cgkytQ4Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA3C6C4CEE2;
	Tue, 18 Feb 2025 20:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739910480;
	bh=yW4pEsb3j28bL9dOj45mONs4S21+tH5Ra7TxCNGoXNg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cgkytQ4Y7ZfhVwuYujlJSux9d7WCWwudEQmt7JcPGIPq+jhd9PHKRJIaxZfMpAVVG
	 bB8UgWd+JOWbTp+M4o9EADjDQ1PKPtfUz6Wzg4m5JRsG4DwnyVOvgNa4q0VVXtiWhg
	 UzSHr/j22qF2rnSyDS40TPVq+q/A9dm4T5nZPUyQmSyqsaw2FsnUoOPYsDyFEf81qe
	 xDB3xGihJB+Z2snN+XIkldVFn/NNV+AKcDw2fvKATxcND3Dud9ReXCpT3QltpBPvET
	 mJk6f43+9NpyM49upXs5BR3VskTslvxkVz7xzbUUTZL0+DsAc4OO8mooUr6FpV21rt
	 jNXQeBHZTSi+w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alex Henrie <alexhenrie24@gmail.com>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 07/17] HID: apple: fix up the F6 key on the Omoton KB066 keyboard
Date: Tue, 18 Feb 2025 15:27:31 -0500
Message-Id: <20250218202743.3593296-7-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250218202743.3593296-1-sashal@kernel.org>
References: <20250218202743.3593296-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.78
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
index 9ff40f3b98064..9f3480ef524c1 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -531,6 +531,9 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
 		}
 	}
 
+	if (usage->hid == 0xc0301) /* Omoton KB066 quirk */
+		code = KEY_F6;
+
 	if (usage->code != code) {
 		input_event_with_scancode(input, usage->type, code, usage->hid, value);
 
-- 
2.39.5


