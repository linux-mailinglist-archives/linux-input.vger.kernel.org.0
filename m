Return-Path: <linux-input+bounces-6134-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B214A96AFF1
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 06:43:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1BC62B24690
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 04:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 001E085260;
	Wed,  4 Sep 2024 04:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SMkYk+fc"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7870E84A32;
	Wed,  4 Sep 2024 04:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725424986; cv=none; b=IWDLxyWDd+1v4kIiXWd7Kjgu5PG9vAzooh/mE8aJhSWOzvcSCO5Z9MXYfN0g45ZxhfLnt9tuLZv1gfa66PzvR/sDAgTmyQdMYJQG60Xh7Xs4dSZNE6PmztTIdbV3TzNe1mgmgkghyYrCDrs0jMiMPpWNpSwfs3Ql7mu93vyBtOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725424986; c=relaxed/simple;
	bh=ntJRQE7i5EHSpWxAGqsFMIM6I1u1MMOt+WMjZtKBSpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lerNXQGqCbFod1IWFFmH02vEj8hDxbR982l1aYwr9wayYcy2X6kbyhHJwoHdRpiisnbvkPImJP7hN4IWyYRzxWdijfGWaw4x1Bjl47WhzU+3H0tcLT5xjschkKEowf0FRzzDxEpffiFRDAg8kLiCzgLTQL+C1Tf9XfEy5d6HzVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SMkYk+fc; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7143165f23fso4878838b3a.1;
        Tue, 03 Sep 2024 21:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725424984; x=1726029784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qt3lIbqEzBLG2ARFdyUWJzIIEgp9iN6FwkL6CSsxPmo=;
        b=SMkYk+fc2T5ZC3QYAzjoR6h1AGucQ+xleW7wAYjPm0pmjLazV04oaxkX4+3NzgC+65
         GyzaPfGK4r8Y4wpKQNf3Ek5iRxvqDCjEiddOkPmQmQMsd7JqAJKtsrdhyMGx8W3G1JB8
         TByOLiJaUKL+gDkyNa+nOyhy6F8/XPsQU+K49xXsXcIcBlRQTza1mOmV7VRi9ruo5RoG
         GB/WyKfAJ3hplU/+/Lzw6gVm58IYMwbegtJ2rRbfEoj9j/aRKEfH0aBzzaLt4szuugj3
         WLNAbZIZw7qlgUUlC6CgfWkZqQuAz3BChQZgdpV3X7vhqdcpYbHYJHnmRkpJBngUN9ts
         EkWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725424984; x=1726029784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qt3lIbqEzBLG2ARFdyUWJzIIEgp9iN6FwkL6CSsxPmo=;
        b=v2Hpns8YPo+VNrGezPnMKxZvdzzdjc9MuqKZI1KvyoSEAzMSQWWO4WeZBbJ05NHrcn
         erltqVTYsrPoDlvLfFT8IP/j5rfwf/TeTYKUklgAra2LmBJTFtJspU1+uybyeMiks4Br
         Qn5/Y6AviEmaHjj0h3sNToDurkZOm1SgKsEe5yuKQ5r+IKcPXQOMr7saTiJz2Lgoqh24
         QhZHwM9PuY3+Ee7HB6IP54LLHN5ntGCJziXcP7QX0LbLWMnYKBqWaXlRoUWOpYGJbps8
         cemZtXpEd9nSDLXQrW5uqhZtsDhUoOjMg3GFabXI88/Jqpk8nhBUG2DTqZNjRvwwKGz/
         bCOw==
X-Forwarded-Encrypted: i=1; AJvYcCXRJwmRNfMZqTzXeJEDLDcaq78pUkt9PMkE2W6KVo/8FARJrU/ILzRcyQegQffDjx03/IWAHDOORdE00d8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPuO9X3atnsnXFpp49eXiM7m7XeyH3N8ZTl8Tw3cjDcZSD/ksr
	54FyjBN2CHmuQRl51rjRGSWuQH469dOh9gHbqcqrMjT3TycI+OKtlBeEXg==
X-Google-Smtp-Source: AGHT+IFNC8TLv1cx88xGH3pwH1vAazusFQZm0bGvrQnQR0jeYN70CGQDBhRl7ZtFk2U7+lwmIWjtEA==
X-Received: by 2002:a05:6a21:789f:b0:1cc:e1a2:4335 with SMTP id adf61e73a8af0-1ced058ab02mr11718585637.50.1725424984473;
        Tue, 03 Sep 2024 21:43:04 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:e682:e3dc:908:eef0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae951c13sm5727665ad.103.2024.09.03.21.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 21:43:04 -0700 (PDT)
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
Subject: [PATCH 05/22] Input: da7280 - use guard notation when acquiring mutex and spinlock
Date: Tue,  3 Sep 2024 21:42:25 -0700
Message-ID: <20240904044244.1042174-6-dmitry.torokhov@gmail.com>
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
more robust by ensuring that locks are released in all code paths
when control leaves critical section.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/misc/da7280.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/input/misc/da7280.c b/drivers/input/misc/da7280.c
index 1629b7ea4cbd..e4a605c6af15 100644
--- a/drivers/input/misc/da7280.c
+++ b/drivers/input/misc/da7280.c
@@ -1263,39 +1263,37 @@ static int da7280_suspend(struct device *dev)
 {
 	struct da7280_haptic *haptics = dev_get_drvdata(dev);
 
-	mutex_lock(&haptics->input_dev->mutex);
+	guard(mutex)(&haptics->input_dev->mutex);
 
 	/*
 	 * Make sure no new requests will be submitted while device is
 	 * suspended.
 	 */
-	spin_lock_irq(&haptics->input_dev->event_lock);
-	haptics->suspended = true;
-	spin_unlock_irq(&haptics->input_dev->event_lock);
+	scoped_guard(spinlock_irq, &haptics->input_dev->event_lock) {
+		haptics->suspended = true;
+	}
 
 	da7280_haptic_stop(haptics);
 
-	mutex_unlock(&haptics->input_dev->mutex);
-
 	return 0;
 }
 
 static int da7280_resume(struct device *dev)
 {
 	struct da7280_haptic *haptics = dev_get_drvdata(dev);
-	int retval;
+	int error;
 
-	mutex_lock(&haptics->input_dev->mutex);
+	guard(mutex)(&haptics->input_dev->mutex);
 
-	retval = da7280_haptic_start(haptics);
-	if (!retval) {
-		spin_lock_irq(&haptics->input_dev->event_lock);
+	error = da7280_haptic_start(haptics);
+	if (error)
+		return error;
+
+	scoped_guard(spinlock_irq, &haptics->input_dev->event_lock) {
 		haptics->suspended = false;
-		spin_unlock_irq(&haptics->input_dev->event_lock);
 	}
 
-	mutex_unlock(&haptics->input_dev->mutex);
-	return retval;
+	return 0;
 }
 
 #ifdef CONFIG_OF
-- 
2.46.0.469.g59c65b2a67-goog


