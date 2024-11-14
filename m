Return-Path: <linux-input+bounces-8094-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 585139C82B6
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2024 06:42:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 167F71F225F4
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2024 05:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A169A1494CC;
	Thu, 14 Nov 2024 05:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="E5drx4LZ"
X-Original-To: linux-input@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA1933FE;
	Thu, 14 Nov 2024 05:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731562940; cv=none; b=t8HGf4Kxv77n6Kn4mLO8chsWNbmkZUGChq/UN7l28+tDDaLEmmiKNFhkNdNPHLs0elnFOZ9KIMXMYueWvOifD70tI2GjvLRlgS0CChlON5XOFxhaP0XaLkyM1ituM4vujY3xC6Omv26Wz4kF6a9Lkp3Q65ZTBjoy4DpldZo/i+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731562940; c=relaxed/simple;
	bh=9/4HIazgMmGzKjbCDGERjNMls5pKjbHVC1ZoQUH1ixw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sv/JiRDBk846drueKezFMPoOGZLq69FtxfBYd08DgdxpP/S7fQdJ1dX9iTWzwSdJDt/M8uYvz3yF61JEE23mAWNSVBvn11QUj5HuhdNlnnnJt+2LO6M8hZ1et/wOjIZXdy50rmWfO62zWdCXMYIu46dVcIKIed8lyjWm6dGdkgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=E5drx4LZ; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6SIBLHy5MYAjWWFcjs9aXJSN806lHGK/RKSu3VgQhcE=; b=E5drx4LZUW7xOWbVbicW/GxTU7
	SFDLSpA3/vMhxl8U4yUWk+ZZK/GbCIu9tWlCCCzymkRgk8idaTBTYsTmtE0pAGj/Kl/vzsX5Krlxz
	mPPtkMqvQMXk8cM2mLKjvkPAjIuIYf4i+NgMR7Z5jl2Cm/nrDcvJHJ5vOLYmwgW7rDUovD8sziCTI
	zeWgBOdEEGLyDuLHgIf8ser56GEbGcRdRs+pVUaLMU2VMMAEVcnv74d07kbYiUlDSYDTWUiVxm+qv
	El23tZ6W3DlMiZ94FhbauE5E2yarwEBfelzhmLzwnLz0d0cSOVSypxO80GkbMo+EAn9JpyZKaSQgL
	TTPGp2iw==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tBScF-0000000DSH5-3U8k;
	Thu, 14 Nov 2024 05:42:04 +0000
Message-ID: <e16278a6-da1c-416f-a012-0aea1a4ce186@infradead.org>
Date: Wed, 13 Nov 2024 21:41:55 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/22] HID: intel-thc-hid: Add basic THC driver
 skeleton
To: Even Xu <even.xu@intel.com>, jikos@kernel.org, bentiss@kernel.org,
 corbet@lwn.net, bagasdotme@gmail.com, aaron.ma@canonical.com
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Xinpeng Sun <xinpeng.sun@intel.com>,
 Rui Zhang <rui1.zhang@intel.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
References: <20241114053416.4085715-1-even.xu@intel.com>
 <20241114053416.4085715-3-even.xu@intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20241114053416.4085715-3-even.xu@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/13/24 9:33 PM, Even Xu wrote:
> diff --git a/drivers/hid/intel-thc-hid/Kconfig b/drivers/hid/intel-thc-hid/Kconfig
> new file mode 100644
> index 000000000000..e7e8201287f8
> --- /dev/null
> +++ b/drivers/hid/intel-thc-hid/Kconfig
> @@ -0,0 +1,20 @@
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2024, Intel Corporation.
> +
> +menu "Intel THC HID Support"
> +	depends on X86_64 && PCI
> +
> +config INTEL_THC_HID
> +	tristate "Intel Touch Host Controller"
> +	select HID
> +	help
> +	  THC (Touch Host Controller) is the name of the IP block in PCH that
> +	  interface with Touch Devices (ex: touchscreen, touchpad etc.). It

	  interfaces                   (e.g.: touchscreen, touchpad, etc.). It


> +	  is comprised of 3 key functional blocks: A natively half-duplex
> +	  Quad I/O capable SPI master; A low latency I2C interface to support

	                               a low

> +	  HIDI2C compliant devices; A HW sequencer with RW DMA capability to

	                          ; and a HW
though I prefer to spell out              hardware      Read/Write

> +	  system memory.
> +
> +	  Say Y/M here if you want to support Intel THC. If unsure, say N.
> +
> +endmenu

-- 
~Randy


