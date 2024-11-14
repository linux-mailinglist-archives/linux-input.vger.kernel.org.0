Return-Path: <linux-input+bounces-8096-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0979C82BD
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2024 06:46:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B42CDB23BD4
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2024 05:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91C49158DC4;
	Thu, 14 Nov 2024 05:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qNGgxBxU"
X-Original-To: linux-input@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C12915575D;
	Thu, 14 Nov 2024 05:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731563152; cv=none; b=VKyUclLzkdW+Ms+mOujzl1D/okQNjyEepEOAkQbyvaMw+zV/DJkKgCE6+yJbFahSehLoyp6cwyvV/PlbdaOgxC2h7oCN9bkDntgPtlW1mi27nuOsiZ1AVruOBgzmAIi0dZ5FIU/BBKwXSFRuUhZtWzME7dpoUtM7NlEuyF0k/2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731563152; c=relaxed/simple;
	bh=YpYZ4XQNaecIGTkQbob24vX7yqLqOb2Gg12hJ5EP1Wk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TbxKiNkpmb1QzftHo4AO03tu4eqZoluBw+LYjuWhRoN5LNVEmJxkwYWY5QCK1zf/RU2S2HcB1smu5AeaUloA4HkSCIQ5cwZ3IRKcSSfgTltHEqumpRaFk1+GvGjYGFIDsREwnGyIvCqTC3fZFp+J/ENoi7JMzMItrwB9fXM5FaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=qNGgxBxU; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=fbpwtEaKHoqSv+7NpsTPm7xh/LRBD66D2U2t5wW/fqU=; b=qNGgxBxUC4g8FeHsyUppVqNjRI
	qTFDkMIw/QHWlyetGkTXJNA+ENFfEPJJ1N+uLowTxjtue7xRRSWARyfRJQyW7lZLKNsjndsvqh/dP
	6ZMKAVHQci11JixDuu8W5STmMm0uq1KEIgm7ciSA9fiMWxMs6Q5yh+e4nq2RyslSr7Hnf4nVcxShr
	QIOIWAp8JWBTgM7fdfPkQOSc0VPYnMr502yuucz1uzx6NINa4bDMrOKXDvZPFarkRy+oRFtrIgRWu
	6czVBmtnKpx5aHn8AzHPPbZz+biL17Ie8CCVBCxGwuHJ4qkcb1fgQyYQ3YbY+RoeQTEETTYK/pWLL
	fa+mWI4Q==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tBSfr-0000000DSIT-1RLM;
	Thu, 14 Nov 2024 05:45:47 +0000
Message-ID: <f78a4c4f-1efa-4aad-87e9-14c90d6e437f@infradead.org>
Date: Wed, 13 Nov 2024 21:45:42 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/22] HID: intel-thc-hid: intel-quicki2c: Add THC
 QuickI2C driver skeleton
To: Even Xu <even.xu@intel.com>, jikos@kernel.org, bentiss@kernel.org,
 corbet@lwn.net, bagasdotme@gmail.com, aaron.ma@canonical.com
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Xinpeng Sun <xinpeng.sun@intel.com>,
 Rui Zhang <rui1.zhang@intel.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
References: <20241114053416.4085715-1-even.xu@intel.com>
 <20241114053416.4085715-18-even.xu@intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20241114053416.4085715-18-even.xu@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/13/24 9:34 PM, Even Xu wrote:
> diff --git a/drivers/hid/intel-thc-hid/Kconfig b/drivers/hid/intel-thc-hid/Kconfig
> index 0d0a3877eeb0..275e42a4f7a1 100644
> --- a/drivers/hid/intel-thc-hid/Kconfig
> +++ b/drivers/hid/intel-thc-hid/Kconfig
> @@ -28,4 +28,15 @@ config INTEL_QUICKSPI
>  
>  	  Say Y/M here if you want to support Intel QuickSPI. If unsure, say N.
>  
> +config INTEL_QUICKI2C
> +	tristate "Intel QuickI2C driver based on Intel Touch Host Controller"
> +	depends on INTEL_THC_HID
> +	help
> +	  Intel QuickI2C, uses Touch Host Controller (THC) hardware, implements

	        QuickI2C uses

> +	  HIDI2C (HID over I2C) protocol. It configures THC to work at I2C

	                                                            in I2C

> +	  mode, and controls THC HW sequencer to accelerate HIDI2C transcation

	                         hardware                          transaction

> +	  flow.
> +
> +	  Say Y/M here if you want to support Intel QuickI2C. If unsure, say N.
> +
>  endmenu

-- 
~Randy


