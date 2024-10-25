Return-Path: <linux-input+bounces-7687-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C83319AF719
	for <lists+linux-input@lfdr.de>; Fri, 25 Oct 2024 03:44:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55604B21C23
	for <lists+linux-input@lfdr.de>; Fri, 25 Oct 2024 01:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93F9F12B143;
	Fri, 25 Oct 2024 01:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dmesicOA"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1381339A4;
	Fri, 25 Oct 2024 01:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729820630; cv=none; b=PEJnX1OyQ5m4ZT+4V87CVLyyDuI672iKEtl+FrBXVdU7GhcQ32iVoki4X8N1ThEP8XeIOy7OX4zzqt7Qo/8CQUXE05DIDzKCFVC48w4h5LE0a8Oe/ROftsMigfc44DG0g5RHTL7TnKAnp7sc8hL+Zba7zjI+4f+weVb5Z9n8KCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729820630; c=relaxed/simple;
	bh=AYdbDzYteBMJENppX6/EUKrwUvFettDvvcZ4FaF+xqg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MnCMGWrRJSnN1Zp/6KPIqJZbcaZKvtj6iPkQSxQqMm3+ZceqUNe8aSG7xlcJg6X0jCGBTs1XLktx1KKJv+REIACTHKeDCI3RapOWl0ibvVNMsUyCArXbCT1L6ISLh9jwNkGgdnBPUgXKuDoca5zNx38g8gz/sAwRAhV7Rya0V3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dmesicOA; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e5ef7527deso18202737b3.0;
        Thu, 24 Oct 2024 18:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729820627; x=1730425427; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N2HiBsa0ajxk+aOOy2ifb/DFIXKGzhQ2omglgYUqaPE=;
        b=dmesicOAqtfVqqkoB42wWXeHhKl83tdkja24F+Z4ZDW2mPXLub6JGdoNiVKw0fRtl4
         wxAtDSkVvHa63NyuyD0p6swPg8RrgalH4KpWV/sLMWk6OQF7/7LTbqmGva0weQBHYXar
         9BoImIJmePzmMHDTidT5RdCV5bCcn+iXYrs3EKqeNFPE9fFAAjppm85FV8CZDRdfDw61
         dGEq7H8nD4n5UB5HtbckBogFvLpiIv2D8+51ZlZJNUAluqgPM3wfnPdIU2DO8aHdAskQ
         Wltvpd7ztzjRIv+yAY8nEocX52tGBj8DY+d+CeY8xIRSwCe67mVR0ShHLqF9oax7bIP6
         OShw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729820627; x=1730425427;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N2HiBsa0ajxk+aOOy2ifb/DFIXKGzhQ2omglgYUqaPE=;
        b=saLNqMWxDJ53HEP2QZc+kTqKcqJQFO+9A8diwJtuu221Pwt3HZSNkrTacFOpygLieO
         2YvnWiW1s5udcohwithKOTbzkXL3NRz9EcdRV57xDtd03m1+0XcTOXPEaVMIvCZDxhy5
         wNJfonsaYyE9N5D7isUudiIP30QR125FAYBb/gP5rcG+TqlVC7L5BN3icRMNUpICPVka
         SxYdXK16HONfrlBHBCAFvOyNTfTfeO2BV9DKSVSmPcy4+Dx7K81/oZ8/rflJyJGezIiC
         O/a64jVRpHeDQFglIgjzbfDXhodgE0XZV5eHCT91hiDkU1L4zmpkA0xU5YfkvzS8DDfD
         3gJA==
X-Forwarded-Encrypted: i=1; AJvYcCV8QdVTqSQo0seimq1QAZh5ux8AG/uy+Hj5rd80UK10kP5AH7gdG9MFAXUYn5Of/vfoqLsXbQ+0iV/Lk2k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg/6fruM9X8VlSZJvJKj9b9Ynq5X1+wZ2ORQokyKwbRs4rejUu
	FzD/qDN5xf/PhyoXV0Seva82Iqjz3RlEZfyY/vZjlnfj1FTgLtszWfjPTQ==
X-Google-Smtp-Source: AGHT+IH800DcZdVuCht4HznqfakBPKE41IOUTnqOUQ9esvpayVFiAA44Ox56JKM8vHL9c3F+H3nVcA==
X-Received: by 2002:a05:690c:91:b0:6e3:116c:ebf3 with SMTP id 00721157ae682-6e7f0fac744mr84307797b3.28.1729820627496;
        Thu, 24 Oct 2024 18:43:47 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:a810:a864:e2e2:2651])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720579397d8sm82391b3a.86.2024.10.24.18.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 18:43:47 -0700 (PDT)
Date: Thu, 24 Oct 2024 18:43:44 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Helge Deller <deller@gmx.de>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: hilkbd - use guard notation when acquiring spinlock
Message-ID: <Zxr30BpPobpM65vO@google.com>
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
 drivers/input/keyboard/hilkbd.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/input/keyboard/hilkbd.c b/drivers/input/keyboard/hilkbd.c
index c1a4d5055de6..c8d8d0ea35b0 100644
--- a/drivers/input/keyboard/hilkbd.c
+++ b/drivers/input/keyboard/hilkbd.c
@@ -180,9 +180,8 @@ static irqreturn_t hil_interrupt(int irq, void *handle)
 /* send a command to the HIL */
 static void hil_do(unsigned char cmd, unsigned char *data, unsigned int len)
 {
-	unsigned long flags;
+	guard(spinlock_irqsave)(&hil_dev.lock);
 
-	spin_lock_irqsave(&hil_dev.lock, flags);
 	while (hil_busy())
 		/* wait */;
 	hil_command(cmd);
@@ -191,7 +190,6 @@ static void hil_do(unsigned char cmd, unsigned char *data, unsigned int len)
 			/* wait */;
 		hil_write_data(*(data++));
 	}
-	spin_unlock_irqrestore(&hil_dev.lock, flags);
 }
 
 
-- 
2.47.0.163.g1226f6d8fa-goog


-- 
Dmitry

