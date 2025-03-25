Return-Path: <linux-input+bounces-11225-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF95A70240
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 14:41:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A0ED847832
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 13:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 438BA258CCD;
	Tue, 25 Mar 2025 13:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VzjIku57"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186FE1EB5D4;
	Tue, 25 Mar 2025 13:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742908442; cv=none; b=RFULDTyV3DOzualfFDFbUmO7zhcKLYvFBDM0P8cK+UzndcuUejn0GAQApvgg+dV1820TnMOwye/8zq7BJTM4p1WOHRRT4mxyp5YIxVoWb6MiyjFe4xc9h79dRgtbJX4WYQRn+bf3QyYlMy0ir/wR7msEYM1/8CqaUFX6Ilncxq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742908442; c=relaxed/simple;
	bh=4spZi+34u2jLQa5Xje4g5IeQSlBS4Lc54gwL1Jv8FjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HZm+tyqSWu5iZZ8VtKm8TJg3pmkwebElOyRXmVDeIgwQ/QnmmkvrgSvTUP1U0H6aQQdMjVu2yI+IdYkIKfloty2UtGPU8Ne7f7V1VGJVXuiFR7qQGD1NpNKIvZDnEEOIkVvCPZgEVHmHcrzLLpV0W9xMdk7k7YgCu543ioWEXUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VzjIku57; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBC3DC4CEE4;
	Tue, 25 Mar 2025 13:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742908441;
	bh=4spZi+34u2jLQa5Xje4g5IeQSlBS4Lc54gwL1Jv8FjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VzjIku57cQOtFQ/19v3AkHeJD+2h73KTsPUeatGgCbdNcZB7swuQfqH9RYgIm/YTv
	 k5knUMtwcqQsUFyOkK8MK3y0mnkAvPn5ry53OMSFp8t4HCcFlTcxFx6qFARlOtJKma
	 cM9CqVWfkfko7sB/axPtWTImj7lEqnu9vIPgWgyyxqvXYhn0g2CzzJ1wvMMws+DDB1
	 R2YoXLbtDNPpJczDfV4qRI1IbLE+npCMRRL7RPwGKWLmE2oZtkM6BWOSu+MvJfumE8
	 E8+eIYqe5BDrT3/1XhocaHlXuDCeh+tVRwOr1Yje8LTjbIzSbH4gIdRzHhkpfQ4TxE
	 ml56O/3vWE0kw==
Date: Tue, 25 Mar 2025 14:13:57 +0100
From: Benjamin Tissoires <bentiss@kernel.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: Aditya Garg <gargaditya08@live.com>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, Kerem Karabay <kekrby@gmail.com>, 
	Orlando Chamberlain <orlandoch.dev@gmail.com>, Aun-Ali Zaidi <admin@kodeit.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: [PATCH RESEND 0/5] HID: multitouch: Add support for Touch Bars
 on x86 MacBook Pros
Message-ID: <a556q6xw4grdi7bfjtxr3pgwd4xlkgwnl2n5ucpsu3q5wo2skv@tcouud5sodaf>
References: <ECE4880B-2A87-4147-B83B-2D832639F3B2@live.com>
 <67829qr8-op53-7q0s-n858-9psq5sqopo45@xreary.bet>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67829qr8-op53-7q0s-n858-9psq5sqopo45@xreary.bet>

On Mar 25 2025, Jiri Kosina wrote:
> On Mon, 10 Mar 2025, Aditya Garg wrote:
> 
> > Hi all!
> > 
> > This patch series aims to improve the Touch Bar support for x86 Macs.
> > 
> > Recently, the hid-appletb-kbd and hid-appletb-bl drivers were upstreamed
> > into the Linux kernel [1]. They enabled the Touch Bar to display a
> > predefined set of media and function keys, exactly the same it does on
> > Windows Bootcamp.
> > 
> > Now we are about to get support added for the DRM mode of the Touch Bar
> > as well [2].
> > 
> > The DRM mode enables the Touch Bar to act as a second display,
> > just like macOS. So now you can add a widget, put a clock or anything
> > else on the Touch Bar as long as you can develop a daemon.
> > 
> > Now via these patches, in the DRM mode, we can use the Touch Bar as a
> > touch screen. The Touch Bar seems to be not compliant with the HID spec,
> > thus via these patches several tweaks have been done under the cover of
> > a single quirk, MT_QUIRK_APPLE_TOUCHBAR.
> > 
> > For the case of T2 Macs, apple-bce [3], the driver for the T2 Security
> > Chip is also needed for all the peripherals, including the Touch Bar
> > to work. It is still WIP, and will be subsequently sent later to the
> > appropriate tree. Till then, I'll suggest for get the driver from [3],
> > or more preferably, get Linux support from https://t2linux.org/.
> 
> Benjamin, could you please Ack this series?

Nitpick on patch 5.

Patches 1-4 are:
Acked-by: Benjamin Tissoires <bentiss@kernel.org>

Cheers,
Benjamin

