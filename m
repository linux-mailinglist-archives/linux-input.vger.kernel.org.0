Return-Path: <linux-input+bounces-16621-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 989D5CCA8F0
	for <lists+linux-input@lfdr.de>; Thu, 18 Dec 2025 07:58:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 98E3B3015D1C
	for <lists+linux-input@lfdr.de>; Thu, 18 Dec 2025 06:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A9282C375E;
	Thu, 18 Dec 2025 06:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJuuC/fZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027902BE621
	for <linux-input@vger.kernel.org>; Thu, 18 Dec 2025 06:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766041116; cv=none; b=ZcDEvMFVk8uDt1XYhCecQPvG/WySlgs9VQ9KciBXwgNOwyBXU2Nau4lwjx/uKU995B74gQCzEsrFXU6P0MAgZKpc6d4WVd9xLM26B/Io68NVVr29KIS1UYsHRXScCfPkBnD/TrfkiJWqkfyMVSZf71eXQVeydCtCSwvvO/2vv0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766041116; c=relaxed/simple;
	bh=G/WmXAHjTHKSi250ciB9gVCUtdJAGQCj0/pQ1r+ZhqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cb+CXpf+IEINuHEi2NCSy7TTYZRQKhRI8wtc8IrgwtenqJcgm/DDjzEfHLDVnYGpaiz1MGPLrdlfxVBAlDiR/xcxN+FuRjwf0lwou81ZCR1jYc+lK+z6O3vodm+SAxAmc4lLYA9PBfMxAvdOY0EjHysEqy56ecffhX+kXvFu1BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iJuuC/fZ; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-bdb6f9561f9so321542a12.3
        for <linux-input@vger.kernel.org>; Wed, 17 Dec 2025 22:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766041114; x=1766645914; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HxZ2F54lTQtCyMILDuCZeRGUB1SywNnpVXopjXM2+Zo=;
        b=iJuuC/fZWDOR9TGh061jU6LmqJnJLqssajl3Mq1qhzey9Ipf4Y5TlUardSC7LNvQLg
         rTjvEAxqvaPKB0kqg9/Ki+jGxCsdfpbGCGZSNVU6Qaqh8J7qnFBMghVrfJzguSdi9vlL
         RgQC3Vj4ztT5eLEpwlpMBc+5r1H48DBNzr+O4jR2L+YNl2RFZN9WL6O/bDFHRtomdPaK
         81sVf09zxY2i+iZ1dJiAC88AkXWyxr9PmoS0NNuG58QOEVQ2BUFwoBHQWamxnWYcijIy
         AHIaD4kxyXlPXoGCutgT78MwI7Sjetvdekp9aEF9sBu+9Zv05LXkHc1SDn8I0pdsTwKH
         Ctvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766041114; x=1766645914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HxZ2F54lTQtCyMILDuCZeRGUB1SywNnpVXopjXM2+Zo=;
        b=B1127hpv4j58kZX2iM5KpiBf3joROwTOufQyjm0YRWcC59yKV1UUH7Mf0n7Pr5pHky
         DhHlVsHvXQ1Pf8aM9GIU1D2SsVHTZNbNTGL4rihp+JVp3FNd/Zt+qgY1xi8fNCW6FOTU
         2EaNoSBJHE0twipr5Ph8RwXysU4kh1GPkd6UuWJaSMwI4SZBH3U8Kbj8uh9UG1T87O0/
         Mf04lIaf96tJuFUqWqDfTigP0J+7mWXVVy2lHszsp5wZdSVbeV1EbRuR2/21eglFFb7K
         Z6cim+P5eRTLdToCZphI98nkcXaNJ0hmDxT/bdqEeUK2e7hmgv5qKiv0xfntDoiftEsT
         h2bQ==
X-Gm-Message-State: AOJu0YyZ1kfMo1o4qgOelRuClR5MGCk3pcMfQPXN9yjiwze4ig5t+gun
	pE8SwQ9O9jY9HqSsVHdJaDG9WE8ovb/FL220Go6vZlIYG1EWP00uvECz
X-Gm-Gg: AY/fxX4VMh59fQpLS/VT7gRlljhGNRlflTlACFQMTF5YszEO+XxfmEMELtsKFP+NqYo
	MaQSqjhxan5Ha0eDidvsQhgCZorna/WTXuhx2sefbLABAtTpJhAwa2Mg+9lyvGzZ06J41Per42E
	aVjPZHOjIQHz+Jx+bw78RCOm1BzOhc/ippQfQHorEZ7NaW9FrGhHgvxKFvHHYMuHQQIB2ZsURPI
	tvD9tQ5RmrlAe9TuyDkQs3H/85ECTRGnXxEemnCQLpZUSyhSsM0ae1akoLPtpoH5HQWOi12udP8
	kSd3NvVYOtf96OrkA4c1HUnyEecG7sCEOWGupnZnJyIqlKjZBS8/O3ZGu/rMDsoRE+9gintcvpB
	qPjGI/D6Nun553hXZHHEifXk/cNkxOuytXbw/TmLH5afHhp7g9r3AE4PDeZcjVD46+px4+hEwWq
	S2PJm+TuXHdgE+AeBTQ7qgc+21W7v/4x1L59vxsR1c2CjePDyITJ0UU8cC80NjeQ==
X-Google-Smtp-Source: AGHT+IGSXECrwT/mHS8JwjA5IyFIneL5Hc7d+SZfvy1zcbArWmv1vhtZAigJ0bZcEj9rttjhhdhx6Q==
X-Received: by 2002:a05:7301:4618:b0:2ac:287f:fc14 with SMTP id 5a478bee46e88-2ac3225d257mr14647047eec.19.1766041113986;
        Wed, 17 Dec 2025 22:58:33 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c00:cda0:e722:e1ee])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b04e58d130sm2115047eec.7.2025.12.17.22.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 22:58:33 -0800 (PST)
Date: Wed, 17 Dec 2025 22:58:30 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: duoming@zju.edu.cn
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	pali@kernel.org, kuba@kernel.org, alexander.deucher@amd.com, 
	akpm@linux-foundation.org, johannes.berg@intel.com, pkshih@realtek.com, 
	hverkuil+cisco@kernel.org, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, 
	mingo@kernel.org
Subject: Re: [PATCH v2 RESEND 2/2] Input: psmouse - Replace flush_workqueue()
 with disable_delayed_work_sync()
Message-ID: <ho33u6epmzsojiw5zvqksskpzo3f6z2lykvhgektf65stqj6sr@5hq6qd76ezxg>
References: <cover.1765939397.git.duoming@zju.edu.cn>
 <6e40a46e5d9e6e3237702958b8f641263c28d2e4.1765939397.git.duoming@zju.edu.cn>
 <joqpa647tq7mh3lyl27zjv3wr4xbixuuvq7ifti3isifz3gfxg@p3ibbvrsuxud>
 <2e74b4a1.464cb.19b30013387.Coremail.duoming@zju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e74b4a1.464cb.19b30013387.Coremail.duoming@zju.edu.cn>

On Thu, Dec 18, 2025 at 01:49:03PM +0800, duoming@zju.edu.cn wrote:
> On Wed, 17 Dec 2025 10:13:16 -0800 Dmitry Torokhov wrote:
> > > The original code uses flush_workqueue() in psmouse_disconnect() to
> > > ensure the completion of both resync_work and dev3_register_work.
> > > Given that alps_disconnect() already uses disable_delayed_work_sync()
> > > to cancel dev3_register_work, replacing flush_workqueue() with
> > > disable_delayed_work_sync(&psmouse->resync_work) is more robust
> > > and efficient.
> > > 
> > > Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
> > > ---
> > > Changes in v2:
> > >   - focus on the robustness and efficiency improvements of disable_delayed_work_sync(), not on the UAF aspect.
> > > 
> > >  drivers/input/mouse/psmouse-base.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/input/mouse/psmouse-base.c b/drivers/input/mouse/psmouse-base.c
> > > index 77ea7da3b1c..eb41c553e80 100644
> > > --- a/drivers/input/mouse/psmouse-base.c
> > > +++ b/drivers/input/mouse/psmouse-base.c
> > > @@ -1484,7 +1484,7 @@ static void psmouse_disconnect(struct serio *serio)
> > >  
> > >  	/* make sure we don't have a resync in progress */
> > >  	mutex_unlock(&psmouse_mutex);
> > > -	flush_workqueue(kpsmoused_wq);
> > > +	disable_delayed_work_sync(&psmouse->resync_work);
> > 
> > Before we replace flush_workqueue() with disable_delayed_work_sync() we
> > need to also add disable_delayed_work_sync() to
> > drivers/input/mouse/hgpk.c that also queues work to psmouse workqueue
> > and relies on flushing it when disconnecting.
> 
> The delayed work item recalib_wq could never be scheduled due to the 
> touchpad driver only supports mouse mode and the hgpk_init() function
> remains disabled.

What do you mean? If you enable OLPC support the option to enable hgpk
protocol driver should become available, right?

Thanks.

-- 
Dmitry

