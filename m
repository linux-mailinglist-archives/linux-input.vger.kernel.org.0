Return-Path: <linux-input+bounces-2097-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A158696C1
	for <lists+linux-input@lfdr.de>; Tue, 27 Feb 2024 15:15:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2DB61C23B1A
	for <lists+linux-input@lfdr.de>; Tue, 27 Feb 2024 14:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 785461419B3;
	Tue, 27 Feb 2024 14:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fw0qnwXu"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522B514532D
	for <linux-input@vger.kernel.org>; Tue, 27 Feb 2024 14:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709043276; cv=none; b=q+TvGDJhNLKDWvsOG74whGeGYr/SttQzpk+04sYfJ57K4YNN/36uzvRjIGei1f62Ym6JN8cMQZJ10Xj9qhnocG98u9aftXkRwH++usUSt4c4OqG8AAA67pz0hWN5lg8VKl4zmW/nkxm61vftUMnEkaSmw82GESpkbhz6HYs1ntE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709043276; c=relaxed/simple;
	bh=lpQWwURxV6I7Leu/8BpRZ+yVf00HFDpZvTWEMs22RgU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=DBcTBLv8zJ2LGe+H6PTNEiWcTzXP0E+hLFYz6osvJjbMfTE7fPshmlYGpxfWpSIdOZZvf4bZhjIkB61m+uLwM8mww/FPDTfHknsGLpWx++WbhXK9g5SmMu38DHDBoE9k+tpD8Tr5uTV34Ghzlj5qzEw+c1B0upnh7TcgZZQ9ix4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fw0qnwXu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF6A3C433C7;
	Tue, 27 Feb 2024 14:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709043276;
	bh=lpQWwURxV6I7Leu/8BpRZ+yVf00HFDpZvTWEMs22RgU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Fw0qnwXu6LGlv5v6AhODtLEJ6+rs4HfdIZvDw3S1pkusl6IoO1m5lgCcmEopmIFgE
	 diyD+xNuyyCDHt/2QFAzbkp07YNO1ZGZpxruMEXj9uo16o/MiVYC1X1LRJ553HpyIZ
	 4KxQqpA90SGRIAkeO9aF1cg7DpyBHmZG0NRU6EFHbG0kBWfG0/XpYPHs7hLu9081Fo
	 vDiVZ4OP3NFjieU6QVV5cBaUVm9FkyFLVzf59NnQZyxTP7UMCmz56h+wI+XEn05Iam
	 TarXcPH0RzVu6mk/h2xPBVgXLzOnOhhK1FZXxFg8h0iIl3bmkAsGtAAvr7BKTMrbC4
	 oZjZ9Ju/3Kelg==
Date: Tue, 27 Feb 2024 15:14:37 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
cc: benjamin.tissoires@redhat.com, linux-input@vger.kernel.org, 
    akshata.mukundshetty@amd.com
Subject: Re: [PATCH 0/5] Fixes and updates to amd-sfh
In-Reply-To: <20240214144144.682750-1-Basavaraj.Natikar@amd.com>
Message-ID: <nycvar.YFH.7.76.2402271514230.21798@cbobk.fhfr.pm>
References: <20240214144144.682750-1-Basavaraj.Natikar@amd.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 14 Feb 2024, Basavaraj Natikar wrote:

> This patch series include changes for:
> - Increase sensor command timeout.
> - Update HPD sensor structure elements.
> - Avoid disabling the interrupt.
> - Improve boot time.
> - Extend MP2 register access.
> 
> Basavaraj Natikar (5):
>   HID: amd_sfh: Increase sensor command timeout
>   HID: amd_sfh: Update HPD sensor structure elements
>   HID: amd_sfh: Avoid disabling the interrupt
>   HID: amd_sfh: Improve boot time when SFH is available
>   HID: amd_sfh: Extend MP2 register access to SFH
> 
>  drivers/hid/amd-sfh-hid/amd_sfh_common.h      |  16 +++
>  drivers/hid/amd-sfh-hid/amd_sfh_pcie.c        | 118 ++++++++++++++----
>  drivers/hid/amd-sfh-hid/amd_sfh_pcie.h        |   6 +-
>  drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c |   2 +-
>  drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c |   4 +-
>  .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    |  10 +-
>  6 files changed, 124 insertions(+), 32 deletions(-)

Now queued in hid.git#for-6.9/amd-sfh. Thanks,

-- 
Jiri Kosina
SUSE Labs


