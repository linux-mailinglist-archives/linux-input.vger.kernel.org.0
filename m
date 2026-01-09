Return-Path: <linux-input+bounces-16895-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF58AD09F64
	for <lists+linux-input@lfdr.de>; Fri, 09 Jan 2026 13:48:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 24C8E302DC99
	for <lists+linux-input@lfdr.de>; Fri,  9 Jan 2026 12:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29F3235C1A3;
	Fri,  9 Jan 2026 12:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qceN1F1h"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A0B35BDA8
	for <linux-input@vger.kernel.org>; Fri,  9 Jan 2026 12:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767962484; cv=none; b=GoBDAd7u3VJIDIfnqQzwqbCiZ483KKmvDF1TXxN9iecyIVwLvahcnN7SMDo3C79QI3x6qPQskxKPpiL4zklapJ8AookOj5tk5+FlqzOLNcEi1MDpgbuMGtLMK+FWbxA8AlvoN7H+L7kcVz6Tw0wpDTLuhormZXqC9BeJ6L+JvFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767962484; c=relaxed/simple;
	bh=eVOmJOpJ2g+nWNAxnyfdx6FM/mb3Dw1vCRyIVPH1Rag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QN2d0t90Uuo7SABnpCKgUmNDM6nIFqrHKMno+r6dfhQk05T/ot2BONYs66JW9YUi1NsvKowR/vbThrczRVW/iS3Nn/bW1uajj1Qm504a+6Xpffiwj5jCaWsfDSOyeXCMr2owtF4chzWk7yk4uudNAyP4kUN8m4bzzNHTCfFSYJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qceN1F1h; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47d5e021a53so31734995e9.3
        for <linux-input@vger.kernel.org>; Fri, 09 Jan 2026 04:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767962479; x=1768567279; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OS8jAYKJTxd436S6Hg/z7BMXyNGFTQawvHyOajW7Mkc=;
        b=qceN1F1hDJPqJY5F4gHMRVmzOfN1y/WpGRpK6mEmPASh3hwTbM0Rc/HDpEHpuXV8Ce
         Sk4JjfTw9uAavOrlTNDhYr/OI7NG1QjaAUK6o5oC4P1dsAZYidhFXpFEOS8dxTOdxFph
         LSV7m/jXVZLHKSk8Rd9TQXGw1bWcZZ494gBpWIL1CT5Jp9NcDjIQUNKCc9MSD9TzK5ue
         BE+yGaT4mMa/B+kEEyhgmVRWi/weAoghJWqDqIsJaVTCFK8pgBbF0rx+eX0CBgG5Rbyq
         ZPhehTfc7tYvK70bXzP6K0WjVOuqP/8yLrviqIotqX9pKoZ5i+U51i6gwgSgqm75oF/Z
         /S8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767962479; x=1768567279;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OS8jAYKJTxd436S6Hg/z7BMXyNGFTQawvHyOajW7Mkc=;
        b=ATLr6FhyYYlTDFbAJi8a7yD+f3KgY7QeRho2xsNkxhqLDA958iv/Xy5n/LhbSqU1sL
         QWiXKrqflTTysq9KVA7B5GJVCfb+dPrLJ0RHWsodYc7lHkTM0Qa7Gq6X0SmkBIKsFNxO
         hUXYRelNqd+w6T7N2EcYp9xfqxtrjwZXFPWYE5ed3UmswS23R3eK17u0Pra1Xyxs7zCt
         VsYaDH7DYDmWr6f7BBVWmdDXwEzwwEfDU0SRrbLf8712EqdTbvfL7MliKrtn/0yhPqGy
         4fLHjMM+niLTIEls/lP7jybHGt1mwaNkjo16vXmBToKkKG7Ni1yqwfbPCiKhMhKP3Kq2
         n9UA==
X-Forwarded-Encrypted: i=1; AJvYcCWeaCISZkPwJ1od8A0PeF0XD3LYSNly1dGiZQmPbBIXcwbrYTBFbJcUy0JlPmJQs2L25LuhR4S5oBRvDg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1Z4Q8OhG6KTg8d0zJCJlqqLW8lDiuoZ27XG1otyYFrm+kU+Nd
	ti83b4E6r9gJpIXeDYwepkdHfKS92yDXYXRGC4+FOv7DtDEicvwBnm+j3nJ/2TMZ0g==
X-Gm-Gg: AY/fxX5gQfL2bAscCKL3e8Cy2qUsrdWziqzNjYqPtghIav6NuSR6KAeNPKOwexvCo9i
	zgkFp2yrR9kDfQW+ekVyssIQ+ng7tpguOfi446D94BfE7k1nupPHKOmSvfIu6DlfmBMBo8pLe8n
	Ckxpr4chsVZrv20248tQjRpkuYIaWsmji5HSBNH2fFqUGM9AucVJg0GriCnU6h6+11NEMxsIX6f
	nVLditjX9Q5Sjix8Y9ZOjLZC/m7EJmfLVZAxgmW7/fOGtm09ZvQBaLhNzjhmC0BEdB1iD6eLSEj
	VFVE/ZBA8tDJM7fvgy31Xhpsz+r5OqZXzqU7zvCzjwQ6Efxfv4mbReo3JKQcphNCTW0WTFIqAoE
	eBsx7v6XatytxsgbaKqb1gPQJe+hLk2XFX6i71748UZ4KyTApn93NYsl7wvzdex4QxImwY49ibY
	UCvplDj6spM4QCp8jT4iXy9ttq2mQyy8GKIDu4nH86yA==
X-Google-Smtp-Source: AGHT+IEs1pOpkW+f39F/DRqpNCXzF0cymX5J81DrZywu+onED4ZE4gRGm1Y2kkOMoDNFz55txwy6qg==
X-Received: by 2002:a05:600c:b86:b0:479:3a86:dc1e with SMTP id 5b1f17b1804b1-47d84b41007mr111442295e9.36.1767962479268;
        Fri, 09 Jan 2026 04:41:19 -0800 (PST)
Received: from google.com ([2a00:79e0:288a:8:b844:1270:724f:f3aa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f418538sm205252975e9.5.2026.01.09.04.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 04:41:18 -0800 (PST)
Date: Fri, 9 Jan 2026 13:41:13 +0100
From: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Filipe =?utf-8?B?TGHDrW5z?= <lains@riseup.net>,
	Bastien Nocera <hadess@hadess.net>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>, stable@vger.kernel.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: logitech-hidpp: Check maxfield in
 hidpp_get_report_length()
Message-ID: <aWD3aXy9OzH_u73S@google.com>
References: <20260109105912.3141960-2-gnoack@google.com>
 <2026010956-anteater-pungent-d5b6@gregkh>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2026010956-anteater-pungent-d5b6@gregkh>

On Fri, Jan 09, 2026 at 12:14:43PM +0100, Greg KH wrote:
> On Fri, Jan 09, 2026 at 11:59:12AM +0100, Günther Noack wrote:
> > Do not crash when a report has no fields.
> > 
> > Fake USB gadgets can send their own HID report descriptors and can define report
> > structures without valid fields.  This can be used to crash the kernel over USB.
> > 
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Günther Noack <gnoack@google.com>
> > ---
> >  drivers/hid/hid-logitech-hidpp.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
> > index 9ced0e4d46ae..919ba9f50292 100644
> > --- a/drivers/hid/hid-logitech-hidpp.c
> > +++ b/drivers/hid/hid-logitech-hidpp.c
> > @@ -4316,6 +4316,9 @@ static int hidpp_get_report_length(struct hid_device *hdev, int id)
> >  	if (!report)
> >  		return 0;
> >  
> > +	if (!report->maxfield)
> > +		return 0;
> 
> Combine this with the if() above this?

OK, done. I sent a V2:
https://lore.kernel.org/all/20260109122557.3166556-3-gnoack@google.com/


> And if we are going to be handling "malicious" USB devices, be careful,
> you are just moving the target lower down, you also need to audit ALL
> data coming from the device, not just the descriptors.  I'm all for
> this, just realize that this is a change in how Linux treats devices
> (and all other operating systems as well.)

Thanks.  Yes, I realize that the later communication with the device is also a
potential way to trigger bugs.


> For now, we strongly recommend not allowing "untrusted" devices to bind
> to your system if this is a threat model you care about.
> 
> Not to reject this, or your other patch like this, just letting you
> know.

Acknowledged, thanks.

-Günther

