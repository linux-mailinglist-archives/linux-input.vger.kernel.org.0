Return-Path: <linux-input+bounces-8170-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C1E9D3DA6
	for <lists+linux-input@lfdr.de>; Wed, 20 Nov 2024 15:34:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59FC6281E1A
	for <lists+linux-input@lfdr.de>; Wed, 20 Nov 2024 14:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAFEC1AAE38;
	Wed, 20 Nov 2024 14:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ULUjmoXK"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9182EA939;
	Wed, 20 Nov 2024 14:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732113242; cv=none; b=KHVtG6D6+kdctp7l5txK0r7mNxrXMiwntlOcTxttPRk2M04IPSfBnF70I7Gw5OcIo7QrgtC0yBCC/pEk2YunS28PZjdv5KS/keNT6W7kEm7iwPKRCJGZe+ecJPZxhCkz+eXBfSv1WNsnnS84088JDmftqtp6GrVgbqu5qFA1wzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732113242; c=relaxed/simple;
	bh=f6jE4YHqQUGgN75eGWXUJ9kbNinucKH3z14BlVmeZW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IV4iwCwAhV9HXLhXDZ/pko16VL4OB4u+49oPeq0GdRsDfb3GhvP5WnRsUV5gBBm9tq+829CingHZ0Au+59dP1J3162/1Ztunxi0PyN2hnUmq2DlBLslMfTgcGeP4p9upQoYoYaehIRRDpvwWPn+ZdJmj9b9O4bGlJNqpUrXRKfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ULUjmoXK; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732113240; x=1763649240;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=f6jE4YHqQUGgN75eGWXUJ9kbNinucKH3z14BlVmeZW8=;
  b=ULUjmoXK/oVzEGE8SZ4rNycYIm6Dji4xDFrkJJEDH7yZHizJsMg/fRMw
   tI4v+VAX8/hUO2yfeWmuWAbrru79JHetrntt28wtuntQU5TkJjVni0rzQ
   L6nuqcE4LiBVVxIltDUQWBntfEszADRA/CJ28JxTzW2PIsDOuMpI0hB9b
   PIfiAwCLSeAkWlHjU9cMH79lF04s4a61MzNDiLmZB9AMb2gAdwq/T0f1a
   mtX8oJewi8zOrwBcWXoP8E2wN/FK/wLi5b9m/Jl1c/4VX6XbVvB+JwCRv
   HG4FEhJMEzbTE71B3GSU+tkKGd+Jr521hlMdJYLtBcILCFpqZhnGi04ay
   g==;
X-CSE-ConnectionGUID: Ldysh7jGR9SfEUXcOngAbQ==
X-CSE-MsgGUID: 1pBrx6qnSqW/JqDl9CPSvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="31544966"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; 
   d="scan'208";a="31544966"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 06:33:54 -0800
X-CSE-ConnectionGUID: 7HDv2UnUQhGVSJlya5RSlg==
X-CSE-MsgGUID: +1jjkapGQf+B8EB6Qily/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; 
   d="scan'208";a="90318056"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa007.jf.intel.com with ESMTP; 20 Nov 2024 06:33:50 -0800
Message-ID: <9b86a2c9-de7f-46b7-b63d-451ebc9c87dd@linux.intel.com>
Date: Wed, 20 Nov 2024 16:36:07 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v30 02/30] xhci: sec-intr: add initial api to register a
 secondary interrupter entity
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 dmitry.torokhov@gmail.com, corbet@lwn.net, broonie@kernel.org,
 lgirdwood@gmail.com, krzk+dt@kernel.org,
 pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com,
 tiwai@suse.com, robh@kernel.org, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20241106193413.1730413-1-quic_wcheng@quicinc.com>
 <20241106193413.1730413-3-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20241106193413.1730413-3-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6.11.2024 21.33, Wesley Cheng wrote:
> From: Mathias Nyman <mathias.nyman@linux.intel.com>
> 
> Introduce XHCI sec intr, which manages the USB endpoints being requested by
> a client driver.  This is used for when client drivers are attempting to
> offload USB endpoints to another entity for handling USB transfers.  XHCI
> sec intr will allow for drivers to fetch the required information about the
> transfer ring, so the user can submit transfers independently.  Expose the
> required APIs for drivers to register and request for a USB endpoint and to
> manage XHCI secondary interrupters.
> 
> Driver renaming, multiple ring segment page linking, proper endpoint clean
> up, and allowing module compilation added by Wesley Cheng to complete
> original concept code by Mathias Nyman.
> 
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> Co-developed-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>   drivers/usb/host/Kconfig          |  11 +
>   drivers/usb/host/Makefile         |   2 +
>   drivers/usb/host/xhci-sec-intr.c  | 438 ++++++++++++++++++++++++++++++
>   drivers/usb/host/xhci.h           |   4 +
>   include/linux/usb/xhci-sec-intr.h |  70 +++++
>   5 files changed, 525 insertions(+)
>   create mode 100644 drivers/usb/host/xhci-sec-intr.c
>   create mode 100644 include/linux/usb/xhci-sec-intr.h
> 
> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> index d011d6c753ed..a2d549e3e076 100644
> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -104,6 +104,17 @@ config USB_XHCI_RZV2M
>   	  Say 'Y' to enable the support for the xHCI host controller
>   	  found in Renesas RZ/V2M SoC.
>   
> +config USB_XHCI_SEC_INTR
> +	tristate "xHCI support for secondary interrupter management"
> +	help
> +	  Say 'Y' to enable the support for the xHCI secondary management.
> +	  Provide a mechanism for a sideband datapath for payload associated
> +	  with audio class endpoints. This allows for an audio DSP to use
> +	  xHCI USB endpoints directly, allowing CPU to sleep while playing
> +	  audio.  This is not the same feature as the audio sideband
> +	  capability mentioned within the xHCI specification, and continues
> +	  to utilize main system memory for data transfers.

This same API should be used for the hardware xHCI sideband capability.
We should add a function that checks which types of xHC sideband capability xHC
hardware can support, and pick and pass a type to xhci xhci_sec_intr_register()
when registering a sideband/sec_intr

> +
>   config USB_XHCI_TEGRA
>   	tristate "xHCI support for NVIDIA Tegra SoCs"
>   	depends on PHY_TEGRA_XUSB
> diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
> index be4e5245c52f..d4b127f48cf9 100644
> --- a/drivers/usb/host/Makefile
> +++ b/drivers/usb/host/Makefile
> @@ -32,6 +32,8 @@ endif
>   xhci-rcar-hcd-y				+= xhci-rcar.o
>   xhci-rcar-hcd-$(CONFIG_USB_XHCI_RZV2M)	+= xhci-rzv2m.o
>   
> +obj-$(CONFIG_USB_XHCI_SEC_INTR) += xhci-sec-intr.o
> +
>   obj-$(CONFIG_USB_PCI)	+= pci-quirks.o
>   
>   obj-$(CONFIG_USB_EHCI_HCD)	+= ehci-hcd.o
> diff --git a/drivers/usb/host/xhci-sec-intr.c b/drivers/usb/host/xhci-sec-intr.c
> new file mode 100644
> index 000000000000..b112c3388368
> --- /dev/null
> +++ b/drivers/usb/host/xhci-sec-intr.c
> @@ -0,0 +1,438 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * xHCI host controller secondary interrupter management
> + *
> + * Provides logic for client drivers that support utilizing xHCI secondary
> + * interrupters.
> + *
> + * Copyright (c) 2023-2024, Intel Corporation.
> + *
> + * Author: Mathias Nyman
> + */
> +
> +#include <linux/usb/xhci-sec-intr.h>
> +#include <linux/dma-direct.h>
> +
> +#include "xhci.h"
> +
> +/* internal helpers */
> +static struct sg_table *
> +xhci_ring_to_sgtable(struct xhci_sec_intr *si, struct xhci_ring *ring)
> +{
> +	struct xhci_segment *seg;
> +	struct sg_table	*sgt;
> +	unsigned int n_pages;
> +	struct page **pages;
> +	struct device *dev;
> +	size_t sz;
> +	int i;
> +
> +	dev = xhci_to_hcd(si->xhci)->self.sysdev;
> +	sz = ring->num_segs * TRB_SEGMENT_SIZE;
> +	n_pages = PAGE_ALIGN(sz) >> PAGE_SHIFT;
> +	pages = kvmalloc_array(n_pages, sizeof(struct page *), GFP_KERNEL);
> +	if (!pages)
> +		return NULL;
> +
> +	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
> +	if (!sgt) {
> +		kvfree(pages);
> +		return NULL;
> +	}
> +
> +	seg = ring->first_seg;
> +	if (!seg)
> +		goto err;
> +	/*
> +	 * Rings can potentially have multiple segments, create an array that
> +	 * carries page references to allocated segments.  Utilize the
> +	 * sg_alloc_table_from_pages() to create the sg table, and to ensure
> +	 * that page links are created.
> +	 */
> +	for (i = 0; i < ring->num_segs; i++) {
> +		dma_get_sgtable(dev, sgt, seg->trbs, seg->dma,
> +				TRB_SEGMENT_SIZE);
> +		pages[i] = sg_page(sgt->sgl);
> +		sg_free_table(sgt);
> +		seg = seg->next;
> +	}
> +
> +	if (sg_alloc_table_from_pages(sgt, pages, n_pages, 0, sz, GFP_KERNEL))
> +		goto err;
> +
> +	/*
> +	 * Save first segment dma address to sg dma_address field for the sideband
> +	 * client to have access to the IOVA of the ring.
> +	 */
> +	sg_dma_address(sgt->sgl) = ring->first_seg->dma;
> +
> +	return sgt;
> +
> +err:
> +	kvfree(pages);
> +	kfree(sgt);
> +
> +	return NULL;
> +}
> +
> +static void
> +__xhci_sec_intr_remove_endpoint(struct xhci_sec_intr *si, struct xhci_virt_ep *ep)
> +{
> +	/*
> +	 * Issue a stop endpoint command when an endpoint is removed.
> +	 * The stop ep cmd handler will handle the ring cleanup.
> +	 */
> +	xhci_stop_endpoint_sync(si->xhci, ep, 0, GFP_KERNEL);
> +
> +	ep->sec = NULL;
> +	si->eps[ep->ep_index] = NULL;
> +}
> +
> +/* endpoint api functions */
> +
> +/**
> + * xhci_sec_intr_add_endpoint - add endpoint to access list
> + * @si: secondary interrupter instance for this usb device
> + * @host_ep: usb host endpoint
> + *
> + * Adds an endpoint to the list of endpoints utilizing secondary interrupters
> + * for this usb device.
> + * After an endpoint is added the client can get the endpoint transfer ring
> + * buffer by calling xhci_sec_intr_get_endpoint_buffer()
> + *
> + * Return: 0 on success, negative error otherwise.
> + */
> +int
> +xhci_sec_intr_add_endpoint(struct xhci_sec_intr *si,
> +			   struct usb_host_endpoint *host_ep)
> +{
> +	struct xhci_virt_ep *ep;
> +	unsigned int ep_index;
> +
> +	mutex_lock(&si->mutex);
> +	ep_index = xhci_get_endpoint_index(&host_ep->desc);
> +	ep = &si->vdev->eps[ep_index];
> +
> +	if (ep->ep_state & EP_HAS_STREAMS) {
> +		mutex_unlock(&si->mutex);
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * Note, we don't know the DMA mask of the audio DSP device, if its
> +	 * smaller than for xhci it won't be able to access the endpoint ring
> +	 * buffer. This could be solved by not allowing the audio class driver
> +	 * to add the endpoint the normal way, but instead offload it immediately,
> +	 * and let this function add the endpoint and allocate the ring buffer
> +	 * with the smallest common DMA mask
> +	 */
> +	if (si->eps[ep_index] || ep->sec) {
> +		mutex_unlock(&si->mutex);
> +		return -EBUSY;
> +	}
> +
> +	ep->sec = si;
> +	si->eps[ep_index] = ep;
> +	mutex_unlock(&si->mutex);

We should probably check in xhci-mem.c if ep->sec is set before freeing the
endpoint ring.
We don't want the sideband client driver to touch freed rings.
Maybe we even need a way for xhci driver to notify this sideband/sec_intr client
in case a offloaded device or endpoint is being freed.

I guess usb core in most cases ensures class drivers are properly removed,
and thus this sideband/sec_interrupt should be unregistered before xhci starts
freeing endpoints, but I'm not sure sure this is true in all corner cases.
This is the first time we share endpoint ring addresses.

Thanks
Mathias


