Return-Path: <linux-input+bounces-6208-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7691196C900
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 22:55:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8E901C25539
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 20:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CC4E13B7A3;
	Wed,  4 Sep 2024 20:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O2UdEHPK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C424AD530;
	Wed,  4 Sep 2024 20:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725483313; cv=none; b=nwDuJedh++bQ6nofkrTa7aVT4C6NCEgdpWFnLV7fD/UjWQyg6LfoAowpVj2epUKdOQxdHJN4RJshQkD53l4E8KN1Qlru1HZpcwKTiOG0hNwQN5HSFT5svSXQR0CqwUXSxGSlx4rkvqfz3LoUNV1d3+iYvb2KTQSFCQ4OJN6ESGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725483313; c=relaxed/simple;
	bh=LQTu8sC/kulEKMETw8TubpnUEdoK4OUoYt2IduwMQPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fy0RwCqHIwJB9d6l2RNxUdxnvTD17Ap9nA+d3y9UsrJQLR9yyS7BtG/+0WUZOGFWJoLceP6rVi3xzfhOOZ71gigKkPPfxRD8WN911mMH81JJ6J8QfRLMJX/6glCPhqC3L9hphKVPKq6udY/sjXF8drOCXQGnFzw5orhfpIa4Gs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O2UdEHPK; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2059204f448so801735ad.0;
        Wed, 04 Sep 2024 13:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725483311; x=1726088111; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sqrX7xKRsiUs8X7rmIdaWp7SWBsLihp3vVeII2DVLXw=;
        b=O2UdEHPKqCtVktDRPJSxt52yZ3idu0nFQh3dxueapYBL7pNo0Eki6clUfkBaVwaqFN
         k4dbDrVh9GsSC8GngoOn+t6OJErBFGmUdd8ngNQVEKcyVROjZD5VJ9cA4rbR8AXse7GB
         dNX44joj7Q4qYo9E5rhTn5t5TU7WRn6eCCwbPVTjpR1BElI7N69X8e/+qlu+Tgy9VZAO
         E8Bfrg4GNggAMEaZioBrSUiVR8NlWfAAfI9RzF2MQ3ya+a8g0ofQeShz452F0a9iTkwM
         TWO0WAITbsrpo+QnVGY1OVkFammlfGGeRFvP4qhP7/71lpQwREPGmzbU3NHp398JsbOW
         Vutg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725483311; x=1726088111;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqrX7xKRsiUs8X7rmIdaWp7SWBsLihp3vVeII2DVLXw=;
        b=qQS6d0TGjBDxqTmkRl9kOzCfWT95z4sZLkUpmsQXVAPFJXRDqDTquLirJZ3jur9P57
         MyCCsGSJvUM/noBj/kuy6XfnNpmSvIU5HicR0H+VSmQFOFz3c1DIra3poNvzKDuD4cvq
         K1yvlUnUbMJ4FbtYxLq9No7AjYWhlbETrsRc4x1o8IRYZnjxRF+BhwNBOlFqbHue9aMN
         Z8SzyItPaPMNH9owXo3AfSByJHeJIqqP2cdhJiLVboHtYHOtrqaMUkf7s6Z/sFeiFDAZ
         4UcEfIoid/e/Tt5weBuoJtFSDvR6uZj6VlCl/CiLh/VzIWMnByYKP6k8mACSdCywvmEU
         NQYA==
X-Forwarded-Encrypted: i=1; AJvYcCXE+4G1/rkhAGCazTL5jU96yrRvu25wJjVCnsFx2e0bhlMA5OzcHIvfoYydhVF5W/9VTuGD1lyXxvqWsio=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxDoDkzm1JTNjLjCvzaE2L2LMqpvmpHGsU0rsxRp6W3+voEmHz
	odLHMJ3XuVRfTVljI0v197U/chRdXLdafJ0zySvvDVZB1fpBDTcX
X-Google-Smtp-Source: AGHT+IFN1IwonS31KRPHw1fKgP9hulUMBQG6IxgViZqWb3/daMJFpYfffDJkEKkxZZyCCacv3nOxtw==
X-Received: by 2002:a17:902:c949:b0:205:5dfe:7be with SMTP id d9443c01a7336-2055dfe179fmr126258775ad.26.1725483310546;
        Wed, 04 Sep 2024 13:55:10 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:13bd:b4e:4c0f:4c37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae9525d6sm17598355ad.111.2024.09.04.13.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 13:55:10 -0700 (PDT)
Date: Wed, 4 Sep 2024 13:55:07 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: linux-input@vger.kernel.org,
	Michael Hennerich <michael.hennerich@analog.com>,
	Ville Syrjala <syrjala@sci.fi>,
	Support Opensource <support.opensource@diasemi.com>,
	Eddie James <eajames@linux.ibm.com>,
	Andrey Moiseev <o2g.org.ru@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jeff LaBundy <jeff@labundy.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 20/22] Input: regulator-haptic - use guard notation when
 acquiring mutex
Message-ID: <ZtjJKxQRRzJE0aWZ@google.com>
References: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
 <20240904044922.1049488-1-dmitry.torokhov@gmail.com>
 <3ff97fb3-27e0-496e-a8b0-0c2d69deeff2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ff97fb3-27e0-496e-a8b0-0c2d69deeff2@gmail.com>

Using guard notation makes the code more compact and error handling
more robust by ensuring that mutexes are released in all code paths
when control leaves critical section.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

v2: drop no linger used "error" variable in regulator_haptic_suspend()

 drivers/input/misc/regulator-haptic.c |   24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/input/misc/regulator-haptic.c b/drivers/input/misc/regulator-haptic.c
index 02f73b7c0462..3666ba6d1f30 100644
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
@@ -205,19 +203,15 @@ static int regulator_haptic_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct regulator_haptic *haptic = platform_get_drvdata(pdev);
-	int error;
 
-	error = mutex_lock_interruptible(&haptic->mutex);
-	if (error)
-		return error;
-
-	regulator_haptic_set_voltage(haptic, 0);
+	scoped_guard(mutex_intr, &haptic->mutex) {
+		regulator_haptic_set_voltage(haptic, 0);
+		haptic->suspended = true;
 
-	haptic->suspended = true;
-
-	mutex_unlock(&haptic->mutex);
+		return 0;
+	}
 
-	return 0;
+	return -EINTR;
 }
 
 static int regulator_haptic_resume(struct device *dev)
@@ -226,7 +220,7 @@ static int regulator_haptic_resume(struct device *dev)
 	struct regulator_haptic *haptic = platform_get_drvdata(pdev);
 	unsigned int magnitude;
 
-	mutex_lock(&haptic->mutex);
+	guard(mutex)(&haptic->mutex);
 
 	haptic->suspended = false;
 
@@ -234,8 +228,6 @@ static int regulator_haptic_resume(struct device *dev)
 	if (magnitude)
 		regulator_haptic_set_voltage(haptic, magnitude);
 
-	mutex_unlock(&haptic->mutex);
-
 	return 0;
 }
 

