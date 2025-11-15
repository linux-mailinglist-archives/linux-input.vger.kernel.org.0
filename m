Return-Path: <linux-input+bounces-16119-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D69FC5FE28
	for <lists+linux-input@lfdr.de>; Sat, 15 Nov 2025 03:24:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 855BB35C292
	for <lists+linux-input@lfdr.de>; Sat, 15 Nov 2025 02:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5A381F3BAC;
	Sat, 15 Nov 2025 02:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dzx35Vfs"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7441E3DF2
	for <linux-input@vger.kernel.org>; Sat, 15 Nov 2025 02:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763173410; cv=none; b=CKtinGZA5MBlseILaD7e8HwHL133h70m8dKiN6TSG1KBmrP9nVEWjMjF6jaqkPSJc/UAQ/sHEQXOq7TEW9NTjJE0TAN1WmrRG+jd7hYJH8DYmPxVH0dCQjxSv8iuxMN9LEfJ0r9VjHEmMwihLKV5PFAeEKBMRL/3CPpz5VeM4Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763173410; c=relaxed/simple;
	bh=PDuIwqkmp4oY++AO5WJEFu5LTrqlYcDohavau5UgJBw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tfKlJahhbjfK+u/UQgublpp3GeOPAQpfYnFsHSv3TETdGHm5dzSOPe21/6ioPi0/QQkQvlO4s9BwBw6IC4q6z5eCfggTx550C0IMm7oUnBsRf+O/6J9zqhYD1tuCSgo1/0/+xaERz6rmJoAWDmqA0n6f8M0slN7rgNF8EcdXL5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dzx35Vfs; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso17901425e9.2
        for <linux-input@vger.kernel.org>; Fri, 14 Nov 2025 18:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763173407; x=1763778207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yq39x51ae6KSXgKlBMN16r069fnAu1T426yuW0a275o=;
        b=Dzx35VfsIyfoXs4YE+h4D5y1h1M/yPItyo4RBnM/HNXfNmEovEx5vGdCu54mGvVqsp
         skplMTFmaHbLaywz5fv44R+MhCJDnZw2FtqP8Bfd4o3K2pUtrm89Kxky6iA7Q/BgP6rm
         XunPXn193lhY1Z81W1YyyI/475GrKDDxrXwrZI90HpJ/XguceCnguruoFWWKneBMgczB
         tVrC8hkZ96BMMe/TIr8PHR7IdweCr6QxJ6um2NpxNatgP4c8Sh6WxrZNDvKIV7K3zjFe
         Hqw+MAnqZKc3KkwENloSKQaVfXYlbvotia8LU5F5A0jxGHUPCao/1XfH7d+GfKE62OPP
         cUxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763173407; x=1763778207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yq39x51ae6KSXgKlBMN16r069fnAu1T426yuW0a275o=;
        b=K7A0iTAtjQHLk4N+kCKLCb5nhNJLYFwBaSb1zaXTC27k94KfmagWKJjNSBgf2iSefW
         R2/5NJHSTjGraic5jKLwKGPwlyhzyMiekLa/ebfwTtZYHjJwCu63lzWMyoY2pV20X5Cu
         DW7X+7OERS1vN2zpglD5ohwceCqFQu/pMtFup9C2hr6wJuf+zrsML+jpi1+z7Nx0PvBw
         JiiBjHsWygb1PYB3+YvtDSXKGCCNoEciu8otu5UM9K95xriYEgpwqbbXq9b19ZRz5MUJ
         lfYLjH5AL6aVuAsyZzQTUTv7HqnaL9dthF58wc9e/tjeVAnB4ZQM862mVeRMPAPXhhdY
         scYg==
X-Gm-Message-State: AOJu0YxLY2/sQBttcWO3TcmBFSB7nZNKnhfPhoZ13xS86RHY5HJSsnkA
	W2IpQnRtt3rKeb9gxP3uOF9F9OfidIKgbEj+LwlFh1vT5zCu75qa8+xW
X-Gm-Gg: ASbGncu8wHlcr0yDyrDmzPS2wI2Dth3mLRVIuCXLpC3aN1mnV3S8KOnODDaEIe9E2Ar
	qHUiZ9p5zuqFQGC4iIL7o/H+pH1ed1rvS+sNxCc6Eki8z01BhyQ5LlUudZrCrRGYIu8Yb6l3Kfz
	sddWgq1lwQJxkd+kChhmWypb/iGaFKBXcmTdkPdgd/23s55BpCkiOcApxx3560kmzBuQyQ15IOs
	RS1FXc6/SRAL10AKz5OpFbC0fa+3g05F7x4wyS/1h3aT8DL+teHkg1EHbucV+JoUdL54Z63RMmK
	mOtOihgnZyFUjqYPH/0zbLgLVs22vu9Uxr2Ufdub4odqR3RE5y6Mb0irT3xC+OLsWJx6xSU+eoe
	gIyY7mf8WRBfyW9YphqdzLUzYDI98dngjidotvDcBAxg3PX4ZqKeMPxEUFX9PiWTgySE0PyjAZT
	0dFXLscGhFPdmsGgE4Qw==
X-Google-Smtp-Source: AGHT+IHwtds412uhUupLtmV+2/NGIul99ockQiTr5w6D0rYEzcLwFACKDUNxLF2QbUdnIpMPXMH43g==
X-Received: by 2002:a05:600c:4695:b0:477:63b4:ef7a with SMTP id 5b1f17b1804b1-4778feaa8a1mr40105145e9.20.1763173407164;
        Fri, 14 Nov 2025 18:23:27 -0800 (PST)
Received: from ekhafagy-ROG-Strix.. ([197.46.78.60])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778bcfbaeasm56157495e9.9.2025.11.14.18.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 18:23:26 -0800 (PST)
From: Eslam Khafagy <eslam.medhat1993@gmail.com>
To: roderick.colenbrander@sony.com,
	jikos@kernel.org,
	bentiss@kernel.org,
	max@enpas.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	eslam.medhat1993@gmail.com,
	syzbot+4f5f81e1456a1f645bf8@syzkaller.appspotmail.com
Subject: [PATCH] HID: memory leak in dualshock4_get_calibration_data
Date: Sat, 15 Nov 2025 04:23:23 +0200
Message-ID: <20251115022323.1395726-1-eslam.medhat1993@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

function dualshock4_get_calibration_data allocates memory to pointer
buf. however the function may exit prematurely due to transfer_failure
in this case it does not handle freeing memory.

this patch handles memory deallocation at exit.

Reported-by: syzbot+4f5f81e1456a1f645bf8@syzkaller.appspotmail.com
Tested-by: syzbot+4f5f81e1456a1f645bf8@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/691560c4.a70a0220.3124cb.0019.GAE@google.com/T/
Fixes: 947992c7fa9e0 ("HID: playstation: DS4: Fix calibration workaround for clone devices")
Signed-off-by: Eslam Khafagy <eslam.medhat1993@gmail.com>
---
 drivers/hid/hid-playstation.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 63f6eb9030d1..fef81b7e27c1 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -1992,9 +1992,6 @@ static int dualshock4_get_calibration_data(struct dualshock4 *ds4)
 	acc_z_plus       = get_unaligned_le16(&buf[31]);
 	acc_z_minus      = get_unaligned_le16(&buf[33]);
 
-	/* Done parsing the buffer, so let's free it. */
-	kfree(buf);
-
 	/*
 	 * Set gyroscope calibration and normalization parameters.
 	 * Data values will be normalized to 1/DS4_GYRO_RES_PER_DEG_S degree/s.
@@ -2041,6 +2038,10 @@ static int dualshock4_get_calibration_data(struct dualshock4 *ds4)
 	ds4->accel_calib_data[2].sens_denom = range_2g;
 
 transfer_failed:
+	/* First free buf if still allocated */
+	if(buf)
+		kfree(buf);
+
 	/*
 	 * Sanity check gyro calibration data. This is needed to prevent crashes
 	 * during report handling of virtual, clone or broken devices not implementing
-- 
2.43.0


