Return-Path: <linux-input+bounces-16004-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E41C4EBE3
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 16:17:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32FD83B3034
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 15:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56FCC35BDA0;
	Tue, 11 Nov 2025 15:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="EvsOj+aw"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FBE35B145
	for <linux-input@vger.kernel.org>; Tue, 11 Nov 2025 15:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762873693; cv=none; b=PQHlAoC3ZHBYc4KSoRW9wVPtthU9lImjaLG1feaENQG6Jdcx/+XfDP9XrogW12wP2dXl2gPXXGUEctX27F6nZJob9mnwfdKwgURTOkzcVTn/BL2mUI1NsY2FPXhzfK1+OjbNPCL4jWPbthc878RAXBepPdVhgyMde2i2Iad+3EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762873693; c=relaxed/simple;
	bh=DAt5LtmL6m5oArkUGnBm1bgOgLbg+gEeBc0aZ8x0sF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TmOvbtqYlvYVNZPlNiOhAYWXP9iLF16Ff2VnneUOfTU01kWrjMI49c0glDhEjIcbHbbKxolsjtrZ8RXD0VJzZ1nsUoofKll0RfD5oFp8TgMjGlbeIIFBM8q3Os6x1aD+mIqaGIoPGnPkNGtdwFVkIRrnnL/D1ZTNZh1YT02QqQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=EvsOj+aw; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8b21fc25ae1so456096985a.1
        for <linux-input@vger.kernel.org>; Tue, 11 Nov 2025 07:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1762873690; x=1763478490; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3lJT5ZSJMOrp2Um3w1eEC09oiv0bY1tvU8jyZkoYyro=;
        b=EvsOj+awzYxqnrvFd6n5fZq7wZzm8A3L839dhxHDRubaLMqTaTVRX12uRGeZWJQfaJ
         KVfWVKuP1rR6ie8Qd/v21QGdospewIx/rru2tnr9eKwM922FYblciRcWIfOyGsE7W8XL
         ABk5kYiefYFBFGHATQtxaQgf+pU0mR5ZSsqmVXSZZACjExe3Mwc5/kYLgxmUVIFZEYtX
         UHwjKcJ+AxP/pOdO5weKSL+QJu7N2KteNoZWYNGz6rs4kwKV5wGPJPOTZDXh8/xEevdv
         wPVaNQj5mv0HieM96Qh/net6EzHVJaXiZnXHvOAeXUmfU4KkU0x7T0F3wxJLlwynh+3/
         k3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762873690; x=1763478490;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3lJT5ZSJMOrp2Um3w1eEC09oiv0bY1tvU8jyZkoYyro=;
        b=YYm1gWdQYi59Z5+ZGTtyCEf3Gd0BModspLg2QTue8nmXST7pyLUFD+yLubzSxwEpWL
         xTlISvp4oPNOoDazXQIcfBDB2yco4tn/oixzZGRZJfhQLmWslI8cEN1SrZer24YaKc/B
         J72fm5BhdLTLZfsYBH1C6VQP/xUogH0+WqavLzm6FF1IuOIcBZkrH6wyl+0i8ZWn9GGH
         88ArLTkBkO6M2qkqtv+1Fk2GK0DnEyFQiZPHGUpvpv/+TEmiHZBbpedno446ZucoU9X9
         jc+9XKPLiXBiiR3tdS5NFYG84iwqj7Rqfx7LsexIVySodqZS/D8O3NAi+uzuZoCK15Co
         3m6Q==
X-Forwarded-Encrypted: i=1; AJvYcCW5Gerw6lNSJoYAtsPQ9dg2oBZfwzO5WfqyRV3nOR4cfcpsjS0oPFabY6BhXjdQJoNx7OqXF3Qeg5PQMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrSojchmUuxXMiUEk6yley87e3shoD+7Va//N0Ci5A5x4IqvVY
	ZcxLRZcgA0FYCcqG7Z3htp7IRI16PNvrgYlI/QVv/4sSEEYLf7o+Ajz/wGkP6HJlybA3bGrFVMY
	pFDU=
X-Gm-Gg: ASbGnctKKvJERATkwNOXtj8L7v76Dg93NDhpB3BdYiqr9Dfze8ijHwt0NHLk73vHjp+
	yyBGDEtVZlcX0lneBHMqvjJU2Pyuctw9sBoFr6379dJ+PpZdgY1C2ykKrqEa4gVeyAJFgADEpC/
	UUQknl5MvoVt3noU8sWyMFfllqRdQIykFTn7F7QQwCeGkGersQEJbTH8sZKUwpZ4HXLXP+dDjYU
	iTOhXMh5tSvn8G5K7TUzEy8Uy/aExuETP3DjtnTWYkyqQSDd41qTU9kg7QTNXwQIlBjPZsxPFdi
	02mwFAji1371+MqxakVRezsxjJi9oeFx92mSmKAomul1rixiu8gh1UUA4D7VLCC/Ah34O4Pcv97
	NEutFTetQX955IyGg5LrYT6VUKB2XomayciiKYoURnFfgYI1Y5LfshyUXnNtZIH/jj7LNV0Q91c
	P7uw==
X-Google-Smtp-Source: AGHT+IFgUb+2Gl34Fb0q5W9YamyNK7hzqSSthFYGdVLDl5NkdFz46yfwatDwjuvgJWFBBIQqtTtPZQ==
X-Received: by 2002:a05:6214:240d:b0:880:4d78:89ea with SMTP id 6a1803df08f44-88238702c86mr173354936d6.60.1762873689882;
        Tue, 11 Nov 2025 07:08:09 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::ba76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88238969ca6sm76561276d6.15.2025.11.11.07.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 07:08:09 -0800 (PST)
Date: Tue, 11 Nov 2025 10:08:06 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Terry Junge <linuxhid@cosmicgizmosystems.com>
Cc: The-Luga <lugathe2@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Michal Pecio <michal.pecio@gmail.com>,
	Terry Junge <linuxsound@cosmicgizmosystems.com>,
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [BUG] Edifier QR30 (2d99:a101, Jieli Technology) reboots itself
 when RGB brightness button is used under Linux
Message-ID: <732b03e1-ff0f-4428-8b50-725758962ad3@rowland.harvard.edu>
References: <CALvgqEBD05PwMpm00cAbFkpSWpCFP9jaBU0r-8+op+RGPtkktg@mail.gmail.com>
 <7adc816d-169d-4213-bb67-9d070af3c4a7@cosmicgizmosystems.com>
 <30528153-95f1-4ec7-a6bf-5da396441f86@rowland.harvard.edu>
 <xrfmda5rohporc3bjax35fc7xjziai6cmdt5svjak5rps6y6jz@k6h4zlt3jgg2>
 <CALvgqEDZ=g+uvdSYqbD22sL_VP+n6Pda2xXuFAJyKkh3bjm6HQ@mail.gmail.com>
 <CALvgqEC6UW96NEYOCM5v0m4x8Si0A7AwPuMpwXt3PMqkO3eqww@mail.gmail.com>
 <52fc4350-2930-44d3-b844-03f00806f142@cosmicgizmosystems.com>
 <1ac9d1dd-822a-487a-bd42-45c163dfbfe7@rowland.harvard.edu>
 <CALvgqED5NCNjrtv_YSfg9rzerK-xWAE5TaJjZtMBMcY=8MSk3g@mail.gmail.com>
 <c6d506f7-f13b-4d57-a522-a2ccd09e7a1f@cosmicgizmosystems.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6d506f7-f13b-4d57-a522-a2ccd09e7a1f@cosmicgizmosystems.com>

On Mon, Nov 10, 2025 at 09:11:25PM -0800, Terry Junge wrote:
> 
> 
> On 11/10/2025 3:48 PM, The-Luga wrote:
> >>> Are you sure?
> >>>
> >>> HID_QUIRK_ALWAYS_POLL = 0x400
> >>> would stop suspending the device.
> >>
> >> Actually, it forces the kernel to poll the device's IN endpoints even
> >> when no program is holding the device file open (see where
> >> usbhid_start() calls hid_start_in() if the ALWAYS_POLL quirk is set).
> >> This is exactly what the speaker seems to need.
> >>
> >> As a side effect, it prevents the device from being suspended.  But that
> >> doesn't seem to be the important thing here.
> 
> Polling for input reports is handled by the hardware at the interval 
> requested by the device during enumeration.

Only if the kernel tells the hardware to poll.

(Also, the interval used by the hardware is what the kernel tells it to 
use.  Yes, the kernel generally does choose to use the interval 
specified by the device, but it can use some other interval if it wants 
to -- and in some cases it does.)

>  There is no intervention by 
> the kernel to poll for an input report. The only way the kernel can stop 
> polling a device for input reports is to suspend it.

This is simply not true.  Consider: Where would the hardware store the 
report data sent in response to a poll if the kernel hadn't given it the 
address of an input buffer?

> So ALWAYS_POLL means never suspend.

As Oliver explained, that's only partially accurate.

Alan Stern

