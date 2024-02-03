Return-Path: <linux-input+bounces-1648-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F72E847FEC
	for <lists+linux-input@lfdr.de>; Sat,  3 Feb 2024 04:34:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 250E51C21A62
	for <lists+linux-input@lfdr.de>; Sat,  3 Feb 2024 03:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2903479C7;
	Sat,  3 Feb 2024 03:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GXK6Zlnm"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4B9D2E8;
	Sat,  3 Feb 2024 03:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706931275; cv=none; b=PKz8SYskzCbi0RZxK+3LvM7p0o9+1sWkExV//uuj4h++1atEIeeLYPZ1CgREiqAybzW9L3WSS5ucYLyGBiuTGlD3AE7HlJopihkV7S4SRpUCkA+NCkq1ptlA45q/uEmk1j1hePbVlJr6PlW/hIDxP8jAcENSd+TM6FAF29RgB5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706931275; c=relaxed/simple;
	bh=qce/kWItfAB4PiZhWuuhWK907Z9AneH2OKhw3p7UUZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r6BICw5yjXmwfSFM5Pxve8a0yYlaYSmGBkHkIlYKVczGN22W1ubnOyJ3hpdOM8LksPqYxLy06N4Ss6hCANBBIXARrJuRAjwamytfj13gkJKU4pwhlRkg3b1X+RZXyiBrBbD4fybcenm55/MGyZYxTXFqs6uODTitT9TSmSg9SQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GXK6Zlnm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57AAEC433C7;
	Sat,  3 Feb 2024 03:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1706931274;
	bh=qce/kWItfAB4PiZhWuuhWK907Z9AneH2OKhw3p7UUZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GXK6ZlnmCgwSqtDpisFYuxhHaenEweZIamFvHzLqS8pYEeYFw/prda8BQLVmzhnup
	 f9vn5qoI5L4ziTPbROn7NN8PGEs33ifH8UXKp0rI659C3DqirtycVqmgGVgQBCOrpC
	 eZYzToXEhhib0CItM68+74Thn15wxB8aRBbVcnmU=
Date: Fri, 2 Feb 2024 19:34:32 -0800
From: Greg KH <gregkh@linuxfoundation.org>
To: Aseda Aboagye <aaboagye@chromium.org>
Cc: stable@vger.kernel.org, jikos@kernel.org, benjamin.tissoires@redhat.com,
	linux-input@vger.kernel.org
Subject: Re: Requesting 3 patches for Apple Magic Keyboard 2021 to be merged
 to LTS kernels
Message-ID: <2024020217-immodest-reversion-407e@gregkh>
References: <3b82d3d8-c0c3-49e1-ae68-966f02fe5429@chromium.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b82d3d8-c0c3-49e1-ae68-966f02fe5429@chromium.org>

On Fri, Feb 02, 2024 at 08:45:40PM -0600, Aseda Aboagye wrote:
> Dear stable kernel maintainers,
> 
> I am writing to request that 3 related patches be merged to various LTS kernels. I'm not sure if it would have
> been preferable for me to send 3 separate emails, so please forgive me if I chose wrongly. (This is my first foray
> into interacting with the kernel community) :)
> 
> The patches are as follows:
> 
>     1. 0cd3be51733f (HID: apple: Add support for the 2021 Magic Keyboard, 2021-10-08)
>     2. 346338ef00d3 (HID: apple: Swap the Fn and Left Control keys on Apple keyboards, 2020-05-15)
>     3. 531cb56972f2 (HID: apple: Add 2021 magic keyboard FN key mapping, 2021-11-08)
> 
> These patches have all been merged to mainline, but I believe when they were submitted, backporting may not have been considered. The Apple Magic Keyboard 2021 (Model # A2450) seems to be a popular keyboard, and without these
> patches, for users on certain LTS kernels that use this keyboard, the function keys do not behave as expected. e.g. Pressing the brightness down or brightness up key didn't work, and bizarrely pressing the globe/Fn key alone caused the brightness to decrease. None of the top row keys worked as expected.
> 
> I checked to see where the patches were missing and figured that it would be good to have those patches in those
> kernels.
> 
> I would ask that patches 1 & 3 be merged to v4.19, v5.4, v5.10, and v5.15.
> I would ask that patch 2 be merged to: v5.4 and v4.19.
> 
> For patch 3 to apply cleanly, it needed patch 2 to be present in the tree.

I've done so now, but really, adding support for a keyboard that wasn't
even out when the kernel was released is odd, why not just use a newer
kernel version?  That's generally a good idea for all consumer devices,
use the latest stable kernel please.

thanks,

greg k-h

