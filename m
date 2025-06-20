Return-Path: <linux-input+bounces-12975-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A61F2AE1471
	for <lists+linux-input@lfdr.de>; Fri, 20 Jun 2025 09:00:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5089C4A1E4F
	for <lists+linux-input@lfdr.de>; Fri, 20 Jun 2025 07:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C75A2226556;
	Fri, 20 Jun 2025 07:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K+Mmdhtb"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E3C225A34;
	Fri, 20 Jun 2025 07:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750402813; cv=none; b=Sa6MXBA7kGBb+guEQ9I17IEprS1IOUQwhHqkZNO8kuBVL1iYMLl24st2O1Vxamf8qEbjzV6wFW8pVkIpT77Yjd3YQL+AJmDrTUicRGN3+hNTRsXP2Rcf3PsqRbqRfSDSLcO7Hnrw0yEu+vcx4kBXxmhIQEaqpAkn4fnL6Hcf9/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750402813; c=relaxed/simple;
	bh=ZhkZKxI5HE3Y0dc4+yhW1WKBLqzqBD0VCIaJ1xAUss0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=bi0mGA+TMNCVWXqzkiDwzyuQZzgany2H2jjAy6qTjEBSiaN2iK+1axwH2nhw3Ke2JWlYPgpf9Ogzj6OCQdVh7cFZEBgCAg1BcK7dcjEmonlXLfTpTGSA6lPGE8USI0MMIVpcd9JvLuimVKS37ykXIpDdb+99F4863O90I+BTdcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K+Mmdhtb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2C16C4CEEE;
	Fri, 20 Jun 2025 07:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750402813;
	bh=ZhkZKxI5HE3Y0dc4+yhW1WKBLqzqBD0VCIaJ1xAUss0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=K+MmdhtbqHB9vMJEtXmr2ji65ubEkCB3htSSC+rSOoOizENRTuAIbqZQLWm7G2bFq
	 uzIlytffvk4CYdDTtUpIQhHdBj7JLwVHqSQfwhXZhbCI5GbZVh71P4fw2r3w1HRmoo
	 2XP2zEWzDmFvuIzukobTcM1uMajLMr4NJRGKmknvh3S1ey7wEl6tqObIQlJr3Qg2Bf
	 kWI/YTwZhcVRVRsZ13CZGRlB2WgKV8zQuPfEbS3UCQjMo46yDTfXfe+oAPIGYEMFFH
	 geTk740W7p5tc7u5HMsPeczzMI03z1KhcDzxFmfEqOujBUeWYf7Zn6YxDbJL9Qt2jn
	 6wgTtUJ+kKKuw==
Date: Fri, 20 Jun 2025 09:00:10 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    Linux Documentation <linux-doc@vger.kernel.org>, 
    Linux Input Devices <linux-input@vger.kernel.org>, 
    Benjamin Tissoires <bentiss@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Even Xu <even.xu@intel.com>, Chong Han <chong.han@intel.com>, 
    Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] HID: intel-thc-hid: Separate max input size control
 conditional list
In-Reply-To: <20250613014327.11514-1-bagasdotme@gmail.com>
Message-ID: <770p8s09-n989-p728-1s20-8nq417prr094@xreary.bet>
References: <20250613014327.11514-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 13 Jun 2025, Bagas Sanjaya wrote:

> Stephen Rothwell reports htmldocs warning:
> 
> Documentation/hid/intel-thc-hid.rst:200: ERROR: Unexpected indentation. [docutils]
> 
> Separate conditional list for max input size control by a blank line
> to fix the warning.
> 
> Fixes: 45e92a093099 ("HID: Intel-thc-hid: Intel-thc: Introduce max input size control")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/linux-next/20250611142409.7d4683b0@canb.auug.org.au/
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Applied to hid.git#for-6.17/intel-thc, thanks.

-- 
Jiri Kosina
SUSE Labs


