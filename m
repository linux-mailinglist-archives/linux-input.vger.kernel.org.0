Return-Path: <linux-input+bounces-13479-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAC5B00DBD
	for <lists+linux-input@lfdr.de>; Thu, 10 Jul 2025 23:29:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D18C1C436DF
	for <lists+linux-input@lfdr.de>; Thu, 10 Jul 2025 21:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 104C02FE312;
	Thu, 10 Jul 2025 21:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lJSb5oTg"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838BC23506E
	for <linux-input@vger.kernel.org>; Thu, 10 Jul 2025 21:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752182946; cv=none; b=Fmsv06cno+JLm5V3NV8lveRgTqq4pHMiOtGuL45bpUsA5qZ+MGZCBEZ3MXwVrSMaB7D0UNFNP/VQgLqYWq4UP1Pmy3aD1VIDmrUzmPffhxGu4f2H0xfZnCavCVhEvBulb30/9KP5BoHHAnnNvaK/tB2cv5du+JX3PGMbSY+pWd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752182946; c=relaxed/simple;
	bh=WYbnagY6aIE2QPOhXormiV9s0RFkSUGiF6lLWgkKeIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fi6BR9qy5fvmsDA8QJVRwicOBfozTTNs1g2QhLo+8N9+NcQ7rgUwafhhz4sEAJP/h9lr49GcrwbM6OVJmQS+K7imZL3hhh02wkGfKfWwa9OndtVr3KA/rfYLE72PqgAkQjnRyuFuOp0hBN/OhrMy/3JbFD8PYThdseBf56jcx2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lJSb5oTg; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-74924255af4so1315765b3a.1
        for <linux-input@vger.kernel.org>; Thu, 10 Jul 2025 14:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752182943; x=1752787743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NY3tikFQWOYl2+aBjvgIb3mWrTfuNWb4LJGfyQX67/c=;
        b=lJSb5oTgeIEZAhDTc8tFd69HjcuGcBh0NYtY89X9Hl10V4suolxtywhA7/BPz67MIG
         UNm720bQX9uy2S+a2UwaCgTWx7yhgNXsjXOKz+In0YJB9IdfikZGzozCG8gLFdA7m212
         LiOhtA/XuTmybnyzh+dRvCvfUB1mawr2X2BVhT3+YjYsRBuBq8Slun8JBLTPEWbCnBCG
         P65Ter5rEhH9dcITRb1R4JNw3Twt2PmNa4beMez+fmAPvI+y9mCSlR65wLAlYkKRHeGn
         rtUtNN0pV5XjAWdlJJlkDmjgl5yFsUi89BpId/w/+fDJq3UiYokVtVANmr+T56hF2FKY
         GvvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752182943; x=1752787743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NY3tikFQWOYl2+aBjvgIb3mWrTfuNWb4LJGfyQX67/c=;
        b=C+UJxN78uyPlBwpwqeCiNbiy4U8MkefnS2txHCd9FuPm4bhDdUozBj33sJuzkRmTf4
         gOENthGRNudjg0AlheraJyX3yZn5SumZtP8kXqK5WNIdCMHWu2GkL5diHqbTezVm8voD
         1vCpiDXKvJJX3uAlXao4eL4AX2+MnIg9XjATYg353vdW69TaDcU8wQblGwp/uc7FHISY
         j+tXjbfCws7auxocZX+Ukmc13i9L7lAmksS14ZJv4SLGK0WTaEhyP4drO85dDuVkVlOc
         4FD2fAtpLNC9084hKLTPklQZi9QBdHLHn2IssIZWAUsvSCIn8xI2YQbXVvDWJx0DArT8
         bgzQ==
X-Gm-Message-State: AOJu0YxL0VYeeD8wacZvT21qSW8efIMF3QDYLyHLzzam/Ba2n+HgJHKQ
	wL95MwQpbsOqj4VJDO2uX6lzz49M8saZ3NWfyNj70jQf7ADB4DMotu24vIi7iQ==
X-Gm-Gg: ASbGncu5gv12sK8aGASv3NDLUvN74XLvGkPElEqxsoc7OAaggRQbwwFuw6M2csEcJmq
	S8/W+76zwagMUBuZ4ZtrOXm/S/XlzlTHo2pW1kMp+QCTlIN14p8DvGkUwQ8wCwGAw2zIfgi6RVp
	ZA7HohlCnWq7wdOlUHdvVKd7Nn+scVHa0ICAFozH2TRx4Ehlt+nc31UyO2gc/CgROM/etQEVLGz
	Fp1g6F2kszHtLGjHlHTuKSy9nLb/0gYmDLRrVHqdQCv9Qwh5n/QRpaCwg3yE2Wr8puSrKSFogIf
	isEdL1JHiNMpDB7m6z55p1efccTMAuUIz9BMGV+Mn8RXPzgCqx2uHfbJoW7TGR7c0Sbgw5AlODd
	iMnPIXf0CWOtcwIyVgA==
X-Google-Smtp-Source: AGHT+IHIDAaJbA5pqWrD3+Qf7nbKBOuBcvYsUVCEc7EeWpbm80IdKHINSqi4vZfxlu/H3ivRBJkbEQ==
X-Received: by 2002:a05:6a20:e198:b0:215:d565:3026 with SMTP id adf61e73a8af0-23137e8da69mr752709637.20.1752182943249;
        Thu, 10 Jul 2025 14:29:03 -0700 (PDT)
Received: from ping-dynabook-V62-B.fvrl.org ([66.96.79.214])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f8fa6csm3343913b3a.170.2025.07.10.14.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:29:02 -0700 (PDT)
From: Ping Cheng <pinglinux@gmail.com>
X-Google-Original-From: Ping Cheng <ping.cheng@wacom.com>
To: linux-input@vger.kernel.org
Cc: jkosina@suse.com,
	bentiss@kernel.org,
	Dmitry.Torokhov@gmail.com,
	stable@kernel.org,
	Ping Cheng <ping.cheng@wacom.com>
Subject: [PATCH 1/2] HID: input: map HID_GD_Z to ABS_DISTANCE for stylus/pen
Date: Thu, 10 Jul 2025 14:28:59 -0700
Message-ID: <20250710212859.7892-1-ping.cheng@wacom.com>
X-Mailer: git-send-email 2.43.0
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
---
 drivers/hid/hid-input.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index ff1784b5c2a4..240bc8a5f3bc 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -858,8 +858,18 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 			goto ignore;
 
 		switch (usage->hid) {
+		case HID_GD_Z:
+			/* HID_GD_Z is mapped to ABS_DISTANCE for stylus/pen */
+			if ((field->application & 0xff) == 0x02) {
+				if (field->flags & HID_MAIN_ITEM_RELATIVE)
+					map_rel(usage->hid & 0xf);
+				else
+					map_abs_clear(ABS_DISTANCE);
+				break;
+			}
+			/* fall through for other devices/tools */
 		/* These usage IDs map directly to the usage codes. */
-		case HID_GD_X: case HID_GD_Y: case HID_GD_Z:
+		case HID_GD_X: case HID_GD_Y:
 		case HID_GD_RX: case HID_GD_RY: case HID_GD_RZ:
 			if (field->flags & HID_MAIN_ITEM_RELATIVE)
 				map_rel(usage->hid & 0xf);
-- 
2.50.0


