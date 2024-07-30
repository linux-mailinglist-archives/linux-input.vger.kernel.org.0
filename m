Return-Path: <linux-input+bounces-5209-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 418F49415C1
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2024 17:52:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB2201F254AF
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2024 15:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50192145A18;
	Tue, 30 Jul 2024 15:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TzjMdKM1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60541BA869;
	Tue, 30 Jul 2024 15:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722354728; cv=none; b=OGnqgSqZfiI7mAX7t8b2dn5csmxtsbJrIdp//JddFND5V9QLzM+4w83SKOag1eG2kO4Y0KF6saxdYozxn+VGFtbeY+K0eacEYMygG7TdkNqSrxYHkZW0GLqNHUF+s/XY+Z2KvVUnTy+NaA0N1fjotTazDORumTD3lqfy39GOrLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722354728; c=relaxed/simple;
	bh=FL/qY9kZgeoZ8OVYj74nz1JqSGuDuc00dgkKFESUfNA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KdFkp7z++J95/A5eJk24ZHJfVYrhLY1AjJLJo67X8U+HQ1VG+pBXNq9HC6qraKE3dZbzxXgavqk3BN0ubu1V15fWNqrrDktj5t0I8eL0sA9sJDyHiPT8eTUuGTTl7+VuKM1rVvV1g6cn+fJAKEEqX/fbRb9CcrKanJ0uVXRDSOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TzjMdKM1; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2cb55418470so2922500a91.1;
        Tue, 30 Jul 2024 08:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722354726; x=1722959526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rGTJNgxfe9Ob3gBJFcR51TvMio1QbF0ml0yPuynT6so=;
        b=TzjMdKM1/W7qHt4u1G8qLFjDyXe3IlPXnpU16rgVlnCLgFJcV6JRe0MLtchvP8bYYQ
         RNTq2wjCtohhheoXagrkFT1R0CPXNlnUOepO42kdllJbtmdauoNnxeLk8D2ujmIA0HK3
         fBfmXyOUrXjpOzB0bpjKMEh2QFFiW6I3vMtgo0xz+oWLy8Sxp+2YRBe8LwyNsvpze8Z6
         Gs/NFlB33eZohnykS8uTUSidn/3lMviqF47/UXEYeGqvfvX7WMH2yGVWbXpDGGl/RMlQ
         pfQZu3T35Yr19fvHVHzuZeNKk4Dh5nF6Ambr/4O2h8HSrMMsznhfJE1Y+6CiEUUiyiZZ
         BdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722354726; x=1722959526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rGTJNgxfe9Ob3gBJFcR51TvMio1QbF0ml0yPuynT6so=;
        b=G//WKlMGnTIhEuUxxuC0KlYqMM7bATnG1eHPmHi/isebd0QWzojWhiD89w1pVt9TX9
         mEtso+0M6ezR9I0nhEw0iH630xOeRoanc+eBfnSjEbA0Dj46F+Ibr/cO3FMaQw42AKBu
         4dU8nLQPkT5U8KJaw8aD3KmWlXFjUUJcEAmj6kcEPeVQco8YPXkR+Pabw0TykS90XT37
         Ld4FLokKlQXrKNbq+QQATbYbgESuKSG/+/QQ2ixqxI544E9CSqQnnsTtauTsHGjDuj7B
         VburL+uLvkA4gs0vGxfeywROCSTn5+EQbuP4Jo1ubHHkQK+KqBcbaHhVuH4jcaE4w296
         8eDw==
X-Forwarded-Encrypted: i=1; AJvYcCU5Lekpg/bR0/42TzNBAoPxEJCUH9M7AECQ7PRk5LdVCTZOyARA9yMrOzcDW9wPRpDk/PPe2tYM7JWOdQ1AETE/6Sqgs/6Z
X-Gm-Message-State: AOJu0YwDrqoVAyw7jiDLnsFFixHzGCeRm5gd2OMoKy9I3w7ctKzWFq9A
	EYBUN4i+tGf4FJQvhQqCyWEgt0PSTBagozm2cP8E52fae9quN6ztXHZafg==
X-Google-Smtp-Source: AGHT+IF4b6FaThdPXhzvuE3TfYcb2tkeIxqSYmJ/MJuohBSEy7VD5QcKXAD5OZFnOzhaMkjSCNbAWA==
X-Received: by 2002:a17:90a:9c7:b0:2c9:6278:27c9 with SMTP id 98e67ed59e1d1-2cf7e621f45mr9461877a91.38.1722354724200;
        Tue, 30 Jul 2024 08:52:04 -0700 (PDT)
Received: from localhost.localdomain (71-34-81-131.ptld.qwest.net. [71.34.81.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb7600054sm12788517a91.47.2024.07.30.08.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 08:52:03 -0700 (PDT)
From: "Gerecke, Jason" <killertofu@gmail.com>
X-Google-Original-From: "Gerecke, Jason" <jason.gerecke@wacom.com>
To: linux-input@vger.kernel.org,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Jiri Kosina <jikos@kernel.org>
Cc: Ping Cheng <pinglinux@gmail.com>,
	Joshua Dickens <Joshua@Joshua-Dickens.com>,
	Erin Skomra <skomra@gmail.com>,
	"Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>,
	Jason Gerecke <jason.gerecke@wacom.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/5] HID: wacom: Defer calculation of resolution until resolution_code is known
Date: Tue, 30 Jul 2024 08:51:55 -0700
Message-ID: <20240730155159.3156-1-jason.gerecke@wacom.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jason Gerecke <jason.gerecke@wacom.com>

The Wacom driver maps the HID_DG_TWIST usage to ABS_Z (rather than ABS_RZ)
for historic reasons. When the code to support twist was introduced in
commit 50066a042da5 ("HID: wacom: generic: Add support for height, tilt,
and twist usages"), we were careful to write it in such a way that it had
HID calculate the resolution of the twist axis assuming ABS_RZ instead
(so that we would get correct angular behavior). This was broken with
the introduction of commit 08a46b4190d3 ("HID: wacom: Set a default
resolution for older tablets"), which moved the resolution calculation
to occur *before* the adjustment from ABS_Z to ABS_RZ occurred.

This commit moves the calculation of resolution after the point that
we are finished setting things up for its proper use.

Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
Fixes: 08a46b4190d3 ("HID: wacom: Set a default resolution for older tablets")
Cc: stable@vger.kernel.org
---
 drivers/hid/wacom_wac.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 1f4564982b958..2541fa2e0fa3b 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -1878,12 +1878,14 @@ static void wacom_map_usage(struct input_dev *input, struct hid_usage *usage,
 	int fmax = field->logical_maximum;
 	unsigned int equivalent_usage = wacom_equivalent_usage(usage->hid);
 	int resolution_code = code;
-	int resolution = hidinput_calc_abs_res(field, resolution_code);
+	int resolution;
 
 	if (equivalent_usage == HID_DG_TWIST) {
 		resolution_code = ABS_RZ;
 	}
 
+	resolution = hidinput_calc_abs_res(field, resolution_code);
+
 	if (equivalent_usage == HID_GD_X) {
 		fmin += features->offset_left;
 		fmax -= features->offset_right;
-- 
2.45.2


