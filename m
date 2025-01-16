Return-Path: <linux-input+bounces-9323-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8E1A146D5
	for <lists+linux-input@lfdr.de>; Fri, 17 Jan 2025 00:53:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86CCE188DFDE
	for <lists+linux-input@lfdr.de>; Thu, 16 Jan 2025 23:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4994C13B58C;
	Thu, 16 Jan 2025 23:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rwG/Bkv+"
X-Original-To: linux-input@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D22C25A620;
	Thu, 16 Jan 2025 23:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737071608; cv=none; b=NKAF1aH4YFZDGWs+g21t02vxuUTOFLtKlOTv5/8lA5k4MRz/hzUvKkt9K7jCLhGScS7jkDyfED7/yHacrzyd+SdbkTX0b7ENnVHuFl3MdHpsHmD5HCgGEv1Xpi8KhstulU7D9WMEU8VkQbYuJ7TcuiUhgAaJCKpkfwyHpSWn7fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737071608; c=relaxed/simple;
	bh=fMI/wQYtRSh+mmgL4eWCJdh2SM4kuK7GivhJzyzz0Vg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PU6EprHCf5oGgmt389r/EBrX+Cr3q9Nqo53lGyB+9G168dS5lcd6+jGZwEX1TXw4kUVwup0ZQ0SiHE5tefYJd6BoN1ExW4mu7NbsdIXSknwY7qcM3tfovddS0QyCO8HxtjD6RtqZPfckQYrk608j4jeC1+5HBUtXaGoM+mlbKOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=rwG/Bkv+; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=5fBJl4wFxvNWO8lXVueuBLxocroZzh7AlOaC5uH25wA=; b=rwG/Bkv+feizVmzXLoPlZb12cK
	09/yYZLAd/rJQIQgg/M2UL20qb7/fWzAGuzvgunL+wuR+wtDMPWywewqSjcpM84MgzLDlQ9tUBxKI
	WIo0dl70RHGAApERbA9NDUMQ6GZzvbDvGCXF3z2xAIJt/cgEGI6Pp5UhkHFtqmN9aK4FB0+YQwNTf
	Y5bpmDZ/7DZYzbOJCdzyRr9p0CEEmVTKLN3QXK+pLtK06nX328f5m8XY5uPShn/iUZLMsHnYdZJBg
	oTNz3pV0MS9YPzZ8nCjAUA+IgHuRu4/qRX5j31Rh1mII3pJMnJ9ZA78WNJ8PGtYuQG0DVXT6xi1Wa
	/oW++n+Q==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZfr-00000004Ijv-0L9A;
	Thu, 16 Jan 2025 23:53:19 +0000
Message-ID: <348416d5-01c7-416d-aecb-75da46f86a80@infradead.org>
Date: Thu, 16 Jan 2025 15:53:13 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v33 24/31] ASoC: qcom: qdsp6: Add USB backend ASoC driver
 for Q6
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
 <20250116232824.3748438-25-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250116232824.3748438-25-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Similar kernel-doc comments here...

On 1/16/25 3:28 PM, Wesley Cheng wrote:
> Create a USB BE component that will register a new USB port to the ASoC USB
> framework.  This will handle determination on if the requested audio
> profile is supported by the USB device currently selected.
> 
> Check for if the PCM format is supported during the hw_params callback.  If
> the profile is not supported then the userspace ALSA entity will receive an
> error, and can take further action.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  include/sound/q6usboffload.h  |  20 +++
>  sound/soc/qcom/Kconfig        |  10 ++
>  sound/soc/qcom/qdsp6/Makefile |   1 +
>  sound/soc/qcom/qdsp6/q6usb.c  | 246 ++++++++++++++++++++++++++++++++++
>  4 files changed, 277 insertions(+)
>  create mode 100644 include/sound/q6usboffload.h
>  create mode 100644 sound/soc/qcom/qdsp6/q6usb.c
> 
> diff --git a/include/sound/q6usboffload.h b/include/sound/q6usboffload.h
> new file mode 100644
> index 000000000000..cca6d353afc3
> --- /dev/null
> +++ b/include/sound/q6usboffload.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * sound/q6usboffload.h -- QDSP6 USB offload
> + *
> + * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +/**
> + * struct q6usb_offload

Missing short description.

> + * @dev - dev handle to usb be
> + * @domain - allocated iommu domain
> + * @sid - streamID for iommu
> + * @intr_num - usb interrupter number

Wrong separator character.

> + **/
> +struct q6usb_offload {
> +	struct device *dev;
> +	struct iommu_domain *domain;
> +	long long sid;
> +	u16 intr_num;
> +};


-- 
~Randy


