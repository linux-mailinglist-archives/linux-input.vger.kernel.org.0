Return-Path: <linux-input+bounces-6780-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 71524987A22
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 22:39:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 309E7284842
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 20:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B12B217BB33;
	Thu, 26 Sep 2024 20:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uwXk5ZWb"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85319176FDB;
	Thu, 26 Sep 2024 20:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727383154; cv=none; b=A5dBghDYiF4kVnwme5oX+ku0/4mSfqyHWsQAfPgCXSSKr0AlhQD6fIBvixzXlR2s3hZ7XhEVpYRf7vD3vM+jw3Ra2FmSNtO9+MD5y7Ee12TmphjwoQ5dlkCdDsdEeXXYQhjfs7Sa9g2Kqmxz2aB8aBzfSjUkf/VMKwMa0Mcb1K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727383154; c=relaxed/simple;
	bh=XkZjDabZH9X7UmAPJUU+KbDCKrMrsT238AURGpTtgqE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=PZB2b2tomKDUnO3308jBTYeNnxqz4Hdki9eSkPWTdWsrBlbtxWnFO8hMxe1JvcKObvKQ7JXHSB0pWl7KC27uaYaTnLTEum6EbW4c1sJ5Q0miqIDuZc7WFQRFThd+iKws8aHPxAjFYOmYXTgxBN0X7ka7AAFk7Hdf06vzvcifVK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uwXk5ZWb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71502C4CEC5;
	Thu, 26 Sep 2024 20:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727383154;
	bh=XkZjDabZH9X7UmAPJUU+KbDCKrMrsT238AURGpTtgqE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uwXk5ZWbRJn/EHpC97A+8wLvBzCnflPHrRS9LxGcuqj4uKdKyZ8YSgm4iFHN84qUQ
	 CAiNs8PkDP2jCsLopcT0g4MCloV9Shr/erop5TUVs2C9ksStKyDBAefO5LrbKFm9WS
	 /IInhhGuKQpAyCKywCEDLNygICzuDb6Sg8zwUNFxKCf9HbEECGtwpz/kHIVlGtm1qo
	 4g1aUqoybtem943/XlN8rKqu65S9LEPwj0mK64Hk410mbvK8ppUZ/FlHK5AtvUOMvP
	 3aQi7uNKZ9L8x0yBMebRDUhPPYepTPGlnY0r8ZtmniXvvFc+SG9F40iUSkynMnkI7o
	 dpHdwZzLxXzrQ==
Date: Thu, 26 Sep 2024 22:39:11 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Dave Airlie <airlied@gmail.com>
cc: Aditya Garg <gargaditya08@live.com>, 
    "tzimmermann@suse.de" <tzimmermann@suse.de>, 
    "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
    "mripard@kernel.org" <mripard@kernel.org>, 
    "daniel@ffwll.ch" <daniel@ffwll.ch>, 
    "bentiss@kernel.org" <bentiss@kernel.org>, 
    =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <thomas@t-8ch.de>, 
    Orlando Chamberlain <orlandoch.dev@gmail.com>, 
    Kerem Karabay <kekrby@gmail.com>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
    "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
    "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>
Subject: Re: [WHY SUCH DELAY!] Touch Bar support for T2 Macs
In-Reply-To: <CAPM=9tw9Dns-fjeQmqLDyf5P99+Dq77R5xktvsFbO0crC5b5oQ@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2409262238310.31206@cbobk.fhfr.pm>
References: <DD9C41AD-6543-47CE-8504-69E4992229B2@live.com> <MA0P287MB02176175318B96135BE3E320B8902@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM> <nycvar.YFH.7.76.2409111420040.31206@cbobk.fhfr.pm> <MA0P287MB0217A06CA89D6A7D0631466EB86A2@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
 <nycvar.YFH.7.76.2409262001520.31206@cbobk.fhfr.pm> <CAPM=9tw9Dns-fjeQmqLDyf5P99+Dq77R5xktvsFbO0crC5b5oQ@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 27 Sep 2024, Dave Airlie wrote:

> > > It has been more than a month since I've sent this patch set and I
> > > haven't got a clear yes or not for the same. I understand maintainers
> > > are busy people, but I'd really appreciate if I get some response for
> > > this series of patches from the HID and DRM maintainers.
> >
> > Just to reiterate -- I am waiting for Ack from the DRM people and will
> > then take it through hid.git.
> >
> > Dave, who'd be the best person to do this from the DRM side please?
> >
> 
> I think Thomas or Maxime could take a look, though it might be easier
> to submit this in pieces, does it really need to all go in at once?

I'm fine either way, once DRM folks either give their Ack, or express 
their desire to separate it out, I'll follow :)

Thanks,

-- 
Jiri Kosina
SUSE Labs


