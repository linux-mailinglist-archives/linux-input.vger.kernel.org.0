Return-Path: <linux-input+bounces-9847-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 300C2A2C430
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2025 14:57:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2BE2169203
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2025 13:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DED8E1FA166;
	Fri,  7 Feb 2025 13:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m2+E5uDZ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B691F1FA14B;
	Fri,  7 Feb 2025 13:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738936591; cv=none; b=dLEbT5lZm/DBMLY4EcM+MC+4cL45IQMQcNJcHnpXrwuUJ+q1TvDcvEUSXSsdJRkqwjrSAqJDieeLI/XpxG/ive+Gdlfc1xt9GCP386PDwY7/SEcZDy3hDZqlAuvJQZ5EXu4aGKxzR71+VWcyC9TuVeD11GZKvsgTljlqmURiaNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738936591; c=relaxed/simple;
	bh=WgOgL1KWixuEaC0aIvIRsM65ZIULA5fzTZc224CQK+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fivfhISbY4mXR8xZ+0eQB5dvQEbrBvPLG4IyVoQ7Jds9TLJqtQLlMHtib14KW8tq2nmjUY1tCKzwaIDKMDOaNQYKP32xmtOtcuREvjvKQSpy7aUmH7yw2OzcTIdVVTvzCm5T0iCxfMTL6enQWmKGUhYi2aOsuXmqmjJ5sq93je4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m2+E5uDZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23CE8C4CEDF;
	Fri,  7 Feb 2025 13:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738936591;
	bh=WgOgL1KWixuEaC0aIvIRsM65ZIULA5fzTZc224CQK+g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=m2+E5uDZJXzidEAGKyehHzwIFxWZviVy5zgyWLQU9PX5nAlF6FJ80CttApYsKX2JT
	 1GdGs5K94/0xM8cwlUzSAC0Ux6QO+JdgecF43DrGGRGtpEtF8hoevwHH4d8YWG9hTB
	 fOj2eNyxTy5f01Pm5ADPMz1EzV+WL6QRVyTRXYHBJHjltYOr6n3TlQni+ZnkWCwa/y
	 fxZRSUweHk8zNf0APVHaAA3nrWCwu2UhiYZDYpIHOVBJBPDLdknndi0du2EqKg+u3Q
	 h29twSCKZ3eanodlxWGHMgt46ELOCBwpDzyOBfE0OAuLiZTU9asPZ4kp25Furdxeul
	 2ORI0jRaHqk5g==
From: Benjamin Tissoires <bentiss@kernel.org>
Date: Fri, 07 Feb 2025 14:56:00 +0100
Subject: [PATCH 4/7] HID: bpf: add support for the XP-Pen Artist Pro 19
 (gen2)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-bpf-import-2025-02-07-v1-4-6048fdd5a206@kernel.org>
References: <20250207-bpf-import-2025-02-07-v1-0-6048fdd5a206@kernel.org>
In-Reply-To: <20250207-bpf-import-2025-02-07-v1-0-6048fdd5a206@kernel.org>
To: Jiri Kosina <jikos@kernel.org>, 
 Peter Hutterer <peter.hutterer@who-t.net>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 Benjamin Tissoires <bentiss@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738936583; l=4704;
 i=bentiss@kernel.org; s=20230215; h=from:subject:message-id;
 bh=WgOgL1KWixuEaC0aIvIRsM65ZIULA5fzTZc224CQK+g=;
 b=8bp/lOeRWYNRyJDeMTGIDqY88Oz1OAE6EWPePn5Pqz6wYA2qeY+Ly18qrxwhpWhOPiY3gruOq
 tfIrXCTjBDnBPkHU9oJmmTAHFAlu5A0Zsanle1Wi+SZ6icwKSh45X6K
X-Developer-Key: i=bentiss@kernel.org; a=ed25519;
 pk=7D1DyAVh6ajCkuUTudt/chMuXWIJHlv2qCsRkIizvFw=

The device behaves the same than the 16" and 14" models, so let's just
add support for it too.

Link: https://gitlab.freedesktop.org/libevdev/udev-hid-bpf/-/merge_requests/145
Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
---
 drivers/hid/bpf/progs/XPPen__ArtistPro16Gen2.bpf.c | 44 ++++++++++++++++++++--
 1 file changed, 40 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/bpf/progs/XPPen__ArtistPro16Gen2.bpf.c b/drivers/hid/bpf/progs/XPPen__ArtistPro16Gen2.bpf.c
index a669525691aae1c354259cb3276cc3bb406bf529..0c7e5cc5dc7e30bb67717e2090a002b42dee91ef 100644
--- a/drivers/hid/bpf/progs/XPPen__ArtistPro16Gen2.bpf.c
+++ b/drivers/hid/bpf/progs/XPPen__ArtistPro16Gen2.bpf.c
@@ -10,10 +10,12 @@
 #define VID_UGEE 0x28BD /* VID is shared with SinoWealth and Glorious and prob others */
 #define PID_ARTIST_PRO14_GEN2 0x095A
 #define PID_ARTIST_PRO16_GEN2 0x095B
+#define PID_ARTIST_PRO19_GEN2 0x096A
 
 HID_BPF_CONFIG(
 	HID_DEVICE(BUS_USB, HID_GROUP_GENERIC, VID_UGEE, PID_ARTIST_PRO14_GEN2),
-	HID_DEVICE(BUS_USB, HID_GROUP_GENERIC, VID_UGEE, PID_ARTIST_PRO16_GEN2)
+	HID_DEVICE(BUS_USB, HID_GROUP_GENERIC, VID_UGEE, PID_ARTIST_PRO16_GEN2),
+	HID_DEVICE(BUS_USB, HID_GROUP_GENERIC, VID_UGEE, PID_ARTIST_PRO19_GEN2)
 );
 
 /*
@@ -22,7 +24,7 @@ HID_BPF_CONFIG(
  * - when the eraser button is pressed and the stylus is touching the tablet,
  *   the device sends Tip Switch instead of sending Eraser
  *
- * This descriptor uses physical dimensions of the 16" device.
+ * This descriptor uses the physical dimensions of the 16" device.
  */
 static const __u8 fixed_rdesc[] = {
 	0x05, 0x0d,                    // Usage Page (Digitizers)             0
@@ -100,6 +102,12 @@ int BPF_PROG(hid_fix_rdesc_xppen_artistpro16gen2, struct hid_bpf_ctx *hctx)
 		data[62] = 0x62;
 		data[73] = 0x1c;
 		data[72] = 0xfd;
+	} else if (hctx->hid->product == PID_ARTIST_PRO19_GEN2) {
+		/* 19" screen reports 16.101" x 9.057" */
+		data[63] = 0x3e;
+		data[62] = 0xe5;
+		data[73] = 0x23;
+		data[72] = 0x61;
 	}
 
 	return sizeof(fixed_rdesc);
@@ -177,6 +185,27 @@ static const __u16 angle_offsets_vertical_16[128] = {
 	188, 186, 184, 182, 180, 178, 176, 174, 172
 };
 
+/* 19" inch screen 16.101" x 9.057" */
+static const __u16 angle_offsets_horizontal_19[128] = {
+	0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 25, 27, 29, 31, 33, 35, 37, 39, 41,
+	42, 44, 46, 48, 50, 51, 53, 55, 57, 58, 60, 62, 63, 65, 67, 68, 70, 71, 73, 74, 76,
+	77, 79, 80, 82, 83, 84, 86, 87, 88, 89, 90, 92, 93, 94, 95, 96, 97, 98, 99, 100,
+	101, 102, 103, 104, 104, 105, 106, 106, 107, 108, 108, 109, 109, 110, 110, 111,
+	111, 112, 112, 112, 112, 113, 113, 113, 113, 113, 113, 113, 113, 113, 113, 113,
+	113, 113, 112, 112, 112, 112, 111, 111, 110, 110, 109, 109, 108, 108, 107, 106,
+	106, 105, 104, 104, 103, 102, 101, 100, 99, 98, 97, 96, 95, 94, 93, 92, 90
+};
+static const __u16 angle_offsets_vertical_19[128] = {
+	0, 4, 7, 11, 14, 18, 21, 25, 28, 32, 35, 38, 42, 45, 49, 52, 56, 59, 62, 66, 69, 72,
+	75, 79, 82, 85, 88, 91, 95, 98, 101, 104, 107, 110, 113, 116, 118, 121, 124, 127,
+	129, 132, 135, 137, 140, 142, 145, 147, 150, 152, 154, 157, 159, 161, 163, 165, 167,
+	169, 171, 173, 174, 176, 178, 179, 181, 183, 184, 185, 187, 188, 189, 190, 192, 193,
+	194, 195, 195, 196, 197, 198, 198, 199, 199, 200, 200, 201, 201, 201, 201, 201, 201,
+	201, 201, 201, 201, 201, 200, 200, 199, 199, 198, 198, 197, 196, 195, 195, 194, 193,
+	192, 190, 189, 188, 187, 185, 184, 183, 181, 179, 178, 176, 174, 173, 171, 169, 167,
+	165, 163, 161
+};
+
 static void compensate_coordinates_by_tilt(__u8 *data, const __u8 idx,
 		const __s8 tilt, const __u16 (*compensation_table)[128])
 {
@@ -241,12 +270,19 @@ static int xppen_16_fix_angle_offset(struct hid_bpf_ctx *hctx)
 	__s8 tilt_x = (__s8) data[8];
 	__s8 tilt_y = (__s8) data[9];
 
-	if (hctx->hid->product == PID_ARTIST_PRO14_GEN2) {
+	switch (hctx->hid->product) {
+	case PID_ARTIST_PRO14_GEN2:
 		compensate_coordinates_by_tilt(data, 2, tilt_x, &angle_offsets_horizontal_14);
 		compensate_coordinates_by_tilt(data, 4, tilt_y, &angle_offsets_vertical_14);
-	} else if (hctx->hid->product == PID_ARTIST_PRO16_GEN2) {
+		break;
+	case PID_ARTIST_PRO16_GEN2:
 		compensate_coordinates_by_tilt(data, 2, tilt_x, &angle_offsets_horizontal_16);
 		compensate_coordinates_by_tilt(data, 4, tilt_y, &angle_offsets_vertical_16);
+		break;
+	case PID_ARTIST_PRO19_GEN2:
+		compensate_coordinates_by_tilt(data, 2, tilt_x, &angle_offsets_horizontal_19);
+		compensate_coordinates_by_tilt(data, 4, tilt_y, &angle_offsets_vertical_19);
+		break;
 	}
 
 	return 0;

-- 
2.47.0


