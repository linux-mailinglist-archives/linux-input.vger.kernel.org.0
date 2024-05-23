Return-Path: <linux-input+bounces-3794-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A3A8CD216
	for <lists+linux-input@lfdr.de>; Thu, 23 May 2024 14:16:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACAB91F21796
	for <lists+linux-input@lfdr.de>; Thu, 23 May 2024 12:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FCBD13B5A6;
	Thu, 23 May 2024 12:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LMZ/IvNU"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB931E4B3
	for <linux-input@vger.kernel.org>; Thu, 23 May 2024 12:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716466512; cv=none; b=sf79za4DmcD0ohjnjkIJpOCHeGsiqHRSV3lYtzOe5OducydKgmbr1BOexLo5pCcrmXgvvTx2QbqvTTRxz8w6WnswyEhnym+t8sH2RQt/ix+BqE4S/NXQa8O6ZB3u00f3iw6mGgcHSoNc2GZgf2pjObboLl25b9jGplCqJzg3zhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716466512; c=relaxed/simple;
	bh=2ZV0X652sz64FF38IkXCRCDMNw6jNGE+qM3S0WG7OpI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HjGzKFlPIfaeq4cMDRUQ2LEQfxcIMwwDq+ntHsqklSsFmkbNkIT1K3ltmoHs5mD0OpYHAVDLwS66ZopWFTUpctmirBp4aeGVv17btqM4dzRd1I889YX1iIaa3jipJLOboET65GiHn551rmkQnrcK8MQWIspVA42lZ07Uvbqj9cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LMZ/IvNU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81822C2BD10;
	Thu, 23 May 2024 12:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716466511;
	bh=2ZV0X652sz64FF38IkXCRCDMNw6jNGE+qM3S0WG7OpI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LMZ/IvNUa3ZlkqEQ6BvE38Iv4OLlpl0J07liwUWsDgd42eZEcRnqQDxxY41W5CTrt
	 rbC9I3HpC/lgvB6usWdPwUR9YLcfZHdqXuIyHFrBV6HzQGF++ghU8wtNOxPP2KmcmK
	 StTBSXTQFqxozVW9xvPepHULw57HTQDIMljBI+VNM1w5H+fjTuyIQWWjExoktb2Hyb
	 hskrloF+B/fNB/iWWuTeCvjQAJeo+3Q+VxbFr33BkIM4saxS6XU0OhsBBvXLUjKsnV
	 L1m8NRYCIKYdLGehZdA/z1+MIZUlBRY7wEI7hXaTj5QXEAQHwJHC43tXVS4aOhtSXv
	 Er+hLIkjITh2Q==
Date: Thu, 23 May 2024 14:15:08 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Zhang Lixu <lixu.zhang@intel.com>
cc: linux-input@vger.kernel.org, srinivas.pandruvada@linux.intel.com, 
    benjamin.tissoires@redhat.com
Subject: Re: [PATCH] HID: intel-ish-hid: Fix build error for COMPILE_TEST
In-Reply-To: <20240523011401.705577-1-lixu.zhang@intel.com>
Message-ID: <nycvar.YFH.7.76.2405231413340.16865@cbobk.fhfr.pm>
References: <20240523011401.705577-1-lixu.zhang@intel.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 May 2024, Zhang Lixu wrote:

> kernel test robot reported build error due to a pointer type mismatch:
> 
>   .../ishtp/loader.c:172:8: error: incompatible pointer types passing
>   '__le64 *' (aka 'unsigned long long *') to parameter of type
>   'dma_addr_t *' (aka 'unsigned int *')
> 
> The issue arises because the driver, which is primarily intended for
> x86-64, is also built for i386 when COMPILE_TEST is enabled.
> 
> Resolve type mismatch by using a temporary dma_addr_t variable to hold
> the DMA address. Populate this temporary variable in dma_alloc_coherent()
> function, and then convert and store the address in the
> fragment->fragment_tbl[i].ddr_adrs field in the correct format.
> Similarly, convert the ddr_adrs field back to dma_addr_t when freeing
> the DMA buffer with dma_free_coherent().
> 
> Fixes: 579a267e4617 ("HID: intel-ish-hid: Implement loading firmware from host feature")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202405201313.SAStVPrT-lkp@intel.com/
> Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>

Applied to hid.git#for-6.9/upstream-fixes.

Thanks,

-- 
Jiri Kosina
SUSE Labs


