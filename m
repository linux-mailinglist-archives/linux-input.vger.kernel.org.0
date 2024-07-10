Return-Path: <linux-input+bounces-4940-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB65992C6D9
	for <lists+linux-input@lfdr.de>; Wed, 10 Jul 2024 02:04:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 004A51C22024
	for <lists+linux-input@lfdr.de>; Wed, 10 Jul 2024 00:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B63797E1;
	Wed, 10 Jul 2024 00:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B5We3Hvt"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F43125C1;
	Wed, 10 Jul 2024 00:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720569880; cv=none; b=H7BzTpOIBTDZPl0OfiY0Gcb5ACxTl+Aw0YVpYAzovvfju6t5DfN+UTIkEQslpLpaTd96Taa8FBPc2z/IkFTumK2EE+bGuErpBaPSrViWs6ZoZAfA8F/SfZEmxyuw/dqoOiKt/IVWsACnONjc4Dou2uFFIj/n3h5DsO6GGYSx9D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720569880; c=relaxed/simple;
	bh=7svXtIRIQev3qw6/H5fBsnzbi9V2xC1keg6/wSjP/jc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VkqBZhDxe6I02GSwTZUHLPRxNbfdrZsQS/OXBh1qlUzja8qH0eopS+huwRRJj9uVJdG+CV1x/0tOBmHNJweKjm6gY9zf4dwXwr5/j5aZjgUfHcjseLNu8FuEkPjRrC8PHsnFJL382DE2NRwhYjEshDVqJI3IuYSqpjMCeh6bTRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B5We3Hvt; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-70b12572bd8so2852499b3a.2;
        Tue, 09 Jul 2024 17:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720569878; x=1721174678; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=skE6m8I/Wpu8lnOuMGo8EZdY4lGens1131mvpVe4I+8=;
        b=B5We3Hvtn+Dz/pJs+24DtTGjGqqKRSd2xagoOP9LDOHnFLrWhfGMXuR9DaRpCHGonx
         dCIGG5hz5hNKou0c8Nh6j05lwKlYEZsz/2YPsK43682ku2f/6daIBcFqXYBjbaR8cEKP
         PI3BxaUoddgb5VRxgmoVeY1eUnC+oZujx5E+ncqHpecWTHyYJfkXfy1QGIoSz+AFTSLU
         JmEfL7Z0EbWJQ9rK+v90yniTuzNY/sxnrASTHo21+Cl5oBobq6ZLQmBOtg018zPxE/yb
         wvPgQpdkZlw0OW4j8dOnJC2G8V7iAxcQidSLVIXCV2B2a6FRvO6rNp/bK0ExGBFkHRz/
         7IAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720569878; x=1721174678;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=skE6m8I/Wpu8lnOuMGo8EZdY4lGens1131mvpVe4I+8=;
        b=WJbNZw6nPAC8ImPyKkouTVRVGHAshoKOsnU+d9lW+evMzmZzEHPMyEo8ZeubFacPK5
         DSOsqto8VfUqhyDEud+GMe1VEy/3UVhrzR+F1v1tfx5/mx0yHXilecTPqI3ApKS65GuJ
         61bbC8Eu7MipIu2EYCtVfL7xhTLCmH78aDMPBKsWpAKrBI7MDffkBOxC+9cLZS1A8DNJ
         bxrYCjAVpw2H9760rrZrA2HgjS0f/uD/Hwqnscle7dFr2NlislFFs6ByQ65gS8tJiPWM
         GNEJrRwW4EWys0oiao/9w1WiqXgup+Aj5bmecaALmqNrnx912Ddq9QozgjyMqmiCyv8q
         jWgg==
X-Gm-Message-State: AOJu0YzlxfvOVWHoWn42wbwWkc8twNENpOONtM+vzZbU/DWPy9Nk0pNO
	3XscxekHZVudK5dMJUZLh1Hmfbv4ovjLNzHsbb1blvEjbcNo4dfHY1FiBQ==
X-Google-Smtp-Source: AGHT+IHEHZ8qSXr8kyZHsPzj3a9OH8na6Fyw9Ccju34FIBurqIo2WnGg7EevDuqfe3tq7zruW6eQog==
X-Received: by 2002:a05:6a00:3e02:b0:706:5b9a:b6d5 with SMTP id d2e1a72fcca58-70b43576ab9mr4518027b3a.15.1720569878226;
        Tue, 09 Jul 2024 17:04:38 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:f11c:146:525b:f491])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b439ac718sm2420477b3a.168.2024.07.09.17.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 17:04:37 -0700 (PDT)
Date: Tue, 9 Jul 2024 17:04:35 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Mirsad Todorovac <mtodorovac69@gmail.com>
Subject: [PATCH] Input: twl4030-pwrbutton - fix kernel-doc warning
Message-ID: <Zo3QE00GqCrA3M9b@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Do not use kernel-doc style for comment describing contents of the
source file, as it trips the script:

  scripts/kernel-doc -none   drivers/input/misc/twl4030-pwrbutton.c
drivers/input/misc/twl4030-pwrbutton.c:2: info: Scanning doc for function twl4030
drivers/input/misc/twl4030-pwrbutton.c:33: warning: expecting prototype for twl4030(). Prototype was for PWR_PWRON_IRQ() instead
1 warnings

Also remove file name from the same comment - it it not the best idea
to have it as they tend to get stale when sources get moved or renamed.

Reported-by: Mirsad Todorovac <mtodorovac69@gmail.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/misc/twl4030-pwrbutton.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/misc/twl4030-pwrbutton.c b/drivers/input/misc/twl4030-pwrbutton.c
index e3ee0638ffba..f85cc289c053 100644
--- a/drivers/input/misc/twl4030-pwrbutton.c
+++ b/drivers/input/misc/twl4030-pwrbutton.c
@@ -1,5 +1,5 @@
-/**
- * twl4030-pwrbutton.c - TWL4030 Power Button Input Driver
+/*
+ * TWL4030 Power Button Input Driver
  *
  * Copyright (C) 2008-2009 Nokia Corporation
  *
-- 
2.45.2.803.g4e1b14247a-goog


-- 
Dmitry

