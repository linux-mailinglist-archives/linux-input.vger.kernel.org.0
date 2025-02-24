Return-Path: <linux-input+bounces-10277-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4FEA41810
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 10:05:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5ABEB18900C9
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 09:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84E9121D3D0;
	Mon, 24 Feb 2025 09:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FcJFoPBx"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A561EDA00;
	Mon, 24 Feb 2025 09:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740387907; cv=none; b=m2Etl2HNBjOt0GoN2gTbTsbqdJyaw8LlFZSLIxWj2KoUnPrmeAPBoKzoGwH5O/3J9PPvh9L53Tfn4HNl5puMQrnERfTmHTQr1XI2KNRjVVhZfFmwXrzVUlrpNLp56VNkSYaogUjsXaW4wHfDHGRUx0iWIeFbJg4wrCr53CalZ7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740387907; c=relaxed/simple;
	bh=SqHL6xTRVipsGvScdT04CAh9Zy3KMqZjnmYjsQkiaDo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HVYGtO+8zhV19wltH+2k0RQ6PJMVPJD1WkDuHKFWqaNoUWM9QqvSzrWrtWyHUC0szDHUet8qHphJBHxwdIWKFReJ8y4kuO0q4gHKxCZq8CiarQ2awJ6Mk3AOwJFOewUgV2qpbnH623wAEa048upi4BlchAOOkZ67opbamOzrDSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FcJFoPBx; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-439350f1a0bso23902895e9.0;
        Mon, 24 Feb 2025 01:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740387904; x=1740992704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1o+hmUFjyxLJ5txUQsV8eFqZyJVyTj/M8WfPxzZGAO0=;
        b=FcJFoPBxogT1Nv8TqBwIu7MZVH8Syff6ZqadXjc3PC8sDu8J7jvUQYVl7oMJ8gZxQ/
         1aQs8WAqqOMR5KVuFxASW4f+/ZxMLIQhR+TGRBeBTJBQrL0v4fkYmfncWOwu0p7CKnun
         s/eHScgKTGGRn5c0Ey0UNTUY8J09cWxiDrXHZct0qpWb7cccvUaFBDDQq7HaMFeicYMN
         sdFUpUuZbSBgUFLVWVgei6lq3KIZ0JF/8dauz3/1FV0GD5TrMPAyhzbtLYgxUcnN7Bft
         Exg/RGGKy0yRQ+t1kCFgd0Bt6YVOWZONose3U1vTqYVyd1j3ciWvwHs8OsRCtcEe/Hiu
         zwnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740387904; x=1740992704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1o+hmUFjyxLJ5txUQsV8eFqZyJVyTj/M8WfPxzZGAO0=;
        b=IdpkVDGEs5o+ilNau/X7TTbtEbNm2ozvlS+rONmghLgKDfcD0Wanln8Nbc7grqvBBa
         hPdSGL6y5WrJ9rhI19QRj3XKiANxx+S1Y5jkAlhKCmJWyezqxU165m149mSPIQboxpSK
         hVKjXdL2hHnbv/1gHVr0bGQIHg1nexCSxYvfzPqawZQac0m9XUc84C6WELoEl+kprIls
         T1Au+o0xcffGg0tASOrj77PCtAcrOzADmZfBtWiBxL77usHgTJjIOuNoP/6y3QsnjKFX
         +Xl7CzMG1y3mXag/xHay9AtU3Xjfci2zo3xjGN/Foz8axi7zGKdJRCOCIbaPpicQAwl2
         bV3w==
X-Forwarded-Encrypted: i=1; AJvYcCVNpPVCMb0Rt89akuWgENG8ao6KoAK97tZW5tZBjIAXQt8kjzprLvLeZ8Z+RFOvdetyXNK5HWKvu3Txig==@vger.kernel.org, AJvYcCVbuI3mwYOVR9H1wuwSQd/N74pNTLqI9SB49plkMbZtKAHgFcm0wUB4lcl/KsNdOF839V2oyCYSs2YKgmNB@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ309qsOhKELXTZEemnhi1dyyKDuWnDBJk6wPlxnp2R3o+lxVS
	Zz2070ApQfXMO9ZBfyR2Bjo3zqu+NJIlsxo6Xvy5xUq9oVGScK+kMyfmceoBLDg=
X-Gm-Gg: ASbGncvwzesTRUvHJ1f5VOwmcAK3iqmu2AKYtdmCJS2K3KUsv/FHMbgT4Pkw7ClAqIc
	nj7rSd4YyRn+2sLREhdttaI2P7GuIOufguL+h82fSaLnBCibsQOdlg6dU5re97HXr0lfps1JkFt
	lw4Xb1r6plQkrv6lMhe8k2WQre54WDvchInzx02CFzJX+0ImZUTRz9vXpot0ZCSXHVpR53RpaGo
	Jm6FtGGxUjoJImvUHrYcKBHGvymQY1Ra3Bsj97Xb+ZzCLzN+Kte51z9gG3rBgSy2KNOKEU+58BN
	9Y7QS7Opwlj3pV0EWeeUkbEHVQ658vkBOrcVgR/xbQsXwBeO5VPVMj/rr4CBIw==
X-Google-Smtp-Source: AGHT+IG7ux92omp2zX4ff8jGYQdlwlhR2jbX2uF0UyuI3jJ+fCAMB/gq6CixmUwKF5yAPwT9yQpapg==
X-Received: by 2002:a05:600c:198f:b0:436:1b86:f05 with SMTP id 5b1f17b1804b1-439ae320521mr94741215e9.11.1740387903721;
        Mon, 24 Feb 2025 01:05:03 -0800 (PST)
Received: from fedora.. (84-236-81-135.pool.digikabel.hu. [84.236.81.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b4123sm31835674f8f.17.2025.02.24.01.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 01:05:03 -0800 (PST)
From: Andras Sebok <sebokandris2009@gmail.com>
To: markuss.broks@gmail.com,
	dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org
Cc: phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	linux-kernel@vger.kernel.org,
	Andras Sebok <sebokandris2009@gmail.com>
Subject: [PATCH 1/2] input/touchscreen: imagis: add support for imagis IST3038H
Date: Mon, 24 Feb 2025 10:03:54 +0100
Message-ID: <20250224090354.102903-2-sebokandris2009@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds support for imagis IST3038H, simular to IST3038C.
Tested on samsung,j5y17lte.

Signed-off-by: Andras Sebok <sebokandris2009@gmail.com>
---
 drivers/input/touchscreen/imagis.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/input/touchscreen/imagis.c b/drivers/input/touchscreen/imagis.c
index abeae9102323..3c8bbe284b73 100644
--- a/drivers/input/touchscreen/imagis.c
+++ b/drivers/input/touchscreen/imagis.c
@@ -22,6 +22,7 @@
 
 #define IST3032C_WHOAMI			0x32c
 #define IST3038C_WHOAMI			0x38c
+#define IST3038H_WHOAMI			0x38d
 
 #define IST3038B_REG_CHIPID		0x30
 #define IST3038B_WHOAMI			0x30380b
@@ -428,11 +429,19 @@ static const struct imagis_properties imagis_3038c_data = {
 	.protocol_b = true,
 };
 
+static const struct imagis_properties imagis_3038h_data = {
+	.interrupt_msg_cmd = IST3038C_REG_INTR_MESSAGE,
+	.touch_coord_cmd = IST3038C_REG_TOUCH_COORD,
+	.whoami_cmd = IST3038C_REG_CHIPID,
+	.whoami_val = IST3038H_WHOAMI,
+};
+
 static const struct of_device_id imagis_of_match[] = {
 	{ .compatible = "imagis,ist3032c", .data = &imagis_3032c_data },
 	{ .compatible = "imagis,ist3038", .data = &imagis_3038_data },
 	{ .compatible = "imagis,ist3038b", .data = &imagis_3038b_data },
 	{ .compatible = "imagis,ist3038c", .data = &imagis_3038c_data },
+	{ .compatible = "imagis,ist3038h", .data = &imagis_3038h_data },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, imagis_of_match);
-- 
2.48.1


