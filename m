Return-Path: <linux-input+bounces-7111-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6E0992C6D
	for <lists+linux-input@lfdr.de>; Mon,  7 Oct 2024 14:58:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C59FA1F236A5
	for <lists+linux-input@lfdr.de>; Mon,  7 Oct 2024 12:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7752C1D2709;
	Mon,  7 Oct 2024 12:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jt1ITEVs"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474341BB6B8;
	Mon,  7 Oct 2024 12:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728305899; cv=none; b=g9DzFHsmXfhoo871m8Uzb1fK1gRyqD+4MLGa0bTl+Qe9vMBh8t61gOx4tUQt9idRiCzH1l2Y0l1WJPbUY+D731gGljlw3UBNmGja27N5/ZKnGyHvw2SRVJJfRdqs98OtpyBnfZ/pyTjnXfb1y6PBGSSjjSezwR4n9qgbgLRNUBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728305899; c=relaxed/simple;
	bh=C4OqaWbGRVkYzQR9RiFB6m8LHGSEyaH+eYqc7Bqmvf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D/q9u4rUhloTKOoka+CVdoSAtT4KbC7EHvOdnAO+C3X0xHx6Fg76uh7GpAsir4o1AmRuy9kFlQc9dY3+MM9QW6HJAHk/+bXBjBZ9MutmxJY6Kw+ztA27kchwFJ7H8n8CBlOWWS3MIOErC8037oSoKrMQmVZMm2tVZVaSo+dhJKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jt1ITEVs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11A63C4CECC;
	Mon,  7 Oct 2024 12:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728305898;
	bh=C4OqaWbGRVkYzQR9RiFB6m8LHGSEyaH+eYqc7Bqmvf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jt1ITEVsdzygkMINmqbs4taMR9u8c4H7zDVLUDAVcpw5SxwsnHVCWi5aKakLXviTx
	 vZnPq/JXHRF4a4pFYLT2NKX4qndCGfRT0oe4DQV1tNZ+Prjea/HBhQH4mL77VfXjSA
	 QKYFc2ckfk5jPS47V8Z3R+jafvvdlykbABpgt3itsEEeubBmDiVvjCuxWPJozysGdI
	 twktMqiGDL7RB4QNlnouAuxbtDHPC+MXz6YmlTLKVuKHpi1JnoRoQOs53l8dKu1dEA
	 zKec6CMpSKKTfh/P3bYVxldkGZTWN8+oQhcxZwbFfgPeL64d8xZLgKKLjuCrVRFkzh
	 lReJZ+dryZAcQ==
Date: Mon, 7 Oct 2024 13:58:13 +0100
From: Lee Jones <lee@kernel.org>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: bentiss@kernel.org, dri-devel@lists.freedesktop.org,
	hdegoede@redhat.com, jelle@vdwaa.nl, jikos@kernel.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, miguel.ojeda.sandonis@gmail.com,
	ojeda@kernel.org, onitake@gmail.com, pavel@ucw.cz, cs@tuxedo.de
Subject: Re: [PATCH v2 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO
Message-ID: <20241007125813.GA17897@google.com>
References: <20240927124152.139099-1-wse@tuxedocomputers.com>
 <20241002125243.GC7504@google.com>
 <4bfc188c-0873-490f-bfef-119c7fa74be5@tuxedocomputers.com>
 <20241003075927.GI7504@google.com>
 <8874c084-20b2-44d8-9a0d-67aedad4b456@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8874c084-20b2-44d8-9a0d-67aedad4b456@tuxedocomputers.com>

On Fri, 04 Oct 2024, Werner Sembach wrote:

> 
> Am 03.10.24 um 09:59 schrieb Lee Jones:
> > On Wed, 02 Oct 2024, Werner Sembach wrote:
> > 
> > > Hi,
> > > 
> > > Am 02.10.24 um 14:52 schrieb Lee Jones:
> > > > On Fri, 27 Sep 2024, Werner Sembach wrote:
> > > > 
> > > > > Hi,
> > > > > first revision integrating Armins feedback.
> > > > > 
> > > > > Stuff I did not yet change and did not comment on previously:
> > > > > - Still have to ask Christoffer why the mutex is required
> > > > > - Still using acpi_size instad of size_t in the util functions, because the value is put directly into a struct using acpi_size
> > > > > - Error messages for __wmi_method_acpi_object_out still in that method because they reference method internal variables
> > > > > 
> > > > > Let me know if my reasoning is flawed
> > > > Use `git format-patch`'s --annotate and --compose next time please.
> > > > 
> > > I did but --compose does not automatically insert the subject line, that's
> > > why i copied it but forgot to change it to 0/1
> > > 
> > > Sorry for the flawed subject line
> > And the missing diff-stat?
> > 
> Also not automatically created by git send-email --compose. is there a flag
> I'm not aware of?

As above.  I use "--annotate --compose".  See if that works.

-- 
Lee Jones [李琼斯]

