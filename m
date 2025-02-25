Return-Path: <linux-input+bounces-10369-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3036AA4502A
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 23:32:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D24FA188B55B
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 22:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A43EA216E3B;
	Tue, 25 Feb 2025 22:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lDkctC+o"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98FA207653;
	Tue, 25 Feb 2025 22:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740522612; cv=none; b=qst60bJC3n4QA7BdFC+JXPK8GTr17OTS4RFSNIqKFckf4BeUTvKE+NqmnEakyOfaMBvl/ct30MPCOVD6DvpUKlSusOAinWVjrAcQx64UccjHM2fZWn8McCGvBN7Sn60E/MCmdlbRRy/MogC+6tpYHLVeoYxxUx3ga/rWAsicDVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740522612; c=relaxed/simple;
	bh=3T4YzAQURkv2cYSaZM4p2LxoTFID/ZnnSccXjrjxqf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iPG96EjtVTYhBn71MD/bpW5pjfbnkudWRgxFllb7OH+Ho/+e8JIOlsFDtGy6uWcwSVwCAqf4ZVaOMeLiFY0/bkr7apCipqFQX3BkFXDRq8dOw5cS77rlFeS35DKsRmJHkur9Eazo0GG5CqiKJeJdIMncFLhucZzziwuDQfjKO+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lDkctC+o; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5ded7cb613eso1200147a12.2;
        Tue, 25 Feb 2025 14:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740522609; x=1741127409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bZYzwX+kmo0dpwpxSXaKJth2MnjzSzA80scLUp1v0LE=;
        b=lDkctC+oPhmQFiBwbRRk8ikDmUWuLctryJO7aJ6Pdt16ImQkc6KPeyN96IfXoXdyJi
         6KPhbvAT8CWsCPInXcWrCDh7b7roRu+5AagBdL9lF89YjsBEWjTatSlXGiT7gjpqFGKb
         xZPFnWzshMjJ1ypnQnl0Pmo39cuBwOPZXud+A75kuDysjnLLCZAdElK4Mjt3rijXrShd
         KEnipbe2vHVtYMZNN+V0m8Z8c7QwMDbosuBWpFdp8yvB2dfg2g6IfwMIQB3YFl1Mfu8w
         yD6dqUoBd8UE0RHheapAdiwkyZmppoSQn5j3z1R9yP7urlnhEyOodQwTeH32FAV6vaCH
         Dc9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740522609; x=1741127409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bZYzwX+kmo0dpwpxSXaKJth2MnjzSzA80scLUp1v0LE=;
        b=anw0mz78zyMhfXnd/5nX1c9Mdmlqfo9BirCnTkdQg6z/3HHriA+U+02Jmo9vzcROqd
         93E1QvMtiqrYVHHGBROZmqs/FlSqROaZrOYAVfNRDwWQIDeVfhrhNNk5tdd5btEOVNx+
         8JoAHMCQI9zuTHvoSeOrpLu6NgBXa3oahSZ+eNwVcbaUm6HNTeygYS8PLIPQDnh0dYU9
         eqkSZuWGYpLMihF+OD9Wg7nXmb/06NO0PasWVLptNRGPLPIYyqMG4/QJaJoP1HEbUn6f
         RK8gQfmuoMVSLs8LQDgPpSsOKAlQbLTsM9CL1PWIvlPvNW7mUtEXZVXdN2Wv36ZZkhKg
         vAOg==
X-Forwarded-Encrypted: i=1; AJvYcCUVeWCcytlOmAN2Cwth0iZPG0bWCqjiXRnjsrPOWtQN3BWair+LrPEkyheM+2IazxxNLXB5/QP5B/nv@vger.kernel.org, AJvYcCXoCuri7rWrlfnkZQIpACqIB8dyhrAiTwf4wj703V2tEX0JSHkjBTT59H8PYh/QnyZ1rNdH+JkUepJW1w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxny4MS0XS7fzLiJhVXmOdkmIxxu/pcWuJWJZcGZtViInjszDA3
	eSmnDnEI6D4PllS6oQXX0jZgv6o4EJFGO5gcKTim0Vizpac29ILt
X-Gm-Gg: ASbGncs/Fv/qkNARUvQ82koy0stjBqVvVV7GGXloz4E9Z+BvBI8ChCE4QVRE1/dEbU+
	Qn2c4o/QqjniDgeeINNYVp6m/YdY8OHxxe0NhAh7lGwJgqYsZ/m8vP3FN7/B932n6L90N5o2WgA
	uPDiK1tK7GsiVBI7Yk3dCsBgdJ3PYThdzWAUvNBwC77NZMH+FREFq3hGRC+FNnQMhcP1QTaYssM
	+ZtU2NXxXJquVNrwocQrk/cmxO6Knquccv9VtX5GybWuXWUQ4xCTvyV1UWgB4WZDyd6nSW26Fcp
	8cetYUNLZc4MTLykQkr1qt+K0tyXQYXTgk7J2E3hvdEHUcen9dWmfBpx+UprCWzmluRBvWU3
X-Google-Smtp-Source: AGHT+IHw3SJjqJSEYtOvdxeYXka4pS3aAK66J353K93o/HsKrYcWwdEFOXBcXku6XswTRWo+1Q+0YA==
X-Received: by 2002:a17:907:9722:b0:ab6:d3b6:d825 with SMTP id a640c23a62f3a-abc09a578efmr637301566b.6.1740522608844;
        Tue, 25 Feb 2025 14:30:08 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed2010f74sm209122566b.121.2025.02.25.14.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 14:30:08 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 1/5] HID: pidff: Rename two functions to align them with naming convention
Date: Tue, 25 Feb 2025 23:30:00 +0100
Message-ID: <20250225223004.415965-2-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250225223004.415965-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250225223004.415965-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Driver uses "set" everywhere to indicate setting report values and
requesting HID_REQ_SET_REPORT

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 6f6c47bd57ea..ffecc712be00 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -552,7 +552,7 @@ static void pidff_set_gain_report(struct pidff_device *pidff, u16 gain)
 /*
  * Clear device control report
  */
-static void pidff_send_device_control(struct pidff_device *pidff, int field)
+static void pidff_set_device_control(struct pidff_device *pidff, int field)
 {
 	int i, tmp;
 	int field_index = pidff->control_id[field];
@@ -578,10 +578,10 @@ static void pidff_send_device_control(struct pidff_device *pidff, int field)
 /*
  * Modify actuators state
  */
-static void pidff_modify_actuators_state(struct pidff_device *pidff, bool enable)
+static void pidff_set_actuators(struct pidff_device *pidff, bool enable)
 {
 	hid_dbg(pidff->hid, "%s actuators\n", enable ? "Enable" : "Disable");
-	pidff_send_device_control(pidff,
+	pidff_set_device_control(pidff,
 		enable ? PID_ENABLE_ACTUATORS : PID_DISABLE_ACTUATORS);
 }
 
@@ -591,12 +591,12 @@ static void pidff_modify_actuators_state(struct pidff_device *pidff, bool enable
 static void pidff_reset(struct pidff_device *pidff)
 {
 	/* We reset twice as sometimes hid_wait_io isn't waiting long enough */
-	pidff_send_device_control(pidff, PID_RESET);
-	pidff_send_device_control(pidff, PID_RESET);
+	pidff_set_device_control(pidff, PID_RESET);
+	pidff_set_device_control(pidff, PID_RESET);
 	pidff->effect_count = 0;
 
-	pidff_send_device_control(pidff, PID_STOP_ALL_EFFECTS);
-	pidff_modify_actuators_state(pidff, 1);
+	pidff_set_device_control(pidff, PID_STOP_ALL_EFFECTS);
+	pidff_set_actuators(pidff, 1);
 }
 
 /*
-- 
2.48.1


