Return-Path: <linux-input+bounces-13170-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BC2AED110
	for <lists+linux-input@lfdr.de>; Sun, 29 Jun 2025 22:51:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96D937A66CE
	for <lists+linux-input@lfdr.de>; Sun, 29 Jun 2025 20:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0D1D23C8C9;
	Sun, 29 Jun 2025 20:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WVyTrzRn"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3ECB23C4FB;
	Sun, 29 Jun 2025 20:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751230311; cv=none; b=E26dAC4wlc5hNcnX6Gu94XNEGCH2xDARLaiueF8LiuQ/O6OFS+nXZuA3x4WnH5f38lrINa5qqCwsKspmFj7JPB6ecA09mdLqVkFPU0ato7HI/V3IrvQhyZy65dJvbfVMiOiA81gRcuiJL/5cWEOzCFCC3CbA9OZx2GXQXYaWPsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751230311; c=relaxed/simple;
	bh=vZx8lnd78OyAsE8ViQurrPrYJlyjslv3QwebfJkZ604=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y17KwoC1nxzKE0ZEtpfrCCVpTXdX2AmuBbK9qCT2xgNV6suAyD+JC85hPd9b1F4xlT4L4/J9W2kbSNy9tN10ACxunY//eoEtPg88jfnoeHEaIU7RNoW0QVIqbpjQDFzqMB8m6x9fRXrF41Eq8c+JBUmN3GfMHA3j6ZATUSfBu+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WVyTrzRn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 095C6C4CEEF;
	Sun, 29 Jun 2025 20:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751230311;
	bh=vZx8lnd78OyAsE8ViQurrPrYJlyjslv3QwebfJkZ604=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WVyTrzRnwKLGtXvLfB2oq/DBgHLZzRG42mZUKsYkO8M9qfgDmZTTEOS8wbo68J8Fd
	 iC4lvXsVcgL+tU++5SQLlprnSZtSYY7aRJMYskCsPlIsGKDv9omb1ic1MnpzkGsIs3
	 +FhBeVuWTArOj/ZXhB1vaPpoRCi8k/a/QjoGfICREsPu8lnj9W74y3fnYG8zWlvdTE
	 Vz/GNNEfiQlbHftPL848Lbqfj/h4CgQTNcvF52aY9vb5k70RooWTP6QkNKbZ5es2o/
	 ffquEEYzLOFzZIGaBJleqMhMDbAdNJUJtk34LlfIkj4SPFRCFALL6c32vk4IE8e2ba
	 AUtIefAZwcPyQ==
Received: by pali.im (Postfix)
	id CAA10BEF; Sun, 29 Jun 2025 22:51:48 +0200 (CEST)
Date: Sun, 29 Jun 2025 22:51:48 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Vishnu Sankar <vishnuocv@gmail.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>, hansg@kernel.org,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	tglx@linutronix.de, mingo@kernel.org, jon_xie@pixart.com,
	jay_lee@pixart.com, zhoubinbin@loongson.cn,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	Vishnu Sankar <vsankar@lenovo.com>
Subject: Re: [PATCH] x86/Mouse: thinkpad_acpi/Trackpoint: Trackpoint
 Doubletap handling
Message-ID: <20250629205148.l2etpceayuzmhzph@pali>
References: <20250620004209.28250-1-vishnuocv@gmail.com>
 <5jgix7znkfrkopmwnmwkxx35dj2ovvdpplhadcozbpejm32o2j@yxnbfvmealtl>
 <4ad6e1e1-aca8-4774-aa4a-60edccaa6d0e@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ad6e1e1-aca8-4774-aa4a-60edccaa6d0e@app.fastmail.com>
User-Agent: NeoMutt/20180716

On Monday 30 June 2025 05:42:45 Mark Pearson wrote:
> Hi Dmitry,
> 
> On Fri, Jun 27, 2025, at 2:14 PM, Dmitry Torokhov wrote:
> > Hi Vishnu,
> >
> > On Fri, Jun 20, 2025 at 09:42:08AM +0900, Vishnu Sankar wrote:
> >> Newer ThinkPads have a doubletap feature that needs to be turned
> >> ON/OFF via the trackpoint registers.
> >> Systems released from 2023 have doubletap disabled by default and
> >> need the feature enabling to be useful.
> >> 
> >> This patch introduces support for exposing and controlling the
> >> trackpoint doubletap feature via a sysfs attribute.
> >> /sys/devices/platform/thinkpad_acpi/tp_doubletap
> >> This can be toggled by an "enable" or a "disable".
> >> 
> >> With this implemented we can remove the masking of events, and rely on
> >> HW control instead, when the feature is disabled.
> >> 
> >> Note - Early Thinkpads (pre 2015) used the same register for hysteris
> >> control, Check the FW IDs to make sure these are not affected.
> >> 
> >> trackpoint.h is moved to linux/input/.
> >
> > No, please keep everything private to trackpoint.c and do not involve
> > thinkpad_acpi driver. By doing so you are introducing unwanted
> > dependencies (for both module loading, driver initialization, and
> > operation) and unsafe use of non-owned pointers/dangling pointers, etc.
> >
> 
> Do you have recommendations on how to handle this case then?
> 
> This is a Thinkpad specific feature and hence the logic for involving thinkpad_acpi. There are Thinkpad hotkeys that will enable/disable the trackpoint doubletap feature - so there is some linkage. I'm not sure how to avoid that.
> 
> Is there a cleaner way to do this that you'd recommend we look at using? It's a feature (albeit a minor one) on the laptops that we'd like to make available to Linux users.
> 
> Mark

Hello, I do not know what is doubletap and patch description does not
explain it. But for laptop / mouse interface, I'm just giving example
that dell-laptop.c for some particular laptop can enable/disable
touchpad led and uses PS/2 interface for it. See touchpad_led_init().
I do not know if it is ideal or preferred solution, just writing to let
you know, maybe it can be useful.

