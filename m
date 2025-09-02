Return-Path: <linux-input+bounces-14420-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FDAB3FFB4
	for <lists+linux-input@lfdr.de>; Tue,  2 Sep 2025 14:14:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 793611894305
	for <lists+linux-input@lfdr.de>; Tue,  2 Sep 2025 12:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DFFC3054E5;
	Tue,  2 Sep 2025 12:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tFxlyQPY"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D2A3054E3;
	Tue,  2 Sep 2025 12:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756814934; cv=none; b=kQf+EPEQ8UZ/deC7PLma/U1eBeB7RWHPPfFpU2eD3lymlu5zuhkcnTw7uV/+XJWeki7oclaCmWHd6fn7LNC8NnbiRRLyYG6GFciLzZt0R14JkTB8LeBu+n30zLKmE6sm9Spo5qPU7Oj1aG8fHOHUq/Js2mFk2agVp5gdH4i3Kpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756814934; c=relaxed/simple;
	bh=oalm0DGGFQj/rZL+E459PfWJtMIvQp14W81fJKKwn1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Khmo/SL6NNbwlyzsh5IPJyo83YySGsmUJ5CthRMQcI/Jd5iOpRLakS50i5c8jFiSuUQ0lrrfnJ7zibEWzpF8NKjsVhWp8zexAqzQ2T7QEdYiMYDbKhBtWmjUacgBVo1uR7Uctjpm+ugUz1CbDuoVn+zpHXvDXqySkh9Gp0y/nwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tFxlyQPY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE67C4CEED;
	Tue,  2 Sep 2025 12:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756814934;
	bh=oalm0DGGFQj/rZL+E459PfWJtMIvQp14W81fJKKwn1k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tFxlyQPYrM6llFXv/dMlxf/mXV8cuqTNeJPzLDwMPqxxAJRcL1ig6sPf4ab5v8VoT
	 2U79gPTmAguD4kwxLWuw+aqUj5w4YNudZ0Z3z/R6FioEXtcGs54sa0o0n5DePvX2QQ
	 TZW0VntWxrKeahoyZ7ryXbaELj+0YP4APyBJ76UtNS/wbq36iheDKcFXnL2qVZcV4t
	 G0WjlJbk1FC8f8cEfx3C0eUqDvlpzSd+i0/B0UU+BYvDpUDz3CYYj/XiunJRCioL0S
	 TsEowUTk3s2n4M/swLqBQHunbzz61r0+7bXQ5A2bEt8O65paSyL6qnafkbsJ/P3m5q
	 cipY91ppKcA6g==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Antheas Kapenekakis <lkml@antheas.dev>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.16-6.6] HID: quirks: add support for Legion Go dual dinput modes
Date: Tue,  2 Sep 2025 08:08:24 -0400
Message-ID: <20250902120833.1342615-13-sashal@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250902120833.1342615-1-sashal@kernel.org>
References: <20250902120833.1342615-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16.4
Content-Transfer-Encoding: 8bit

From: Antheas Kapenekakis <lkml@antheas.dev>

[ Upstream commit 1f3214aae9f49faf495f3836216afbc6c5400b2e ]

The Legion Go features detachable controllers which support a dual
dinput mode. In this mode, the controllers appear under a single HID
device with two applications.

Currently, both controllers appear under the same event device, causing
their controls to be mixed up. This patch separates the two so that
they can be used independently.

In addition, the latest firmware update for the Legion Go swaps the IDs
to the ones used by the Legion Go 2, so add those IDs as well.

[jkosina@suse.com: improved shortlog]
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Based on my analysis, here's my determination:

**Backport Status: YES**

This commit should be backported to stable kernel trees for the
following reasons:

1. **Fixes a real user-facing bug**: The commit message clearly states
   "Currently, both controllers appear under the same event device,
   causing their controls to be mixed up." This is a functional bug
   where the Legion Go's detachable controllers cannot be used
   independently as intended - their inputs are incorrectly merged
   together.

2. **Hardware quirk fix**: This falls under the stable tree rules
   category of fixing "a hardware quirk." The Legion Go requires special
   handling for its dual dinput mode where two controllers appear as two
   applications under a single HID device.

3. **Small and contained change**: The patch only adds 4 lines total:
   - 2 new device ID definitions in `drivers/hid/hid-ids.h`
   - 2 corresponding quirk entries in `drivers/hid/hid-quirks.c`

4. **Low risk**: The change uses an existing, well-established quirk
   mechanism (`HID_QUIRK_MULTI_INPUT`) that's already used for dozens of
   similar gaming controllers (as seen in hid-quirks.c). This quirk
   simply ensures that when multiple HID reports come from different
   report IDs, they create separate input devices rather than merging
   into one.

5. **Device enablement**: The commit also adds support for new device
   IDs (0x61ed) used by newer firmware and Legion Go 2, which falls
   under the stable rule of "just add a device ID."

6. **User impact**: Without this fix, users cannot properly use the
   Legion Go's detachable controllers independently, which is a core
   feature of the device. The controllers' inputs being mixed together
   makes many games and applications unusable.

The `HID_QUIRK_MULTI_INPUT` flag modifies the behavior in
`drivers/hid/hid-input.c:2305-2320` to ensure that different HID reports
with different IDs create separate hidinput structures, resulting in
separate `/dev/input/eventX` devices for each controller rather than a
single merged device.

 drivers/hid/hid-ids.h    | 2 ++
 drivers/hid/hid-quirks.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 33cc5820f2be1..a687fbbb77b00 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -831,6 +831,8 @@
 #define USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_6019	0x6019
 #define USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_602E	0x602e
 #define USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_6093	0x6093
+#define USB_DEVICE_ID_LENOVO_LEGION_GO_DUAL_DINPUT	0x6184
+#define USB_DEVICE_ID_LENOVO_LEGION_GO2_DUAL_DINPUT	0x61ed
 
 #define USB_VENDOR_ID_LETSKETCH		0x6161
 #define USB_DEVICE_ID_WP9620N		0x4d15
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 9bf9ce8dc8032..90be93bdb0895 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -124,6 +124,8 @@ static const struct hid_device_id hid_quirks[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_MOUSEPEN_I608X_V2), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_PENSKETCH_T609A), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LABTEC, USB_DEVICE_ID_LABTEC_ODDOR_HANDBRAKE), HID_QUIRK_ALWAYS_POLL },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_LEGION_GO_DUAL_DINPUT), HID_QUIRK_MULTI_INPUT },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_LEGION_GO2_DUAL_DINPUT), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_OPTICAL_USB_MOUSE_600E), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_608D), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_6019), HID_QUIRK_ALWAYS_POLL },
-- 
2.50.1


