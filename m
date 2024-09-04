Return-Path: <linux-input+bounces-6124-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCF596AFD6
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 06:31:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BDD93B24259
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 04:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9809E824A0;
	Wed,  4 Sep 2024 04:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FKLPb66H"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD1318C36;
	Wed,  4 Sep 2024 04:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725424278; cv=none; b=Om8eZeKyu263+FzBkeWInyzwHleiKLfY6dJdtaa67lccBbtEMyRsdTQaa6Vi3+5EXJSTMpXjALksaxa8Ijm7VPi++/rYPT4xanoMW2gbnNfQSXtDkCbJtRNyhVhZ/e/sKe/Mx+WPu/yw23Uj18kc1ikD6bTULF060XtpcD+Pikc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725424278; c=relaxed/simple;
	bh=ZJAi8VHy7qSDD1/8e5V67cLxULpG+erGpInrDT6ftBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hqjdLe6x73gAx9A1aR5AUgEq7Kw8+G6iKVJ0IQ40zJssGDUjG0WmT/L9Q/0DRs+n2XjoTNHzfxCstBwulLwhfEAGgvO/1wRxCf17JMgG0do23iEpM+5oTKI2wAF1eSjk+1JVm1WYUgO5NoA2LiRMlElYTwpqv8YL6urm8hEbEjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FKLPb66H; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1fc47abc040so3068215ad.0;
        Tue, 03 Sep 2024 21:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725424276; x=1726029076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLlgku3anJMbbsPu9u0QAuCB6pezMxOtz2uO45yg+go=;
        b=FKLPb66H3Qjb4iBcf0uJUjbsImrPYpdyYr1nXaH85pkPWrcPcluin07lOXVOBoKBIf
         BXrgqaeC1pqB60IYpVG6JNWuGaeXWblWZOrmqO+5zo1iAB5XFI7Ry++9Gr7nglx1Yp7a
         JKyShrEvaNRcpoDfiHUhc0LaNBnx/YWwtaxZvREgiPpaMN8UQ04g9cdDjM8pR9g5CQy4
         3rTAOI/UaDNEH4J+0omHEYcd2AAQ4ypG2qDQAFWwsWEtWTqQgwwIx0Q3GZU3DgQrudcY
         MbvVhwwpW/kTHVAG4zE4LUcE6YWc39UsX2zE92YAeqWnpqgJgDd7HSd24A8FvXgeem3T
         rj5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725424276; x=1726029076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qLlgku3anJMbbsPu9u0QAuCB6pezMxOtz2uO45yg+go=;
        b=m7VFcIrj0v9BYG4ipdxiqe/ZZQcNGS6rbkJWcbSINpbViJyfkSj7TMS2iV6T150SjV
         Mx4I9nhfmAwrPwOmnkFhkGuv9Rziv3GAk6RKk+rhCFB4AW9ArVTNymR6aiv4G47vpI03
         L5ihpAbSPLYF/5SvepXeCag5TOkRtcl/F2Jj597cPRdFO2Z/tFyqS/kEZvrytKN6aIkR
         j4Oc7a72ORurcjcsRh86QcPI/9jgB/auJlt4khGrQQGPmb6fnGmXe0wVlR20v3uDtNuO
         vyHS+TFvWR12sQbpHQ2pBHzzcpUIXISflvt5sRJ5AqhVZRxs1pcXZ2l5WKxWyuAwapMq
         RZzQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5FhoymsS/WJRUrIS17fuTg5Nig4Qw8CbZLlj0XEJcK4qr1GeT/2V/HlnIP4maXIHorJ1OkU0LoWSUz6s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwparXU2E6UiHoBH1aKyGPihSt5O7AootyMZndelliXGlspMJ1q
	osWlJf5jDwlCR0YkfLt25++XXpnwzk0N8evm9QKh6Pgp50ZOoWowlp7asQ==
X-Google-Smtp-Source: AGHT+IHWVnwJuRlqZZFMv5HEQK4dSHyx01u9Q2WTkQJpZCoausD/W6CmZ4U2SjUpGvpw6XSEDdsAFw==
X-Received: by 2002:a17:902:c94f:b0:205:7829:9d83 with SMTP id d9443c01a7336-20578299e50mr57313105ad.38.1725424275938;
        Tue, 03 Sep 2024 21:31:15 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:e682:e3dc:908:eef0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206aea392e3sm5503555ad.135.2024.09.03.21.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 21:31:15 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Erick Archer <erick.archer@outlook.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] Input: gamecon - use guard notation when acquiring mutex
Date: Tue,  3 Sep 2024 21:30:59 -0700
Message-ID: <20240904043104.1030257-3-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240904043104.1030257-1-dmitry.torokhov@gmail.com>
References: <20240904043104.1030257-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using guard notation makes the code more compact and error handling
more robust by ensuring that mutexes are released in all code paths
when control leaves critical section.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/joystick/gamecon.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/input/joystick/gamecon.c b/drivers/input/joystick/gamecon.c
index c38de3094553..968c0e653f2e 100644
--- a/drivers/input/joystick/gamecon.c
+++ b/drivers/input/joystick/gamecon.c
@@ -765,33 +765,31 @@ static void gc_timer(struct timer_list *t)
 static int gc_open(struct input_dev *dev)
 {
 	struct gc *gc = input_get_drvdata(dev);
-	int err;
 
-	err = mutex_lock_interruptible(&gc->mutex);
-	if (err)
-		return err;
+	scoped_guard(mutex_intr, &gc->mutex) {
+		if (!gc->used++) {
+			parport_claim(gc->pd);
+			parport_write_control(gc->pd->port, 0x04);
+			mod_timer(&gc->timer, jiffies + GC_REFRESH_TIME);
+		}
 
-	if (!gc->used++) {
-		parport_claim(gc->pd);
-		parport_write_control(gc->pd->port, 0x04);
-		mod_timer(&gc->timer, jiffies + GC_REFRESH_TIME);
+		return 0;
 	}
 
-	mutex_unlock(&gc->mutex);
-	return 0;
+	return -EINTR;
 }
 
 static void gc_close(struct input_dev *dev)
 {
 	struct gc *gc = input_get_drvdata(dev);
 
-	mutex_lock(&gc->mutex);
+	guard(mutex)(&gc->mutex);
+
 	if (!--gc->used) {
 		del_timer_sync(&gc->timer);
 		parport_write_control(gc->pd->port, 0x00);
 		parport_release(gc->pd);
 	}
-	mutex_unlock(&gc->mutex);
 }
 
 static int gc_setup_pad(struct gc *gc, int idx, int pad_type)
-- 
2.46.0.469.g59c65b2a67-goog


