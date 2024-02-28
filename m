Return-Path: <linux-input+bounces-2117-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA9586AEDA
	for <lists+linux-input@lfdr.de>; Wed, 28 Feb 2024 13:11:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD9E61C20D7B
	for <lists+linux-input@lfdr.de>; Wed, 28 Feb 2024 12:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06E3173539;
	Wed, 28 Feb 2024 12:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CLvPqMLc"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D771C73529
	for <linux-input@vger.kernel.org>; Wed, 28 Feb 2024 12:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709122283; cv=none; b=lFYFRQkXUJ24wB30hiEwKGmpOfQhFZhKyW6rciZ4y6ZqN9iwuZMOVJFQliclEQOU9SZ0PBT7eYfy4g/FhvObDRtCN+K5yOIv69u6tnvIOMt8k2jqqLdxBoYnQa1qXBFffdLTet9eiijAg/fZuBpWgzLdn30cx3uUGrobXsq1C3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709122283; c=relaxed/simple;
	bh=wydgLHlahHkTk+YboxpIvk9UgEx1MnqFHyl1BlO5r3I=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Co267m+gv89MeSk1RhjaxkUTcl2MQe7r1JwL+iLI818SEU3rzXkgzYhGqZIlc8L3bjo+Ze1f5aRXlW4jMmTAczqPIWgfJbcMmMQ4RroSQ9q/cM2RtOEOyPwdIuEcO5ygA8mHvBVWP6A2r3YLBJZlKLThYpy4YZ4g2jB3E9jLzu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CLvPqMLc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1883EC433F1;
	Wed, 28 Feb 2024 12:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709122282;
	bh=wydgLHlahHkTk+YboxpIvk9UgEx1MnqFHyl1BlO5r3I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CLvPqMLc3VHUM0aoRHS79oDDrQRs0dbzJlAVu/O1gIO31hLSBPZf81ns7IEfsU52m
	 phCbluzUGOVOtKS2ii+tBWkyLBtm5IQIFgIUnAqNkk38x5KbkISsuJFxU6a7VdWWSJ
	 jOp5iwjo+y9qaWICL8y142hSYRwKQ4rX2Q981Xj69LdUsBQM4qk4MZmpWiRdekw72u
	 wU29Fcki7YXyp+0l6eQc2FAI2Yk8sFM0ahGwO9KzzVpcdu5rgrmTaDbZ7EUzYs3q7D
	 9j3qNnuydi55nf9Iu16Hzc4S4UHzexMFbk49M6tzx9+v8gvwecg0xPDlL4fwLXjq0e
	 cEpoCkazy1eow==
Date: Wed, 28 Feb 2024 13:11:23 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
cc: benjamin.tissoires@redhat.com, linux-input@vger.kernel.org, 
    Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH hid-next] HID: amd_sfh: Set the AMD SFH driver to depend
 on x86
In-Reply-To: <20240228113914.3864232-1-Basavaraj.Natikar@amd.com>
Message-ID: <nycvar.YFH.7.76.2402281311130.21798@cbobk.fhfr.pm>
References: <20240228113914.3864232-1-Basavaraj.Natikar@amd.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 28 Feb 2024, Basavaraj Natikar wrote:

> Considering that amd_sfh exists only on AMD platforms, set the AMD SFH
> driver to depend on x86 to avoid build warnings or errors on other
> architectures, as shown below.
> 
> drivers/hid/amd-sfh-hid/amd_sfh_pcie.c: In function 'amd_mp2_pci_probe':
> drivers/hid/amd-sfh-hid/amd_sfh_pcie.c:413:21: error: 'boot_cpu_data'
> undeclared (first use in this function); did you mean 'boot_cpu_hwid'?
>   413 |                 if (boot_cpu_data.x86 >= 0x1A)
>       |                     ^~~~~~~~~~~~~
>       |                     boot_cpu_hwid
> 
> Fixes: 6296562f30b1 ("HID: amd_sfh: Extend MP2 register access to SFH")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/all/20240228145648.41c493ec@canb.auug.org.au/
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


