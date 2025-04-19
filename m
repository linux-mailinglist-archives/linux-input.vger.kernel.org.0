Return-Path: <linux-input+bounces-11844-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D1058A94388
	for <lists+linux-input@lfdr.de>; Sat, 19 Apr 2025 15:13:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0211417BA9C
	for <lists+linux-input@lfdr.de>; Sat, 19 Apr 2025 13:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 046A11D86FF;
	Sat, 19 Apr 2025 13:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UDQSpBv5"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867381C3F0C;
	Sat, 19 Apr 2025 13:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745068413; cv=none; b=AgxJhSfNUHjgKzY+KiwZIfupCBtkrW9Qbz5e6TvB3+uKnImOSx98iH+Wfsc4F+eK8Nl2ji6/n0aBnSL7uu08cv4ZH1UGbFHBAAaTMxR9QMsWfUoK0xXNP014mnFHq1YtzePo9CU1u1xi5wThfLLKtPVRMw/FDWIyy+jRrMNVBfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745068413; c=relaxed/simple;
	bh=tuDFBHWxPx3EkLh0gLTcA0QzK/y7dpVMNz99kPwyUWk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JNH9uzLGvfwTfJlRa2NeLf34/sITiJdd/6H0sX4K86P3MYpfMcUo+xy3iSSNCt61KkFDij886FIle2cERZjDUGSOXE8mz+dexFfMPF5NDEjUrkILDPU5tXgW2pdw9ESWunsOTAKEx6ZdqCg1ToQKQ1nizfMf+NAgvA0Y73Bbj3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UDQSpBv5; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-225477548e1so26542095ad.0;
        Sat, 19 Apr 2025 06:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745068412; x=1745673212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SxRJBQp+/o/jC677CucO0qPNfksZQQtd1FtjH+R8IFU=;
        b=UDQSpBv5t/vPIBRtMstdPxjY/6GRukUX4V16JtuF6X5YjW8cuDyIg86LA7UShM0JZ4
         1+YKpV/dRPoZDCadWJlgHYiYNICB8eb92kD46/nT8qsG4ST+Jg3ONK+v3urxAYJR6Q2u
         vUMzJrbzatxElKLVCcHarZayTCXjjO/yas5e43x7qAksiJjnop0eZV4MKdYhscrO3ITg
         iJOLxAs7siUEBLO6jDubYc7JGtZQ87WZ9EBPSop8HI9STAkLYUYsE0yK9PjEAyVIyQlD
         0nu7MmpWXoGXdMlBzK5EtmUG5zlSt/PszJsc60wTB2DYW4xDuXLXjDKjOaCOZOtWq70n
         VEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745068412; x=1745673212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SxRJBQp+/o/jC677CucO0qPNfksZQQtd1FtjH+R8IFU=;
        b=LpQNLr8Fx9J+Hy4icPma9WfxlDjwfR/5/W9X2GpyllItHHeQ6ISLB3Q+YRdWqVbASK
         lZ9LRu/z/usjsGojCBHt/HuZlW0doa7bfckrsOTGjT1V9P4TGW3OjVIy4NX2vmVFBFOI
         28iUIn6Rq1gBU4lpgEqQ3/M0UUIzWigdfiF3zzJ6whLHdojqvxRIJGHQKKRqaBj7Toys
         4eGnm8YWznIlV8KlJs1rpX5v5N/g7XVAj3IwCqO2Ht8CBsAukjSjae17hbZRPjkPGI2D
         2shXfTYK+zFOVtWemZcCnKKNIifSoz2/JFzV0aH0noy6TvxvdPtd6jNBbRt3+lNeRQL3
         5X0g==
X-Forwarded-Encrypted: i=1; AJvYcCURdBdCDafVyJZD1OK5Bu4SIcYatdaFO5pY8yGx9o+AmQHsZsAlqt5HGbhHr7omkgE55J2UwugZH2O04A==@vger.kernel.org, AJvYcCUyGGlWBC+A/t0HFsus1XLsnSu8595YeNaxcTf761IXuGjV7GwKBJiVN4+y7V5YtHGpUToFujZb20ot60Cj@vger.kernel.org
X-Gm-Message-State: AOJu0YxKNHl8PxHPsOfbqpKpWZzuSLt/ojPMjhjxDRbA7D4FkjEGyxRA
	08lrLLA0AkJNYCtObaYGuTUZj49wIUjwqatfoz1WEe+982OAIhQu
X-Gm-Gg: ASbGncvQqWdXGG+m/buYoqMOK8AeH+wriTrJ2+btJVvBM/sFQocAA37JYHN+/FbMUh6
	cPy+d7CS+QnI9HFgZD7Qv1kucps0Ib787EtDGX/SMrAhIVYlcYvSo3lUsrUMnSvVfc8O0Jvl03j
	3SdFvAOVBeByyMrrI1HpjnT/S+FHQlmdJicZCUEoY7aWpHZIBjGJo+/ItzO4khVqXx7c/XDinDc
	i86SGyJgwZktZ6GOb/w1Le5APjiDpqyE8dfKME3sECLSrgc1Sg1eM4VFae/bp4YM5Il+yeaUq97
	gEygQJQbQuTZdRHqdniEtL+veabXflUsJVJhLDAMasTIObEPFCdp9JAAA9ATB3j9fdvKy2Hdm1g
	=
X-Google-Smtp-Source: AGHT+IHDihZqqRqFeHMyIOVZFs/uwOGi0O2bdn1FPZFo/3A7mt1ETIE3WFULowboo0fTFrs3tg1O1w==
X-Received: by 2002:a17:902:f54f:b0:224:1781:a950 with SMTP id d9443c01a7336-22c5357eda2mr86812665ad.14.1745068411649;
        Sat, 19 Apr 2025 06:13:31 -0700 (PDT)
Received: from purva-IdeaPad-Gaming-3-15IHU6.. ([2409:4080:218:8190:588e:b51d:c905:529b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfa59a97sm3360161b3a.94.2025.04.19.06.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 06:13:31 -0700 (PDT)
From: Purva Yeshi <purvayeshi550@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: yujiaoliang@vivo.com,
	jkeeping@inmusicbrands.com,
	oliver.graute@kococonnector.com,
	viro@zeniv.linux.org.uk,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Purva Yeshi <purvayeshi550@gmail.com>
Subject: [PATCH] input: ili210x: Fix uninitialized symbols in ili251x_firmware_to_buffer
Date: Sat, 19 Apr 2025 18:43:15 +0530
Message-Id: <20250419131315.24897-1-purvayeshi550@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix Smatch-detected issue:

drivers/input/touchscreen/ili210x.c:621 ili251x_firmware_to_buffer()
error: uninitialized symbol 'fw_addr'.
drivers/input/touchscreen/ili210x.c:621 ili251x_firmware_to_buffer()
error: uninitialized symbol 'fw_len'.

Initialize 'fw_addr' and 'fw_len' to 0 in ili251x_firmware_to_buffer()
to avoid uninitialized use warnings reported by smatch.

Although the while loop ensures both variables are always assigned before
use, initializing them silences false positives.

Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
---
 drivers/input/touchscreen/ili210x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index fa38d70aded7..10b52d87c41a 100644
--- a/drivers/input/touchscreen/ili210x.c
+++ b/drivers/input/touchscreen/ili210x.c
@@ -586,8 +586,8 @@ static const u8 *ili251x_firmware_to_buffer(const struct firmware *fw,
 					    u16 *ac_end, u16 *df_end)
 {
 	const struct ihex_binrec *rec;
-	u32 fw_addr, fw_last_addr = 0;
-	u16 fw_len;
+	u32 fw_addr = 0, fw_last_addr = 0;
+	u16 fw_len = 0;
 
 	/*
 	 * The firmware ihex blob can never be bigger than 64 kiB, so make this
-- 
2.34.1


