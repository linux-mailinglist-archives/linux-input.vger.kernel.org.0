Return-Path: <linux-input+bounces-7688-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F39C9AF71B
	for <lists+linux-input@lfdr.de>; Fri, 25 Oct 2024 03:44:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9066A281F82
	for <lists+linux-input@lfdr.de>; Fri, 25 Oct 2024 01:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 498F2AD21;
	Fri, 25 Oct 2024 01:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MBtP72A7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8D522B644;
	Fri, 25 Oct 2024 01:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729820678; cv=none; b=V1XC5UHGv5cqVezTeI3/oxBN/JMzFrG1m3H6HZeGfO0+ztLCFwGSFaCvtmEB5gbhpZ1OfHO+DEpc1Y+nGC+2mTJ26aO5aPVOZtvrNRShyG67LXXA2d3GCzaLJU7+Jzo6RhrCuP2cLkiPlFiWZK33QQm62OJlDDm3JyD9RsnxB78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729820678; c=relaxed/simple;
	bh=8y5j6C6mvOIAKvddsFRC1CgVPy7GdLlrGigrshbMcy4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AXTE2Orj2iK5jmFTAVikE5LtBQz51eAne+tZLFYw/QkmWOZAk7loVmoe9Cij/QtP57CQHj6UkhkHsdmn0aZd/IRwcq+25vrGjjTN31C2cCH+tNwjLWAzqpci2eGCDOph4LOhNC3Z7nCKUg9pgi9Pr3SCnKM8wqreVb3PpKua+4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MBtP72A7; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7ea7e2ff5ceso1007833a12.2;
        Thu, 24 Oct 2024 18:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729820675; x=1730425475; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IhXSiTjX7JgkrNu1pYu+npyBqROxL+T9IaiQMyzUh40=;
        b=MBtP72A7sWuvDEZswSVELPUO8llC/+6NG2bweKQ9eOeYtwfd2TJzKqxVaZEiMmZ3KI
         RVkl7tbBAOeafUCNa7q3pHh/9LS2mg0l+2Of88wriZIEwX3YLZUF7uSbRbR2xHko9VJX
         8WMqj1EHKwSSpzCjpoDmAWvP7mU0Ay/OiUcn1qvAWcxEBxND0ASLp9bawmyXZaGfhzpJ
         6n3/9pZ1xbA2ubaYzbcMU6kt0glEyhQjI494buFXpdNeVIHRsBOq6erCgkda2DWpTlTe
         7WTyv4Y9A8FpfdFsxf/d7wTXyKqhwXkJC6Zv1DhafLjzNPQIIT7OLO3YkZRk/6QKCUwc
         3fKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729820675; x=1730425475;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IhXSiTjX7JgkrNu1pYu+npyBqROxL+T9IaiQMyzUh40=;
        b=DnicPXnpNw97uh8OOGjQ6HlKsigS3YRahwLShc5bLA/Y/2KclRBTyTmWZ5OEM/QKtz
         +zV+yuZPORKAJpV0SYXycUZa/VENzVj0I2FlAc++7e/ADDOcHTHCq5/sq5R+KiPed+Oj
         VUiXWIJ/v0GAJUGzNak836cSCluP7an1dNVKXQ4E/O9emALK8eB78UgEyGd7IWuseHdl
         iI5RVN2UTtAlbCwM3yvdxXF6J4HH9l8Vg7gBilMd7ggCKG9BjDIKiZxsc/poy0Ta3T7d
         eRugbDWdGaCUPodU/bW6YUoVk21BD3u0aPFYUS2fx+DEFhf6LSk7DjZd7fR+kzvVxTCd
         JQaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpRqJsFe2KLk84zQZlZCYhWXOsrGJhg0Wdcu0++4gRs0i+3pGCzuHN7WGzXlww2jjCky1z+sjEuslCSDk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3TpiE9QEc1+pQIksgiYb+xedi1Hbn8lNjmyKYSLbySwvRg9oT
	HtrHlB/jZJPg7NLg4RlWQN6WrdeJULdf7Pc/8lh7BJRsg7APsfEwC+yLjg==
X-Google-Smtp-Source: AGHT+IF++62h7vZ8340L/6rHyMK1GfUkNkVMyVv1yPg5Zvb9LPtZ09cAMrW7ofUSXIeD7x3L71CE+g==
X-Received: by 2002:a17:902:d2c2:b0:20c:d5d9:95dc with SMTP id d9443c01a7336-20fa9e99cc5mr118645365ad.40.1729820675170;
        Thu, 24 Oct 2024 18:44:35 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:a810:a864:e2e2:2651])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bbf44344sm852305ad.62.2024.10.24.18.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 18:44:34 -0700 (PDT)
Date: Thu, 24 Oct 2024 18:44:32 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Erick Archer <erick.archer@outlook.com>, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: locomokbd - use guard notation when acquiring spinlock
Message-ID: <Zxr4AMJrzhZlHAlf@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Using guard notation makes the code more compact and error handling
more robust by ensuring that locks are released in all code paths
when control leaves critical section.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/locomokbd.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/locomokbd.c b/drivers/input/keyboard/locomokbd.c
index 4b0f8323c492..c501a93a4417 100644
--- a/drivers/input/keyboard/locomokbd.c
+++ b/drivers/input/keyboard/locomokbd.c
@@ -112,11 +112,10 @@ static inline void locomokbd_reset_col(unsigned long membase, int col)
 static void locomokbd_scankeyboard(struct locomokbd *locomokbd)
 {
 	unsigned int row, col, rowd;
-	unsigned long flags;
 	unsigned int num_pressed;
 	unsigned long membase = locomokbd->base;
 
-	spin_lock_irqsave(&locomokbd->lock, flags);
+	guard(spinlock_irqsave)(&locomokbd->lock);
 
 	locomokbd_charge_all(membase);
 
@@ -167,8 +166,6 @@ static void locomokbd_scankeyboard(struct locomokbd *locomokbd)
 		mod_timer(&locomokbd->timer, jiffies + SCAN_INTERVAL);
 	else
 		locomokbd->count_cancel = 0;
-
-	spin_unlock_irqrestore(&locomokbd->lock, flags);
 }
 
 /*
-- 
2.47.0.163.g1226f6d8fa-goog


-- 
Dmitry

