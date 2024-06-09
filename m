Return-Path: <linux-input+bounces-4278-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5874D9018C8
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 01:48:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B68062812DF
	for <lists+linux-input@lfdr.de>; Sun,  9 Jun 2024 23:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 930D14DA10;
	Sun,  9 Jun 2024 23:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="keFpqjzE"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D831CF9B;
	Sun,  9 Jun 2024 23:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717976882; cv=none; b=ouW8CyKgeG6+XtIYx3ZXqiBJ4SLXHjYnuLz73untv8zf0VpgFVbKvM8gjzYqSzkUl5ntsGQ5HtrLsuTHxKof3SeLszL5KVARZsaPcRDkicoYU/CfiUlFUB8T31DG40hwhYJ2ay4E20gWLVofCnEnMunI1t+9RgElVp7hRdiMSDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717976882; c=relaxed/simple;
	bh=5AA5d/MF9Shw9Kh/wMvrIAH5nrPo2kGcMO1SZ/tOpWA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JaxxAPR3NMVhUPOqk07i4qUp4Idq+6JgSFsYabgdNOK0QUg0ANdAohn6FnlFnH7aGooz7TR8SHcrmevYR0YF9xiJkmPQanXjx/85OIhCP9HDGFVGr0kB6aiRb/Kh8vYJo7raxyZ+zWAxWUSedhIPOcDnOqvCIvWnmPCpFBoHZas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=keFpqjzE; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1f480624d0dso34374495ad.1;
        Sun, 09 Jun 2024 16:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717976880; x=1718581680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Q2D+Jor5IoHL7HGlsrqjKSeVr5dnX9tgaI5HbH4jWc=;
        b=keFpqjzE92ISpoKJ4ghDZ2oXgDSLp1SEGbuJyWKBoaVTOclgLyHw+H66C1tG53ZUUy
         iURgJb8jTGm32HN8H30ExRGbxXe21Vt9Yh7MZgq9cJMknxJ1zs8kOLtRW5dOKLYD0X8b
         kGjjBiPb5nOKjkbyBFCCgT7dNi9Jc6pbxQEBVz2OspJG0MJ9GtRRhI1+IQhI7OBiz7g2
         RpW/bcqkmPh3GKm4pgz/QBDOCHHaAQa8z979EIfyjb3TE3lp6Rfxh3P7FNr9B1SWNIwj
         rVWMcIBPuwOgBBVBZLE1BV0OQ8cdjQt9/aPkflWVZCxiefrrwx17/HALvoNF2SAmIxbr
         mZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717976880; x=1718581680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Q2D+Jor5IoHL7HGlsrqjKSeVr5dnX9tgaI5HbH4jWc=;
        b=lK/GYJr89BUidOXXz8TBfGpEa+lZYeLMqE9sT3/be4afPyA9cg9L1sqn7T34XWTGsn
         aYZTTkMWUcy3FEWWA2G8fcJ2QGA4sTTQZgqP9m8SK+Wl7R+U+ZLgxVRdQuwqKmkBYtcJ
         v6u3h/+FDLuGX3ANrhNqVERhdnXTe1hykf3HBohLWYCyqC7E4dlACJgDP/Wub5tYUnLZ
         4zMM917Mr2eomUQckXswyhyVcLC7GS5vNPfImaJMaTrSv5IUbMYe+r416NnYW1AngY2W
         LRKUL2VZh8uPThLIxEZ6vTPh3XnT5GBJ3lWhNRorSY7+WQawf39chwPTMdv+8HoIIRes
         6yMg==
X-Forwarded-Encrypted: i=1; AJvYcCWyxZxhbkI69V7Ewup8rGJhBdQTowA1b+SOZx+7Pfj8li27ACOVINGndH1+DfRiePnJpyj7UNcHh5KFbw+Fufp0pZuKOoBTpHtCtkU7
X-Gm-Message-State: AOJu0YxAkfRLO67Ov8vTuHqhTPa9EqDn9VTvI8wRbDA4Am7yznwsP0UD
	Y4eM06l3pf7J7gz6HO/QpeuuX5zSIcofAhOHks75YAXGg81al/hrHWpnIg==
X-Google-Smtp-Source: AGHT+IHZwMtv1+5F8FZkxFSqtxrrAoLt9OBDAa9nbgCEk1oIv056VI9Fw4QHECP8A4yuUXpizD7zpQ==
X-Received: by 2002:a17:902:cec9:b0:1f6:3693:1a3 with SMTP id d9443c01a7336-1f6d02f561fmr100581245ad.33.1717976880126;
        Sun, 09 Jun 2024 16:48:00 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:55a9:13e9:dec7:f9d3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6f84dac28sm27503285ad.158.2024.06.09.16.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 16:47:59 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: John Keeping <jkeeping@inmusicbrands.com>,
	Marek Vasut <marex@denx.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] Input: ili210x - use kvmalloc() to allocate buffer for firmware update
Date: Sun,  9 Jun 2024 16:47:53 -0700
Message-ID: <20240609234757.610273-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allocating a contiguous buffer of 64K may fail is memory is sufficiently
fragmented, and may cause OOM kill of an unrelated process. However we
do not need to have contiguous memory. We also do not need to zero
out the buffer since it will be overwritten with firmware data.

Switch to using kvmalloc() instead of kzalloc().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/ili210x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index 79bdb2b10949..f3c3ad70244f 100644
--- a/drivers/input/touchscreen/ili210x.c
+++ b/drivers/input/touchscreen/ili210x.c
@@ -597,7 +597,7 @@ static int ili251x_firmware_to_buffer(const struct firmware *fw,
 	 * once, copy them all into this buffer at the right locations, and then
 	 * do all operations on this linear buffer.
 	 */
-	fw_buf = kzalloc(SZ_64K, GFP_KERNEL);
+	fw_buf = kvmalloc(SZ_64K, GFP_KERNEL);
 	if (!fw_buf)
 		return -ENOMEM;
 
@@ -627,7 +627,7 @@ static int ili251x_firmware_to_buffer(const struct firmware *fw,
 	return 0;
 
 err_big:
-	kfree(fw_buf);
+	kvfree(fw_buf);
 	return error;
 }
 
@@ -870,7 +870,7 @@ static ssize_t ili210x_firmware_update_store(struct device *dev,
 	ili210x_hardware_reset(priv->reset_gpio);
 	dev_dbg(dev, "Firmware update ended, error=%i\n", error);
 	enable_irq(client->irq);
-	kfree(fwbuf);
+	kvfree(fwbuf);
 	return error;
 }
 
-- 
2.45.2.505.gda0bf45e8d-goog


