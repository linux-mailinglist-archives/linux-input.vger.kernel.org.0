Return-Path: <linux-input+bounces-16547-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 456ABCB7F3D
	for <lists+linux-input@lfdr.de>; Fri, 12 Dec 2025 06:29:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C9523039748
	for <lists+linux-input@lfdr.de>; Fri, 12 Dec 2025 05:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B02230DEC6;
	Fri, 12 Dec 2025 05:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hpzvfup8"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B1D1A285
	for <linux-input@vger.kernel.org>; Fri, 12 Dec 2025 05:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765517388; cv=none; b=esPUSkxTSHV172j6Usy9K5P2yJ75qsdgF3EQqCfyr42ZYdgUXgprU5FpuT65kO2B2oRQhHUzpyL1GL/K6V7Lu7/M4pCDBdHSKGKoCwUkuE9R45v4URvOVB+bWwGrjP2ALqHLqn1urZ8XDRpW2AEEGG73KRPNfotruzg/P1WmzUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765517388; c=relaxed/simple;
	bh=ncSfG+DQWHiHJ5P/tpjPaAOggTR0P8F+F2Kj1x+1+9I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dL61tLeWVy3gtqAxL5WBbi8m6ZVoFedNgsGHbQd+oLg8Jt9WPciebvw1+rch5MW5kM5TpR2C9QFIQx8KgQTC5E0y79xM/D4syjlntFEyhNugQ+8F0d9VRyCMgwSYGr4db8qAbm/6U6bTiMCUyn6a2EoMKXudPqzJcBvvqhKCUSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hpzvfup8; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-29efd139227so9704185ad.1
        for <linux-input@vger.kernel.org>; Thu, 11 Dec 2025 21:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765517386; x=1766122186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KabGZGJyQG+etjOxlMGCNny58DR5Q6sGGHquVVHLJAc=;
        b=Hpzvfup8CWjGds18idPq9BC9s9Bk6qVo2VlkxMZZvZ4GIMNEnnk+g5K/Z7XsJrjnZw
         zO0XY6H0q2BYMBBYH/TS0WnbsyowoDyI3KdjG77YXpHaF6p4RGQFY0qZPkUds8sQ4ypz
         zvfbtUac52fkeKqLqmGYgLnuN0y65FydnfNrbG2glBLtkbkGq7IwkiXN6Sow0naSr2Dw
         bxdCdz+ZJq180QzEUkIuoTjbgVDn1FPDmfbEo+zqUkPURk9ZtuU2QT+t/OM6daC7pzg6
         7BXof9TUEikDhd9UKts9a3XE45HjwV39zu70mMdbjzAdlKd9oFOurKh1s/QPkOVxBT3s
         gmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765517386; x=1766122186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KabGZGJyQG+etjOxlMGCNny58DR5Q6sGGHquVVHLJAc=;
        b=hQNYoYoZjM+8AFYsgRBL0rIgSGMxf/MQzbvQfIoVFSiX7fkNc8NG46Kwit8wbOLUZS
         RoP6ccl/dj7SB2Hoes/JmeaaBLgiJYYrd4tpo3/qn0iaONHCD+9L4HJviwxMrcpVzqzZ
         x78LjNOAQsaB9iqH8c2zyVgHlT53IxUWOPmWDpZGohVzOSpcYUNiWJkHY0njEgQCz3Ys
         FLzq54ctJLtDUxTMpay9ggQRhO7sOLPWZF7AI2a81KH5EJnn51anbAlBqmC3syY4JdSV
         aE3xsnQ3xynyQYpe/16YKA2lQFKrfwPCQWvOAVdATWcuWG0qllG1c9NJfaUJTYeRAZf+
         HwCQ==
X-Gm-Message-State: AOJu0Yw3IAYh7SSzpBY/CzRxvvqZRk9EfENJFu9/piAkZ+kZ+QtuNfsn
	ptSbOm31+pO5NELF/BHvjQLqG7CsxwsTL7CBVJTD1JsuZm6w3c2Bs1OP
X-Gm-Gg: AY/fxX7iUX4rODgWEN9le/ii2+crOdYs6EjsF3v7by6XUKTNyqXrQKQfdGQtAF7va0A
	yz/QVtZ3EMx10VHlxyAYpQN4iXBXprVl2cf2Sm79G+VWLEGU7K/U7l6kgQJSXawyeRIwPH6HE6V
	ft2obAivfSZFKnJcQRhC5TCFvCM4aPcy+aZZgizrFai9L7exahYH6k+b9F14o53TJl1UF70xvH2
	5AmI3ZG3Az4d0PgAl+O0vyWLOx5rXdpDrXwxsm2eU/RwSOP6naePvAryB6XXFzQ5TBTVDRELhSZ
	fnGIC4nSey/shxkTlYoJQbo/otkhklgFvn/hLacNCQYCJXssR5GjJXwrxl6V1mNG3vaAtE7WrTV
	epG2D9EXXqxtp9GfGkHV8qoaz8cy3J0HYTZKulGBkJGLgksXKBRNrWdrw2N75h7GvejbItnFbxL
	tWNYaYWeUm/d9cmXTyunxGX9d1j6Ng
X-Google-Smtp-Source: AGHT+IEOsPxs15DqmPE193WrrqWLMX9iYaahF/lhuJg5vO7TdIm8fmfokib6VBzwJtZ1UOig832vFw==
X-Received: by 2002:a17:902:da89:b0:295:275d:21d8 with SMTP id d9443c01a7336-29f237db7damr13746115ad.0.1765517386109;
        Thu, 11 Dec 2025 21:29:46 -0800 (PST)
Received: from DESKTOP-6DS2CAQ.localdomain ([211.115.227.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea06b49csm41486705ad.95.2025.12.11.21.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 21:29:45 -0800 (PST)
From: Minseong Kim <ii4gsp@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] input: lkkbd: disable pending work before freeing device
Date: Fri, 12 Dec 2025 14:23:14 +0900
Message-Id: <20251212052314.16139-1-ii4gsp@gmail.com>
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


