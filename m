Return-Path: <linux-input+bounces-9098-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED88A070AE
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 10:03:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 454051889FD8
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 09:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29D8E2147E4;
	Thu,  9 Jan 2025 09:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cGpsysft"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0252E1FFC51;
	Thu,  9 Jan 2025 09:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736413434; cv=none; b=H1Udtpcmz7PwOOY2wQn+2E0OcprYeFm6CJHimtthjeXX7ifikuJ0iXwNKQ9dlKPdw3ndrwZ/mUeuKjxMRLqo73tln1kQkulDUhPkYb+c+DUBU+PVu4b+flsRkVlviRu9XqiwwjQyKmJqrIdFVLjqjZhF615Gakq7Lqcr0STiyYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736413434; c=relaxed/simple;
	bh=bX4pqk6kwqfA0KbbWgdv9FQjvq2eqOK4YCnc/AOJGvc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=hDSsRGvHDS0R8FKvnc9NFoe79sKZRfNeAetDfgX7d4yi1F9+KXSmj+fBuS8+vlMq5gppZoPc3lqtWG0QiPhS5gETrboxcvcp2tzHQLCeGeTFAuE23VDPjY9GalcOmsXDdnTaCjTa8jA+TnkJozgIcCo2mFcoyxUhhFCLKwRnSZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cGpsysft; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47A63C4CED2;
	Thu,  9 Jan 2025 09:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736413433;
	bh=bX4pqk6kwqfA0KbbWgdv9FQjvq2eqOK4YCnc/AOJGvc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cGpsysftEN24U4kzhNVpUUupEIdWE7gFTuF/miL6xtQ7GDF4krBCThKMJRo/VYhd3
	 g+G8shpeRsUcd11r77AFUc6BBAXxev5rKHUcFEJlhFhfivciAMZe2HcKqbbdgatDiv
	 z4ZFkQIAW0q9YcFEuPdCNtYPSTBVXBE9j/c/Shzoah8LNnS31xU1uKbpPpqGWPTXXG
	 xxIkRcX3+X3eC/yTUf5294LoSFqKIQg/NmAHuK/MyA02DW4IEW5BvSIpqQvmTsh+M5
	 K9eMxaaky9d53FR7WouhqLIRuCi9hc2wWne09WMt6uZyJbAjUrYSAu+uMbAto5Erwc
	 BVcYOWYAo6BPA==
Date: Thu, 9 Jan 2025 10:03:51 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, ilpo.jarvinen@linux.intel.com, 
    Mario Limonciello <mario.limonciello@amd.com>, 
    Basavaraj Natikar <basavaraj.natikar@amd.com>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Akshata MukundShetty <akshata.mukundshetty@amd.com>, 
    Patil Rajesh Reddy <patreddy@amd.com>, platform-driver-x86@vger.kernel.org, 
    linux-input@vger.kernel.org, Patil Rajesh Reddy <Patil.Reddy@amd.com>
Subject: Re: [PATCH v2 2/2] platform/x86/amd/pmf: Get SRA sensor data from
 AMD SFH driver
In-Reply-To: <20241217151627.757477-3-Shyam-sundar.S-k@amd.com>
Message-ID: <2937457n-6519-50p4-2696-oq391s2no1s7@xreary.bet>
References: <20241217151627.757477-1-Shyam-sundar.S-k@amd.com> <20241217151627.757477-3-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 17 Dec 2024, Shyam Sundar S K wrote:

> The AMD SFH driver includes APIs to export SRA sensor data. This data is
> utilized by the AMD PMF driver to transmit SRA data to the PMF TA,
> enabling the AMD PMF driver to implement the output actions specified by
> the PMF TA.
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/pmf.h | 18 ++++++++++-
>  drivers/platform/x86/amd/pmf/spc.c | 51 ++++++++++++++++++++++++++++++
>  2 files changed, 68 insertions(+), 1 deletion(-)

Hans, can I please get your Acked-by: for these bits so that I could take 
the whole lot via hid.git?

Thanks,

-- 
Jiri Kosina
SUSE Labs


