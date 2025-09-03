Return-Path: <linux-input+bounces-14459-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F583B42638
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 18:06:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E1921BA092E
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 16:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5ABE2BCF6C;
	Wed,  3 Sep 2025 16:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="sKW3KswG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-244104.protonmail.ch (mail-244104.protonmail.ch [109.224.244.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CF229C35A
	for <linux-input@vger.kernel.org>; Wed,  3 Sep 2025 16:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756915571; cv=none; b=G6L0vvm9zSJfE8o62aYjgxdtM4E5pGeE3Z3Nt9O0xBuvGPkSKeYF/mNlV9kfm/C4e1Su3qcrmsxtY0x8UesbWE+Wp8f5Nwbt4AdeQSS2Pdv6GLRLuBFqWBNFq2h4kYDkaDRSzdZ5fBdV/escUnNjl9BsGW22G0lAA2KU17c7DI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756915571; c=relaxed/simple;
	bh=KIL3ce3BqAHA4/aF4mjIxz2pa9C7BqnYHQLeoLIRcmc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=klSInXedqddmHVHdc0fl/sxq+9nsMJAVGpt7xPVGRTleU9fJ0TOasCb3vlN/RlBnRwQuC5S3z0EBLi+ug9Cl3RxohrmF7ZKVkIoWmz7ncZO63fH2ViPL11cdjTBjknJfYqknzn78RSxygQ3X2eMij12ZTqQmUPIan0cL86xfatY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=sKW3KswG; arc=none smtp.client-ip=109.224.244.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1756914974; x=1757174174;
	bh=Eh2xU47Ek3s7y9ir1ICpxUkQEE8tyADRg56vn2q6eVg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=sKW3KswGUiwTwoHL4u436eLWpoCoWb7oTzn+KBtEDen6SJ7QiUMKenAYQ/W5oG9PR
	 DgngTlcaoojF3ictQoN1h14iZ7S/iTqI4CKh39jUx6D+mXhMDIPa4fG+6OV36NbV+L
	 7xctC7QlYn/10UEqebjmeUMt5oH6HfSEk7+UYw/AOIe7BPfTyJleINblCWhNk0wn2s
	 KH/xDKq8XsQFG32PzC0lU2nDnPQ8cxaQoexgGnKufurWkPXYp7flL/J2hfaNbGot1w
	 qeUUAXXWpOC8fffeY0TweZ1VMHws05ah2xwFGaroyqilgiI26nKx84i96Lnv9KbJIt
	 gi9CRZPJ44KYg==
Date: Wed, 03 Sep 2025 15:56:10 +0000
To: Stuart <stuart.a.hayhurst@gmail.com>
From: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
Cc: jikos@kernel.org, linux-input@vger.kernel.org, benjamin.tissoires@redhat.com, hadess@hadess.net, lains@riseup.net
Subject: Re: [PATCH v4] HID: logitech-dj: Add support for a new lightspeed receiver iteration
Message-ID: <20d3b05b-dbe0-4802-b724-fe4ab5e279d6@protonmail.com>
In-Reply-To: <CALTg27=fZ+_2b2AXmKk5UcZG_2-zm2XP3+xzbSUrWdahD7ShaA@mail.gmail.com>
References: <20250902184128.4100275-1-mavchatz@protonmail.com> <CALTg27=fZ+_2b2AXmKk5UcZG_2-zm2XP3+xzbSUrWdahD7ShaA@mail.gmail.com>
Feedback-ID: 20039310:user:proton
X-Pm-Message-ID: 3e976d3368dc1ddbc9ffc481f49c4edfc2a92056
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

On 02/09/2025 23.03, Stuart wrote:
> Thanks for rebasing, testing with a Logitech G915 TKL:
>   - All the keys work and the media controls work perfectly too.
>   - The battery is detected and the sysfs attributes all look correct.
>=20
> However, caps lock correctly enables caps lock, but the caps lock
> light doesn't respond to it any more (the light works without the
> driver).
> My laptop's internal keyboard lights up correctly when caps lock is
> pressed on either keyboard, but the caps lock light on my G915 TKL
> never lights up.

Thanks for taking the time to test it.

Is your product id the same as the one in the patch or are you modifying=20
it before compiling?

> I'm happy to check anything you need for troubleshooting, I'm also
> happy to compile more kernels :)

Can you please dump the HID descriptors from your receiver
(sudo usbhid-dump -m 046d:c547) and share them?

> Thanks,
> Stuart


Thanks again


