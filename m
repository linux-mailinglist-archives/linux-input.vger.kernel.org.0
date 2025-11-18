Return-Path: <linux-input+bounces-16192-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA90C6AF84
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 18:31:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1838934CD02
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 17:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FCB03AA18F;
	Tue, 18 Nov 2025 17:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ssomm/iQ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D233AA185;
	Tue, 18 Nov 2025 17:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763486220; cv=none; b=JjpM+pHCBxaii9D/XCLU7ixtkY0hulzhDvyR4MoZroPjh+Fd/yFrIA0IAyrYFkjFRo78zjP4OYwfBpmuLzz6RojDTNimW12dpgQeLxN/gtHM3cPwPCeuo41q12Md+LZy2srnIU6kcViKqgB1BiqroBz6l+rp32IMFdTtYx2pIYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763486220; c=relaxed/simple;
	bh=LatW49ws46HDBvfzOY1y4K96RPgnuMSTYcEnI7aQVs0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a5fblWVla8SpMmsVsW7RsWCfaiZE/66mB/zwMS8VsZ/LYkkeq3CVBg0ULODEvpDE2HVsxPzjJSgOVBwD/w3SBd/HPZwWeHtlcgEJr+NnfqOSynZH+a/bK9ly9jCOM2J7xXou1RLmOicS2Ias4uEcY9H/t8LuFteBwDyAQd/C1d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ssomm/iQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A8A1C2BCB8;
	Tue, 18 Nov 2025 17:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763486220;
	bh=LatW49ws46HDBvfzOY1y4K96RPgnuMSTYcEnI7aQVs0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ssomm/iQBRsjopdba4r2Jr9JPizHd+RoqJ+YvldCrmEnmeOqyz4wBqy+jb77LwUol
	 Cncf/Th+ZtjE2OrcjjUlnEQfvbZHALKGu5SBZBwICqdmHGXjGIlSBCJJT+aRKlfZ0F
	 /8810TPPl2OwMbhDP+H6Q/01yGHOuvWi8i/LWGXuBNy8S4ZE+yc7mkvXv6W34fS3gp
	 KR6Ro9rzikiDLiov6/xZfqeimT3hfsJM8pEbUH2qaX3TivQBtzQiWlbdd2GsHWk78p
	 DR9BuQeYkWAw+JnOsnMv4v8YZwqv+5nrRmyR3aHQMMz2X1j2/1/5Xytix2OBLRdn8e
	 +zf/q/AfUQIOw==
From: Benjamin Tissoires <bentiss@kernel.org>
Date: Tue, 18 Nov 2025 18:16:30 +0100
Subject: [PATCH 09/10] HID: bpf: add the Huion Kamvas 27 Pro
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-wip-sync-udev-hid-bpf-v1-9-0f8105c54835@kernel.org>
References: <20251118-wip-sync-udev-hid-bpf-v1-0-0f8105c54835@kernel.org>
In-Reply-To: <20251118-wip-sync-udev-hid-bpf-v1-0-0f8105c54835@kernel.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 Benjamin Tissoires <bentiss@kernel.org>, 
 Peter Hutterer <peter.hutterer@who-t.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763486193; l=1813;
 i=bentiss@kernel.org; s=20230215; h=from:subject:message-id;
 bh=LatW49ws46HDBvfzOY1y4K96RPgnuMSTYcEnI7aQVs0=;
 b=9AvYeGYz8edWI+enthjyrFJvB6dfu/e018OId79nMHhi4k7/oDeaVNnRn7FItVoc422kTFT8B
 kIGRZ68msx2BeMCF3bF8S/T1Il5bJfDV+bG7jaNssFsoVnWe2Y9XZvQ
X-Developer-Key: i=bentiss@kernel.org; a=ed25519;
 pk=7D1DyAVh6ajCkuUTudt/chMuXWIJHlv2qCsRkIizvFw=

Same issues with a secondary tip switch instead of secondary barrel
switch as the Kamvas 19.

Copy the stable Kamvas 19 support back into testing and add the vid/pid
for the Kamvas 27.

Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
Link: https://gitlab.freedesktop.org/libevdev/udev-hid-bpf/-/merge_requests/189
Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
---
 drivers/hid/bpf/progs/Huion__Kamvas-Pro-19.bpf.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/bpf/progs/Huion__Kamvas-Pro-19.bpf.c b/drivers/hid/bpf/progs/Huion__Kamvas-Pro-19.bpf.c
index 489cb4fcc2cd2702e4d996ad9435ba0ca454b6d9..5f43e407184854d860eeed4e857acee8bcbd272d 100644
--- a/drivers/hid/bpf/progs/Huion__Kamvas-Pro-19.bpf.c
+++ b/drivers/hid/bpf/progs/Huion__Kamvas-Pro-19.bpf.c
@@ -9,12 +9,15 @@
 
 #define VID_HUION 0x256C
 #define PID_KAMVAS_PRO_19 0x006B
+#define PID_KAMVAS_PRO_27 0x006c
 #define NAME_KAMVAS_PRO_19 "HUION Huion Tablet_GT1902"
+#define NAME_KAMVAS_PRO_27 "HUION Huion Tablet_GT2701"
 
 #define TEST_PREFIX "uhid test "
 
 HID_BPF_CONFIG(
 	HID_DEVICE(BUS_USB, HID_GROUP_MULTITOUCH_WIN_8, VID_HUION, PID_KAMVAS_PRO_19),
+	HID_DEVICE(BUS_USB, HID_GROUP_MULTITOUCH_WIN_8, VID_HUION, PID_KAMVAS_PRO_27),
 );
 
 bool prev_was_out_of_range;
@@ -351,7 +354,8 @@ int probe(struct hid_bpf_probe_args *ctx)
 	if (!__builtin_memcmp(name, TEST_PREFIX, sizeof(TEST_PREFIX) - 1))
 		name += sizeof(TEST_PREFIX) - 1;
 
-	if (__builtin_memcmp(name, NAME_KAMVAS_PRO_19, sizeof(NAME_KAMVAS_PRO_19)))
+	if (__builtin_memcmp(name, NAME_KAMVAS_PRO_19, sizeof(NAME_KAMVAS_PRO_19)) &&
+	    __builtin_memcmp(name, NAME_KAMVAS_PRO_27, sizeof(NAME_KAMVAS_PRO_27)))
 		ctx->retval = -EINVAL;
 
 	hid_bpf_release_context(hctx);

-- 
2.51.1


