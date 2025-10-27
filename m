Return-Path: <linux-input+bounces-15759-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B71BEC116B0
	for <lists+linux-input@lfdr.de>; Mon, 27 Oct 2025 21:38:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE3411895652
	for <lists+linux-input@lfdr.de>; Mon, 27 Oct 2025 20:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBC5C31B830;
	Mon, 27 Oct 2025 20:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HoRzUVLQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660C72C11EB
	for <linux-input@vger.kernel.org>; Mon, 27 Oct 2025 20:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761597529; cv=none; b=t7sZMv/LhU4zPH8ikuNFBdzUH/fWTuLDjhln/dHNn5KSvHW4x+rLIBawfYC5fjDSHkgTfdh5MN1Lf3sWf+N5qaBua99Rn0HRJaiX/4vOuJCEvcYaBMKcStzJI0di0oLfki2dTmDGudoNMr3XF60lkAzNkcfd4OlPhISvF+QNTME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761597529; c=relaxed/simple;
	bh=Ml35QZ1+1f04yrTXPN2DRkiosHCWmqTZtxNXf5cDi2o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pZ5SaeDOkWXpPPFC+6vcHJWgQMIWT78UtGPepT0Q3XW819y5AGljFV3GmKgbXeT/ooSfTNTzbPKBucgaQvfO1t7XGUjvE515ek7FAiNGYpj4Y72K74dHmIgjkbbBKC1dVRng703w2Tq85oUEnY2wYC8mHbcIDIcNhflYTm0PapQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HoRzUVLQ; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b6cf07258e3so3729222a12.0
        for <linux-input@vger.kernel.org>; Mon, 27 Oct 2025 13:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761597523; x=1762202323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWISWk8SvtXxoZsHOMaA2cRFHQT4nox+BhPw0G7iR+o=;
        b=HoRzUVLQr45H0oqiO7/c4BYuIVq/j/bXQwhFxcS/QbdS/GsQMHBcD4ELdPStWX/oiL
         AgwwvYtYgAnEsUJomXNB7JmnZYNlCeS+48l1NkEZzQx81oUMtOdeQ5UgwD4xh610WL5C
         eVaFonPXpFYAJDiRNU54ANukmTYI6NcpZfFGL8DLre8kEHcMxMxKJdV47sLr86UO8gqq
         uq+fCORNlZdZWrDsjAecoOded6AKoHVJW1biZnCoKhxdqMlC62Lthm+rT1A8v+Q1fnho
         Bxt0Hs5a74Dv2IPS32id/Bnjgqi/vc2GP/txt2kI2ESyUxXoiT2YMR9WwAk52oIebcEf
         EYcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761597523; x=1762202323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZWISWk8SvtXxoZsHOMaA2cRFHQT4nox+BhPw0G7iR+o=;
        b=ZgtMklMv4rpzPNRJVQ8lWa3v3B32R01EIua1d562hos73KvQypqnLBjJBIqA9NxDJL
         +douvb5lcx485yYK95MxgHPXtsXwaNVyvB+XDBE5GIxXzr+C1jeZALyJWmv+0zMhrjUn
         hStzcFWEvfNDohGmtRoyNJ7BwsidldixydZsSVQafEBDSr9S+QEdTmUzwRDJTrq87uu7
         ciscb3/C3NS4Q2URFzF0teq3XUxQ01TlY4L8eLEmuID029Hbjjc3GZlIvNgrrI4V2tAz
         /YJTzZr3hB1zw2Xia1fq1+okzMESBAhd3lJbqo3s9/ShLMZzPlK0KlAwP8A+nTZKAwT8
         b96g==
X-Gm-Message-State: AOJu0YyRfocyDY3u6gvtDjR3YmNLSJKt90xy8HY69pVquU/kBgiT4fii
	oVNVzLXevUtlMQkDjK4kmu9PBOl4r36hHOo2HvKFspE8ri832ESHxT6C9FcFpQ==
X-Gm-Gg: ASbGnct+xxmDahEIgwLFmQ2L1Xu4DgkItpner8/F+bwXSGcmXOsngRHifXK4R/kPf5u
	FeliGTLCANJ+KSQL8zadEN4xFgdXGAYnjfLdnzkBn8uZT+W7LFv3OvX94geUhtKdv9nshyBKHGf
	mMKzMj7ct7itP/QOQcFJi+XL30ecX2jO5RaL8Qgz2Tg/7S/b5idqHyqKYzS/623OTI7Eg0G3Tb5
	2eIbp2SolsdXgN6i+DQT4K12jytPk2ditTskUnXslj1D3FIq2mHWkhArdhDC8saRnazhOKMJN5J
	9wksRyyLka4x4RpEttAqAGpHE7jg0xS6jeBOUvEw9p0ZjF/K03rlyiXJgcA3VArptVOkgFHV+rJ
	3WN41pTRyEMEXlAtMuVYHk0Rs5ZGHFNOu+IECUGGS63frsCIpN89THVXz
X-Google-Smtp-Source: AGHT+IGCIohmx+9BiLHN8kCRjjPeZ6GcHNR5IHnoRm2tGlYNRn2Ab4d+BOgkKrU9k4mBDSxEpVaFJA==
X-Received: by 2002:a17:902:f68c:b0:28d:18fb:bb93 with SMTP id d9443c01a7336-294cb35ec03mr12529975ad.7.1761597523038;
        Mon, 27 Oct 2025 13:38:43 -0700 (PDT)
Received: from fedora ([2607:fb90:33aa:e805::ff98])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d40a73sm93350635ad.74.2025.10.27.13.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 13:38:42 -0700 (PDT)
From: Ping Cheng <pinglinux@gmail.com>
X-Google-Original-From: Ping Cheng <ping.cheng@wacom.com>
To: linux-input@vger.kernel.org
Cc: benjamin.tissoires@redhat.com,
	jikos@kernel.org,
	Dmitry.Torokhov@gmail.com,
	stable@kernel.org,
	Ping Cheng <ping.cheng@wacom.com>
Subject: [PATCH 1/2 v2] HID: input: map HID_GD_Z to ABS_DISTANCE for stylus/pen
Date: Mon, 27 Oct 2025 13:37:42 -0700
Message-ID: <20251027203742.23740-1-ping.cheng@wacom.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HID_GD_Z is mapped to ABS_Z for stylus and pen in hid-input.c. But HID_GD_Z
should be used to report ABS_DISTANCE for stylus and pen as described at:
Documentation/input/event-codes.rst#n226

* ABS_DISTANCE:

  - Used to describe the distance of a tool from an interaction surface. This
    event should only be emitted while the tool is hovering, meaning in close
    proximity of the device and while the value of the BTN_TOUCH code is 0. If
    the input device may be used freely in three dimensions, consider ABS_Z
    instead.
  - BTN_TOOL_<name> should be set to 1 when the tool comes into detectable
    proximity and set to 0 when the tool leaves detectable proximity.
    BTN_TOOL_<name> signals the type of tool that is currently detected by the
    hardware and is otherwise independent of ABS_DISTANCE and/or BTN_TOUCH.

This patch makes the correct mapping. The ABS_DISTANCE is currently not mapped
by any HID usage in hid-generic driver.

Signed-off-by: Ping Cheng <ping.cheng@wacom.com>
Cc: stable@kernel.org
---
v2: updated pen/stylus checks
---
 drivers/hid/hid-input.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index f45f856a127f..141359de5ce5 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -860,7 +860,7 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 
 		switch (usage->hid) {
 		/* These usage IDs map directly to the usage codes. */
-		case HID_GD_X: case HID_GD_Y: case HID_GD_Z:
+		case HID_GD_X: case HID_GD_Y:
 		case HID_GD_RX: case HID_GD_RY: case HID_GD_RZ:
 			if (field->flags & HID_MAIN_ITEM_RELATIVE)
 				map_rel(usage->hid & 0xf);
@@ -868,6 +868,22 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 				map_abs_clear(usage->hid & 0xf);
 			break;
 
+		case HID_GD_Z:
+			/* HID_GD_Z is mapped to ABS_DISTANCE for stylus/pen */
+			if (field->flags & HID_MAIN_ITEM_RELATIVE) {
+				map_rel(usage->hid & 0xf);
+			} else {
+				if (field->application == HID_DG_PEN ||
+				    field->physical == HID_DG_PEN ||
+				    field->logical == HID_DG_STYLUS ||
+				    field->physical == HID_DG_STYLUS ||
+				    field->application == HID_DG_DIGITIZER)
+					map_abs_clear(ABS_DISTANCE);
+				else
+					map_abs_clear(usage->hid & 0xf);
+			}
+			break;
+
 		case HID_GD_WHEEL:
 			if (field->flags & HID_MAIN_ITEM_RELATIVE) {
 				set_bit(REL_WHEEL, input->relbit);
-- 
2.51.0


