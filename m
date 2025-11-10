Return-Path: <linux-input+bounces-15980-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A074C4931C
	for <lists+linux-input@lfdr.de>; Mon, 10 Nov 2025 21:10:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD2D83AF57D
	for <lists+linux-input@lfdr.de>; Mon, 10 Nov 2025 20:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E7333F8A6;
	Mon, 10 Nov 2025 20:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="PWiLgpM1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0678732E6A7
	for <linux-input@vger.kernel.org>; Mon, 10 Nov 2025 20:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762805428; cv=none; b=G1Qk4/uDMCFRFgoz6fYMGHOnS9wLYAd8B86JyLdlV+VgMcoDZk/vLE7W5ivxU/4ZwI7Yrq2BeWSgM2lLFk8pv1BobpY0MnpQogjxisOoAdRDJ0Ezp3E0Y9wRLTak6aeL9kqVySqm8Mpc68mAPuUHO1f+FO6Z0PW2CYFLgbDZHew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762805428; c=relaxed/simple;
	bh=9jh715J3zhYgr7vV+A0FRNJLn3+kp5U4RcDiOVM26r4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FNTyXFy9kW4wKCZs33fok3d4KHgxbnYBSMMBCLRLAUY0QF0bVpiSYw4nTJewT/ueRd0lfYARmQ+CRWY9AELCKGs78ttV3JkLB+gyS39GvALRxiLqEQwJOsYtOUT8Kq4B6Q1y0+4xcpiU8Vtu52BKxkvRJrvv8sQcZmdVXm8Zaf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=PWiLgpM1; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4edade7d5baso1693041cf.0
        for <linux-input@vger.kernel.org>; Mon, 10 Nov 2025 12:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1762805426; x=1763410226; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i1l1rpdi0edG+jJ2v9QDv3ez8ceen+pVk5UIQhPyIEc=;
        b=PWiLgpM1Xj1hcc/Diykff9tkLedp9HlEv2Ndy6lA+4MhX86FsY8YwrnCd4/m0Dw5BO
         cNb/SahwoaQMJvfa33bjgNLyIYNvhXoN4qBdFN5Ybka8zWkXEo42XY+HgtfaVbESChnq
         ZkPHkpfnmbNB29sCKLi28yUzjivvAIDLyrVhGjdg2yYo3YLn5QswSXnWLzMKS97QZ5Ga
         9rhdDCAjmtVfFZzsuBRLJ+mPIXVuYp0NhKA6Rw+2eeemhtP2I261YzuWKQvKBZtYZPo4
         hTQTljymK2z5UxSsc+LCwUU7lrESGNtBLWQt7OGhTGWouLpbEgVhwAAMhegpetzKUT/k
         a+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762805426; x=1763410226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i1l1rpdi0edG+jJ2v9QDv3ez8ceen+pVk5UIQhPyIEc=;
        b=kRW3utBND/eaiHa83CigYde0QBq5+gcZSDnmFIYTcvmKaVQMQixY8g3oWxc02Bvh5r
         GSFvXmMtsiu7HCJQQjfXx9xscQiSdh23MYhXIvRGxY14OUfPC9Q4Ob6SP+bStGSxO8cc
         3G8IPjH1MHb4+UBT4EM686m9WCvH/N5/urfupkA61hur81ZStQygOQNEWiZS9OMPLpUU
         fhXLvdD4gPv3/qGUQi4+YgHFyhNu/LDobJvhFnURdz8vi9biBfmzPvAD1zRwQDNaTRpi
         +ZnyDT/0YwxiJxlbTR3ZltjWEFj8mf1nISu3FZJ1HIWhRV6dDDAfSSXFnulodbgsC7MJ
         nHvw==
X-Forwarded-Encrypted: i=1; AJvYcCWcbjXxelDbdt6b3S1rxS5dWJDPcWwp7k35cEfRd5UsN8+dQvSc+ZTTUfUcFjjj8OjHOWm/RiZji3rWAA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8hafdIA8WtHNaMytsodX+kZXxAERL31cVq4uf/mzLzzamOxAD
	SH+TP16OEaHr17I4ocBU8DSCJKKxcAL+UtOmvs2U95wPxScgxchCYfcT6qTgXN9eRw==
X-Gm-Gg: ASbGnct+Ta/gw74PPwa44utFmaJgc7f7albVUDD/xhpXIAFMSFNzLgotCuGlov+ZLeZ
	tYH5NHCXEEJc/VPk3bOppi6Rw+A13Ejq8J9WN0RfsBiN1YJYZrohwK+4rPLcB/l5m23TNakVNoc
	ABXQ68MUOGFSmO8wT4WNrJQ3vfsYDoWIxXyC1AggsRxuChYiKtWDmKZbmmaVJC3ybZQHltufvGH
	1EXPAiMl+ulPdKcvreAWFPTSpoDo9Kiglwk4bIOMeGSCcK3TbD1m8dZ21/teBxZpzYGoC47VR9A
	DponezwezI+rV6MkeH+pP2+v3rm147l5RdwM2MapnjNI8bc3lHbGpqnQQeaGWy1WpuPr58jcWM8
	BU15zSylIlGK/TJ8MvTSaJxOxzY/BabXK56tZ7Alyha1psGpc2ke1E+wpoUVvHnkpDgTvPRNWP8
	j9viblxbxrCxI95a5mIK3x3hhghtM2oSYgIQCg1Ak0PdrwBq36miHWZde0Pu9qQdMqKEYcXg==
X-Google-Smtp-Source: AGHT+IE6vW1fZ0H1TK1sGq2X+CuEOdqFfcqY7kVDqldDW7KHCD//2cXzu8s4xuuaBFfozryysnDJFQ==
X-Received: by 2002:a05:622a:5445:b0:4d1:c31e:1cc8 with SMTP id d75a77b69052e-4edcab19f1emr6309711cf.22.1762805425906;
        Mon, 10 Nov 2025 12:10:25 -0800 (PST)
Received: from rowland.harvard.edu (nat-65-112-8-28.harvard-secure.wrls.harvard.edu. [65.112.8.28])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4eda561a021sm53507261cf.1.2025.11.10.12.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 12:10:25 -0800 (PST)
Date: Mon, 10 Nov 2025 15:10:22 -0500
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
Message-ID: <1ac9d1dd-822a-487a-bd42-45c163dfbfe7@rowland.harvard.edu>
References: <25f2419a-ee91-41eb-9446-87d238b4c7c4@rowland.harvard.edu>
 <CALvgqEBu_RzQYRSJnbu58XZt5wHX6PRD8i-J7Tovh7+KuhOyag@mail.gmail.com>
 <6999b5b2-a242-432e-8100-5d8ee58bcae8@rowland.harvard.edu>
 <CALvgqEBD05PwMpm00cAbFkpSWpCFP9jaBU0r-8+op+RGPtkktg@mail.gmail.com>
 <7adc816d-169d-4213-bb67-9d070af3c4a7@cosmicgizmosystems.com>
 <30528153-95f1-4ec7-a6bf-5da396441f86@rowland.harvard.edu>
 <xrfmda5rohporc3bjax35fc7xjziai6cmdt5svjak5rps6y6jz@k6h4zlt3jgg2>
 <CALvgqEDZ=g+uvdSYqbD22sL_VP+n6Pda2xXuFAJyKkh3bjm6HQ@mail.gmail.com>
 <CALvgqEC6UW96NEYOCM5v0m4x8Si0A7AwPuMpwXt3PMqkO3eqww@mail.gmail.com>
 <52fc4350-2930-44d3-b844-03f00806f142@cosmicgizmosystems.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52fc4350-2930-44d3-b844-03f00806f142@cosmicgizmosystems.com>

On Mon, Nov 10, 2025 at 11:57:10AM -0800, Terry Junge wrote:
> 
> 
> On 11/9/2025 10:54 PM, The-Luga wrote:
> > PROBLEM IDENTIFIED AND SOLVED (almost)
> > 
> > Reading this: https://docs.kernel.org/hid/hidintro.html
> > and https://github.com/torvalds/linux/blob/master/drivers/hid/hid-quirks.c
> > 
> > I decided to try the HID_QUIRK_NO_IGNORE:
> > 
> > I added to my kernel cmdline:
> > 
> > usbhid.quirks=0x2d99:0xa101:0x400
> 
> Are you sure?
> 
> HID_QUIRK_ALWAYS_POLL = 0x400
> would stop suspending the device.

Actually, it forces the kernel to poll the device's IN endpoints even 
when no program is holding the device file open (see where 
usbhid_start() calls hid_start_in() if the ALWAYS_POLL quirk is set).  
This is exactly what the speaker seems to need.

As a side effect, it prevents the device from being suspended.  But that 
doesn't seem to be the important thing here.

Alan Stern

> HID_QUIRK_NO_IGNORE = 0x40000000
> would stop ignoring a device that is in the ignore list already.

