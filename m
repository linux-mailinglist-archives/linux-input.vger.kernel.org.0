Return-Path: <linux-input+bounces-5347-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B99947F9D
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 18:52:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 166AC281798
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 16:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8120315B96F;
	Mon,  5 Aug 2024 16:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+c64+XU"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093442C684;
	Mon,  5 Aug 2024 16:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722876736; cv=none; b=QZBtP53/i4FHgWZqs6ZN63hBMcFSW1Fn8q69/eKFahFTrUMyWyEVdEoBdZ36/5hlZYj81k7WjTSDRnvYy72WtQlaMOTws5BMZCdMAI7SC5/a5NH14m3RRWDuJSkWCixUpdCOKJZ5y3EXabcxrwYCTtlrN/6qe+MfdGp7+uyrnz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722876736; c=relaxed/simple;
	bh=Vi7pbpZu+Fx5s+so/xnJIRV1C0WQRC7KdX1dFONf5+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u6yJGRi50TkbJPmYEvjweM+FzjYM8AdAgYnfhSgDXIStyK3E+dLCP6MIfm+vVophz3mCQ14UgaRQFIxKLCzc7wOA6SzbSX6t9AUatw3wXb478dPc8PceLetrUGqAyExaS/JyrGjHMDQry5mAM8wwfWuCKC5Y8QvdAHxKcgoDxhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+c64+XU; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1fd65aaac27so39824685ad.1;
        Mon, 05 Aug 2024 09:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722876734; x=1723481534; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cU7hqINeKxwolbZUmfp+qqQ0tXwqgQ2m5cJ7GcrXNDg=;
        b=X+c64+XUdwwf7b7HLFBILEwElU/prE6k2lawO0uGBQjoKyUH6IxGn1iHxYVerDT/q5
         JIhLnx262B+2yd4czEa98RcU9qtrMBdcUeYhPrQYfNfT1E3Xfup0dQ/wX5p2XN+OQoz9
         biRml1m0toiKK8ACdKek6CR2HQ1+fJr4xwCyZqoJOHm0NxOSusfyVQ3ChfPugltPKElO
         e0CTL7P4Pr7fu9BtHwC4ohg7i1urbQeM+abGqfzSy1yhdX+xD5gUwk1LLygJtH4rob93
         CdQPFfoNyUzf3MIywmX1wLwACdZ3vthI2WU3AqMoz7l5Uf2msRcT1cYlFNyyHbXPvmcG
         +BTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722876734; x=1723481534;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cU7hqINeKxwolbZUmfp+qqQ0tXwqgQ2m5cJ7GcrXNDg=;
        b=aTvQq9eYrXHxLD/hDsDZvVZrsjDf5bQZ/oTQqspy81eBhNSYR6u7WOA73CpcyOpsbL
         BlXoizId3E1CSSwv+zf+aOp4XKi6NTx60Lye4eRYa/MbpxzdQl8WUDVtweDbTwpWEnfI
         7f8keDr6HKpsJN3/d2N690Yg96tybZraMJj9Fmo9ORCHjjSwh12KaiYIiF7XxL20KN0O
         rJ7e2gUYaTmkG5UwCHtfYpBuBa+kCtCvXVhzBI6BvUr9pHtJ4hX3nb6vA7hOQ7PUqB9Z
         tEyV1rozDF2RayhvlwoM668FZoETBuKaGrBwV4SDubxWLPppjzwWdMSoHCjW+DOOw+Y4
         Pyag==
X-Forwarded-Encrypted: i=1; AJvYcCWl9OEdMAcdmCXb6YdFGRPWjLRgCRFuTcyTxMw8LC9a351Lb+ISPZ45ca/MegYGs5Av5xpk6qro4Su2FFcfu7Ykyl3HKGOZTg1YRgO+3mIsX0bMxsdRnFyNoWe29fJmSoIbzvtQTPkTytIcmRIc8hBDfrDAq+b7WLM+xtcvy/wwQxjXVKAn7j5ZRPtz64gs
X-Gm-Message-State: AOJu0YwqGZiLIL5Qm3I4ItduUcbh8KFPvsicYLlVwYHEuFvnKCLpEDvt
	wX8hJPoKY7GgMew9PtZMslV7wW81vRYYLNLCAEBWZRgNyWZCnu2j
X-Google-Smtp-Source: AGHT+IFX4btd4+Q1ybjPEjZYYv9RklKe4YsDEecaDM+qSaLnQW4He+3ivREsNXa4X4cGYGJw704ghQ==
X-Received: by 2002:a17:902:d503:b0:1fc:494b:3ee8 with SMTP id d9443c01a7336-1ff57b8592cmr206330905ad.11.1722876734007;
        Mon, 05 Aug 2024 09:52:14 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:b116:76da:13a7:247b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff5905fecbsm70563705ad.172.2024.08.05.09.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 09:52:13 -0700 (PDT)
Date: Mon, 5 Aug 2024 09:52:10 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Jonathan Denose <jdenose@chromium.org>,
	LKML <linux-kernel@vger.kernel.org>, jefferymiller@google.com,
	Jonathan Denose <jdenose@google.com>,
	Raul Rangel <rrangel@chromium.org>, linux-input@vger.kernel.org,
	Ike Panhc <ike.pan@canonical.com>,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] Input: psmouse - add resync_on_resume dmi check
Message-ID: <ZrEDOnxYzbJpC-pH@google.com>
References: <20231102075243.1.Idb37ff8043a29f607beab6440c32b9ae52525825@changeid>
 <ZcKs589qYxviC1J4@google.com>
 <CALNJtpV0KsOusPQeGv8bQ3jKy2sUj+k=mPHc172f+vMaTDYPfg@mail.gmail.com>
 <ZcZ2oG1Rls-oR593@google.com>
 <CALNJtpWNbSZdpxky9hTiSRsaGgLDUnM66QGEy213d3Lhra0hsw@mail.gmail.com>
 <ZeDLq9gPs5InBmdK@google.com>
 <CALNJtpWwhen2H9OT1-rZ4bt+huwXPOPz6qVDJ5g+emE1wRSLsw@mail.gmail.com>
 <ZeoHcH59Qsiv90b-@google.com>
 <b9f08bfb-4c1c-4d1b-9061-8a4b1013497d@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b9f08bfb-4c1c-4d1b-9061-8a4b1013497d@redhat.com>

Hi Hans,

On Mon, Aug 05, 2024 at 04:18:57PM +0200, Hans de Goede wrote:
> Hi Dmitry,
> 
> On 3/7/24 7:29 PM, Dmitry Torokhov wrote:
> > On Mon, Mar 04, 2024 at 11:17:31AM -0600, Jonathan Denose wrote:
> >> I disabled the ideapad driver by rebuilding the kernel without the
> >> ideapad_laptop module. That does fix the suspend/resume issue!
> >>
> >> Attached are the logs. Is there a way to make this permanent?
> >>
> >> On Thu, Feb 29, 2024 at 12:23 PM Dmitry Torokhov
> >> <dmitry.torokhov@gmail.com> wrote:
> >>>
> >>> On Mon, Feb 12, 2024 at 02:57:08PM -0600, Jonathan Denose wrote:
> >>> ...
> >>>> [   50.241235] ideapad_acpi VPC2004:00: PM: calling acpi_subsys_resume+0x0/0x5d @ 4492, parent: PNP0C09:00
> >>>> [   50.242055] snd_hda_intel 0000:00:0e.0: PM: pci_pm_resume+0x0/0xed returned 0 after 13511 usecs
> >>>> [   50.242120] snd_hda_codec_realtek hdaudioC0D0: PM: calling hda_codec_pm_resume+0x0/0x19 [snd_hda_codec] @ 4518, parent: 0000:00:0e.0
> >>>> [   50.247406] i8042: [49434] a8 -> i8042 (command)
> >>>> [   50.247468] ideapad_acpi VPC2004:00: PM: acpi_subsys_resume+0x0/0x5d returned 0 after 6220 usecs
> >>> ...
> >>>> [   50.247883] i8042 kbd 00:01: PM: calling pnp_bus_resume+0x0/0x9d @ 4492, parent: pnp0
> >>>> [   50.247894] i8042 kbd 00:01: PM: pnp_bus_resume+0x0/0x9d returned 0 after 0 usecs
> >>>> [   50.247906] i8042 aux 00:02: PM: calling pnp_bus_resume+0x0/0x9d @ 4492, parent: pnp0
> >>>> [   50.247916] i8042 aux 00:02: PM: pnp_bus_resume+0x0/0x9d returned 0 after 0 usecs
> >>> ...
> >>>> [   50.248301] i8042 i8042: PM: calling platform_pm_resume+0x0/0x41 @ 4492, parent: platform
> >>>> [   50.248377] i8042: [49434] 55 <- i8042 (flush, kbd)
> >>>> [   50.248407] i8042: [49435] aa -> i8042 (command)
> >>>> [   50.248601] i8042: [49435] 00 <- i8042 (return)
> >>>> [   50.248604] i8042: [49435] i8042 controller selftest: 0x0 != 0x55
> >>>
> >>> So here I see the ideapad-laptop driver trying to access i8042 before it
> >>> even starts resuming. I wonder, does it help if you disable
> >>> (temporarily) the ideapad driver?
> > 
> > OK, so I tried to cook up a patch that would allow ideapad-laptop driver
> > to establish device link with i8042 so that the resume will be processed
> > after i8042 resumes, but the longer I think about it, the more I think
> > that ideapad driver should not be messing with the touchpad state
> > directly. The disable event may come up in a middle of the touchpad
> > resume transition, or when we decide to change touchpad mode for one
> > reason or another. It also does not respect inhibit/uninhibit controls
> > for input devices. I think that the proper way for ideapad driver to
> > handle this is to only send KEY_TOUCHPAD_OFF/KEY_TOUCHPAD_ON to
> > userspace and let userspace deal with toggling touchpad input (via
> > inhibit or by other means).
> > 
> > CC-ing ideapad maintainers for their thoughts.
> 
> Sorry for the very slow reply.
> 
> The interesting thing is that sometime ago I already removed the i8042_command()
> command being done on most models now the ideapad driver already only
> sends KEY_TOUCHPAD_OFF/KEY_TOUCHPAD_ON except on the ideapad Z570 for
> which the i8042_command() call was initially added.
> 
> I agree that this should probably just be removed.
> 
> Jonathan, I presume that you are seeing this on an Ideapad Z570 ?
> (since that is the only model where this is still done by default).
> 
> Since the i8042_command() call has already been disabled on all other
> ideapad models I agree that it would be best to just remove it entirely
> relying on userspace filtering out touchpad events after receiving
> a KEY_TOUCHPAD_OFF.
> 
> I have submitted a patch to do just that:
> 
> https://lore.kernel.org/platform-driver-x86/20240805141608.170844-1-hdegoede@redhat.com/
> 
> Jonathan can you give this patch a try (with a kernel with
> the ideapad-laptop module re-enabled) and then confirm that this
> fixes things ?

IIRC Jonathan observed the touchpad being stuck on resume even after
disabling ideapad-laptop module. So we ended up with a69ce592cbe0
("Input: elantech - fix touchpad state on resume for Lenovo N24") that
sends disable and then enable command to the mouse/touchpad on resume
which makes touchpad work after resume.

Thanks.

-- 
Dmitry

