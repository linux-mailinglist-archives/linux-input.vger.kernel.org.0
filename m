Return-Path: <linux-input+bounces-10280-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D36A41937
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 10:34:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F98B3A3357
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 09:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0410B21D3C0;
	Mon, 24 Feb 2025 09:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WH78KHBX"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405B3158D96
	for <linux-input@vger.kernel.org>; Mon, 24 Feb 2025 09:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740389416; cv=none; b=NqIWZ2iYSPUdrUB7kDosbTwCGVaT1E3wIPQX1fb3HKbZNH1PUVwfpWxpmpDn13bKtl5UxUt8btEcerq1sQ8tg8/rz0+55ygctqcH+WSxZjvZ+U/Q6d2mTiBPJUI4fvYeOD5uJqMFnvNQ7gVN36ydBIjEetkBD2P9GhXVEy/QOGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740389416; c=relaxed/simple;
	bh=3T4YzAQURkv2cYSaZM4p2LxoTFID/ZnnSccXjrjxqf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bFcNTVIcIiKaY/tg27g8T/i+1obmluHPaMO7yg6QryLWj14ozPf8kaVH4z96FbGIwnDhnS1Lk1dC6HD8UKNq+kliVAvYooTKvW4vI/uuT58oqmq5H7yzQvqzgEIiL0YOwmNX4Uuae1gRId+IEbDkAUrZtMIuZudrqn2GNqVXE4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WH78KHBX; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5de8e26f69fso768019a12.0
        for <linux-input@vger.kernel.org>; Mon, 24 Feb 2025 01:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740389413; x=1740994213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bZYzwX+kmo0dpwpxSXaKJth2MnjzSzA80scLUp1v0LE=;
        b=WH78KHBXaXkuyVzSuJ63Gz4GB8ksvgBwJnGsQH5+HtylqcCE18tiruETFNeIrqYAEd
         D4TGQpDS9y+mR4YHm1t3Ksjx3XZS+xdVqBQeXlmUyqh909rcNYEqw+9CzeoVAnyy33+K
         CfqNFgQDrqZ2M9v570xdDhM4Ll5XUPKyARxfDRazeK/nJUSXwk/4eZMMFUfn81rryUgl
         Q7wbb/80RE0UZ8h/4nPMoaVZHTLtLXfN66j2tEtAWQOlu1qFPwn9TMC57m1wvlgWSGD4
         brK+KwbQlZgTkVjysnnaNNUJFP1ywUa9y0mw7eiQN4lj3HaHZeLo/WVlSYMGooREkBL8
         maVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740389413; x=1740994213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bZYzwX+kmo0dpwpxSXaKJth2MnjzSzA80scLUp1v0LE=;
        b=viak6HGOqdqJbh6u0KILwrLryiUlgdboFPTKZO+KsGmkD/2gDdIKEg0q3MSGZZ0eyL
         vJFl0/7UKKDSYg9EIWsXfyx2roZABK53ETUWYIFB78BHrLLWdPp4O6cYEgeuLQu/Yheb
         36qRxY0WXENhYp+HVjRbG+KXJIlFfC8MNAaqnM8ySzZgWul0U5oHPOx2xqwWZLhwk2W/
         2VatesHfuXCw/xf1E6MowCaMlJg4tXaZZII+K8lDoVLgJPF2VuwMDRY8AFBAPD7qVs14
         kDw5Ayu7te196n97HXoYoT61S5OYBHshH87qd7GiTKAuxonSBBiG7HcnpXqqwQG/YoPt
         pYLQ==
X-Forwarded-Encrypted: i=1; AJvYcCURCnsoAdnqImOmQDYXh3wLlqKLgK35Ddoo/gWlD0TWJnRQWVRTcNb7OtRuB5eSlffbHBZy0zb10/Me8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbKgqtvPnt5mFPFDxVKD+FA06KCIBDZp3bbJQrd5hddkY+w3O1
	zhyedgVU7RMt0D7W5NLgjRUToK5O7dIzz5iFKGG+IYRvvP+2Gc05
X-Gm-Gg: ASbGnctD2Dl0IyoStLicrhOkQEUNZSIPZjhhsAY2I/vOL0bESBiPh7mD8d2jdDcEmsu
	oEday9kkPMFdhVC5HxKz23jH8yO+wWVcvCdfL4T2mGo1Z755O4FNLlomudhSb9blExLYmdJb2Tt
	wdy/Q6Iw/ns5aM7K6dtlep01YIhAkD0eQd6E0eS0njiiCcVddon2XyTxCTvhRLw7ts9Ji6g2z4N
	t7fH0BGknV1xTYpMXKTHLhhGClg9Kgn98/0jMJCocoTHpWy7Pc0meD/TGtfVl+VnVVbe5CGgt06
	LESWvAosvcL9ImRtLcP13M9Uujjra2TRW6N2kOldQD/Qx+XSUMAbkDFFpbeKkO3CbsUcjNKR
X-Google-Smtp-Source: AGHT+IHEQJuB3LEkS8l8wyPHKNcNXQ7jeJNq+3Wha+UPjwFsNF1grnDTQGLz9ZFiafrz8lIBapCuTA==
X-Received: by 2002:a17:906:16d5:b0:abc:37ac:6e6b with SMTP id a640c23a62f3a-abc37ac700emr208910766b.7.1740389413069;
        Mon, 24 Feb 2025 01:30:13 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba4b9ee98sm1416668666b.167.2025.02.24.01.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 01:30:12 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	anssi.hannula@gmail.com,
	linux-input@vger.kernel.org
Subject: [PATCH 1/3] HID: pidff: Rename two functions to align them with naming convention
Date: Mon, 24 Feb 2025 10:30:07 +0100
Message-ID: <20250224093009.1831811-2-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250224093009.1831811-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250224093009.1831811-1-tomasz.pakula.oficjalny@gmail.com>
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


