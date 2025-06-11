Return-Path: <linux-input+bounces-12805-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3409AD4FB4
	for <lists+linux-input@lfdr.de>; Wed, 11 Jun 2025 11:26:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D42F23A4C02
	for <lists+linux-input@lfdr.de>; Wed, 11 Jun 2025 09:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 882C025F965;
	Wed, 11 Jun 2025 09:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lSCElZ9c"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDF913A3F2;
	Wed, 11 Jun 2025 09:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749633995; cv=none; b=mk8FxAsacCeE8cImGEES25uIlYZ3Toj+o9t5OlAN0JBo479hlImPzAsHozHhb5U090wlAk8nGBI1Osn3rdTY6OIOHnVKJ2pC+gCAWln3BOrlwOBRDvSWLJz/8NxfgYuP4PtOJzn6Y34X6TvGkqROiYPBA5tv1X1TLr6RU5jtTfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749633995; c=relaxed/simple;
	bh=JcH4q7bvmR/iiEjQtCDbBYoJ+a4mZWMpSZ4WzoNbXwI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=EaY0wuv78s+zdXE3JWHiMUqDwLAs/kzeLBKE2oEEAuVohQc8HoWC7102xUN3rlbvqpN/BuYXjuhIrD40UQ8zJHb0hiRoDlED9WNf/fBrB5sOZohTVs3nOAPslnwx4k1HHG9cVUKjGKhAnpk82CjknlECJ3pIM/+fOk7f0/Bkdno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lSCElZ9c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96868C4CEEE;
	Wed, 11 Jun 2025 09:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749633995;
	bh=JcH4q7bvmR/iiEjQtCDbBYoJ+a4mZWMpSZ4WzoNbXwI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lSCElZ9cPGdTjtxfyETX3X3+2aCyQnssewuchC9Tw0wBs07iCgOk/m1a59hP4yd+I
	 BNbo6hiVmsFt1KQYk6BoR4gBBwPWxCzXUwmxJqf28I3FtOVDLKT29KcQLi3WnNUy5m
	 SftVFf2A2uXvam8iXeyyw6tqQ6ZcuuPqkCU/umA5i1o49Gor9+1Cnoeo7VLxUU9o0x
	 AJgDtHjfG4kN906ScF7p9a9O8oWDCRJyEK6PNtoEPnMCuBcFmAnncD8J26GFc9jumA
	 AjespapGqtfnPzGUPdZk/gCIvqKFShiS/N/fmLPRugQUDMvMrWwPoiuf14NbAh8XTg
	 idp6AatIuiD9w==
Date: Wed, 11 Jun 2025 11:26:32 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Aditya Garg <gargaditya08@live.com>
cc: Benjamin Tissoires <bentiss@kernel.org>, Kerem Karabay <kekrby@gmail.com>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    Linux Input Mailing List <linux-input@vger.kernel.org>
Subject: Re: [PATCH v3 0/5] HID: multitouch: Add support for Touch Bars on
 x86 MacBook Pros
In-Reply-To: <PN3PR01MB959768813D548FD4A91CDD11B864A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Message-ID: <8r1757q9-7qqq-n6p8-0no1-040rssnsn260@xreary.bet>
References: <PN3PR01MB959768813D548FD4A91CDD11B864A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 27 May 2025, Aditya Garg wrote:

> This patch series aims to improve the Touch Bar support for x86 Macs.
> 
> The `hid-appletb-kbd` and `hid-appletb-bl` drivers were upstreamed into
> the Linux kernel and are available since version 6.15. They enable the
> Touch Bar to display a predefined set of media and function keys, exactly
> the same it does on Windows Bootcamp.
> 
> Alongwith that, support for the DRM mode of the driver has also been
> upstreamed in kernel 6.15.
> 
> The DRM mode enables the Touch Bar to act as a second display, just like
> macOS. So now you can add a widget, put a clock or anything else on the
> Touch Bar as long as you can develop a daemon.
> 
> For this mode, we needed two patchsets. One went to the DRM tree as the
> `appletbdrm` driver, and other is this.
> 
> The DRM driver is responsible for displaying whatever the OS wants on
> the Touch Bar.
> 
> Now via these patches, in the DRM mode, we can use the Touch Bar as a
> touch screen. The Touch Bar seems to be not compliant with the HID spec,
> thus via these patches several tweaks have been done under the cover of
> a single quirk, MT_QUIRK_APPLE_TOUCHBAR. Originally expected to be
> upstreamed alongwith the DRM driver on 6.15, these patches seem to have
> remained in a backlog.
> 
> For the case of T2 Macs, apple-bce [1], the driver for the T2 Security
> Chip is also needed for all the peripherals, including the Touch Bar
> to work. It is still WIP, and will be subsequently sent later to the
> appropriate tree. Till then, I'll suggest testers to get the driver
> from [1], or more preferably, get Linux support from https://t2linux.org/.
> 
> Cheers
> Aditya
> 
> [1]: https://github.com/t2linux/apple-bce-drv
> 
> Changelog:
> 
> v2: keep parse at original location in patch 5 as suggested by Benjamin
> v3: Reword the cover letter to update the maintainers with the latest
>     situation, and re-prepare the patches on 6.15.
> 
> Kerem Karabay (5):
>   HID: multitouch: Get the contact ID from HID_DG_TRANSDUCER_INDEX
>     fields in case of Apple Touch Bar
>   HID: multitouch: support getting the tip state from HID_DG_TOUCH
>     fields in Apple Touch Bar
>   HID: multitouch: take cls->maxcontacts into account for Apple Touch
>     Bar even without a HID_DG_CONTACTMAX field
>   HID: multitouch: specify that Apple Touch Bar is direct
>   HID: multitouch: add device ID for Apple Touch Bar

Now queued in hid.git#for-6.17/multitouch, thanks.

-- 
Jiri Kosina
SUSE Labs


