Return-Path: <linux-input+bounces-8712-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A944B9F9D58
	for <lists+linux-input@lfdr.de>; Sat, 21 Dec 2024 01:09:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1020816286B
	for <lists+linux-input@lfdr.de>; Sat, 21 Dec 2024 00:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA339370;
	Sat, 21 Dec 2024 00:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Kuk2Atwh"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0BF163
	for <linux-input@vger.kernel.org>; Sat, 21 Dec 2024 00:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734739788; cv=none; b=r+U2+naevEITDLdyuDqITZvRhfprqp1+Wi0iHkP+bPmlohxe+X8vx5x2/wAVs3P4XJwl9fC/fY0bP0nTUYi5r0khyuTiEzVAQ3WKKD7hF6Mt7SxpNog9wUGwA/hEg9TmxQNpDHFtvvpP9X3sY1ddautwpinuMQoolkQsHIbD0Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734739788; c=relaxed/simple;
	bh=flhTg/GMaZiO4dCxiJDtiKWG3f/ke/JpsT1WGyP5PyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jInHU9WF7tZPch9zYCpkL9ENEX+JWCuG4Ku3pub7LxB/AcAZzaTgpValHIZM/77z7z+fkEyqNhK579sbr6m9G/Ld04cnwgXwZBguhqqJGuhP0o3TO6HwAh4M6bgXjHxAZD0sCKACYoRq80pJif0Cc4wLadZy/exNZ1s0UzkoQjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Kuk2Atwh; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6d8e8445219so20966356d6.0
        for <linux-input@vger.kernel.org>; Fri, 20 Dec 2024 16:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1734739786; x=1735344586; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vda/F4g2zeRiPaYfuqVXTonyQ9QFEOsQs2WkWHH0h1w=;
        b=Kuk2Atwhce1Zr90UWfjHUiH2RmHM10dpJh0mnuMMnRWyGfV1/R8LgaA/5ZNwhiFk+Y
         txm4+polFMmlyGft2vNOu9uVqrrQq8wDxV1gJ98xlkaenPafptSWbZsYBpnC/DE0ceNx
         0w1Me2xoRZzfL+4Ri6Zz5iPUUT3YdFuhWQpSA8Okq3zDQlTGXzcmhMhx1NTkUc7f2/C+
         VfTrvXfoTLp3dkUHD/ZF5UrA5n30H4Kk78Tu+ZPyY+1wpJHwg93dSc2GXxKTXfZtUDAE
         KPcVtlW7nC0G/4JBtRWFAvRd+js2GhT65s1T99AXNBaTl3Av/Smy5t6fW/i70b61QgrS
         KRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734739786; x=1735344586;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vda/F4g2zeRiPaYfuqVXTonyQ9QFEOsQs2WkWHH0h1w=;
        b=hEt25qG0elRbdxN9SP5o/K82A3NJYrQgf+NMNkHwu7zG0AAx6GYVFd7FmLua7tYJLs
         zDCMIbWoj9DHJSptMBZy0B1DMRA7tvfsXPPciMi7bO7d4a1A8YxgIJW13qEKpnREInpN
         7tg0tTGqaKXvB/oDccYFl+grR3H8tZTog7Dmqv1laX+PsXC244hYFhsh0S0POldhDMJY
         Xb9hFdDGjQutTZqHMQlp4PIlSN2QCIDDtlNr0X3AibOEJp8XWAby2KGuynOV0UNbvC1X
         bilHVzQONa9r8foc/cMys49LjyvcVxvMKFQl+CBBUqOpKjREfiyL6e9aifT6taa55HiZ
         mrjw==
X-Forwarded-Encrypted: i=1; AJvYcCWbj53dZkCgkgsoT0BorfF2yeZyUkAiLwfslwWcQuWxaWJtcDWTDMzZrrIF1HEQy1s5zAKAZx2WwuSCMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnZ4HXAvPSuQrhVqPsac8a5md3l5ALH1d/3uD4mddBi/2TEcju
	mIb3phJw0tqBFmFxMlYs2ogYBaQmXS2q0CmC2skPyZlI0KbtvBSjfIGMq8A7UQ==
X-Gm-Gg: ASbGncuA3blS8mdj1e4Ss47WAa5X48212bPc26hEkkx4qgatKP6L2RmYvThmQg9fqQf
	AsFFv6K7M+siYbArfwwNWY4tL1I9Cz4ZRy+nOQ92bHVDlW4PMXhBjBxdCZAnAHT2VqWDDaVYyfs
	IVgwhpQoNNWN/qUWUbkaNOK9mB4PRvmqmb7P1aRPGRAe3b9ztnAZvmr7HrMWNpov/Qcgy6eyHws
	0nNthh2gGehtK1ujjjOYbwSBCziTN6DsZBL3OafcxjQarnrrj9pmu/OTU7GrT5T2MzoZWHOtw==
X-Google-Smtp-Source: AGHT+IEpElG+0JxCdPbhHDZeB6BBzu2Cmni0gK8xRU7rZxUvyMXYjoiqQNDC5RjW3XmR94fmKDZI4g==
X-Received: by 2002:a05:6214:54c1:b0:6d4:2646:109c with SMTP id 6a1803df08f44-6dd2330a805mr75432526d6.3.1734739785955;
        Fri, 20 Dec 2024 16:09:45 -0800 (PST)
Received: from rowland.harvard.edu ([204.150.3.162])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd18135f3asm21646326d6.59.2024.12.20.16.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 16:09:44 -0800 (PST)
Date: Fri, 20 Dec 2024 19:09:42 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	linux-input@vger.kernel.org,
	USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: INFO: rcu detected stall in hub_event
Message-ID: <42fb8b1d-16bc-4948-a214-2892405db258@rowland.harvard.edu>
References: <ade3bb13-e612-49a6-ace2-bf6eeca93f8e@rowland.harvard.edu>
 <fdefac3a-fa4b-4102-9c8a-4ba711beefe3@rowland.harvard.edu>
 <g6wfezt4q746flglh4bteqieooskgbcdyalzkwgtw6fbm5zqle@7zmn625m3eet>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <g6wfezt4q746flglh4bteqieooskgbcdyalzkwgtw6fbm5zqle@7zmn625m3eet>

On Fri, Dec 20, 2024 at 07:16:39PM +0100, Benjamin Tissoires wrote:
> Hi Alan
> 
> [quick FYI, I'm lagging a lot upstream. I had a rough time in
> November and then got some internal work which lead me to be less
> present upstream. And now the holidays are coming. sigh]
> 
> On Dec 17 2024, Alan Stern wrote:
> > Jiri and Benjamin:
> > 
> > The syzbot monthly USB report led to this old email message, which was 
> > never answered.  The full bug report and email thread are here:
> > 
> > https://lore.kernel.org/all/000000000000109c040597dc5843@google.com/T/
> > 
> > The bug still has not been fixed, according to syzbot.  Please review 
> > this material and let me know whether the patch should be changed or 
> > submitted.
> 
> Sorry this fell through the cracks.

No problem.

> > > Index: usb-devel/drivers/hid/hid-core.c
> > > ===================================================================
> > > --- usb-devel.orig/drivers/hid/hid-core.c
> > > +++ usb-devel/drivers/hid/hid-core.c
> > > @@ -1057,6 +1057,8 @@ static void hid_apply_multiplier(struct
> > >  	while (multiplier_collection->parent_idx != -1 &&
> > >  	       multiplier_collection->type != HID_COLLECTION_LOGICAL)
> > >  		multiplier_collection = &hid->collection[multiplier_collection->parent_idx];
> > > +	if (multiplier_collection->type != HID_COLLECTION_LOGICAL)
> > > +		multiplier_collection = NULL;
> 
> As far as I can tell, this might be good.
> I had a hard time finding out if this is correct, but we are in
> undefined behavior, so we should probably just fix the bug.
> 
> The selftests are all passing[0], so I guess we just need to respin the
> patch dropping the second hunk, no?

Okay, I'll do that.  Thanks for getting back to me.

Alan Stern

