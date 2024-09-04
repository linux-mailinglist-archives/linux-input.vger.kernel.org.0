Return-Path: <linux-input+bounces-6135-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB4A96AFFB
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 06:44:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A68841F23E78
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 04:44:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FBD8127B57;
	Wed,  4 Sep 2024 04:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U91gOzrR"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F5684E0D;
	Wed,  4 Sep 2024 04:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725424988; cv=none; b=K20U/GhCm1JeL8B9XjxbZQ5sMDNPw6mtuHApQQHEv/GxwLHwEiXIYik/hCwj+s8gtcsKmNaAOaVEVQpHK/+5IqtdEeEWUCh/vTKnB78F/mCh4TvdY6acK2oRlBqGJDnYadNXQounX6LCQ3cEDh4AA+S56Ed9RYeoEAsVQ9UXLMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725424988; c=relaxed/simple;
	bh=ZwmF1IcBskxRDxGqbU3BxmePdaxQNe2xsTrvQC+AKc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pmOusnwAV8/yXZi7OjuagArECauSCuZm9v+484TgrUE8yzeeE7iWno9fxfAFzO/bJCiOLDow4ETfgfrnvkHpcuxrfmEWkK79HbgndCqMnMOecAWuM+Ib4ICGwYi33mdxIH+PKBsDR0MJKu2Xtc1X77OP0EAIl4l561Uy5gFhB6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U91gOzrR; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-205722ba00cso21242345ad.0;
        Tue, 03 Sep 2024 21:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725424986; x=1726029786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CofU3FPlAau2C+uDy1gGfBp2z32YQ2vYmUn+IAuO6yQ=;
        b=U91gOzrR89zom76kR56aCP6PcbGPwB7u2uslxFRMArUwlNuVpYZ8mllQ2WV9f8a/Ck
         goGoiJBj3cD350DvnvKKFezfN++Z/BFZFmSQgUe8Lgva7xMY3W0f/QslIkZcQ61696+o
         q9/yFZrb8WAf4gB6zuEn/laamCk4oIZToNDU2Ujp68OB6qBkfJUrAfjneXXCUpMbXGOr
         +oc1NHVMeQBb8JCnusvk/7lbrtJmC1XOpGQNDLSMN/ySKYWzFQ9W7RY8j1Lh4eratfOI
         YmEq5D8tfNyyDgImvOF6giu55c0KXKygm+jFFITyZWVX/JSG1+jYIAglu/OGETn3RT57
         97uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725424986; x=1726029786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CofU3FPlAau2C+uDy1gGfBp2z32YQ2vYmUn+IAuO6yQ=;
        b=wcaObx88ERC3WRxTEuVwkf4QJQNT19yf7SXTB+BYg/TufeTIycOkQXKgnyppyKAQIq
         CckXU2jyGOB4PgAeBeugipV87SHiE6cpHsTvDP0HYByV6umNLflOubQi2p0n+5BRtlHi
         WdlhF5lxARMaRkm7VIbfg+J+lp54zRl0klIsXc22U6pstlMlfykfBsKhz7hGjtYYODTz
         yGiv5lm8xIRsc1Bt6AqHcrIaxBUid057isxRUttsw4qbFo504FXggX3qzH7tcDK/pCTI
         PSUREvNn4p+7mY9sUCIvsLbC33On9FRJ0N0W8b5/V7ZhaUqNMQcgGrm9Ls5YIZKM4XuH
         qVLw==
X-Forwarded-Encrypted: i=1; AJvYcCUjsIK7rfCbuHkWYhrM3u6M2jX6b5mK9og3n220p/xhKmesf2I+K1GWWw3DdsKGlR1RZ7V9fHRTnBFtLho=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1Z8X90UdpX3Y6nC+KZCDNur23OX9/o5qS7tQDvugfZJfhsdCy
	wfSrn78Sdo8bj3xGin0K6szyvbE/9tdrMTju0Ooy7JyM1+vaRRO8uauWqw==
X-Google-Smtp-Source: AGHT+IF6bV7qkawi5DzOxfYgshmXdy3EZLNlfAEDj5Hu3oUYEZu2AmASuDYEqp1iuXr/1vLXmrvwsQ==
X-Received: by 2002:a17:902:db0f:b0:205:5f35:80b6 with SMTP id d9443c01a7336-2055f358700mr84495025ad.61.1725424985793;
        Tue, 03 Sep 2024 21:43:05 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:e682:e3dc:908:eef0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae951c13sm5727665ad.103.2024.09.03.21.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 21:43:05 -0700 (PDT)
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
Subject: [PATCH 06/22] Input: kxtj9 - use guard notation when acquiring mutex/disabling irq
Date: Tue,  3 Sep 2024 21:42:26 -0700
Message-ID: <20240904044244.1042174-7-dmitry.torokhov@gmail.com>
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
more robust by ensuring that mutexes are released and interrupts are
re-enabled in all code paths when control leaves critical section.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/misc/kxtj9.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/input/misc/kxtj9.c b/drivers/input/misc/kxtj9.c
index 837682cb2a7d..c6146bcee9f9 100644
--- a/drivers/input/misc/kxtj9.c
+++ b/drivers/input/misc/kxtj9.c
@@ -314,9 +314,8 @@ static ssize_t kxtj9_set_poll(struct device *dev, struct device_attribute *attr,
 		return error;
 
 	/* Lock the device to prevent races with open/close (and itself) */
-	mutex_lock(&input_dev->mutex);
-
-	disable_irq(client->irq);
+	guard(mutex)(&input_dev->mutex);
+	guard(disable_irq)(&client->irq);
 
 	/*
 	 * Set current interval to the greater of the minimum interval or
@@ -326,9 +325,6 @@ static ssize_t kxtj9_set_poll(struct device *dev, struct device_attribute *attr,
 
 	kxtj9_update_odr(tj9, tj9->last_poll_interval);
 
-	enable_irq(client->irq);
-	mutex_unlock(&input_dev->mutex);
-
 	return count;
 }
 
@@ -504,12 +500,11 @@ static int kxtj9_suspend(struct device *dev)
 	struct kxtj9_data *tj9 = i2c_get_clientdata(client);
 	struct input_dev *input_dev = tj9->input_dev;
 
-	mutex_lock(&input_dev->mutex);
+	guard(mutex)(&input_dev->mutex);
 
 	if (input_device_enabled(input_dev))
 		kxtj9_disable(tj9);
 
-	mutex_unlock(&input_dev->mutex);
 	return 0;
 }
 
@@ -519,12 +514,11 @@ static int kxtj9_resume(struct device *dev)
 	struct kxtj9_data *tj9 = i2c_get_clientdata(client);
 	struct input_dev *input_dev = tj9->input_dev;
 
-	mutex_lock(&input_dev->mutex);
+	guard(mutex)(&input_dev->mutex);
 
 	if (input_device_enabled(input_dev))
 		kxtj9_enable(tj9);
 
-	mutex_unlock(&input_dev->mutex);
 	return 0;
 }
 
-- 
2.46.0.469.g59c65b2a67-goog


