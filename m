Return-Path: <linux-input+bounces-6150-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8858496B023
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 06:50:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B572C1C23E45
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 04:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62C43823AF;
	Wed,  4 Sep 2024 04:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aoY403BA"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2F8823AC;
	Wed,  4 Sep 2024 04:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725425366; cv=none; b=I4O7ObI2ABdfyTp5xaVpzpjWI/rpObonypMts38fYUXFw1faLZexjjy7ATsD4zPGTTYrBt/aprvX5citolL2+vMSZNassUd9KBVOt7kCsi8URB9sOmI7k/QpPCkzhjPAQ/88RVoXnUuAwzz+38uB6CiFfuDIshHDB5yiqGqogd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725425366; c=relaxed/simple;
	bh=iqKox10L/BMJRep//TxFHzNzv1gmE/5Z24V0pFtPVQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=avjkYjJnRhIgkjf66FR10yurhIEJtPGr6VWXjXZQxuZU77ldYBoSxZKiYJA+EJGteBWcWbBouOV0TzZzdnVy3ADq3ZpcHiIYMgzOn/1Vr2B7sfdjXdAd4EHqeoio7l3Dr47lqecLFypfbHYzfLoTsMoF12otr8DZ5xVBtSDcg50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aoY403BA; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7176645e440so235192b3a.1;
        Tue, 03 Sep 2024 21:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725425364; x=1726030164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=etkHfoK3+2WQV2UCZXnu7S5CCvqcAYWO20wdxeW2yEo=;
        b=aoY403BAsrdIQv7m916P/LZEFVhlUR9FuPQswGpj6a3Hr0ac2uY/T/vT6oSwfNbaMi
         PlwG4g0ADEG/bQmJ3l4BtDK16urdJJFQ8DTJ1EBz3OJOclE705wGHS9M8NhGvgKrEMgy
         PS2um21Mdx/CljxNrQbokbHiAsUC1hXJwKRT5Lz4/NlasC0YHz1vRJArzNE12A+z9Xms
         UmouVVWislWzReGRvoCngNAqxbHyk2H3ZfKjj+CoQPm77cXZyR+M+j0Ou1JCDtCfCvNE
         X0yoGmYMCvUK5M/Sq8Cp5q0Xbm78qT9vQvzaHdWH2Zy3vqbCXLmUkhQVW1d8YBSk1PMB
         19+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725425364; x=1726030164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=etkHfoK3+2WQV2UCZXnu7S5CCvqcAYWO20wdxeW2yEo=;
        b=NHGolFlbfJVFKxUwJKMcsGzdRc95mp20ICbf8JzL0xoECR+ECoeQeiY458Fe447lcN
         qzQUhPzbIdVr6gBDbyqO/MM+cl7RObpQaQx+BTTyg7gRhlMmgD+T4gUv7Kt8fGguXnwR
         yPafb1Tr8sU8UiwO5Xhxlf20Scj5nB2Xys/EsF2la0DD5Gn9NjqYMZ4My9u/myeE7P0o
         sshE3qR3SrYxmNJpDSUkjuZoAa1xXKtrS7hIi6QLZCZ47w/vmFw1UZsasblFp/5mAezm
         p8u5ot/Zs4GBa1FT1OFN3kFu1xdMMQn8uolI7WA1y7r2OYbzsTUzuyMoao4MJK47rppv
         P/9A==
X-Forwarded-Encrypted: i=1; AJvYcCUiNKfOBp8O1fE7K/0VKDbnlf5gwrTb5sDrrMZBEuXNXLZ8rSgExTR+uYuPnEKfVNSmClTN+mQNoSR7KMI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcGRsYOHuWGGxamZlihgJblxCGFSKOAxKmC87G3IVYDvScAJJ5
	OzCbCwkk56r7Lxo0vT34EUy8O4qJQ1nN/RQlCvcroR4kCkpqUx9x4NpSWw==
X-Google-Smtp-Source: AGHT+IHALpm45S59ySVq5byacFcop5zfDsgwFgYetsN9dEUYq0/2ufoexPczwK9EoCE/MgterT83mw==
X-Received: by 2002:a05:6a00:2a6:b0:70d:2e89:de2b with SMTP id d2e1a72fcca58-7177a92b56emr1219734b3a.4.1725425363807;
        Tue, 03 Sep 2024 21:49:23 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:e682:e3dc:908:eef0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71778521099sm718517b3a.6.2024.09.03.21.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 21:49:23 -0700 (PDT)
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
Subject: [PATCH 20/22] Input: regulator-haptic - use guard notation when acquiring mutex
Date: Tue,  3 Sep 2024 21:49:21 -0700
Message-ID: <20240904044922.1049488-1-dmitry.torokhov@gmail.com>
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
 drivers/input/misc/regulator-haptic.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/input/misc/regulator-haptic.c b/drivers/input/misc/regulator-haptic.c
index 02f73b7c0462..41af6aefaa07 100644
--- a/drivers/input/misc/regulator-haptic.c
+++ b/drivers/input/misc/regulator-haptic.c
@@ -83,12 +83,10 @@ static void regulator_haptic_work(struct work_struct *work)
 	struct regulator_haptic *haptic = container_of(work,
 					struct regulator_haptic, work);
 
-	mutex_lock(&haptic->mutex);
+	guard(mutex)(&haptic->mutex);
 
 	if (!haptic->suspended)
 		regulator_haptic_set_voltage(haptic, haptic->magnitude);
-
-	mutex_unlock(&haptic->mutex);
 }
 
 static int regulator_haptic_play_effect(struct input_dev *input, void *data,
@@ -207,17 +205,14 @@ static int regulator_haptic_suspend(struct device *dev)
 	struct regulator_haptic *haptic = platform_get_drvdata(pdev);
 	int error;
 
-	error = mutex_lock_interruptible(&haptic->mutex);
-	if (error)
-		return error;
-
-	regulator_haptic_set_voltage(haptic, 0);
-
-	haptic->suspended = true;
+	scoped_guard(mutex_intr, &haptic->mutex) {
+		regulator_haptic_set_voltage(haptic, 0);
+		haptic->suspended = true;
 
-	mutex_unlock(&haptic->mutex);
+		return 0;
+	}
 
-	return 0;
+	return -EINTR;
 }
 
 static int regulator_haptic_resume(struct device *dev)
@@ -226,7 +221,7 @@ static int regulator_haptic_resume(struct device *dev)
 	struct regulator_haptic *haptic = platform_get_drvdata(pdev);
 	unsigned int magnitude;
 
-	mutex_lock(&haptic->mutex);
+	guard(mutex)(&haptic->mutex);
 
 	haptic->suspended = false;
 
@@ -234,8 +229,6 @@ static int regulator_haptic_resume(struct device *dev)
 	if (magnitude)
 		regulator_haptic_set_voltage(haptic, magnitude);
 
-	mutex_unlock(&haptic->mutex);
-
 	return 0;
 }
 
-- 
2.46.0.469.g59c65b2a67-goog


