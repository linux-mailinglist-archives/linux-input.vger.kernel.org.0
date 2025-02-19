Return-Path: <linux-input+bounces-10191-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 087FCA3B767
	for <lists+linux-input@lfdr.de>; Wed, 19 Feb 2025 10:15:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9AF2188C3D7
	for <lists+linux-input@lfdr.de>; Wed, 19 Feb 2025 09:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BD461DE88C;
	Wed, 19 Feb 2025 09:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f+dSAUYM"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB4C1DE887;
	Wed, 19 Feb 2025 09:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739955888; cv=none; b=HIbJGK/dSSqxsqCyDBexpS9xwyfaX3RBsWtOvWpz3L9K+BuR5TNTNWeFy1buEhIDwLQH6ncvIxRwNS0S6+AQ/NCx0fwYvvK+ysnsTLBcZEhmZ3owPyNG0YtnDNdKd9coYLrFny/QVHMTdaPlV3S1uBXSx9IX54FGvanpUSpJBQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739955888; c=relaxed/simple;
	bh=eL/eAneaspkNWK19YjRjhS4kDSn/ssNiAM3LBR5utTM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gOZ6I5QVfAfWDZHOv9vg/dy25jzCvMFlD5vsMZjVcpGrsdO8pj0jrUFoce16YA/4IwYC+xSYbDymvwhkpInCSZ6FEZlq1KTFj3hRWexF4qG06OZdsccS6miG+5GePY0Pl5xkCJ2PV06xRPXlNWsUnAGMhE7LsYafonHI1c5/+0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f+dSAUYM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95ED8C4CED1;
	Wed, 19 Feb 2025 09:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739955888;
	bh=eL/eAneaspkNWK19YjRjhS4kDSn/ssNiAM3LBR5utTM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=f+dSAUYMLf6iLdJ+CZEae22iDvAV49RTtwTCIIj0QZiTj10ZeCAt7WNLRtDxsiFCT
	 yeuIgreHcJo4/N8bdpqPiNE5Am57Qb5JROap6JHhgla63Nswve5nV8PvDXCgGDCbGT
	 h3P6BcejZR+O2gI2UBp+zQokb307f8P5L4GbVKVBhIbP9bD2jeNayw92A75yQ2UEGk
	 K+39KFdJoVRnyONjczhWngkL2NPqgkh+bKHzTKVt0wTPYpXxnb7TwudBDSniSfgGea
	 8vgNzY9Tfq1AKq00IWjPehvGXNSXVW+zReSE7Oo57mMFF3LzVqNPpBULrM22C3FeQY
	 kzMfa8BcaoEOQ==
Date: Wed, 19 Feb 2025 10:04:45 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Yu-Chun Lin <eleanor15x@gmail.com>
cc: bentiss@kernel.org, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, visitorckw@gmail.com, jserv@ccns.ncku.edu.tw, 
    kernel test robot <lkp@intel.com>
Subject: Re: [PATCH RESEND] HID: google: fix unused variable warning under
 !CONFIG_ACPI
In-Reply-To: <20250217165013.3127063-1-eleanor15x@gmail.com>
Message-ID: <1o9qp116-73rs-5202-o3rn-s1348670pn21@xreary.bet>
References: <20250217165013.3127063-1-eleanor15x@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 18 Feb 2025, Yu-Chun Lin wrote:

> As reported by the kernel test robot, the following warning occurs:
> 
> >> drivers/hid/hid-google-hammer.c:261:36: warning: 'cbas_ec_acpi_ids' defined but not used [-Wunused-const-variable=]
>      261 | static const struct acpi_device_id cbas_ec_acpi_ids[] = {
>          |                                    ^~~~~~~~~~~~~~~~
> 
> The 'cbas_ec_acpi_ids' array is only used when CONFIG_ACPI is enabled.
> Wrapping its definition and 'MODULE_DEVICE_TABLE' in '#ifdef CONFIG_ACPI'
> prevents a compiler warning when ACPI is disabled.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202501201141.jctFH5eB-lkp@intel.com/
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>

I've added

	Fixes: eb1aac4c8744f75 ("HID: google: add support tablet mode switch for Whiskers")

and applied, thanks.

-- 
Jiri Kosina
SUSE Labs


