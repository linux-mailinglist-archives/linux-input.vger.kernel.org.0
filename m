Return-Path: <linux-input+bounces-13239-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF51AEE723
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 21:03:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61E763BF042
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 19:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B17E1F4C84;
	Mon, 30 Jun 2025 19:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WPh0VfUb"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29301C861E;
	Mon, 30 Jun 2025 19:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751310204; cv=none; b=kWPk3UX/b+H0GsYrNpuT4BEZhMoMIc5GPudW1iq5aC2OFUQD657yvrAIGXAz+Nc1OpcAClrkCqI97PW0HzotI5NDT9F8YCuhEJ7lA46jR79nDP65fYcU2Rj8J++N9qqJ/tIms0i7HBAZGzpR1WQzZ/CGDYrWFTlDSABtiLdQN5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751310204; c=relaxed/simple;
	bh=s04us5Wc5dkVwDrZA7GjW+PBrORmctiWfO5PBu55sb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HgzGpdMsfuFWmkvMIGSsAYOydvgi2CvDEVe5E7i0bAhhpHOoyB4V9jnzsEaYFYDovidBLxJ5w/enPRgMnN1e1b1K952IC8ypA5kHupAfB7yzV0JAqi7k2nv/QSIrvXlCfLmrsX84+aWjrkbkq5hfjgl3ohDy4NyZf/u4U2Faq3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WPh0VfUb; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-748d982e92cso3798110b3a.1;
        Mon, 30 Jun 2025 12:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751310202; x=1751915002; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qwXEzUcg0o/ClzyKHDQ0wbQbJMCGH+I0kvtI5qnjlnE=;
        b=WPh0VfUbKY0HJiXHfj5HTwUA4VAUyf2SGZiLEODdeIsG8aguuE/7eRWr7FsbyJm7yN
         sWl7vHQed1YbLEcVWRMJ2eWrwApCjVWnONeVUbbVwfoYZyYhFdHCe2eMtxrs/xkxdud2
         Tn9iju5Jh/tXi+8OaAz+w4jcAGSYi+bQGo993rgUM0wmVKCQMOpjF+Qe8kwMwOAT8FW0
         LtJD7QR9/3HQSgwM38n0xJqUnOsOX/j/8L6/AC/Io9gMmTqDw6FKUlNFPuwHxtZe6E42
         z0hGEIoy4w5VTSc3V8BdaWsNEXAi/qS4IIq5tOKNZoYliMXKSj+GeVN9ry/vhX21HIgY
         sw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751310202; x=1751915002;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qwXEzUcg0o/ClzyKHDQ0wbQbJMCGH+I0kvtI5qnjlnE=;
        b=Z+NE6vzqKx8HSkEyvTbbDpNaaykDi5M3i+wgz2pSMOZdv7bXLLl1g8ikcBmpKbWr9r
         Wvw7Lp/21GwUMrG7JnWxi/UONTP8EyzEXMKnJo/d0f1XEvRm5Y8vhLDr/0UYnvgw1QOd
         ljjsG/6oufS3/UbP9QBiWmJjQiHwjB3Qtp7/WInL/ZafTaSxceUaOuD3jpgy0FrgSKXZ
         JZP3+MUJJc8h1yVI8M3tGAg1ez3RIbQVfqkpPdITUKtaocTAIxNsBdxXJ53btBl4J8Xd
         56/c/79hbI37WGZdy7U+7bPXTOsHPfKpHZAbZveAoyPECFWYy0f26/ru0Y+e1h05cZaA
         0dWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkIGuRuq/lFKPddRhS4t09aB2dBvw6TOgau4pI9XN1eukuG1tDDLeM6NokX0A+/QRJAtqRJeM7c3OZpyD88N7W+fV7ug==@vger.kernel.org, AJvYcCUt+0vEuRcFOEjfnUTalz55snX3RTAfyLVvXpXTOVLMMLY6MAcse7wU9xTeS+6gA8JRjq4zX9NysfPucQ==@vger.kernel.org, AJvYcCVng8+nXsYA9ebacxRomz123vQkgXquyjjyn8GeW4XnyNpJaXTQPmhQOxeLKzVE/akImPzF/hHGxhkJ3N9Q@vger.kernel.org
X-Gm-Message-State: AOJu0YwR8ZTIP/Z76avgalHyjn9yXQspY9pimsov626JMMk7TVs+zzVM
	hO0n144pAcLkPgFc8GX6Yilcp1RsK0wtE5ekL0mGKsUgobzRflLptbkp
X-Gm-Gg: ASbGncs8GLPJgkiaghOtIsVGaJ4OwXKK3TaSBOSlpEwypGktZxHlt1BlGIaafrKqFgH
	JdqWw4xi6tiOALaMvJIcULG2dvjtTvgXrMGEGE3ZZA87ziQZX42iy8xhL5z6iSjA9uQvXmyBON6
	9fCbttYDoBo5Eow+xlCkRMCHMAoI8DK+YJeklZysuyIhmiFt7HuZMTOh+0iGYT865IhWLxVAnJd
	c/5cLzMYCMPr31/z+o8qPi7q7IhS7lHb3axFFRc0+3yCFy8vn/IczerYRoWL+GfK+5IvLDdYPel
	fx784WpanSXifGBqJzT+T9fUzIoX3o679AHu5A1TrQar7+5aLrgoywpiC84xlQ==
X-Google-Smtp-Source: AGHT+IFL1XnMJgpkAglMwM1ySZ2g6LiG8Id+pjQC0xsSxA2iBB/+g1nLfLk/G0wIP+Zj5UEBemi4nw==
X-Received: by 2002:a05:6a00:4fca:b0:742:3fb4:f992 with SMTP id d2e1a72fcca58-74af6ed3d64mr19490319b3a.10.1751310201757;
        Mon, 30 Jun 2025 12:03:21 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:c92b:c666:1f8:990e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af541c399sm9956123b3a.52.2025.06.30.12.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 12:03:21 -0700 (PDT)
Date: Mon, 30 Jun 2025 12:03:18 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Vishnu Sankar <vishnuocv@gmail.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, pali@kernel.org, 
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>, hansg@kernel.org, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, tglx@linutronix.de, mingo@kernel.org, jon_xie@pixart.com, 
	jay_lee@pixart.com, zhoubinbin@loongson.cn, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, 
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Vishnu Sankar <vsankar@lenovo.com>
Subject: Re: [PATCH] x86/Mouse: thinkpad_acpi/Trackpoint: Trackpoint
 Doubletap handling
Message-ID: <u6exrggeh7wcs76bbecpwc7egixyvsp4q6xi6xxrzvqhdbwdsg@jecmkl5wzeqs>
References: <20250620004209.28250-1-vishnuocv@gmail.com>
 <5jgix7znkfrkopmwnmwkxx35dj2ovvdpplhadcozbpejm32o2j@yxnbfvmealtl>
 <4ad6e1e1-aca8-4774-aa4a-60edccaa6d0e@app.fastmail.com>
 <bviu4igchqy6bvu54fw6afts7ooctlmmcutdq6tc4rutzhjvfs@o56kezrit6un>
 <CABxCQKvJzf1G3XLWmqngpy-Ou9U+a7Lzt6gjwZoEcU-+WL6Apw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABxCQKvJzf1G3XLWmqngpy-Ou9U+a7Lzt6gjwZoEcU-+WL6Apw@mail.gmail.com>

On Mon, Jun 30, 2025 at 08:50:27PM +0900, Vishnu Sankar wrote:
> Hi Dimitry,
> 
> 
> On Mon, Jun 30, 2025 at 2:20 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > Hi Mark,
> >
> > On Mon, Jun 30, 2025 at 05:42:45AM +0900, Mark Pearson wrote:
> > > Hi Dmitry,
> > >
> > > On Fri, Jun 27, 2025, at 2:14 PM, Dmitry Torokhov wrote:
> > > > Hi Vishnu,
> > > >
> > > > On Fri, Jun 20, 2025 at 09:42:08AM +0900, Vishnu Sankar wrote:
> > > >> Newer ThinkPads have a doubletap feature that needs to be turned
> > > >> ON/OFF via the trackpoint registers.
> > > >> Systems released from 2023 have doubletap disabled by default and
> > > >> need the feature enabling to be useful.
> > > >>
> > > >> This patch introduces support for exposing and controlling the
> > > >> trackpoint doubletap feature via a sysfs attribute.
> > > >> /sys/devices/platform/thinkpad_acpi/tp_doubletap
> > > >> This can be toggled by an "enable" or a "disable".
> > > >>
> > > >> With this implemented we can remove the masking of events, and rely on
> > > >> HW control instead, when the feature is disabled.
> > > >>
> > > >> Note - Early Thinkpads (pre 2015) used the same register for hysteris
> > > >> control, Check the FW IDs to make sure these are not affected.
> > > >>
> > > >> trackpoint.h is moved to linux/input/.
> > > >
> > > > No, please keep everything private to trackpoint.c and do not involve
> > > > thinkpad_acpi driver. By doing so you are introducing unwanted
> > > > dependencies (for both module loading, driver initialization, and
> > > > operation) and unsafe use of non-owned pointers/dangling pointers, etc.
> > > >
> > >
> > > Do you have recommendations on how to handle this case then?
> > >
> > > This is a Thinkpad specific feature and hence the logic for involving
> > > thinkpad_acpi. There are Thinkpad hotkeys that will enable/disable the
> > > trackpoint doubletap feature - so there is some linkage. I'm not sure
> > > how to avoid that.
> > >
> > > Is there a cleaner way to do this that you'd recommend we look at
> > > using? It's a feature (albeit a minor one) on the laptops that we'd
> > > like to make available to Linux users.
> >
> > I believe if you define the doubletap as an attribute (see
> > TRACKPOINT_INT_ATTR or TRACKPOINT_BIT_ATTR in
> > drivers/input/mouse/trackpoint.c) then whatever process is handling the
> > hot keys switching this function on or off should be able to toggle the
> > behavior. The difference is that it will have to locate trackpoint node
> > in /sys/bus/serio/devices/* (or maybe scan
> > /sys/devices/platform/i8042/serio*) instead of expecting the attributes
> > be atached to thinkpad_acpi instance.
> >
> > You just don't want to have one driver directly peeking into another,
> > because then it starts breaking if you unbind or force use of a
> > different protocol, etc.
> >
> > Thanks.
> >
> > --
> > Dmitry
> 
> Thanks for the suggestion. I understand the concern about avoiding
> direct driver-to-driver calls and unwanted dependencies.
> 
> Just to clarify: if we move the sysfs attribute to the trackpoint
> driver itself (under /sys/bus/serio/devices/...), then thinkpad_acpi
> would no longer be able to directly enable/disable the doubletap
> feature in response to the Fn+G hotkey press. Don't we need userspace
> to listen for the hotkey event, find the trackpoint sysfs node, and
> toggle the attribute there?

Yes.

> That's possible, of course, but it means the feature won't work
> out-of-the-box without extra userspace integration. For example, there
> would be no automatic linkage between pressing Fn+G and toggling the
> feature unless a udev rule or userspace daemon is configured to do it.
> Or is there an approach you'd recommend to preserve the automatic
> hotkey integration while avoiding the direct dependency between
> thinkpad_acpi and trackpoint?
> Sorry, I missed something.

Well, I guess you can look into interacting with sysfs file from
thinkpad_acpi.c... There is kernel_read_file_from_path() and others, you
will need to implement write counterpart of it. Pretty ugly but safer
than following pointers that may go away.

Thanks.

-- 
Dmitry

