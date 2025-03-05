Return-Path: <linux-input+bounces-10560-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6714CA4F922
	for <lists+linux-input@lfdr.de>; Wed,  5 Mar 2025 09:49:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5115716BC1C
	for <lists+linux-input@lfdr.de>; Wed,  5 Mar 2025 08:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D10D1FC0EC;
	Wed,  5 Mar 2025 08:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mPHDgOfU"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0887D155342
	for <linux-input@vger.kernel.org>; Wed,  5 Mar 2025 08:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741164578; cv=none; b=hKxppu9ffELENPwZCsv1pb1krEcJKrB58gORP39NdDm/8Sqe+1JJ9XP33KPbjOBc19/Du0Xn9aMyxAl1kldkZ2vDV3pUvBjgHpgFtSijB0aV9s4tsow8JxqklC6IdKsMg4kIpdOph6lSt2M1jpno1Bbxu70Yk3r6c2VlBBn8wd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741164578; c=relaxed/simple;
	bh=9jWIOwtHWCTu1CHSD2EUwqj9F2735xzQJKcxTaurzFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qOXF/WmUfU+C/g7u2BdAm7Q/5BFLnIdcIR4qYGTFxENnN25Ev1Lnhcp/sl/r5akUoxDBDhM3EdsovlWUAXyY/E+nQ+APNqTFUmH6GRJWBNPwRpCO+H6IFE5PV5UcfrJ/z2PtLQxoMiBr1NDPYEQGpH2TDDLkSvWy5q2okIw41C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mPHDgOfU; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-390e3b3d3bcso7532271f8f.3
        for <linux-input@vger.kernel.org>; Wed, 05 Mar 2025 00:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741164575; x=1741769375; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EYPK4LJGUkg+fyK9eN8maHW7dtazvwmJQIM9Nya9H0c=;
        b=mPHDgOfUTWHiDhLy7czrVYZJzQ2LKFVCn6RCc+KCbOIwmxThmYBCYS2MbflG38qWl8
         pn/IL03jclZjFPiyzpNDU7fXha2Y9f2r6LSNKkstp97r4XpCgnxfhKHEkkpRJjRQo+KZ
         K9TjYBssq6TyABuy5FlPBALjHZJEeFm1Mq/M7XlY8JwO4Pcm5zO2GXBKmLhBICvIm1so
         jYorT2jCaB9S9TlQX9fohD7s0sdZqYpSb0N0t1YSTFVRRaf8a0vC1Vtp8/JpOC6QHpij
         w8pMSPcoUKO2popa/t7l1Xy+AwfckWg1XYu+++S2BFzJpcndHJHgkdspp49xlhWZPdTo
         yP9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741164575; x=1741769375;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EYPK4LJGUkg+fyK9eN8maHW7dtazvwmJQIM9Nya9H0c=;
        b=qYqH60tFmrU3q9C5TFxQAuI7125VKaSvleXkWoCATgPDjfEfdk9L6IINDN53qQcPxs
         b41pJyy9b5A6kXcOza1+JQH9IY3+CWgZL99EHc4rDoiqfTxOFqkLWHwvlUw0raME8zhU
         43SVNLDo7/ufWcVnh6kmHfJ81Jp2q+FMZ4d6tUn+RYAgtl1jJ8xneQQI6H6PdVvJ9Zn3
         +dndr8ark3LF3jK2W2g2Ju1IOGXNlAqnkcYnjTWcVOOGTEVS3RZTzOWmqSG3cNDxLZW3
         8bY/M94CEds6TBzP6KTcfxt41vS5LPgKLqXOfD+32QuQ5mvms+ocHFfWJhnTiuyFWxTQ
         unIQ==
X-Gm-Message-State: AOJu0YwDWQX+zRcWM49aKAN2NY78aFFgGBycwB7zQ8FWAmdgiC6+RNgA
	t6jU++aj12kHgE+3UsYFCxOz5WfJnnK9XgM2ylfB7kCdl1hIIKhEc6ZZzqNUmgQ=
X-Gm-Gg: ASbGncsDxKQ+cBTyLDx9Wos0P9kjmoA1wsfmDqxjLVrBELSNBleDrg27sOe+SRWXN40
	WFLD63Kbdqr22VyF8HNZcPKziinK3Z6tgmKEoK+aDoDmRYfYJCwPNegRitZ0KhBfa3StE7FuWHD
	hj82qePl5EqIE4JdM8Sry2hepHMR9N2xuoAoc99AX4ufFQHXDph5S8txZsJwsz8XppHHMYI0xfJ
	bqRtZKwZqM5gxt+HdGQMame9B4HnsazcGfdJzkcV6bWeep9fkFQlswcGQTd37pk7y/rMG5GUDrD
	jEKwaPcuZ4uO8fpL8u09bBDGVPmaCWnM8PL8BoiB+R6jVeQubw==
X-Google-Smtp-Source: AGHT+IErh6D4k6HrXpvyI/+0aERvcaeOMx/1gfNmQ4VSvej6ewlkLHJe/aA/MCy4zwQw+RnwIFPgOQ==
X-Received: by 2002:a5d:5f91:0:b0:390:e9e0:5cb3 with SMTP id ffacd0b85a97d-3911f73b6b4mr1403969f8f.12.1741164575162;
        Wed, 05 Mar 2025 00:49:35 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-390e4796084sm20632902f8f.19.2025.03.05.00.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 00:49:34 -0800 (PST)
Date: Wed, 5 Mar 2025 11:49:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: Re: [bug report] Input: atkbd - restore repeat rate when resuming
Message-ID: <715978b4-8de1-489a-9792-643dbe72508a@stanley.mountain>
References: <cd3caca2-607e-4cf4-9262-bc5867b690a7@stanley.mountain>
 <Z8f4r2AbNX-6EpO7@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8f4r2AbNX-6EpO7@google.com>

On Tue, Mar 04, 2025 at 11:09:35PM -0800, Dmitry Torokhov wrote:
> Hi Dan,
> 
> On Mon, Mar 03, 2025 at 11:11:35AM +0300, Dan Carpenter wrote:
> > [ This bug seems really ancient.  But so far as I can see it really is
> >   super old.  I'm not sure why it's only showing up now.  -dan ]
> > 
> > Hello Dmitry Torokhov,
> > 
> > Commit 3d0f0fa0cb55 ("Input: atkbd - restore repeat rate when
> > resuming") from Aug 4, 2006 (linux-next), leads to the following
> > Smatch static checker warning:
> > 
> > 	drivers/input/keyboard/atkbd.c:604 atkbd_set_repeat_rate()
> > 	warn: sleeping in atomic context
> > 
> > drivers/input/keyboard/atkbd.c
> >     583 static int atkbd_set_repeat_rate(struct atkbd *atkbd)
> >     584 {
> >     585         const short period[32] =
> >     586                 { 33,  37,  42,  46,  50,  54,  58,  63,  67,  75,  83,  92, 100, 109, 116, 125,
> >     587                  133, 149, 167, 182, 200, 217, 232, 250, 270, 303, 333, 370, 400, 435, 470, 500 };
> >     588         const short delay[4] =
> >     589                 { 250, 500, 750, 1000 };
> >     590 
> >     591         struct input_dev *dev = atkbd->dev;
> >     592         unsigned char param;
> >     593         int i = 0, j = 0;
> >     594 
> >     595         while (i < ARRAY_SIZE(period) - 1 && period[i] < dev->rep[REP_PERIOD])
> >     596                 i++;
> >     597         dev->rep[REP_PERIOD] = period[i];
> >     598 
> >     599         while (j < ARRAY_SIZE(delay) - 1 && delay[j] < dev->rep[REP_DELAY])
> >     600                 j++;
> >     601         dev->rep[REP_DELAY] = delay[j];
> >     602 
> >     603         param = i | (j << 5);
> > --> 604         return ps2_command(&atkbd->ps2dev, &param, ATKBD_CMD_SETREP);
> > 
> > This fucntion call takes a mutex.
> > 
> >     605 }
> > 
> > The call tree is:
> > 
> > atkbd_reconnect() <- disables preempt
> > -> atkbd_set_repeat_rate()
> > 
> > In atkbd_reconnect() it's the atkbd_disable(atkbd) which takes a
> > spinlock.
> 
> I think your tools are confused by the guard notation. atkbd_disable()
> not only takes but also releases the spinlock.

Argh...  Yeah.  Sorry.  I'll fix that.  I guess the problem is that
Smatch is confused by the if statement in class_serio_pause_rx_destructor()

regards,
dan carpenter

From b045578c121afaba0522b26a617b45e8c2307da8 Mon Sep 17 00:00:00 2001
From: Dan Carpenter <dan.carpenter@linaro.org>
Date: Wed, 5 Mar 2025 11:47:37 +0300
Subject: [PATCH] preempt_info: add class_serio_pause_rx_destructor()

The class_serio_pause_rx_destructor() function enables preemption again.
This silences some false positives in atkbd.c.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 check_preempt_info.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/check_preempt_info.c b/check_preempt_info.c
index 8fabd64cff24..2f5ab7648951 100644
--- a/check_preempt_info.c
+++ b/check_preempt_info.c
@@ -129,6 +129,7 @@ static struct preempt_info func_table[] = {
 	{ "rht_unlock",				PREEMPT_SUB },
 	{ "bit_spin_unlock",			PREEMPT_SUB },
 	{ "__bit_spin_unlock",			PREEMPT_SUB },
+	{ "class_serio_pause_rx_destructor",	PREEMPT_SUB },
 
 	{ "mtk_wed_device_attach",		PREEMPT_IGNORE },
 };
-- 
2.47.2



