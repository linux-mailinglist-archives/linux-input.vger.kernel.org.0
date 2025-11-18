Return-Path: <linux-input+bounces-16191-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF93C6AF78
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 18:30:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9A9F94EF1E8
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 17:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A84F3A9C09;
	Tue, 18 Nov 2025 17:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WHoWDQ6t"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5914E3A9C04;
	Tue, 18 Nov 2025 17:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763486218; cv=none; b=AXW/GKvrjMopPhzfY3EnRfjtI2GFRpLySfIhgytnwJNp0/00NvEgcpA7iPtZbeVHRJ5SndUEke0w6i89GGkNfiBuZfT/JSvv/tOQryYogStiWUuQ+Xl8bpOnCXOT4Hu8JqUa9OeRUxNmTJmWipFvhPwDkttYe0O7J2NTJOMDuxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763486218; c=relaxed/simple;
	bh=zqHDSso1zbAMBvwDevfZJfvdkTIsD8J5jTjG37l7Qo0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qo2zaVtDnDFOOFFDnoJWjmrIwS6m/h4N9i6aqXXuIT5TSUd0FUCHDVzITcSLPd8O3j3a2QDtF+97Gaso0vs6TldDbOfNyJ9wbtdHSXcFuwkeNusddF8LnOP8jpZM2KEEJU5qQeJXcEyxKOHXRdbduLO4ScHjc/28CaPzfOIs49A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WHoWDQ6t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6C62C2BCB1;
	Tue, 18 Nov 2025 17:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763486217;
	bh=zqHDSso1zbAMBvwDevfZJfvdkTIsD8J5jTjG37l7Qo0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WHoWDQ6tMXQLUiURLeKoWX7FNx0sH1OjOzT+HfjbTlrvvFHaKzEegw8LwkQQbV/ld
	 yrnCnaLRKo89b0K1dxEs4269jcRLt8fP+UCd7bAqtgDGbb2lrcYw6qMoOyJtJCO3ZQ
	 5lmBQJFlVvbLrhUsP3shAB+2AAAu237go/lYzp7e9ahJ9Y9vSEqY0KuQMQRpsj8mJd
	 d0GEMgjE1+e9MRMRJAMx5T1cwX77fbLFW93FkuqoX3fSME3NRkhTqqwSA6KKKFGiN1
	 hWUTpovwoGCcJQiUzYzoCeBPEAlvJ0b7+Pldlzm8paJWdZYLDInw9BRNO+t2sY3/qk
	 0v7S4jOA4eDfg==
From: Benjamin Tissoires <bentiss@kernel.org>
Date: Tue, 18 Nov 2025 18:16:29 +0100
Subject: [PATCH 08/10] HID: bpf: add heuristics to the Huion Inspiroy 2S
 eraser button
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-wip-sync-udev-hid-bpf-v1-8-0f8105c54835@kernel.org>
References: <20251118-wip-sync-udev-hid-bpf-v1-0-0f8105c54835@kernel.org>
In-Reply-To: <20251118-wip-sync-udev-hid-bpf-v1-0-0f8105c54835@kernel.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 Benjamin Tissoires <bentiss@kernel.org>, 
 Peter Hutterer <peter.hutterer@who-t.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763486193; l=2512;
 i=bentiss@kernel.org; s=20230215; h=from:subject:message-id;
 bh=zqHDSso1zbAMBvwDevfZJfvdkTIsD8J5jTjG37l7Qo0=;
 b=EPmK8rAezKLSCsHgMkY3kJYw75D+DsNbuMeGwKQ+eViGEHeVqbNESyaWQ5C2NA/TSEqtXn7sq
 6fId+oMAOusBtlOpjgaaZ+PHDTEwlA6/KMva3xwJwhKnSoWYTml4p3M
X-Developer-Key: i=bentiss@kernel.org; a=ed25519;
 pk=7D1DyAVh6ajCkuUTudt/chMuXWIJHlv2qCsRkIizvFw=

When pressing the phsyical eraser button (remapped by us to the
Secondary Barrel Switch) while the tip is down, the device
gives us several false reports with a Tip Switch 0:

         press|           |release
SBS: [0 0 ... 1 1 1 ... 1 0 0 0 0 0 0 ...]
 TS: [1 1 ... 1 0 1 ... 1 1 0 0 0 1 1 ...]

In both press/release the number of Tip Switch 0 reports can be up to 4
and *sometimes* the Tip Switch is released in the same report
as the button press/release event.

Paper over this by forcing the tip down for a few reports if it was down
before the button toggled.

Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
Link: https://gitlab.freedesktop.org/libevdev/udev-hid-bpf/-/merge_requests/195
Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
---
 drivers/hid/bpf/progs/Huion__Inspiroy-2-S.bpf.c | 29 +++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/bpf/progs/Huion__Inspiroy-2-S.bpf.c b/drivers/hid/bpf/progs/Huion__Inspiroy-2-S.bpf.c
index 13f64fb49800b16f6d4d48c378f065fcdf51202a..79453362bf979f42559d6c57e9641a27cda0af40 100644
--- a/drivers/hid/bpf/progs/Huion__Inspiroy-2-S.bpf.c
+++ b/drivers/hid/bpf/progs/Huion__Inspiroy-2-S.bpf.c
@@ -163,6 +163,9 @@ char EXPECTED_FIRMWARE_ID[] = "HUION_T21j_";
 
 
 __u8 last_button_state;
+__u8 last_tip_state;
+__u8 last_sec_barrel_state;
+__u8 force_tip_down_count;
 
 static const __u8 fixed_rdesc_pad[] = {
 	UsagePage_GenericDesktop
@@ -522,9 +525,31 @@ int BPF_PROG(inspiroy_2_fix_events, struct hid_bpf_ctx *hctx)
 			pad_report->wheel = wheel;
 
 			return sizeof(struct pad_report);
-		}
+		} else if (data[1] & 0x80) { /* Pen reports with InRange 1 */
+			__u8 tip_state = data[1] & 0x1;
+			__u8 sec_barrel_state = data[1] & 0x4;
+
+			if (force_tip_down_count > 0) {
+				data[1] |= 0x1;
+				--force_tip_down_count;
+				if (tip_state)
+					force_tip_down_count = 0;
+			}
 
-		/* Pen reports need nothing done */
+			/* Tip was down and we just pressed or released the
+			 * secondary barrel switch (the physical eraser
+			 * button). The device will send up to 4
+			 * reports with Tip Switch 0 and sometimes
+			 * this report has Tip Switch 0.
+			 */
+			if (last_tip_state &&
+			    last_sec_barrel_state != sec_barrel_state) {
+				force_tip_down_count = 4;
+				data[1] |= 0x1;
+			}
+			last_tip_state = tip_state;
+			last_sec_barrel_state = sec_barrel_state;
+		}
 	}
 
 	return 0;

-- 
2.51.1


