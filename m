Return-Path: <linux-input+bounces-13668-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3940FB0F564
	for <lists+linux-input@lfdr.de>; Wed, 23 Jul 2025 16:34:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E38CC188842A
	for <lists+linux-input@lfdr.de>; Wed, 23 Jul 2025 14:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D00618C034;
	Wed, 23 Jul 2025 14:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="J8aC342I"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3649C2EE995
	for <linux-input@vger.kernel.org>; Wed, 23 Jul 2025 14:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753281250; cv=none; b=Wwhp8/38ZgS2V3DwXKFV5zVl1W4fMa74m7IBEZCR++NTpOl3iLSmDN0H62eRYPGR4LYlKy54Ybam6VlrCDI4audMd8rikSZU+OzH+torfesoqIy9y/J0p/66PBBQefXh9VJPtnQ8uCORyiRSnsroOnxwfHTAfAJ5LhEmEy3T12o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753281250; c=relaxed/simple;
	bh=1ULuyti9Kn4FcMH3MUItWYZpR0G6mq8RJGPSkQjQpYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hqw4pdqm5E5V098xs+P73OUf68bBAyRYyL6hgo26SMSeg3ShpIhmpLnbFxzQKe1lBoLvBaah4LVfR1p9KH00IBrh6XlLfqLOFgHuc4D5wqoKKnxlljhpL0Odz0yHFMKkwMz4jxziTebixhfrgP7u3Wc0Lp9opDE5dP6CC5iElmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=J8aC342I; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4ab81d0169cso88517791cf.2
        for <linux-input@vger.kernel.org>; Wed, 23 Jul 2025 07:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1753281248; x=1753886048; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DpVfUmI1KeHlRdksG5/hlr6v6bC/FgYZRIQLfFzPySo=;
        b=J8aC342I5csm64SBHVemOrTwBaimpllITWbF8sZ4uCOCbZ+EWKbiI6RFv6hApLnxeJ
         DWalxAxi5/yP7w5f73t7SOnblE8fOPzOHf4UHzuC3r/ntWQo0yymNHupjnVTAPrnRcrf
         GCJogHwhfIMkzaIbxBG9Lym0SMkE/zuJVR8cV7fzAM67a/LGshdXNELkF78SJdv9uSwL
         g3ebtrka5s8GTpJYtkFdvce3gq6aSM3MdYu933lczBHEn2xayc9syBdnSCTi+kIj6B1U
         bk6iiCXWpkY2WPOwjXY2/dojj28U5ozZzV6AWmV9P/kYNPoybS5yi3ALgTyzfrF6cKPO
         yASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753281248; x=1753886048;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DpVfUmI1KeHlRdksG5/hlr6v6bC/FgYZRIQLfFzPySo=;
        b=ZgL8T2tSdXecdaxsgsPGPioFWNUwbwgjcUq6xm9UGOKNQdjiLqq6waoLc20XOqWAHC
         ODArLEB8UOIkDkCWIjFBbXxGqD+eqO2Gq9qwpL7kNfiV5PivhBZQ/3rySekh9ZdyFQ+u
         FYSrnKb+EhvHlkinZJ/IcmamJsJTlpIilVQH8z2McFydcflNIznjHiWuJ6FBuiB9RIBS
         0xmQKXiFmj1z24ZFasKTzgDtPx/7W3V8FWe7nAzwgfY0DFeNy2KHEDVCHYj+Nlq5DMMo
         f27tt2BAOTJfm2fMr8gcpqTEl8F5A5LhP/0zK/aHKo5wgrw3Fl+bi143Et/iIrsWIpvR
         HBqw==
X-Forwarded-Encrypted: i=1; AJvYcCUF8IxRYYkYKcPFhK3BYoxGPALzewkU7RJdJZ28Ims1+6PQQIkjHO5rdI3IE8a2c04RwDxx4AlnzDmqxg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz60MIhZ7RToozmEuwviqHtUQkc0Cc0EYjWD9DzRShjNI6Dewo2
	4xoBv1Hl/aX4cgGnng6NusXo0IaE6abyBCBnkssNdFK0clsNKb3U3FW0ESk5nbOaug==
X-Gm-Gg: ASbGncsn1pvKh35h0NW8BhJ04UDcjrUiTNOeuj2TA2VaZIdfOxyEES0PQ9sD0fxvtJm
	FHztPJ6beeidu1vjf4xo7Vzj4b2sOEp2N+3PGBlpHir2P9oTDDT5adKmHo+I9xxfCtk+S8YyXgs
	HfjxZGEaWsPZh5WuhaovaoAhlWa7MDBvVTDBHYeHILrFcNa5BF6yj9cj2G8X95Ayn6rdE5IRKTx
	qISSJtqCi24rIKeGZm/jIE50WOqLTtU6TmPj3VkxoztaHQeEAJX7SatmNH7rz14sUPPIq4umARa
	a4br8PBIrMh+sfuHxY6JNt2Lrfp/Gw9t967HpyCigcXbpoqsqU4BHyszjH2C5o4ekRHpxYcdmhI
	4gMnnHJiMR2lJAzOZVZjqtvCIKF9jUgywtO5CGr+CjCmjhNigc0E=
X-Google-Smtp-Source: AGHT+IHpNXlDJG0Cf2V8A8Oz1qR6u5Q6ICaQoF7lbGkGS7QpFGO8kmzSUKcIsA361heT2XOuYduEYQ==
X-Received: by 2002:a05:622a:cb:b0:4ab:5e1f:ca8a with SMTP id d75a77b69052e-4ae6de54cffmr43546971cf.14.1753281247645;
        Wed, 23 Jul 2025 07:34:07 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4abb4b24930sm67046841cf.51.2025.07.23.07.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 07:34:07 -0700 (PDT)
Date: Wed, 23 Jul 2025 10:34:04 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: syzbot <syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com>,
	jikos@kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] HID: core: Reject report fields with a size or count of 0
Message-ID: <750377a5-b5df-4b2b-8e38-0001bfbeb30f@rowland.harvard.edu>
References: <68791b6f.a70a0220.693ce.004b.GAE@google.com>
 <8a4eb6b0-f640-4207-9f05-83e06080410b@rowland.harvard.edu>
 <lrhydvc7huuqck2kvqzobqt7hhwt36zwsa2i3fpegbpykt5q43@2md6gfitjlb3>
 <a2c3537a-8ddc-467f-a9f4-b4d413914914@rowland.harvard.edu>
 <voiysrjm3okjtaz7axqupr2jk5yyvxsqgagbwrsey4z24g6rf4@xb75ss3bwol5>
 <bd033800-53f0-4d5a-a52b-b0e01ac48c12@rowland.harvard.edu>
 <34ks6futbrmunsq2tbz75jwqg64lpk4pg6udbbk3yo2exm657b@3fivbjjdcyl4>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34ks6futbrmunsq2tbz75jwqg64lpk4pg6udbbk3yo2exm657b@3fivbjjdcyl4>

On Wed, Jul 23, 2025 at 11:32:14AM +0200, Benjamin Tissoires wrote:
> On Jul 21 2025, Alan Stern wrote:
> > On Mon, Jul 21, 2025 at 03:05:58PM +0200, Benjamin Tissoires wrote:
> > > > So then would it be better to accept these report fields (perhaps with a 
> > > > warning) and instead, harden the core HID code so that it doesn't choke 
> > > > when it runs across one of them?
> > > > 
> > > 
> > > Yeah, that seems like the best plan forward.
> > > 
> > > [sorry on reduced setup for the next 3 weeks, so I can't really debug
> > > the entire thing now.]
> > > 
> > > Though, we should probably not annoy users unless we are trying to do
> > > something that won't be needed. I doubt that Saitek gamepad will ever
> > > call the faulty functions, so why putting an error in the logs when it's
> > > working fine?
> > 
> > All right.
> > 
> > Probably the best way to do this is simply to revert the commit that's 
> > already applied and then merge a new patch to harden the core.  Would 
> > you like me to post the reversion patch or do you prefer to do it 
> > yourself?
> 
> Given that the faulty commit is on top of for-6.17/core, I can simply
> force push to the parent, and also force push the for-next branch. That
> should do the trick.
> 
> Can you post your s32ton fix on top of that then?

Sure.  Patch coming up shortly...

Alan Stern

