Return-Path: <linux-input+bounces-16124-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D766BC60F05
	for <lists+linux-input@lfdr.de>; Sun, 16 Nov 2025 03:27:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4773C34F082
	for <lists+linux-input@lfdr.de>; Sun, 16 Nov 2025 02:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 598101D31B9;
	Sun, 16 Nov 2025 02:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dzX/BknE"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD471A254E
	for <linux-input@vger.kernel.org>; Sun, 16 Nov 2025 02:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763260051; cv=none; b=Lq4YlQADm5M1r+ztK+5MHQr7740Hb+JLaAsel2aaMj3jYkBaAq6rPrRTjwI7m1MYOX91Am649cY/UDoMXYuZKIwcFjhZ2c+gUFSd8Geg7auhOo9X2OA8Taa6zzGnRMscop3Tr8SzX8Ual0ctxLOet1hVDVxgRJWmmlBi1SLusmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763260051; c=relaxed/simple;
	bh=HeUkJojjgy8x+9+W2n//VkrvHV0zGjUVIl4jJ5gb4Kk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MHJ8m+PEmvbqDlhfes9+vzkYnW/INEroA81+GYk3wrJpzmz8heRncipYwaTde5nnyKr3TEb6gsW/g9s7wDrGntDF3wtWc1pbxVIgYfn5uVCaONVAWxIZx/aPsqXImNd0myKylsk9wIoOFAiumiMRzva4Irp2OkOLd2yxMKJ2ckI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dzX/BknE; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42b32a3e78bso2571330f8f.0
        for <linux-input@vger.kernel.org>; Sat, 15 Nov 2025 18:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763260048; x=1763864848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kQHTaaCZSuYsO96UdJunWUIQb8utCVV4zfJ0o3NYY/0=;
        b=dzX/BknELDlXypOkf/NVT265QBtQ0vFYhxRsmMom/s1NQ5ECJehnQ2jwxQ44Y/l2Lu
         u2S+w1aoSaz7f0/I2sAaQ+LyVKOXoSNVyTtlW0esXbJK4M1s/WeSk4DIdLlkKrwPeEeZ
         lsLhI+/qqMo3udc+6z++LoATkM/hANiaRQIGuealP9IaEf0X89+5uA590AoWpq1J9kn9
         kVv/MP7vEiZhl1MlW47R0znWg2RsTxWccpk0yi18xnYIfmLC1KxMMKK4I5Djx30t5HO/
         LO123FuvwCyJTUGzWFC8EIpjRprwTedY4v8yYj4/XW4xMoNpsY4ucCT+vurkiHgHNOt0
         OOgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763260048; x=1763864848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQHTaaCZSuYsO96UdJunWUIQb8utCVV4zfJ0o3NYY/0=;
        b=sVc7/7J/w7TqbTIJSFbK+f+6pFtqVJMQhjs0VaQb39isWXWd2JAc6WiYpOt5aEP7Dt
         OZZfyJhwS/QdPqb1x9/xPhJ85AUgUQ8Chrm2nm6gshpYhZk27Ai7okpxSx4bDPRAG5dL
         a/j8dPC8I5JgEzWQcWcXy/kCgHLkdO3V3sJ0h72GRIsRZWtUig8H65VWRynvXARsxUzN
         QBKyfzsp4e12rZPu+vJZSszZfdxoUz97yKduiihP6Ms7xc5ihGFcrwljjUWi/34I9RTD
         dUC72+P2f0voo5fYuvbhFka9WoU3pgV9tiJa8SIBO5pf/FGrLz0q6hgRnRfnlGt/4Vb1
         JxRA==
X-Gm-Message-State: AOJu0Yw08pKgbVoKYSiZv9VfRVBtSUZDm/4BXuApVptg1/2MvhNRDT+F
	NrmPq5Rx+aWFxyUxsJOmhJDkGgqXbro4uzuge+EzMnKURWDftyQYJozC
X-Gm-Gg: ASbGncv1/lXVHPZUPevkHGZKS4lagHJzXFM6HV8YZAnX8XqKdVBD8grV135/aXPGdne
	OQTQysJWizAPtyzRj+6poRLy0XmqvfMsBhDr3sYHP+NxO3wbrUzave3Gnf7NssIvIo2WeNsF2UV
	mziAclxxPLcJHK6My3AKrLjc5LrfIhNpP58kUzKSrIJu7rmJ+JGR1tP3JZaFQRzxWtPpTn78QtC
	9hyFx24ZQK6kp8qrWdMNOqFBRLV71AhUEQGZrJnKWvRB5UNUcnI8fBlVd9tiMy+w/esj3Utwnpy
	0LdPtKH9RVb2Em7G1hoc0e8UR1kpYYsJflbMxJCDbOJ33EXzYi269AwYa7J7rf+oJumcMzue1Vw
	yl7PCJVPlTzk7oIhexu8953FSqqmg4LS4UBe9d2j/QvVqLGpyDRNSCxMnA2z6zXjX4IiFCE56av
	3TDQzIRs6HHhmHJ4qd/Q==
X-Google-Smtp-Source: AGHT+IHnVi5ps4m0awDqDegGNwiLqoqub0TaFKEwUQHgJbapVBZLNKrRY2nowbQjtaJ2Z1Ma1OCukw==
X-Received: by 2002:a5d:5f47:0:b0:42b:3825:2ac8 with SMTP id ffacd0b85a97d-42b5939ce2emr6911403f8f.59.1763260047788;
        Sat, 15 Nov 2025 18:27:27 -0800 (PST)
Received: from ekhafagy-ROG-Strix.. ([197.46.78.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7ae47sm18198368f8f.4.2025.11.15.18.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 18:27:27 -0800 (PST)
From: Eslam Khafagy <eslam.medhat1993@gmail.com>
To: roderick.colenbrander@sony.com,
	jikos@kernel.org,
	bentiss@kernel.org,
	max@enpas.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	eslam.medhat1993@gmail.com,
	syzbot+4f5f81e1456a1f645bf8@syzkaller.appspotmail.com
Subject: [PATCH v2] HID: memory leak in dualshock4_get_calibration_data
Date: Sun, 16 Nov 2025 04:27:23 +0200
Message-ID: <20251116022723.29857-1-eslam.medhat1993@gmail.com>
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
Cc: stable@vger.kernel.org
Signed-off-by: Eslam Khafagy <eslam.medhat1993@gmail.com>
---
v2:
* Adding tag "Cc: stable@vger.kernel.org"
v1: https://lore.kernel.org/all/20251115022323.1395726-1-eslam.medhat1993@gmail.com/
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


