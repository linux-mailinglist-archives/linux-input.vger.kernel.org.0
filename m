Return-Path: <linux-input+bounces-6146-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 558C196B01B
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 06:49:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1316928B009
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 04:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1782D839F4;
	Wed,  4 Sep 2024 04:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/FkpZAa"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F17824AC;
	Wed,  4 Sep 2024 04:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725425318; cv=none; b=uNBRzjXVaKklcgyMuOUgIEJJrInO/g6iqfR8Y6KW51D6zt10ut1JoTp6ROm8pg0PJ4NudjqJCtK76lTCJ/uNTH/3WRt/1ncDGnWMCC2SCf6ULH2jSzC1xzn/yvXPsv4MPOXmeSCqh28/4HpAl09D+/0s248VAfPwtQiOWiuMY0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725425318; c=relaxed/simple;
	bh=+sJCHBs05d5XAEiDqdU0Kg0HhhyIg2rxMZOxVqZJKMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hJxGMggxtbDe9HPEss7A913sP+pZckENzRsDQ8EQvSBSul4liR5gkpesQaNzqkE2almiHp2rlZt4PIzdvdwh6sXre7TL9q9WTyKeUmmNOusE8QhxRtMYOO5X9eRBELJOJNdnppq29cqPdAfhSHakXcALM72XSlOmKmmRrpPmGxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/FkpZAa; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2d8f06c2459so1681667a91.0;
        Tue, 03 Sep 2024 21:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725425316; x=1726030116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQyGz6AvMInN2zNoaaQnQeciLOQyRW21Wcs2MhQ1DXw=;
        b=F/FkpZAa1gfdTbARrqVwIjLi3E16PnXbtDCMDFSt/Nb+rvRub5ZOVswZ+veT09bhvN
         3RKZiTGL/qwL0gNfzUhuSWK2q3mOXdWfCtMxie8/OuQa14Fdyk59ZJBB05QA3yDn5b9o
         DToNfsyYcQ3q5zQjsYQPlQBGhtHhlNniL6x7NzIR+uJSLeREw1jlnLqzaJGMqEQL32Z0
         /b9hmfKD24wtzSMJXW43kJcwKliiyHAYRaNhEs2EIfOaVMD49n6IEwThD+OfH3XESwLy
         m6p9NWE4Wn1qY/ZwDIbTK0G8HNKee/z8XU6kg+aYhow34W6WS2GFrFg6Y8/JaVCJgM1u
         KO9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725425316; x=1726030116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vQyGz6AvMInN2zNoaaQnQeciLOQyRW21Wcs2MhQ1DXw=;
        b=SVEP2+EKdU7H8YPes/jY6OrEkkBBFU8iV2TBHfo/U0Ztwv8IJp1RmBkuONgdluaQZA
         FFEtOVRQHH9HSqAbC/cgN7cjqAYTZP8VgXbqtlCKMBEOprY0VdKQEm0XodCLMOFXcRoy
         djjlqXEkhqT8T5IElgjA02J7LaOYhxMmb4tEA6jwT9SWgdpzS9G0JbSrnANQDCJOIM8v
         Haf9lRXVVn3Kt3hJK99lZ0EoQ5/VIwchGq+WLPYVf3AEI+phILI04fTI0jsRlhM72DB9
         Mdc6Cy50IZjnbnIkcCazxkbcspb/Q5R0vIHdVX+UNCVAM9IsQxGd40NfMJ46re/cb+bV
         OnEw==
X-Forwarded-Encrypted: i=1; AJvYcCXhMtw0YDSJaxdoczZgpVU8AOqqYjwN/RWM6XWVYfM1IG+JjVmj6kub0oAMSP/2S7El8UKiFj5NcZKdDu8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTGgZdlVIlEfxbfvm1Usxn6v6fwvH9gk/BuRJnWg88UbpHVFdI
	nfU34HkvO8skYotpPj+r7jXivS5YzXyZWFqKjQu7ppw2ItPS5YJnSUnIbQ==
X-Google-Smtp-Source: AGHT+IHVXuFImtk9unJ2lcRJdwgQdZ6afQn5WeSiERAD9YXRyWhkeY4NIG5Rmkd78fBBk3I2jOTgdg==
X-Received: by 2002:a17:90b:3a92:b0:2d8:f99d:48d2 with SMTP id 98e67ed59e1d1-2da55a4400emr5488932a91.29.1725425315648;
        Tue, 03 Sep 2024 21:48:35 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:e682:e3dc:908:eef0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d85b3b95e8sm12334081a91.54.2024.09.03.21.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 21:48:35 -0700 (PDT)
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
Subject: [PATCH 16/22] Input: max8997_haptic - use guard notation when acquiring mutex
Date: Tue,  3 Sep 2024 21:48:33 -0700
Message-ID: <20240904044834.1048468-1-dmitry.torokhov@gmail.com>
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
 drivers/input/misc/max8997_haptic.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/input/misc/max8997_haptic.c b/drivers/input/misc/max8997_haptic.c
index 11cac4b7dddc..2853455daef2 100644
--- a/drivers/input/misc/max8997_haptic.c
+++ b/drivers/input/misc/max8997_haptic.c
@@ -153,19 +153,19 @@ static void max8997_haptic_enable(struct max8997_haptic *chip)
 {
 	int error;
 
-	mutex_lock(&chip->mutex);
+	guard(mutex)(&chip->mutex);
 
 	error = max8997_haptic_set_duty_cycle(chip);
 	if (error) {
 		dev_err(chip->dev, "set_pwm_cycle failed, error: %d\n", error);
-		goto out;
+		return;
 	}
 
 	if (!chip->enabled) {
 		error = regulator_enable(chip->regulator);
 		if (error) {
 			dev_err(chip->dev, "Failed to enable regulator\n");
-			goto out;
+			return;
 		}
 		max8997_haptic_configure(chip);
 		if (chip->mode == MAX8997_EXTERNAL_MODE) {
@@ -173,19 +173,16 @@ static void max8997_haptic_enable(struct max8997_haptic *chip)
 			if (error) {
 				dev_err(chip->dev, "Failed to enable PWM\n");
 				regulator_disable(chip->regulator);
-				goto out;
+				return;
 			}
 		}
 		chip->enabled = true;
 	}
-
-out:
-	mutex_unlock(&chip->mutex);
 }
 
 static void max8997_haptic_disable(struct max8997_haptic *chip)
 {
-	mutex_lock(&chip->mutex);
+	guard(mutex)(&chip->mutex);
 
 	if (chip->enabled) {
 		chip->enabled = false;
@@ -194,8 +191,6 @@ static void max8997_haptic_disable(struct max8997_haptic *chip)
 			pwm_disable(chip->pwm);
 		regulator_disable(chip->regulator);
 	}
-
-	mutex_unlock(&chip->mutex);
 }
 
 static void max8997_haptic_play_effect_work(struct work_struct *work)
-- 
2.46.0.469.g59c65b2a67-goog


