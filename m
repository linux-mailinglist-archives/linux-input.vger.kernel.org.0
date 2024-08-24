Return-Path: <linux-input+bounces-5815-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A275995DC07
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2024 07:52:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FDDB28419C
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2024 05:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E959156242;
	Sat, 24 Aug 2024 05:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fd9ErRlh"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF031552E3;
	Sat, 24 Aug 2024 05:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724478664; cv=none; b=OWbzZY+DkGtCWuRWC3hWcNERKokY+TOZplsRnrg8YlDwFN+wrQxBsJgHN736pqcwERmc6Zxd/CCrXYeBkfx/569BxgjT8PjbD1kIY8s0hkR+42syRZ+MKZwHyocLCF3E+opAK5wulQZ02hteOdzg8V3wwk4HRmSp+gIko+cFW7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724478664; c=relaxed/simple;
	bh=jZc/ru8ieOguS6XNd3fDyKoJzxvdq03+pTPuWqE0FRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bkg1HzmjFbpv6P33VFGRtNFKoE8DAyagSthkEZCqpkKzUqYYHjNAbiILaZdDQmjzl3MKzH7A8/8e2msTBzgO+5wKac0hYAHo/xpjJMu4XgUgWrqPwuTArErT+wbhwrlugYV3FPWdp+GGTVmDp/GJHnKpY+bqWF9tFvzdbEyn/nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fd9ErRlh; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2025031eb60so23383225ad.3;
        Fri, 23 Aug 2024 22:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724478663; x=1725083463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ztZiHh+Ss+9GgllgOmhrzPgnRJ98j/KfpwosGaKcSPw=;
        b=fd9ErRlh/xQErQTBhJOU5UIq6eR8WGedIubVtjzYJ9DIi/CXfHYNTtUOkVi3sZcYT6
         3i4/u7bTSUF+hE0iSGuCWtRzdPk6wZXvg5OliEDt3/5dsNHk2cTEmwA52ZsZaRgfyclw
         NOzFDNRqBcF8qDyzBa9PbGY4fuC1bZItFed7LxXcyO6jDypbfYO95u1uQL/K9b95uf63
         SktIEtJ+V9C840iu0FWYfY1otYC5FNFN6km3TbC8MF8s+mYUrUMKO5qsyCkyGxwvfJUq
         MbUVNhpckFmLkcBI7Za2CgFu8wgqsIRgCgJHtD23q5Mr5eczHR9lbx0tYyHl92HoIWuR
         /TiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724478663; x=1725083463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ztZiHh+Ss+9GgllgOmhrzPgnRJ98j/KfpwosGaKcSPw=;
        b=SG2DDM+geo9w9T/3y+RQWdDJZlx8Nw3IZqkjVlo8diSNtdtxGSFRnf/sg5AvBr/ExB
         0JyWnrinAZl2lv5QzKQK8Vn1d2WIuajBcnJEkPYW2f7V2boPW4/xOQXbDPd94rLw+1C7
         lgsfe8ONca0FHjGNuQvScxTY/p2bSx3jbGcQN4CnhWw0kIWOl4ieE4nVoDLkcjV7b/Wk
         9mAlZE+3CKfd5pUOAU0JB7JmJ91DMWA1v120RrEtj/YOT1A6lrIuN8SZ4uA2HKpUr+Zi
         DyK52qIHK7iplWSOznpzwTxCJGvccgkEXHk1MIGHKdbjMmFdCfZ87nYBkfW/+P+5xL01
         Dgxg==
X-Forwarded-Encrypted: i=1; AJvYcCWV2snsMaJCOpu2LGyAidlXaT5ZOPxpEbzcTCM4khYVI5cSfGSWJSfY0g7PYryasWhtYfO9tww7uFoLHk6G@vger.kernel.org, AJvYcCXB43w1n4AZcrL3T54cVG/39/q7HmdNZGjBAcvRQvE05CFY36pwSDAz28fsO0o1imxCifaozrj4KKVF7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIlg0Ta5ZjmVdIs4RBtEXWecd6r6YrhOKjcgSo1Pg86BkbnJ77
	h0X4b1WMX88m7oj/LduY4tBkgFswYMAii9asviHLhlc1mJA+kQ0B
X-Google-Smtp-Source: AGHT+IGot0lQRgzGokFPzNf71FPRlrLtsMrbJ1ij7h8spkWMrpcdahIR65WkFEWR2vsBXXI5LaaCFw==
X-Received: by 2002:a17:903:188:b0:1fc:86cc:4254 with SMTP id d9443c01a7336-2039e4b37c1mr44644235ad.33.1724478662530;
        Fri, 23 Aug 2024 22:51:02 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:75c:5a5a:d7dc:18f6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20395ef904dsm23398615ad.31.2024.08.23.22.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 22:51:02 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	linux-input@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/18] Input: zforce_ts - ensure that pm_stay_awake() and pm_relax() are balanced
Date: Fri, 23 Aug 2024 22:50:31 -0700
Message-ID: <20240824055047.1706392-8-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
In-Reply-To: <20240824055047.1706392-1-dmitry.torokhov@gmail.com>
References: <20240824055047.1706392-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a small chance that ts->suspending flag may change while the
interrupt handler is running. To make sure call to pm_relax() is not
skipped on accident use a temporary to hold the original value at the
beginning of interrupt. Use READ_ONCE() so that the value is actually
fetched at the right time.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/zforce_ts.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/input/touchscreen/zforce_ts.c b/drivers/input/touchscreen/zforce_ts.c
index afeafa589928..004ef728fb90 100644
--- a/drivers/input/touchscreen/zforce_ts.c
+++ b/drivers/input/touchscreen/zforce_ts.c
@@ -454,6 +454,7 @@ static irqreturn_t zforce_irq_thread(int irq, void *dev_id)
 	int ret;
 	u8 payload_buffer[FRAME_MAXSIZE];
 	u8 *payload;
+	bool suspending;
 
 	/*
 	 * When still suspended, return.
@@ -467,7 +468,8 @@ static irqreturn_t zforce_irq_thread(int irq, void *dev_id)
 	dev_dbg(&client->dev, "handling interrupt\n");
 
 	/* Don't emit wakeup events from commands run by zforce_suspend */
-	if (!ts->suspending && device_may_wakeup(&client->dev))
+	suspending = READ_ONCE(ts->suspending);
+	if (!suspending && device_may_wakeup(&client->dev))
 		pm_stay_awake(&client->dev);
 
 	/*
@@ -495,7 +497,7 @@ static irqreturn_t zforce_irq_thread(int irq, void *dev_id)
 			 * Always report touch-events received while
 			 * suspending, when being a wakeup source
 			 */
-			if (ts->suspending && device_may_wakeup(&client->dev))
+			if (suspending && device_may_wakeup(&client->dev))
 				pm_wakeup_event(&client->dev, 500);
 			zforce_touch_event(ts, &payload[RESPONSE_DATA]);
 			break;
@@ -548,7 +550,7 @@ static irqreturn_t zforce_irq_thread(int irq, void *dev_id)
 		}
 	} while (gpiod_get_value_cansleep(ts->gpio_int));
 
-	if (!ts->suspending && device_may_wakeup(&client->dev))
+	if (!suspending && device_may_wakeup(&client->dev))
 		pm_relax(&client->dev);
 
 	dev_dbg(&client->dev, "finished interrupt\n");
@@ -584,7 +586,9 @@ static int zforce_suspend(struct device *dev)
 	int ret = 0;
 
 	mutex_lock(&input->mutex);
-	ts->suspending = true;
+
+	WRITE_ONCE(ts->suspending, true);
+	smp_mb();
 
 	/*
 	 * When configured as a wakeup source device should always wake
@@ -615,7 +619,9 @@ static int zforce_suspend(struct device *dev)
 	ts->suspended = true;
 
 unlock:
-	ts->suspending = false;
+	smp_mb();
+	WRITE_ONCE(ts->suspending, false);
+
 	mutex_unlock(&input->mutex);
 
 	return ret;
-- 
2.46.0.295.g3b9ea8a38a-goog


