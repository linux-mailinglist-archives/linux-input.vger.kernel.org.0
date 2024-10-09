Return-Path: <linux-input+bounces-7175-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0B0995E36
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2024 05:38:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63D5A2817E4
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2024 03:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCFDC7710C;
	Wed,  9 Oct 2024 03:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FuOdP+us"
X-Original-To: linux-input@vger.kernel.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B2D26AEC
	for <linux-input@vger.kernel.org>; Wed,  9 Oct 2024 03:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728445080; cv=none; b=OUmMwbOnNPNV+pxCPOz+fh4uWDTvnXMlqvT8btuSlb6t8QhXKMk+dNC+rRQw5S7NONMVhC/u592WtrmekC3ycltenhUPu+PIvnOKaxrR8zmU+ZD7LaFLKlvhxYP9rdKRbtapIY+46Q4kGDDwriRTYg4T6/yMWbP8iouL0rQnF1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728445080; c=relaxed/simple;
	bh=jyO5bJ4ANX7KDtLXjHmfHJJFbtq5+QmwG1gHtZgmBsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OqdORhWtJgsS4DIMrxZjod8sHwRnCDocnZr3zW0sWB8yPlagTxx02eZKx6Wje0jhx/IuAF1qusMxsZH+xT5oVq23S6aX56p0QMB3iji84N6tWuMALaFoL16cMlx4JrvkxNFuVMppLMTM18sMdchpcY8hjupHSILra/cp7sAp7r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FuOdP+us; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Tue, 8 Oct 2024 21:37:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1728445076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qbFXlyNMc3xiprR3Z60KWrRnLtV9YfsEkIq4tFkSo0k=;
	b=FuOdP+us6k7mhGuVP9aoNvMT3ofYMgLjRh7WJ4fUpKaX3udl1daFqINYulIq/iOPCJBVZX
	jvUfHo91//l9qbQiNcZYFXTmiMCwcFoJxD/m0CvNuxm7VXN8mesmWV+RuqohCXDDSwHBIu
	T1S+mNARDg4HfgQWMSkvuYSUByD4JMA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jose Fernandez <jose.fernandez@linux.dev>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, 
	Jiri Kosina <jikos@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	Hans de Goede <hdegoede@redhat.com>, Kenny Levinsen <kl@kl.wtf>, 
	Kai-Heng Feng <kai.heng.feng@canonical.com>, Johan Hovold <johan+linaro@kernel.org>, 
	Nam Cao <namcao@linutronix.de>, linux-input@vger.kernel.org
Subject: Re: [REGRESSION] HID: i2c-hid: Touchpad not working on Thinkpad Z16
 Gen 2
Message-ID: <chxb4iha4mgurg5gaablt2g4r5lphntg5wmvbpei7x25vibsz3@sbxypsvs2wbr>
References: <gbvkokf7rpsayfqv4l5mvk347lal72q54jgxfvwu7bmx7olngm@e3tcy6oyaas3>
 <5c666a9c-e10b-4eea-b2e7-3f781e177c19@leemhuis.info>
 <c5020404-2d48-47ad-a75b-f2d37897f57c@leemhuis.info>
 <hffdmqx4binr6tpc7lqfzah3mwn75h2lifoqcy72gr2hvc3ath@lugoxeaf444z>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hffdmqx4binr6tpc7lqfzah3mwn75h2lifoqcy72gr2hvc3ath@lugoxeaf444z>
X-Migadu-Flow: FLOW_OUT

On 24/10/08 08:47AM, Benjamin Tissoires wrote:
> On Oct 07 2024, Thorsten Leemhuis wrote:
> > On 06.10.24 05:46, Linux regression tracking (Thorsten Leemhuis) wrote:
> > > On 06.10.24 01:01, Jose Fernandez wrote:
> > >> I'm using Fedora 40 with the vanilla kernel built from the 6.12-RC1 [1]. There
> > >> is a regression that causes the touchpad to stop working on my Thinkpad Z16 Gen
> > >> 2 (Sensil touchpad). dmesg shows this on 6.12-rc1 when filtering by `hid`:
> > > 
> > > Could you try latest git instead of rc1 if you haven't yet? E.g. the
> > > latest packages from your "[1]". I wonder if this is
> > > https://bugzilla.redhat.com/show_bug.cgi?id=2314756
> > > which is fixed by a3f9a74d210bf5 ("Revert "Input: Add driver for PixArt
> > > PS/2 touchpad"") [v6.12-rc1-post]
> > > (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a3f9a74d210bf5b80046a840d3e9949b5fe0a67c
> > > ).
> > 
> > Those two are apparently different problems, as from
> > https://bugzilla.redhat.com/show_bug.cgi?id=2314756
> > it seems that it might be not kernel regression after all, but a change
> > in the Fedora's .config that causes your problems.
> > 
> 
> There were 2 problems happening at the same time.
> 
> There is a high chance the whole issue was because of this config change
> in the Fedora kernel, because of automation. However, the PixArt driver
> was still bogus and interfered in PS/2 capable touchpads: we couldn't
> have a PS/2 fallback.

I believe it was the Fedora config regression. The touchpad is now working with
the latest mainline-wo-mergew kernel: 
6.12.0-0.rc2.20241008gt87d6aab2.324.vanilla.fc40.x86_64

> IIRC, in the PixArt thread, they mentioned that they had something like
> "if that command fails, return a touchscreen, no matter what kind of
> failure it was".
> 
> Anyway, we should be fine in the next Fedora builds, so I guess we can
> close these regressions.

+1

> 
> Cheers,
> Benjamin

