Return-Path: <linux-input+bounces-13235-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1615AAEE2DA
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 17:41:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E7181882B0C
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 15:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1293128EA76;
	Mon, 30 Jun 2025 15:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YRE4VEb3"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF84285C9C;
	Mon, 30 Jun 2025 15:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751298061; cv=none; b=e/NH9QR5vJnyjzSaO7U8USuxUpzgfHarJin1iCoCD+PzdFIdXYq6kEvj0go4b2eu8NyOx5YBYv93Aw4HkMZgmGclsEEJ5rAT2+8tpqI0tO+IpbtL3uR+KFsAzNe2CAq0StjzH1OCxvl65VCCKQh0+swt3eC+fvxMD2GHP5tMGW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751298061; c=relaxed/simple;
	bh=szgUvhAymDaMF1TTwvfTKDtpX/gYDuuzBM7Z2uDEPx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nTfbn258C/BAoXw5PcoEisbzyE3vwQ66nxtOEKtlhNaoJS5ytdRZv44HPYqhMCPw27nubHMxVjNwDNGdV5unLme4khY5DSvi+Wn+nScqZm3heMINQsM5xNX0NbrwJsY3F6syuj/rMpFRUgZTuuLq45QZgluG1vMswyrBMJ51wxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YRE4VEb3; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2350fc2591dso41912005ad.1;
        Mon, 30 Jun 2025 08:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751298058; x=1751902858; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y/+Pz6yJJ9TpPcn1KvtixIaXLFE0T8H5Au1H6tkIU6Q=;
        b=YRE4VEb3p/TfCuvGRvFvnVTFg6SLQKNxQ94p6B3ERjj95gO7emd9JQbxCGToMYAA0i
         ZBC2XoL6aTxGypyjx7H/mLOnzSNH/t7H4+1ZLar2MSohK2n1X5Hqr4zNMCyV+I4EUxVE
         8uWe8wrVybk+ge2IsGEfGPiqJTwpp06VBcpDyxvzQfuF//tB6iZEXk69fQSqLbwFzz7I
         hGHxCURb4Iu/E6/Gw02N9W+Ym5jjHFmiL2OeU5fH4sW1Sxry9KhTfGX/46koutaldytS
         oF/SkTbhe/ocEmsjw8zZ2YM2diHrZxpoDMuGXNC7whJuHRDL6v7kEpUflhvrDUQC1CoW
         /wCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751298058; x=1751902858;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/+Pz6yJJ9TpPcn1KvtixIaXLFE0T8H5Au1H6tkIU6Q=;
        b=T4CF9c3aEfNe9k2hdPBlTbfWX6xEVqH5AD5u3na3O3tHuRbhVVDPtHlFdFlTB8eB/C
         kXbd72UoEr4EZff1evfTzvcj019g8/A+EVbJLvv1MbORc1Ww7cO5XBnESc78EfBE45yX
         YQlP7Ot0sSHDscfql/hv6U5ndaKJ/4r3/NE3S1crz1VrKfB/Tl1xQIBlm9YsCc000SoB
         etPj8YY/cjlJXJmIqpBlOHsZE8UXc23fLqg+PVmXcU4GoJF9bSqR9QMoUbzR0V3etkYS
         kG+CpIeR4h0UK4ku/GMFq8M2JmMe9SwoxCxF+qwa4HFvAFPC2m1DT57HfSgH6Fynl/dn
         RsEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYTmtS+WxQTBvphOubmj/cLq7rs/2IQW625/FD7j0DWSMKMUQJnB4OaLfBC31Pj+paMYlwFJ2HjpNKOA==@vger.kernel.org, AJvYcCVooVpidioiiE9CbAlYp3SS1Ey241dGuZq31zrBBcRg7bUfxQEdRBbbgeJb0DKfvWJKbq6YSXqj0b6V/0neJjyjLJQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvvg3/+UwzOO7ENabzxr/NUm6evS/Uz/o1DJuaaHovnv1ULtAy
	maulZAzc6NEXvNxk6QRnODgYecgpXLPlUmw3dm/d9Oz7nMqD0cE7MncO
X-Gm-Gg: ASbGncvzLgipXqlqY4o8QpTZop4Jde6NKXiukO32jx8biePCoMmLeT+zTNJJJWsh8zO
	D5KurOzeorbjsy0oZNkH3B3Jnm8+GpbFp0rIiwCvwJRCfyIXxDuhc/3XFJahEobqeyu3FLw5XZX
	8awL+18p5ngPCQLwSCrMgGoxuprlQaCTbJnFon4tQX/yiFihGMF5gI/sRhc0CYFRs3Ct7B6egBP
	bUcTXGCzF7T6TCroG8FFIHE29Fv2ybNyWMlbOeT2337QVMRG75u7T9QYJDjD+I6D88JxelaDdr1
	FXHPpOAf5+xuzeXCCksEShfBS+XeC1quT+Z63/PaylklvekoxP98kLwmRtjWjStF/VSgG/0n
X-Google-Smtp-Source: AGHT+IH+QwKdMned1YzkQf+3kUg8SHZfXI3JDPR3BmNGXT1hMzVAvWwENvZSRuZhlcBaUkxAHmmSKg==
X-Received: by 2002:a17:902:c952:b0:215:a303:24e9 with SMTP id d9443c01a7336-23b3548c28amr512465ad.3.1751298058379;
        Mon, 30 Jun 2025 08:40:58 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:c92b:c666:1f8:990e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39b934sm83297225ad.92.2025.06.30.08.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 08:40:57 -0700 (PDT)
Date: Mon, 30 Jun 2025 08:40:55 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	linux-input@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Hans de Goede <hdegoede@redhat.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] Input: goodix - add support for polling on devices
 without IRQ line
Message-ID: <csjblrulwqcmcjvyzbetng6o3ct4xedff26nvgwlb56fkqphew@rp63nsl7reuk>
References: <20250610005458.126842-1-marek.vasut+renesas@mailbox.org>
 <6kqp24t5c23vcvv7wuirkjz6a5s3daacifw37rb5554v4uqeit@jzsinkx6qb7r>
 <cfa155f9-573a-479a-b8db-89c3bb077114@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cfa155f9-573a-479a-b8db-89c3bb077114@mailbox.org>

On Mon, Jun 30, 2025 at 11:44:03AM +0200, Marek Vasut wrote:
> On 6/30/25 3:32 AM, Dmitry Torokhov wrote:
> > Hi Marek,
> 
> Hi,
> 
> > On Tue, Jun 10, 2025 at 02:54:12AM +0200, Marek Vasut wrote:
> > > Add the capability of polling the touch controller for events every
> > > 16ms, which is useful on hardware that did integrate this touch
> > > controller, but did not integrate the IRQ line, like the RasPi .
> > > 
> > > Make use of the generic input poller code. Factor out the code
> > > from goodix_ts_irq_handler() into generic goodix_ts_handler(), so
> > > it can be used both by the IRQ handler and poller callback.
> > > 
> > > Use of_client->irq to find out whether the interrupt line is present
> > > or not, independent of whether this is OF or ACPI system. It is not
> > > possible to register poller in case request_irq() fails, because the
> > > request_irq() in this driver is deliberately called after the input
> > > device was registered, and registering the generic poller at that point
> > > is too late already.
> > > 
> > > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > 
> > There was another version of this patch that was submitted and reviewed
> > by Hans, so I merged it.
> 
> Is it the following patch, with malformed commit message and some odd
> "LF-15225" subject tag ?
> 
> https://patchwork.kernel.org/project/linux-input/patch/20250522020418.1963422-1-qijian.guo@nxp.com/

Yes, I cleaned the commit message.

> 
> > BTW I think this version would end up trying to disable IRQ0...
> How come ?

Won't we hit disable_irq(client->irq) call in goodix_suspend()? In
polling mode client->irq is 0.

Thanks.

-- 
Dmitry

