Return-Path: <linux-input+bounces-8095-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB67C9C82BA
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2024 06:44:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A02A5283F32
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2024 05:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA5E517C9E8;
	Thu, 14 Nov 2024 05:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="G2yY5MiW"
X-Original-To: linux-input@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6295E15575D;
	Thu, 14 Nov 2024 05:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731563055; cv=none; b=E2mRI6EgssywvFWLlnhbzHzn1ESX2UDlziJDINwf7Jz5o4oVJS8F3o2Ue1sXfg42CAPGn4HHV2Fs/rNsGw5mkWtdrbWFycL4XPaHz2g94EJeqZKfrKZwSMuqG+VucKQyCpqajo71P2XSxnmUuKrO7Sw1DHmZS0W+yPs6ZTEMzPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731563055; c=relaxed/simple;
	bh=Mq1Amvo5dyw/nZKB9K26DD85ZWm8cSpLwue4KMBwa/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YF6Wpnt5mzcGAlLATGOhjAbwY3fHewVUgQ3SwnwTwXEolGJjIlOV/TjNX1MM1UBNB/XhTvlqxf1+7qa2obf0aJAZwriEf18mVn8ONUVlSp3RLwSQ8Lyjzi65edcIFD2x2lsi7/H9Y4PPnMJ6bj5mfg3pEfMQBaXDSSgVKzXXqDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=G2yY5MiW; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=QXxQ9FRSLryUqBSTgKHu0vabzY3e0G4xxTmaZRLrI4M=; b=G2yY5MiWQ6+QhkeYiobIMeroa5
	3vOsNkSl9YlsIBRx/cQU/9F3c5ALoyEz0Znftxi6SBdziNM9IbiZoKM1ljQyRlx+ubxWnNw1rh8Bm
	B5TJzoWF2NHcCUrzqBO/W9SJmZhvnyJmanY2kXF66LwnJbPnMsgpcy3qgGAJgQD9hlXiQwrdYmJUI
	o9LDPETMkX5FmOYJa7CHRoJHlRoRVCU9ruQNasVAOCKcRLzba2nE44VZDayTOYtfIYHqr3C32oAbS
	in1yC2h9SENoP34ORYADTAGiZJ8AFz6Y2x9masPz+b5EWJbvQyUY3WdJpkezQ4LLEgNRKURZoo+qW
	ZYvLNlKg==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tBSeF-0000000DSHd-0O42;
	Thu, 14 Nov 2024 05:44:07 +0000
Message-ID: <5bf8c9d7-fc12-4463-bc13-5af567a92065@infradead.org>
Date: Wed, 13 Nov 2024 21:44:01 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/22] HID: intel-thc-hid: intel-quickspi: Add THC
 QuickSPI driver skeleton
To: Even Xu <even.xu@intel.com>, jikos@kernel.org, bentiss@kernel.org,
 corbet@lwn.net, bagasdotme@gmail.com, aaron.ma@canonical.com
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Xinpeng Sun <xinpeng.sun@intel.com>,
 Rui Zhang <rui1.zhang@intel.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
References: <20241114053416.4085715-1-even.xu@intel.com>
 <20241114053416.4085715-12-even.xu@intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20241114053416.4085715-12-even.xu@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/13/24 9:34 PM, Even Xu wrote:
> diff --git a/drivers/hid/intel-thc-hid/Kconfig b/drivers/hid/intel-thc-hid/Kconfig
> index e7e8201287f8..0d0a3877eeb0 100644
> --- a/drivers/hid/intel-thc-hid/Kconfig
> +++ b/drivers/hid/intel-thc-hid/Kconfig
> @@ -17,4 +17,15 @@ config INTEL_THC_HID
>  
>  	  Say Y/M here if you want to support Intel THC. If unsure, say N.
>  
> +config INTEL_QUICKSPI
> +	tristate "Intel QuickSPI driver based on Intel Touch Host Controller"
> +	depends on INTEL_THC_HID
> +	help
> +	  Intel QuickSPI, base on Touch Host Controller (THC), implements

	                  based on

> +	  HIDSPI (HID over SPI) protocol. It configures THC to work at SPI
> +	  mode, and controls THC HW sequencer to accelerate HIDSPI transcation

	                         hardware                          transaction

> +	  flow.
> +
> +	  Say Y/M here if you want to support Intel QuickSPI. If unsure, say N.
> +
>  endmenu

-- 
~Randy


