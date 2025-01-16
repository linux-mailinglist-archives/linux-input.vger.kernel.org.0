Return-Path: <linux-input+bounces-9321-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED79A146A3
	for <lists+linux-input@lfdr.de>; Fri, 17 Jan 2025 00:43:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9C77188D02D
	for <lists+linux-input@lfdr.de>; Thu, 16 Jan 2025 23:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B4A71F790F;
	Thu, 16 Jan 2025 23:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WHfGG9VO"
X-Original-To: linux-input@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9BD1F7909;
	Thu, 16 Jan 2025 23:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737070651; cv=none; b=QLzWMQ9621lyNnm21krjH+vDTjaOlEkEhxumQvVDCBlRgeJhQOzJ1eL4bTNE96QbET4b6XSWM82wJ+eU3742izUooXa8RI2dv6MuxUk6gh/lMqaYkVm87Ee/3rcz7Dn4sY4MUnisyS6snOzGlts6mC7k8w6BlxA/OLusmo7uRvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737070651; c=relaxed/simple;
	bh=0YKHy6f/bcLpF5VIVuKk1/Swq6v/oHYwU1iWylq3WMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cwqhNUHMvhH8ltLfsSAfvDfuFyMj2H1sC3TIdNVKqKCQJEIkzwj0CnwOWRO5mZbSOJv42gJ1XxnTXpfpQHn0jv/NNhOCQJ+Iwc5fuBaHDXsMM/Am/fEgQNzuxSR1RGZa3fkb6iIf3rGZRWJ3CzbIW3ZeOGxoKksVNRRElsQOZPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=WHfGG9VO; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=Kg7ADshTT3+bvlTz1g1c05grirarq/jNWFH0AChr31c=; b=WHfGG9VOhWTmdVvrDFNfwOgCWK
	UMgYqhQNx7ROD8jDbNWCoAjhiH/Dtu5VKGS1c4EgmN2lJAPNHw7Lz8V2+Kt6fTPHuHKmxuF066jDn
	MOQVGL1Py/jdEpwe++BHE696ekOMl0D3peUw9NiWz66Be65BGtxVw+/AXXtbE8VD4tGc1idvsR3VQ
	TxmLaQuMa4UddmQRy1wR4w10wU47j0CV6AkO9C4FyJ5VXfkNGeaq0nmMgmpXZbvZqr2ZSAh9qjmvP
	I8jIEtYVnI9dAnHcOgxRVb+vpAxlPbGqYOu4fW4BTIvQnvDg2SmVedJmqN5Z0AQo9QOeGzpwrODEL
	N4fAJc9Q==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZQK-000000047no-3qci;
	Thu, 16 Jan 2025 23:37:17 +0000
Message-ID: <b167789c-6569-4813-be8c-9292fab90848@infradead.org>
Date: Thu, 16 Jan 2025 15:37:05 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v33 14/31] ASoC: Add SoC USB APIs for adding an USB
 backend
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 dmitry.torokhov@gmail.com, corbet@lwn.net, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, krzk+dt@kernel.org,
 pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com,
 robh@kernel.org, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250116232824.3748438-1-quic_wcheng@quicinc.com>
 <20250116232824.3748438-15-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250116232824.3748438-15-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/16/25 3:28 PM, Wesley Cheng wrote:
> diff --git a/sound/soc/Kconfig b/sound/soc/Kconfig
> index 5efba76abb31..d34b4fdb2930 100644
> --- a/sound/soc/Kconfig
> +++ b/sound/soc/Kconfig
> @@ -84,6 +84,16 @@ config SND_SOC_UTILS_KUNIT_TEST
>  config SND_SOC_ACPI
>  	tristate
>  
> +config SND_SOC_USB
> +	tristate "SoC based USB audio offloading"
> +	depends on SND_USB_AUDIO
> +	help
> +	  Enable this option if an ASoC platform card has support to handle
> +	  USB audio offloading.  This enables the SoC USB layer, which will
> +	  notifies the ASoC USB DPCM backend DAI link about available USB audio

	Either
	  which will notify
	or
	  which notifies

> +	  devices.  Based on the notifications, sequences to enable the audio
> +	  stream can be taken based on the design.

-- 
~Randy


