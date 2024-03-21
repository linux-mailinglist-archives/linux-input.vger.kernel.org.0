Return-Path: <linux-input+bounces-2452-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D74885955
	for <lists+linux-input@lfdr.de>; Thu, 21 Mar 2024 13:44:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 76365B228BD
	for <lists+linux-input@lfdr.de>; Thu, 21 Mar 2024 12:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E1D283CB3;
	Thu, 21 Mar 2024 12:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H5AJjoLb"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1C883CAA
	for <linux-input@vger.kernel.org>; Thu, 21 Mar 2024 12:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711025081; cv=none; b=UrR4RvTsdfAd58NYuqM0cTdsP8oyzPnTpthi1efnTP9hYuEgpkV0Ea28oWE8yePLegSVbuY0eqB0sBVWS4MnrGtomW7bI6DtZqMG0BC9OAySf1D6/s6+lRP8Gj3xDEc22E5METt6vlvG7F2gQXRmRjZYrotCFa23rlnKHoUjFuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711025081; c=relaxed/simple;
	bh=hvJTCgMIcWrQbEu4ayN0mOCJ41AxtCvuPYWGLzcX9Mk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=OKWnWXq+02F9+iaVHi463ZUWNgg0aP57WGofc+Apk30L3Q9WpSDm3z5Y7tFOwfNGgx1DzXaBi7lL9ma/YuhvgcZNA//l30OKAhSLQSOHwDpLKYk5BCZzv2c9W49zDEFgzrTq6AyiDFU96StxAZxCeSDDUFsu4l2G+aGHF9ouBIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H5AJjoLb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61319C433C7;
	Thu, 21 Mar 2024 12:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711025080;
	bh=hvJTCgMIcWrQbEu4ayN0mOCJ41AxtCvuPYWGLzcX9Mk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=H5AJjoLb6FMQlE+3wOhRwoer6xKm35MD0Yf9xqeKlMdOP2AaDjfDOxCffpgtdDdvL
	 ELYjyUpGfJ6ChHWyLuyp1Vxz7G1aOsb8PzVnos/NX8WZPP0yS411dwFGT/t+qnRdfk
	 ZBEA0DOdMjqPrPwSqOPeF4NzydDQGOzzACDXkDsPgj4laA++O5CzUqhTLqitgcV4wv
	 Ec5DuNlAL7zR8Tw8S4FhWvZ51J0uBsXHwLRK3Eu0BNFZdJB3qOp+GHVVINAHYh2W4Q
	 +1i2AwIuJs1H9fHYJIaxqtToUtrpOel2O7XMd5uhEZ3hFx3YfrjL84VFRlQEK94lDp
	 CE/dDG97Pjimw==
Date: Thu, 21 Mar 2024 13:44:38 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
cc: "Zhang, Lixu" <lixu.zhang@intel.com>, linux-input@vger.kernel.org, 
    benjamin.tissoires@redhat.com
Subject: Re: [PATCH] HID: intel-ish-hid: ipc: Fix dev_err usage with
 uninitialized dev->devc
In-Reply-To: <f5ca7644241a989779d85086ac55e8c100d926a2.camel@linux.intel.com>
Message-ID: <nycvar.YFH.7.76.2403211343520.20263@cbobk.fhfr.pm>
References: <20240306004404.2770417-1-lixu.zhang@intel.com> <f5ca7644241a989779d85086ac55e8c100d926a2.camel@linux.intel.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 5 Mar 2024, srinivas pandruvada wrote:

> > The variable dev->devc in ish_dev_init was utilized by dev_err before 
> > it was properly assigned. To rectify this, the assignment of dev->devc 
> > has been moved to immediately follow memory allocation.
> > 
> > Without this change "(NULL device *)" is printed for device
> > information.
> > 
> > Fixes: 8ae2f2b0a284 ("HID: intel-ish-hid: ipc: Fix potential use-
> > after-free in work function")
> > Fixes: ae02e5d40d5f ("HID: intel-ish-hid: ipc layer")
> > Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
> > Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> > ---
> This is not an important change to submit to rc cycle.
> This is just a logging issue.

Agreed about the severity. However it fixes a user-visible issue and 
doesn't have a potential to cause any regression, so I have just queued it 
in hid.git#for-6.9/upstream-fixes nevertheless.

Thanks,

-- 
Jiri Kosina
SUSE Labs


