Return-Path: <linux-input+bounces-16296-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A6AC7D4DA
	for <lists+linux-input@lfdr.de>; Sat, 22 Nov 2025 18:37:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30DAD3AA6EF
	for <lists+linux-input@lfdr.de>; Sat, 22 Nov 2025 17:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2220727FD76;
	Sat, 22 Nov 2025 17:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GnrAa+h4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC5E27CB0A
	for <linux-input@vger.kernel.org>; Sat, 22 Nov 2025 17:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763833055; cv=none; b=nzISK4mQjjPomUFtY766fZ5SJf9hiPwrMCReXz1Nc9VfMjpQ1oVQ/QCUQ4p+NQIsZSkWPJyw0CzP4pGIdyAEqzfysGSvCFLyGp7sDJ4YAeJLPzKgRv6sTNpVni+dQaEFX9W8Q8Q534FvhX8OrZdxCCDMF1O8KqxZ8/hC4lR7k50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763833055; c=relaxed/simple;
	bh=jgSpPfKX7nKuDlbS1ie3b78ZMi4lnqU28xD8BnkyxRc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RXYeJVRUzIUjQht0H+/3xSxG2nYPEmJ7L9yxb82juayZVM9geeXbUOQzsOVs8yoJcsfhtVp5guV6wGnFYqb50HIg5a7RaR40uyI8RZBjVu0RAiLubkbdyeFHh7fzeCcwqxFqZQskJoaqQLh5eNsO4nKa7tv7o6FirgcxrIWDsxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GnrAa+h4; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477bf34f5f5so14235245e9.0
        for <linux-input@vger.kernel.org>; Sat, 22 Nov 2025 09:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763833051; x=1764437851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zNcsW5vBnLmxdCKt7kb43zPkWdZHd7JLYgIeVgNn+Ng=;
        b=GnrAa+h4VoONSlN3XqKtSFagoITSpngz1hHBNfl58ezjc04F54QtizrFnVa7lX4lLj
         MJsHBMXWFI80lOKbEzw4bW7rE5B61GkipO1i8Ctp4meR2leKgX1fdnapz1p9cJy3EGrX
         zrZAoI9zXvPXGOnY/0KaD1Tcdlg36dV113fPRLRY4joytGoD3vKJibYnEei33/LV0pqp
         isRO/x1179k21aSTxWFQ3llhJEuXJwf5EM6NOmkSIOKCZ2Lr3lK+1daK4GHO4BznlcgB
         ehIRzVVOUeGz9KCiOmf5/n92HZ46iKvzLbkEqByhNi36jnmuGO09KTKkIZ/Xnb2Tl6ir
         W1Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763833051; x=1764437851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNcsW5vBnLmxdCKt7kb43zPkWdZHd7JLYgIeVgNn+Ng=;
        b=cAzBCMLdDRraS6Oqdru6DpFmFhZE3R1va3X0OeNIug3afwsuIoC56iDOSr80mL93w1
         vHL7YpFzlAPIjPeqKc7K2+TrjmvBj2nhHPk3BHBiEk3kGzTP67jOsQBnQMmB+Ci4rxtQ
         tJnuzxf3AkizlotlgnmRTmBE9CGFPcOnpJdQWx3qPGaZw5zdhqpdGbrdknW4g3fN0mHC
         IXYudAe7nUiS8euVdxIaSLvPzf2DCikgfYzkhPfYsAlVdG9FvV9ofmzhT6Oaf4yT4v0U
         IzdecuT2j/afAkKNrGD4DB/Po5XtZ5yojlVAYUEKDg+ShEycnBca9D0XqbPYCZwk+fiP
         kM5g==
X-Gm-Message-State: AOJu0YwsphHuxUb67KYAxFsqTNvrnNQQ72orb0lEQPn3AhOWQXj26bo+
	hH5bs1em6asqxwiqaWosggUFmeLed9GFKNOoVpLjckZ2c94AaLK60eqv
X-Gm-Gg: ASbGncuehN3d0O5NdywQsFwedLkfLYMrCeFrm/6JnPNT9L6kEzOKEvJyReM5bIdlJde
	FiEzedSA6bo4pt+htzub9cPD56rIzUGhfBgWZyeAk3ZcbjKV/P3aKtfN9U3WxsgSaMvDR7FctDU
	eKcL6cMfpmhyvsknzVF5+FKpCX0fKU/uWEBsGAvPgVLFNYQJQnsgXq+sQghOomZfgO9JM6V9ZQU
	qvDR66ZLKXtzXQV1d7R+iJQrvTaGb3Au4iQ7ZwE+gb2ejz1kaDd3vTKs/relLYFRKmd4+rFQhnb
	qqoBONiGi6fgGhr2Q9IwMB5o0z/e7W6asIqGWGcRc8IsV45j1PF3SqwkILp32aW5MAORhqPZFAa
	99HJHqvRHG25WOj+A3yqZMs4Zoho378aU7Mdx9C+c0GPaPUBNemd0woX267U6EbgY0nuylcGNkI
	OBOe7G/dFr8YIT1xc1Tj0ies+Amzy6
X-Google-Smtp-Source: AGHT+IGsTfGxHQxgZgJIIPv8CKF40nlldzUGw8hZ4M8Uj5zOydPQyKyC7DmLvOxFKHiXw3+JrzWB8w==
X-Received: by 2002:a05:6000:220e:b0:42b:3978:1587 with SMTP id ffacd0b85a97d-42cc1d27ac6mr5941658f8f.36.1763833050375;
        Sat, 22 Nov 2025 09:37:30 -0800 (PST)
Received: from ekhafagy-ROG-Strix.. ([197.46.88.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fd8baesm18115824f8f.39.2025.11.22.09.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 09:37:29 -0800 (PST)
From: Eslam Khafagy <eslam.medhat1993@gmail.com>
To: roderick.colenbrander@sony.com,
	jikos@kernel.org,
	bentiss@kernel.org,
	max@enpas.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eslam Khafagy <eslam.medhat1993@gmail.com>,
	syzbot+4f5f81e1456a1f645bf8@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH v3] HID: memory leak in dualshock4_get_calibration_data
Date: Sat, 22 Nov 2025 19:37:12 +0200
Message-ID: <20251122173712.76397-1-eslam.medhat1993@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function dualshock4_get_calibration_data allocates memory to pointer
buf .However, the function may exit prematurely due to transfer_failure
in this case it does not handle freeing memory.

This patch handles memory deallocation at exit.

Reported-by: syzbot+4f5f81e1456a1f645bf8@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/691560c4.a70a0220.3124cb.0019.GAE@google.com/T/
Tested-by: syzbot+4f5f81e1456a1f645bf8@syzkaller.appspotmail.com
Fixes: 947992c7fa9e0 ("HID: playstation: DS4: Fix calibration workaround for clone devices")
Cc: stable@vger.kernel.org
Signed-off-by: Eslam Khafagy <eslam.medhat1993@gmail.com>
---
v3:
* Address issues reported by checkpatch and re-format commit message
for better readability
* kfree() is safe so no need to check for NULL pointer

v2: https://lore.kernel.org/all/20251116022723.29857-1-eslam.medhat1993@gmail.com/
* Adding tag "Cc: stable@vger.kernel.org"

v1: https://lore.kernel.org/all/20251115022323.1395726-1-eslam.medhat1993@gmail.com/
 

 drivers/hid/hid-playstation.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 128aa6abd10b..05a8522ace4f 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -1994,9 +1994,6 @@ static int dualshock4_get_calibration_data(struct dualshock4 *ds4)
 	acc_z_plus       = get_unaligned_le16(&buf[31]);
 	acc_z_minus      = get_unaligned_le16(&buf[33]);
 
-	/* Done parsing the buffer, so let's free it. */
-	kfree(buf);
-
 	/*
 	 * Set gyroscope calibration and normalization parameters.
 	 * Data values will be normalized to 1/DS4_GYRO_RES_PER_DEG_S degree/s.
@@ -2043,6 +2040,9 @@ static int dualshock4_get_calibration_data(struct dualshock4 *ds4)
 	ds4->accel_calib_data[2].sens_denom = range_2g;
 
 transfer_failed:
+	/* First free buf if still allocated */
+	kfree(buf);
+
 	/*
 	 * Sanity check gyro calibration data. This is needed to prevent crashes
 	 * during report handling of virtual, clone or broken devices not implementing
-- 
2.43.0


