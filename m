Return-Path: <linux-input+bounces-6130-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A6B96AFE9
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 06:43:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C72B1F25079
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 04:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3388824A1;
	Wed,  4 Sep 2024 04:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K7CPXjBP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B10581AC6;
	Wed,  4 Sep 2024 04:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725424976; cv=none; b=BiGJ66KPugP4hsWpPdSx/ZONzB3mCVw2AwOkJ/Y7zWRL3z21dqmYGmBI+lis6pw8VKmwOa8XvV+gMVwaOoQFJwARfN7RmIfFg5FLg7+E2FSBLPlLOTOm3k/FjCB+ISS1C6XBWKT99Q4Be40RseXwggEMJGtBlzjF3F0+xcuciPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725424976; c=relaxed/simple;
	bh=NjT4MvQwByttEN8VVRSC2XF5TVXi28xU8cKD0k0ahyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ConfKugNBjZ1IFUXeIkVakA3VsbTjj7IMH2UyQ+Q8u44A70UuRYNsLKvaR2cFNS2cFgiOM555vpKbr1gagoQkqRS3Xc5B/JQPz519SeW5gImjFxCr6FtZ5/lxeBhLRRmXwnEF/9LXoCpPyS9pu7dwA7Ud4XelH7LoGF8XWSR+tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K7CPXjBP; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-202508cb8ebso38000665ad.3;
        Tue, 03 Sep 2024 21:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725424974; x=1726029774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lDbTLvM6j/fXldgZ2pW2080JP3mjLaUhBxwYqY8D4GA=;
        b=K7CPXjBPQCAZSWfpYefrMbwtvqdo9GUWdS7Et/sJVQaFYggk96IcL0NacjBC6VK8RM
         5lapnmBCz2DG9v+Q9BGun97YBj/LweQgtVHOHVnuZWC85cLBHEzzLZRIJ2eUL7WuYN2p
         VPzQXTnJqfdzO2oNbYu84yGAY2f3dPkncls+HZXW7yUJb9uD9SLfaqAkAKNtI8mQ4uv/
         JivLGUe1/2QqZCym6oPSbRugY+pxq/cKXDYHksqgq5pSTSAdZr0YE2DrBSSe2C/27TG0
         k758tVTsLw2+Ap9UZ7juSXcyQ1LKZh31oc/CWUCDLWbbrRtVWY683QIv1KuDmnF71wvb
         jrRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725424974; x=1726029774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lDbTLvM6j/fXldgZ2pW2080JP3mjLaUhBxwYqY8D4GA=;
        b=Wlu2k0w6TUpG5i6gb0cPjI8fmBeOrTxqo37vbZACMUFLesprT+KCSpmnQhvo+ZibpC
         nzcquBQK4Spmfz+4HdtpcV0jnGDRbVsdrH6petojGYwOHXQa8SAXURsy44Kjd3zmgyY+
         +vFnRe7HOK0C15U5mXg7szflgPjuweYHHdy01yaBtks1ysu8Si1sVfsoQYEuel28ZL8f
         ca7v/Jr9oItmKFLqL2XLCrlzC+a2IgwLIKqiSsAW/mDqQqrdHNa0tfsEn91m+LfBKVG0
         apR94dwhc4EOt4SCx1BNJEM/e7E+X6u10pzw6FrQXPs/rmAoyGm23BerK6XRdmzEvEmP
         TVzA==
X-Forwarded-Encrypted: i=1; AJvYcCWbIrf3hf8eFGbp2zuMVjZ7+Ol6LdjVEESiN48vA7QFlRH9sUIsGBA8ges1bKIMYsrkSuxYht8c8rXkSKo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsgMiLfVbDF4bjp1jThW52pmN8XXkBfb9oLUCpMBDa+YRw1BVK
	bylAmJXXJkJ+rvjR0Qi4bhVY06DlT5s6e8Xv5hVIJ1u6ybpAIjMiXZdTXw==
X-Google-Smtp-Source: AGHT+IHJcwiKdFYmZKy5qiXng/r7t1eytZrl5m4cs0vmg/t3rVxsHeg7bqOfpnL6lEog1Mv6yvwBjA==
X-Received: by 2002:a17:902:e741:b0:201:f8b4:3e3c with SMTP id d9443c01a7336-206b7aabc56mr8291685ad.12.1725424973777;
        Tue, 03 Sep 2024 21:42:53 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:e682:e3dc:908:eef0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae951c13sm5727665ad.103.2024.09.03.21.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 21:42:53 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Ville Syrjala <syrjala@sci.fi>,
	Support Opensource <support.opensource@diasemi.com>,
	Eddie James <eajames@linux.ibm.com>,
	Andrey Moiseev <o2g.org.ru@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/22] Input: ad714x - use guard notation when acquiring mutex
Date: Tue,  3 Sep 2024 21:42:21 -0700
Message-ID: <20240904044244.1042174-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
References: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
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
 drivers/input/misc/ad714x.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/input/misc/ad714x.c b/drivers/input/misc/ad714x.c
index 1acd8429c56c..d106f37df6bc 100644
--- a/drivers/input/misc/ad714x.c
+++ b/drivers/input/misc/ad714x.c
@@ -941,7 +941,7 @@ static irqreturn_t ad714x_interrupt_thread(int irq, void *data)
 	struct ad714x_chip *ad714x = data;
 	int i;
 
-	mutex_lock(&ad714x->mutex);
+	guard(mutex)(&ad714x->mutex);
 
 	ad714x->read(ad714x, STG_LOW_INT_STA_REG, &ad714x->l_state, 3);
 
@@ -954,8 +954,6 @@ static irqreturn_t ad714x_interrupt_thread(int irq, void *data)
 	for (i = 0; i < ad714x->hw->touchpad_num; i++)
 		ad714x_touchpad_state_machine(ad714x, i);
 
-	mutex_unlock(&ad714x->mutex);
-
 	return IRQ_HANDLED;
 }
 
@@ -1169,13 +1167,11 @@ static int ad714x_suspend(struct device *dev)
 
 	dev_dbg(ad714x->dev, "%s enter\n", __func__);
 
-	mutex_lock(&ad714x->mutex);
+	guard(mutex)(&ad714x->mutex);
 
 	data = ad714x->hw->sys_cfg_reg[AD714X_PWR_CTRL] | 0x3;
 	ad714x->write(ad714x, AD714X_PWR_CTRL, data);
 
-	mutex_unlock(&ad714x->mutex);
-
 	return 0;
 }
 
@@ -1184,7 +1180,7 @@ static int ad714x_resume(struct device *dev)
 	struct ad714x_chip *ad714x = dev_get_drvdata(dev);
 	dev_dbg(ad714x->dev, "%s enter\n", __func__);
 
-	mutex_lock(&ad714x->mutex);
+	guard(mutex)(&ad714x->mutex);
 
 	/* resume to non-shutdown mode */
 
@@ -1197,8 +1193,6 @@ static int ad714x_resume(struct device *dev)
 
 	ad714x->read(ad714x, STG_LOW_INT_STA_REG, &ad714x->l_state, 3);
 
-	mutex_unlock(&ad714x->mutex);
-
 	return 0;
 }
 
-- 
2.46.0.469.g59c65b2a67-goog


