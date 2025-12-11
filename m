Return-Path: <linux-input+bounces-16536-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F47CB49C6
	for <lists+linux-input@lfdr.de>; Thu, 11 Dec 2025 04:11:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 44FA0300078C
	for <lists+linux-input@lfdr.de>; Thu, 11 Dec 2025 03:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F299A2773FE;
	Thu, 11 Dec 2025 03:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AJRzOHK1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701DC23645D
	for <linux-input@vger.kernel.org>; Thu, 11 Dec 2025 03:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765422699; cv=none; b=RBoqwCtWPk0eNxrWtOUAY6rS9CHQ8RthR5z9DwVWrPnh8/J3aaooIKb+/GastAuj3y3CnjY3y1/E4cl9CnesjIzwuJs+iSBw+69ORXBDbC0kYd1M7nC+JuL5GTYETBzuyMTPUxWw/Ne+deWaa1/8I7USJuBmrhCHqSPDGZu7Di4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765422699; c=relaxed/simple;
	bh=FBUewJzNttvBj6dhO4FEss/Md1jJMTZhw+mgqA17V14=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UrnCvDaP8Ws2DjKFnH/g2e+mfOpur0U9a+mHfLyaDxVfi9hscOsSq2ybYMN0pqmBiES56K9lzA0sJSrE27jfC4dya+CF08oE2tdzQbXFJBEzgD7jII2sMtuXxyCP0TSpdVJujC2jqc12dHHp4XtDlINbwwOB3fKaN8miX/+6gDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AJRzOHK1; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-349ff18445aso407301a91.3
        for <linux-input@vger.kernel.org>; Wed, 10 Dec 2025 19:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765422698; x=1766027498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KGCWABPnAEr262wrNDG5Ce38cd3v/xWYcwemzU2UFZE=;
        b=AJRzOHK1eBaII2lpqOu1Sy8rYh6O7WAeu7l7Dmtrns/dCxjV2hFZS07Dh347HFbahC
         erybmc/gwALK0qXLSbRW9c2gZdqGUx48cJdC/lxQDBUpZ0hnnQ0F3xV76ZFkQz9UsGAi
         wuhxcNuJoVjxbqmqmCr1e8HjIjjYlmWE8qHAjnlenDGlRXb1J9WvN+d86KLz4Fuxiwsl
         E/By+O0jGGcniM6XWCXk0/d5a5BOScOfl4oYwxwXZBPoGRJvRZK2JFSm5MFTTs9wNAAe
         S2b18c9WZnK7RfGcaJTVc1dSPtuvmXE6N6MwFUP4SHE7cuAs8ZyMc6MQwK4f9MuGA478
         QVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765422698; x=1766027498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGCWABPnAEr262wrNDG5Ce38cd3v/xWYcwemzU2UFZE=;
        b=V1ET+J/yQhPi2Q9YZPX4aoEjmnAU4mdyXctq0PBk//6e0ESqovBwWN9TX1+OK1M7Hf
         3H8hlpXyiFaQ9+WNd8/SRplcqyAE6aZgRNfoEBpJP1JtGKz1sSI4QcMmTlPvralFkpxl
         hwxATwCu3kxRVnkMdP2Rrn3ABFHDem+SnwEcSUbAOZFiu56N6uP2yAFsH4irm1dcVU1F
         fvRrw+boQzi0F48UI9+TXaJwlzr656OI3RGXhJPsu0XfCVtBUBOM9msZk3b/EoQ3Wk5p
         Jat7eT7UZpykd+naTT1JBGzFDUjnB7sf6U2Nbz4NGEDlAORheqSwsx9ZcdYG1XBFVKNE
         K06g==
X-Gm-Message-State: AOJu0Yy4WUp1Bou+1gTMr83gMxfnV7peZTRBtArv4Gqw/C/VhqHijhmS
	sACTUyZ0DShtWEVjom3fbQ4AJNt33cvm7RkK/PKND2gHnduY0dJVptzk
X-Gm-Gg: AY/fxX6e56r4uuexD42udZvVcCvRsX8bPRy6z158rnqPOc6PAtPBRnzjIfjS+HkfB8E
	GDmQ5iuAEGDCX6/4cnHz/1Js8UyjWKqHpdYpxMH6agyKcHK+pmmUojg0APB3lz2ogmNd/WuFqLX
	LqDTU0e5RggZesEPOY8pnBEm/LE7TK3AVjnHl4MfQwJW8fkVmqQ2k0Ua/bFWaRawpnYagjYfIpB
	CL1t3SPFFDrqc43hB54Kd4aWZjYUzus1th3sjtIhpz2Lsk8Qrswboymg3nuVTNgE7la6c/GZh8n
	FX7XO6kKZACrVAEIkVVAQwMcUoyMWCtKjKI+dGq2Xf/6tnYsPjesc8O/NOOGvReekm+NjrsTFC7
	P9zTUh2kCLUqAriWkQZ6dwn8Hekr+OFvgqLLk3/HihoM1Zx2gesCY6uGGfcXvNXkj+9kexEH9N6
	jKl2vJ2yvDyGqNGAvCCuc3XIMPZZjIGg==
X-Google-Smtp-Source: AGHT+IHWcmTOZsaghTibxhIuW0UStAShWvIpbZoqG6v/jKdNCs6tlxwCwwle4nhzr+QPOqrUn6J2HA==
X-Received: by 2002:a17:90b:3847:b0:340:e8e9:cc76 with SMTP id 98e67ed59e1d1-34a7284d09fmr4788926a91.11.1765422697736;
        Wed, 10 Dec 2025 19:11:37 -0800 (PST)
Received: from localhost.localdomain ([121.190.139.95])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0c2ad5961asm774231a12.18.2025.12.10.19.11.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 10 Dec 2025 19:11:37 -0800 (PST)
From: Minseong Kim <ii4gsp@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Minseong Kim <ii4gsp@gmail.com>
Subject: [PATCH] input: lkkbd: cancel pending work before freeing device
Date: Thu, 11 Dec 2025 12:11:31 +0900
Message-Id: <20251211031131.27141-1-ii4gsp@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lkkbd_interrupt() schedules lk->tq with schedule_work(), and the work
handler lkkbd_reinit() dereferences the lkkbd structure and its
serio/input_dev fields.

lkkbd_disconnect() frees the lkkbd structure without cancelling this
work, so the work can run after the structure has been freed, leading
to a potential use-after-free.

Cancel the pending work in lkkbd_disconnect() before unregistering and
freeing the device, following the same pattern as sunkbd.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: Minseong Kim <ii4gsp@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Minseong Kim <ii4gsp@gmail.com>
---
 drivers/input/keyboard/lkkbd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/keyboard/lkkbd.c b/drivers/input/keyboard/lkkbd.c
index c035216dd27c..72c477aab1fc 100644
--- a/drivers/input/keyboard/lkkbd.c
+++ b/drivers/input/keyboard/lkkbd.c
@@ -684,6 +684,8 @@ static void lkkbd_disconnect(struct serio *serio)
 {
 	struct lkkbd *lk = serio_get_drvdata(serio);
 
+	cancel_work_sync(&lk->tq);
+
 	input_get_device(lk->dev);
 	input_unregister_device(lk->dev);
 	serio_close(serio);
-- 
2.39.5


