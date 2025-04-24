Return-Path: <linux-input+bounces-11962-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31414A9A8EC
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 11:51:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 507AC1B873BE
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 09:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48A991F09B1;
	Thu, 24 Apr 2025 09:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ln+ZZjWb"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7AD1C8639;
	Thu, 24 Apr 2025 09:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487990; cv=none; b=s9Tv3atYqIaP87ChPIUgChQWrPoGqrsG81ayyRyS5acBPnN4rRvoRnW7+fY/M42GMvWC9mP6Cw5nU1i7Wf5lidKheJL/9dSZC/lMvkG036blH/kDqZntv8HTXL/oCLw+TVSgmsPoZldYcYBaOBKt2xiYCat4KMzbIlIRqLcMfyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487990; c=relaxed/simple;
	bh=uca3DzKEeUbSCJq/fctKEUcbaJvic++E3d5Iiv6h37M=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gA7uTqUHPETCyRq357Y+fBWM6edp4euTuykf2H3v7iV2HCRlrzDXZzk0Li+6BZtG8FeOaaan7JgWYqBZVYou+V4ZEV2IpLu4K19YoQb6jj8nAsOtXdjWJTsQCaQWPfOqrrzzjqGXsOIAPC58TCg84psOp73Z5og/ZLejPCS2cAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ln+ZZjWb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31103C4CEE3;
	Thu, 24 Apr 2025 09:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745487989;
	bh=uca3DzKEeUbSCJq/fctKEUcbaJvic++E3d5Iiv6h37M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ln+ZZjWbTUv/zQ+LbcV1yLbxPuhdDlgTsSEke3iafrQ3oCUrj1XCBX/JrvYH42L6j
	 J0RYG33HIksrUVqXTz8ND+Nh5Q2EarZeawGgQ9v05mTYkUW684LVwqxWRAXI4PwyGg
	 BDb+rWhj/d3lEM2jMKR+vc5vsw/ZLExrm2qHP7ASEelpdp5chDrRloW0KWbtzMV0F8
	 xu0I+1JiuMzQOn83iKf+9d7miQX9+HQo6KI5E+QDjHCZmpnoARJ+L27RvS4SPL/4Vl
	 07f1bnLEVZuE7EAPdtE8qzZEAHOETDQXEMI0De5+zV6eCHenMC+5eIEg3YiURi7wAd
	 TbMY+7IfA9T2A==
Date: Thu, 24 Apr 2025 11:46:26 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Aditya Garg <gargaditya08@live.com>
cc: Benjamin Tissoires <bentiss@kernel.org>, benjamin.tissoires@redhat.com, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    linux-input@vger.kernel.org
Subject: Re: [PATCH RESEND] HID: hid-appletb-kbd: Fix wrong date and kernel
 version in sysfs interface docs
In-Reply-To: <PN3PR01MB95971412A515ED896F8536E6B8B42@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Message-ID: <rn5472n5-rqoq-n79s-r992-s4n3n626qs8p@xreary.bet>
References: <PN3PR01MB95971412A515ED896F8536E6B8B42@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 9 Apr 2025, Aditya Garg wrote:

> From: Aditya Garg <gargaditya08@live.com>
> 
> The driver hid-appletb-kbd was upstreamed in kernel 6.15. But, due to an
> oversight on my part, I didn't change the kernel version and expected
> date while upstreaming the driver, thus it remained as 6.5, the original
> kernel version when the driver was developed for downstream. This commit
> should fix this.
> 
> Signed-off-by: Aditya Garg <gargaditya08@live.com>
> ---
>  Documentation/ABI/testing/sysfs-driver-hid-appletb-kbd | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-hid-appletb-kbd b/Documentation/ABI/testing/sysfs-driver-hid-appletb-kbd
> index 2a19584d0..8c9718d83 100644
> --- a/Documentation/ABI/testing/sysfs-driver-hid-appletb-kbd
> +++ b/Documentation/ABI/testing/sysfs-driver-hid-appletb-kbd
> @@ -1,6 +1,6 @@
>  What:		/sys/bus/hid/drivers/hid-appletb-kbd/<dev>/mode
> -Date:		September, 2023
> -KernelVersion:	6.5
> +Date:		March, 2025
> +KernelVersion:	6.15
>  Contact:	linux-input@vger.kernel.org
>  Description:

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


