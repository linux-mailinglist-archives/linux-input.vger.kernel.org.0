Return-Path: <linux-input+bounces-16545-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7302CB7EFA
	for <lists+linux-input@lfdr.de>; Fri, 12 Dec 2025 06:22:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D20A304112E
	for <lists+linux-input@lfdr.de>; Fri, 12 Dec 2025 05:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AA8515E8B;
	Fri, 12 Dec 2025 05:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W5UekH2I"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE5D1E9905
	for <linux-input@vger.kernel.org>; Fri, 12 Dec 2025 05:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765516761; cv=none; b=tHbU7Tw5YBvjjz9qDXQcLolV1LGNBFblyRt0YkqTKwqbaUAq2E1WrjrW7sJKUIXhJtXyoGaLdrWHHx4rRaBo1tGllSyVyEpTHczDT8RfpmFhVVGN9nCWHbea4NF9NiFN3rF/uou1BBrtL6lp2gQKDOlIbyeyEu9heJMr9qs1nYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765516761; c=relaxed/simple;
	bh=ncSfG+DQWHiHJ5P/tpjPaAOggTR0P8F+F2Kj1x+1+9I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lrX6LHyNJzQsR5hREfC1yGqRSYOYoNI71p9nDjqcSSflpNFFJS8+MXxNYrLtWgw+zVBMCywB4yAjqHUp8zkwpuFsicAKIFgJ2FtzMc3TDRb4+ydQWQJLVJAKvbvUe99Ivh+1LtauS2XvsGrf8eBL8/1pZGS92kA/+SesroWxVSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W5UekH2I; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2981f9ce15cso9614155ad.1
        for <linux-input@vger.kernel.org>; Thu, 11 Dec 2025 21:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765516759; x=1766121559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KabGZGJyQG+etjOxlMGCNny58DR5Q6sGGHquVVHLJAc=;
        b=W5UekH2IjRVWY0eNTb7/YrsvfIkhH+e7pJKWd0/WwIhGa79Zz/TDe8t668jyi+tseo
         HcC8dKfWnUaFtpHEJSyqv9SsbuX7Kz1b2Z5aZtUbGZE0bAWbR+FVFIu9AQpy0Jc4hoRK
         2cOrCoOhGIpmI7FgZhSpvj3DEcnc9UfQpIK2zmdmNB9apb6LbiTDThLi9B4Wtf1kp54F
         VvY+fpIsiFwrwPDrsMjT0uFG0fVHEAzJWJU6Wr7Ib8ChLxHJtvnNLNTscsDZt04ArpLO
         +gxN/8yXyLu0uocaAsfrchanweXtWyWWN2rZVF39QdDs0fMCLYKFHWyiNlY6W9hlGDEA
         rY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765516759; x=1766121559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KabGZGJyQG+etjOxlMGCNny58DR5Q6sGGHquVVHLJAc=;
        b=s/cRTKXY1Z+ZoQz4+2crDCBtM6ZSt7YR3DXGhraCi9ZLIO0xTkarxKbDuRPOPnNgjR
         dlW5zt1mkhZUtsm963ljxj33GpnRVECozElQXvl0zx7OaDIj9tnw/9piumqfWbIxxtvN
         PKMllwIvRhuFX1K6a9jcazrSvnDAH2WFh08Zzm1E5+iLp889KegFA8Yi5L6EP4cKEvjw
         6FDzIcpNP6oL0pFPU6kXD6+5MvTRNdULlIpv3dwsn6foMAn7IRSia2AdU4tqk6tG/2oF
         KpybVPSuEtvVA/tcSlAmThEgl6OoQxxNftXHUjJ6+RNhxZlfInTPlshk82HivDR/cU6r
         VVuw==
X-Gm-Message-State: AOJu0YxjTWcUJVkNrwYJspMHsJSeX09pPWS1OSv6ZmTEu1WQzq69MQFG
	dm0dM57+/ivjhs38dVJAr4bT2fUA8uZQkKk/i/AZJWK2TXHn7zs6qmR4
X-Gm-Gg: AY/fxX4zSncA9xOG0tPhDOKHncgptugCS29LTiPuoPnyIB4UOLgTN4h6Txm9u211n0Y
	v4yaK3sG/jvQUFunlOjLSMAcQIrExI9FuvFyrS9hQfmIr11v7c3S64BkyqpFw8rPL5gW4KW8UNq
	VzqbccvywTkqVQWYYRvjtp6N5AOIJxeD36FU/JYJBohuObgR5qEPxBjy5I9bi2nL4aSSZCpAjV+
	8qiSV20CrLIoQ3g4CXLXTk93ywOTNYhDVfRTueXeR7xi/MmBri25IIQ2X/dFSEOJVkOXseKZrlf
	53v8a0htQ3UepZrGXZilQvRLPGnWczmQYjC3NEYSsmGq8Bt6BPQ6z6fq4j9m6IpHmqFtCejwfaa
	kyGRxa/gxWV7pQ7KQuGyHnjrxcKdePnUFg7U5S1DYgFqU90MX2/yv13P3dHVJIXUnZ6vNBFhBIO
	EL9fMfW3LCjfz6bZBEYO/QWvJ8pzueuaUZaRh0o44=
X-Google-Smtp-Source: AGHT+IEJC8tmcIeQ8/msRNMMooDb03utB3QP9Gwo6FIkUfmIXMdMYfikSPWRyRhseRGOb5HVS8P0FA==
X-Received: by 2002:a17:903:1b45:b0:27e:dc53:d239 with SMTP id d9443c01a7336-29f26eb2a1cmr6908275ad.35.1765516758906;
        Thu, 11 Dec 2025 21:19:18 -0800 (PST)
Received: from DESKTOP-6DS2CAQ.localdomain ([211.115.227.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29f07d139c6sm18148085ad.89.2025.12.11.21.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 21:19:18 -0800 (PST)
From: Minseong Kim <ii4gsp@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] input: lkkbd: disable pending work before freeing device
Date: Fri, 12 Dec 2025 14:14:32 +0900
Message-Id: <20251212051432.13271-1-ii4gsp@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251211031131.27141-1-ii4gsp@gmail.com>
References: <20251211031131.27141-1-ii4gsp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lkkbd_interrupt() schedules lk->tq via schedule_work(), and the work
handler lkkbd_reinit() dereferences the lkkbd structure and its
serio/input_dev fields.

lkkbd_disconnect() and error paths in lkkbd_connect() free the lkkbd
structure without preventing the reinit work from being queued again
until serio_close() returns. This can allow the work handler to run
after the structure has been freed, leading to a potential use-after-free.

Use disable_work_sync() instead of cancel_work_sync() to ensure the
reinit work cannot be re-queued, and call it both in lkkbd_disconnect()
and in lkkbd_connect() error paths after serio_open().

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Minseong Kim <ii4gsp@gmail.com>
---
 drivers/input/keyboard/lkkbd.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/lkkbd.c b/drivers/input/keyboard/lkkbd.c
index c035216dd27c..12a467ce00b5 100644
--- a/drivers/input/keyboard/lkkbd.c
+++ b/drivers/input/keyboard/lkkbd.c
@@ -670,7 +670,8 @@ static int lkkbd_connect(struct serio *serio, struct serio_driver *drv)
 
 	return 0;
 
- fail3:	serio_close(serio);
+ fail3: disable_work_sync(&lk->tq);
+	serio_close(serio);
  fail2:	serio_set_drvdata(serio, NULL);
  fail1:	input_free_device(input_dev);
 	kfree(lk);
@@ -684,6 +685,8 @@ static void lkkbd_disconnect(struct serio *serio)
 {
 	struct lkkbd *lk = serio_get_drvdata(serio);
 
+	disable_work_sync(&lk->tq);
+
 	input_get_device(lk->dev);
 	input_unregister_device(lk->dev);
 	serio_close(serio);
-- 
2.34.1


