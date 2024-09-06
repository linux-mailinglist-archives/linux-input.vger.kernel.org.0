Return-Path: <linux-input+bounces-6279-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DD896E974
	for <lists+linux-input@lfdr.de>; Fri,  6 Sep 2024 07:49:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02A552863D3
	for <lists+linux-input@lfdr.de>; Fri,  6 Sep 2024 05:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91C1D83A18;
	Fri,  6 Sep 2024 05:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FDuN2ABK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AE52941B;
	Fri,  6 Sep 2024 05:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725601790; cv=none; b=lMWCTJUkMxm4ezXbka3uBHWHwnqr85ceJ6uHZoSuJ6s8WDKKgqttIrd02+txFwZLH3KtHS2X9Mt4YpsycBFVNu5weWojIEoP6NtRwb0xDrX9Az3Aw2gRuwRhmKPZJTnQYLRnQFnkMgc1itiyQ26+/3aSBcCX1fxuOhBtpjbD4yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725601790; c=relaxed/simple;
	bh=VTMK80NSVXM+EogFAW/STROfe75Jb5gUQlF6p/SCq4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=damSVEIRWWcDt/q/8u+fDmwaNLjjQF0zjYLZWkDrZ1QXIvlyOvLcjx7a+XtY9CV5iHZQQnkmcMxcD4iPddF+0qijGjMQpn4uBzUW3BXjPJiDcd5YoqMyh0H+5/QLVf79Lnu7HeuzpgZ/ePR+quqXfdFFnZFbbUUGg/txK5xyhtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FDuN2ABK; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-71781f42f75so1287140b3a.1;
        Thu, 05 Sep 2024 22:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725601788; x=1726206588; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aFxAoI+AmDB/7xZ2dXgpDS99xLnRaOzmM8IMypR71F8=;
        b=FDuN2ABK+43neScKXiwi4xCLf2b+lSUoJINmRXOJ1ILViKgkUs3cBTuXMzvOzt6pch
         fYvRaSSJt5AfHRRcz+4xLNxWQvHLY5pBVRBu6Kny0ro/nUQixFVkwXJOBVuqWYoB9YK4
         PuTB4yizNuvI7Fu309fHJfZMOVoApcB6yQ9OX3byRtbHSYC6trJSYmow9ItEPLK6gWZC
         w1VeWjUsQtSuGIrStAP+KRc39m2zOjSAfwvYgR6z/hh3+1R8pT6T6eSaoi6qZgKpNn6z
         n0bK/drgKm+JgFgh3WfIil50ca0CDYO8Mbx9Y1nNyGVh1+xDcQstKWgPwuHtjQWrhhle
         cmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725601788; x=1726206588;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFxAoI+AmDB/7xZ2dXgpDS99xLnRaOzmM8IMypR71F8=;
        b=Hxtt49IttN+koVv17iNLSTTttGMw4IuBTxOlFwZkc54gAyQfNdrNDUjvnRpwxhcFy5
         Bcy38DKAlCUCs+kEw6TcNqUurZgobETy3KjM6ll5Ad/TnVz92fbwt76LPpsUqP74824t
         HWDwojYf8ZudBaFoW3EGzpJZYuHYh3Ke62sp+Z+g6usnAwD3hSR448T+6v0Tfvn85IKz
         Y0A5MpMX1V1gIRdNaBX9DSaUatGAV4tkcljbV2CKdjcBwheh8ZmgvI7kU1zowqWfuOp4
         uX3cuUJD6/YQJ2EWy28Mc0wEb67hi9ruMyatMcTyI0H8VfR0cFTQ1WeYe1eonoNzlqI8
         vCwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUh3bny9AmlstagJ6CF4s9c2rHCvFEI67Dalon+ee5jWxwkbLtXLjQmyZpcvk22YMwglwFwvt2oJMHs1XQj@vger.kernel.org, AJvYcCX6fbYGrAUM7YZKwqolsuM86z//5z4zRs+bwHjRxmrhxMNAxZCapcWmOtv9ZMHA2QUhYRp9Xc7h6JlkVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzD/iwn8IFfRlIpH87tdVQboUPCK8vPpntTY2ERmnavYGk95SUt
	MBiKddg5/SifBpqcxZFPsEQ5yEn4hFiTHYsaRpSb5b0DYNZ2JrzJ
X-Google-Smtp-Source: AGHT+IFQPy+cE4PEV+mF55KxZABHttVp0OyMcBdlGTc5pIVFEqfE4gNMjmYFYweTGcDQXiFld6v3Yg==
X-Received: by 2002:a05:6a00:845:b0:717:8a87:7d02 with SMTP id d2e1a72fcca58-718d5f068a4mr2085736b3a.23.1725601788190;
        Thu, 05 Sep 2024 22:49:48 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1de8:3062:3230:1a45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71797560c7asm1323681b3a.141.2024.09.05.22.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 22:49:47 -0700 (PDT)
Date: Thu, 5 Sep 2024 22:49:45 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/18] zforse_ts: assorted cleanups
Message-ID: <ZtqX-d-7jsetQp8J@google.com>
References: <20240824055047.1706392-1-dmitry.torokhov@gmail.com>
 <20240902100805.2148ccea@akair>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902100805.2148ccea@akair>

On Mon, Sep 02, 2024 at 10:08:05AM +0200, Andreas Kemnade wrote:
> Hi Dmitry,
> 
> Am Fri, 23 Aug 2024 22:50:24 -0700
> schrieb Dmitry Torokhov <dmitry.torokhov@gmail.com>:
> 
> > Hi,
> > 
> > This is a set of somewhat random cleanups for the zforce_ts driver. 
> > 
> > Heiko, Andreas, if you still have access to the hardware it would be
> > great if you could give it a spin.
> > 
> > Thanks!
> > 
> nice cleanup,
> I tested a bit on the Toline Shine 2HD without gui (have not rebased my
> other stuff to 6.11 yet)
> 
> A short move on the touchscreen gives this:
> Event: time 1725264307.093542, type 3 (EV_ABS), code 57 (ABS_MT_TRACKING_ID), value 24
> Event: time 1725264307.093542, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X), value 1159
> Event: time 1725264307.093542, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y), value 596
> Event: time 1725264307.093542, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR), value 11
> Event: time 1725264307.093542, type 3 (EV_ABS), code 49 (ABS_MT_TOUCH_MINOR), value 11
> Event: time 1725264307.093542, type 3 (EV_ABS), code 52 (ABS_MT_ORIENTATION), value 0
> Event: time 1725264307.093542, type 1 (EV_KEY), code 330 (BTN_TOUCH), value 1
> Event: time 1725264307.093542, type 3 (EV_ABS), code 0 (ABS_X), value 1159
> Event: time 1725264307.093542, type 3 (EV_ABS), code 1 (ABS_Y), value 596
> Event: time 1725264307.093542, -------------- SYN_REPORT ------------
> Event: time 1725264307.096361, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X), value 1039
> Event: time 1725264307.096361, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y), value 607
> Event: time 1725264307.096361, type 3 (EV_ABS), code 0 (ABS_X), value 1039
> Event: time 1725264307.096361, type 3 (EV_ABS), code 1 (ABS_Y), value 607
> Event: time 1725264307.096361, -------------- SYN_REPORT ------------
> Event: time 1725264307.112426, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X), value 934
> Event: time 1725264307.112426, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y), value 637
> Event: time 1725264307.112426, type 3 (EV_ABS), code 0 (ABS_X), value 934
> Event: time 1725264307.112426, type 3 (EV_ABS), code 1 (ABS_Y), value 637
> Event: time 1725264307.112426, -------------- SYN_REPORT ------------
> Event: time 1725264307.131523, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X), value 859
> Event: time 1725264307.131523, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y), value 661
> Event: time 1725264307.131523, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR), value 12
> Event: time 1725264307.131523, type 3 (EV_ABS), code 0 (ABS_X), value 859
> Event: time 1725264307.131523, type 3 (EV_ABS), code 1 (ABS_Y), value 661
> Event: time 1725264307.131523, -------------- SYN_REPORT ------------
> Event: time 1725264307.150540, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X), value 795
> Event: time 1725264307.150540, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y), value 671
> Event: time 1725264307.150540, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR), value 13
> Event: time 1725264307.150540, type 3 (EV_ABS), code 0 (ABS_X), value 795
> Event: time 1725264307.150540, type 3 (EV_ABS), code 1 (ABS_Y), value 671
> Event: time 1725264307.150540, -------------- SYN_REPORT ------------
> Event: time 1725264307.169589, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X), value 760
> Event: time 1725264307.169589, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y), value 675
> Event: time 1725264307.169589, type 3 (EV_ABS), code 0 (ABS_X), value 760
> Event: time 1725264307.169589, type 3 (EV_ABS), code 1 (ABS_Y), value 675
> Event: time 1725264307.169589, -------------- SYN_REPORT ------------
> Event: time 1725264307.188157, type 3 (EV_ABS), code 57 (ABS_MT_TRACKING_ID), value -1
> Event: time 1725264307.188157, type 1 (EV_KEY), code 330 (BTN_TOUCH), value 0
> Event: time 1725264307.188157, -------------- SYN_REPORT ------------
> 
> So,
> 
> Tested-by: Andreas Kemnade <andreas@kemnade.info> # Tolino Shine2HD

Thank you for giving it a spin!

-- 
Dmitry

