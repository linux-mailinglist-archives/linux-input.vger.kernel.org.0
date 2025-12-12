Return-Path: <linux-input+bounces-16546-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD35CB7F11
	for <lists+linux-input@lfdr.de>; Fri, 12 Dec 2025 06:23:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C29803072C58
	for <lists+linux-input@lfdr.de>; Fri, 12 Dec 2025 05:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6072C274FC2;
	Fri, 12 Dec 2025 05:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nbenTyKD"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9A027E1DC
	for <linux-input@vger.kernel.org>; Fri, 12 Dec 2025 05:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765516853; cv=none; b=jfWaMCQRUwZcQwiWEGu5pykSoEtpQyZSoU0mBuYUp7CA04vcPp9t57DfsW3Cay0MIaXbnMKvWLEhOz4/lWe8MCp6JhKGTQU0Pfu3aC/MMcFK89uKw7KtpCuUKwA/VsaSnCAHoU81jDD+L2YGwczxG8aZaweQe4mMQzJ08nlRMhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765516853; c=relaxed/simple;
	bh=ncSfG+DQWHiHJ5P/tpjPaAOggTR0P8F+F2Kj1x+1+9I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g+TM/KK2wIP1lFpIi8bxreU3ZgQvJEyfkH4rswSpkD5Q7Ein/ekEZQm8dDSkTlkkm0Dgv5rlBuaP67raCEjU+DCpQIOqwF4x4RMOqDi2fj19VPV7mFKyuDtFAPkensj260LkxaqKpBpYAWoo6mRzmOpQnKTijN/oxVk0FtgfqSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nbenTyKD; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7b9215e55e6so596515b3a.2
        for <linux-input@vger.kernel.org>; Thu, 11 Dec 2025 21:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765516851; x=1766121651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KabGZGJyQG+etjOxlMGCNny58DR5Q6sGGHquVVHLJAc=;
        b=nbenTyKD85IF45r0eJAc4dm/Vo2aV8M/MP1G+y8CNfmbvnKoBNP6YbuM054uCj/M60
         wOIi7b+vC84BXcSxa+c9R/MTgy4YJWiu0NUTcOE+/CSTNyaQnxkMSXYgx+wAmlj3wuaZ
         NOhEhm7QU2zxXiMr6hqehalOz38eLOE7XxBAn5fKaDztt9VAOrrwarBTQx8tgaKSvn9T
         /YJEGGY7zatNJfjXfHccXHtuNdgcwyo8J+hnpnZnETAt8D2OtNDi2190IFIdlBqfZ5iV
         46OpYg9A1DsKb0dm72Vetv9EnqRRnivqkQavfU7muMdAE2vKxSh5dt08f0DFNU8mHwQD
         BH5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765516851; x=1766121651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KabGZGJyQG+etjOxlMGCNny58DR5Q6sGGHquVVHLJAc=;
        b=OJ+lUisd8KdKtilIFnlFTlq4UyCX32T+kliLafcUnzdvBRSWKpLb0Wzo6z0zAiLyjA
         m5ilH4xCWxHSmP9/pUQgPVofIYlybe6XUzwjX4oYTFCP9jxfTT7FSbYS8x1UrWa/rXbX
         U7Pl3Ic/fycMEgx6fOtpAZM5qD4oTpRemgNa5OZc4ERTAwGDDBnSyXPxlU0gdFxtEQbC
         iWLWx/1eWU4j+2e97SHGkpLwF/NLEUitG6YngnghVoKZYfM7PLWZsmIvf6tnGkZ1+Xrb
         f9kPgC82AXFgDuSF/rPmUARHIM8QeLNK03cRuU6rWWtjgs53Y0uCJvebpNT16429U1+S
         tvag==
X-Gm-Message-State: AOJu0YzcWwWVBzxY+Lby1nrZ4A+QMde/rglJy1ig4mZDelBoiXSErVSh
	ka9n2zzl1aTbdEn3pXs5TpaY4qpTZCYRV5CKFW0sfTZBGeeAwnFiiaS2nSeG6g==
X-Gm-Gg: AY/fxX7QP42rVeFxbukQjxFJR1aRVpWZEz/kucYytulh1lfC8PybF0gI1o9q0P85ph6
	DI63wCYsXEcDNaOuy05+spDc6kG04WKu+sgSfp3CMC5elSsgPd+ThHakHaet6repcbij5Bp+D3w
	EX0DZ0U8/eygXx2YEvzWGY77NZgA1gHNczl1jjWI1SCq6xblv4qEQ3/9P4Y//gTcxMV1bKApic3
	LzWhgPKMn1N4/34apMP15yElPwQ7aPOvDZn6gjXkfdI1wabuAVzmQy0AJDO6ajTpo6Rd7KwXfqe
	N0A27Mc1nkxzOtXernjtPFd9vYa7cwNdtkv+NK/6yzyQHNk8CqBS1LrlMTbdcZ9rCj/rPSM7bW4
	tRElvPIAu3l8WcSpva33bF6FDXa4MRSeMiZkLUiKJ/vYQvpAbKIjCtVdlNs2kSrCPtNAxJl1A0R
	c3YgLkWK9gftUgWhtMXW4qjM2cRjxr
X-Google-Smtp-Source: AGHT+IHP6/Gt3lDCHSB+n7Kyvc1rj2BmbubbeF4OENnzL/yNsMEge4agbPm5+387glQod3uqE8CWlA==
X-Received: by 2002:a05:6a00:1c82:b0:7e8:4587:e8c4 with SMTP id d2e1a72fcca58-7f669a9576amr1107664b3a.55.1765516850777;
        Thu, 11 Dec 2025 21:20:50 -0800 (PST)
Received: from DESKTOP-6DS2CAQ.localdomain ([211.115.227.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0c2bfa0165sm3789626a12.30.2025.12.11.21.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 21:20:50 -0800 (PST)
From: Minseong Kim <ii4gsp@gmail.com>
To: linux-input@vger.kernel.org
Cc: dmitry.torokhov@gmail.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] input: lkkbd: disable pending work before freeing device
Date: Fri, 12 Dec 2025 14:16:23 +0900
Message-Id: <20251212051623.13891-1-ii4gsp@gmail.com>
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


