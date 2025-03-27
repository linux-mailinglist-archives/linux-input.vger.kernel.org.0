Return-Path: <linux-input+bounces-11311-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D79A72D90
	for <lists+linux-input@lfdr.de>; Thu, 27 Mar 2025 11:15:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 893FC3B1D6E
	for <lists+linux-input@lfdr.de>; Thu, 27 Mar 2025 10:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9F63210F6A;
	Thu, 27 Mar 2025 10:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zGdlYsX8"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EB12101A1
	for <linux-input@vger.kernel.org>; Thu, 27 Mar 2025 10:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743070492; cv=none; b=nDGgRiIwcLZCoZjFJg2HAtqppPSbss9jxqWB8d/ZZpdkdIYmj42fgijb3fxiNgz6F4RopPdqJd3DM/u4IHuj08G0rtmejDJVMh1kkfG2bMQS0opFwuJdfuo5UWhhENAMxzTADtzs8uSJj/8a5BBxJcUejlZH6vSJeyxtrF59SoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743070492; c=relaxed/simple;
	bh=mxbeEEZf47lBmfacRgSFiJgHeXTqNm5t315sFmJV3zM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X+qjAoPmsFjt+ZpHseSdAmA1wIXmEM9Ao1qOYy9wUtlKxIXvd4YdJKzjHpFyvO6Hb6iaBnwtvAkRZ3kPbnir9kDZl3yQ7vyXUFW88jIugYkJSD/ZRgAHsZPc8fBhem2lpP1ogRYcZG3YVPyQsCYS1cjrwLSGPX/uycUf6WWFKY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zGdlYsX8; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ff799d99dcso1363153a91.1
        for <linux-input@vger.kernel.org>; Thu, 27 Mar 2025 03:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743070490; x=1743675290; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pc3MyQ5bTVTk0Ea495uvVAUetaAKtLNFPwp0wwpMVmk=;
        b=zGdlYsX8OE3pxIOrV1qgyopedM4SWkf5YILrITtiULKp/RpEz1cfeRinxEDeVchDPa
         PJbF4OBk2UK13amKZWFlP4kQP9fude0FrhxEobieKPpjV/bxqyXUtTNkkTwK3fnz/MHT
         Is+PQ7CjAbVp0o3bzvQAXGKD0wLgzuq6K991m9LOMW8D5DH8x9xfNflFqhcrlcZBHZqk
         QIpQuvetkOPfrRaqi5OVWF/WEvWgEd7S0TWsqYPGIvQE7/40KDovueE2xnFjEyPqQqiP
         bbyfO6GYnKbDProxZNzXq6bFhBFuAH5sE6XwapACvtXE3nz4gB2kpE4AB7cWjG3WBT3i
         PlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743070490; x=1743675290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pc3MyQ5bTVTk0Ea495uvVAUetaAKtLNFPwp0wwpMVmk=;
        b=SXJF4rzwy8ItVD11slDG+tbC/dgK/a/p53f6+vjLVLnz/SjP6SwGjYsa92RHvfHT9N
         zYOpxiAhEuirdYrJHKc74m3xR0hqX3UuttP0B6VZ/dDsRcEjlFk9iZhEmETz+GgVNATj
         fxDGYnWD8blzWIxx0OKVByLRKMu72EB/96KISEsDk89Rp+yMTvTmg8E2DSt04XTTpRgY
         gxLwZV9G52soj8sk3J5pZ/YMjvpfxQvzf1qrbIvMtJzgLPAV9/rT0ICflQ8Z3EzGIFWK
         t6o/KnWd7OlWlWCdGVt4O2pXkiQQq3d7kScn6NJnV6qR3IPIbqlRnkkRXvYprHjnfstb
         TN8g==
X-Forwarded-Encrypted: i=1; AJvYcCX3NE3WMzoVVhSeypSVkprH1IcpeCDM4N2TuWK1OFuANiBEbspooI9u5awXByGg6a6aI0DPvTocnVq8kg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf6cI9r3jdVMS/2jaBOm6uuFASP5x1EHiYOtRmcfGkQmeT6yS1
	65WLlovHtIz0FIRPT4O5iB7215rVxdbADk6vHdyfg9FlUoJaSKz1jRENhdCDMqnU7q1hU1jZdZE
	CWZty5RHEqDxTKJ+Ai31pAVjmte/G7ZxhSE3f
X-Gm-Gg: ASbGncv5i++91ZDUamWvN49xiKhyX4XOtMfuSehJ/jfXD0XXUdt7y3Zlgd0JkvgilpN
	AZxil//qe0suY3zHgU7cDkb3E7NYn7M6gBvQoQiOqDg9Zcwd3ww5l79X0Y3/1HCZqD1XNxpgdsF
	/6dYr+q8ieWmomNYd3/PvbpWcEEEdkyfGZgsM7TYocF0kj5m/c0gOYY/Tk
X-Google-Smtp-Source: AGHT+IFYFfGnbcoZzgqoj3zS3z/ZOLsvILu3IS5X7QoFfPLiCrgVNxsYaxaldcnkJPAfcra/KDYGINQxSk6OO4jLR2o=
X-Received: by 2002:a17:90b:48ca:b0:2ef:2f49:7d7f with SMTP id
 98e67ed59e1d1-303a8159e09mr5956060a91.18.1743070489256; Thu, 27 Mar 2025
 03:14:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319005141.312805-1-quic_wcheng@quicinc.com> <20250319005141.312805-2-quic_wcheng@quicinc.com>
In-Reply-To: <20250319005141.312805-2-quic_wcheng@quicinc.com>
From: Puma Hsu <pumahsu@google.com>
Date: Thu, 27 Mar 2025 18:13:00 +0800
X-Gm-Features: AQ5f1JoKhZI7YNZHENbM4yKeQfizBu4We5YYaZpb4JumGXdnu89E8CNxePGA4vQ
Message-ID: <CAGCq0LZsVnvVVB6=1b86qCr320tpi6r5AXz5HjPnvF=JJJAC=w@mail.gmail.com>
Subject: Re: [PATCH v36 01/31] xhci: sideband: add initial api to register a
 secondary interrupter entity
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz, 
	conor+dt@kernel.org, dmitry.torokhov@gmail.com, corbet@lwn.net, 
	broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org, 
	pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com, 
	tiwai@suse.com, robh@kernel.org, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-doc@vger.kernel.org, Mathias Nyman <mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 8:55=E2=80=AFAM Wesley Cheng <quic_wcheng@quicinc.c=
om> wrote:
>
> From: Mathias Nyman <mathias.nyman@linux.intel.com>
>
> Introduce XHCI sideband, which manages the USB endpoints being requested =
by
> a client driver.  This is used for when client drivers are attempting to
> offload USB endpoints to another entity for handling USB transfers.  XHCI
> sec intr will allow for drivers to fetch the required information about t=
he
> transfer ring, so the user can submit transfers independently.  Expose th=
e
> required APIs for drivers to register and request for a USB endpoint and =
to
> manage XHCI secondary interrupters.
>
> Driver renaming, multiple ring segment page linking, proper endpoint clea=
n
> up, and allowing module compilation added by Wesley Cheng to complete
> original concept code by Mathias Nyman.
>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> Co-developed-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>

Tested-by: Puma Hsu <pumahsu@google.com>

> ---
>  drivers/usb/host/Kconfig          |   9 +
>  drivers/usb/host/Makefile         |   4 +
>  drivers/usb/host/xhci-sideband.c  | 429 ++++++++++++++++++++++++++++++
>  drivers/usb/host/xhci.h           |   4 +
>  include/linux/usb/xhci-sideband.h |  74 ++++++
>  5 files changed, 520 insertions(+)
>  create mode 100644 drivers/usb/host/xhci-sideband.c
>  create mode 100644 include/linux/usb/xhci-sideband.h
>
> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> index d011d6c753ed..033a9a4b51fe 100644
> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -104,6 +104,15 @@ config USB_XHCI_RZV2M
>           Say 'Y' to enable the support for the xHCI host controller
>           found in Renesas RZ/V2M SoC.
>
> +config USB_XHCI_SIDEBAND
> +       bool "xHCI support for sideband"
> +       help
> +         Say 'Y' to enable the support for the xHCI sideband capability.
> +         Provide a mechanism for a sideband datapath for payload associa=
ted
> +         with audio class endpoints. This allows for an audio DSP to use
> +         xHCI USB endpoints directly, allowing CPU to sleep while playin=
g
> +         audio.
> +
>  config USB_XHCI_TEGRA
>         tristate "xHCI support for NVIDIA Tegra SoCs"
>         depends on PHY_TEGRA_XUSB
> diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
> index be4e5245c52f..4df946c05ba0 100644
> --- a/drivers/usb/host/Makefile
> +++ b/drivers/usb/host/Makefile
> @@ -32,6 +32,10 @@ endif
>  xhci-rcar-hcd-y                                +=3D xhci-rcar.o
>  xhci-rcar-hcd-$(CONFIG_USB_XHCI_RZV2M) +=3D xhci-rzv2m.o
>
> +ifneq ($(CONFIG_USB_XHCI_SIDEBAND),)
> +       xhci-hcd-y              +=3D xhci-sideband.o
> +endif
> +
>  obj-$(CONFIG_USB_PCI)  +=3D pci-quirks.o
>
>  obj-$(CONFIG_USB_EHCI_HCD)     +=3D ehci-hcd.o
> diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sid=
eband.c
> new file mode 100644
> index 000000000000..19c58ae60414
> --- /dev/null
> +++ b/drivers/usb/host/xhci-sideband.c
> @@ -0,0 +1,429 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * xHCI host controller sideband support
> + *
> + * Copyright (c) 2023-2025, Intel Corporation.
> + *
> + * Author: Mathias Nyman
> + */
> +
> +#include <linux/usb/xhci-sideband.h>
> +#include <linux/dma-direct.h>
> +
> +#include "xhci.h"
> +
> +/* sideband internal helpers */
> +static struct sg_table *
> +xhci_ring_to_sgtable(struct xhci_sideband *sb, struct xhci_ring *ring)
> +{
> +       struct xhci_segment *seg;
> +       struct sg_table *sgt;
> +       unsigned int n_pages;
> +       struct page **pages;
> +       struct device *dev;
> +       size_t sz;
> +       int i;
> +
> +       dev =3D xhci_to_hcd(sb->xhci)->self.sysdev;
> +       sz =3D ring->num_segs * TRB_SEGMENT_SIZE;
> +       n_pages =3D PAGE_ALIGN(sz) >> PAGE_SHIFT;
> +       pages =3D kvmalloc_array(n_pages, sizeof(struct page *), GFP_KERN=
EL);
> +       if (!pages)
> +               return NULL;
> +
> +       sgt =3D kzalloc(sizeof(*sgt), GFP_KERNEL);
> +       if (!sgt) {
> +               kvfree(pages);
> +               return NULL;
> +       }
> +
> +       seg =3D ring->first_seg;
> +       if (!seg)
> +               goto err;
> +       /*
> +        * Rings can potentially have multiple segments, create an array =
that
> +        * carries page references to allocated segments.  Utilize the
> +        * sg_alloc_table_from_pages() to create the sg table, and to ens=
ure
> +        * that page links are created.
> +        */
> +       for (i =3D 0; i < ring->num_segs; i++) {
> +               dma_get_sgtable(dev, sgt, seg->trbs, seg->dma,
> +                               TRB_SEGMENT_SIZE);
> +               pages[i] =3D sg_page(sgt->sgl);
> +               sg_free_table(sgt);
> +               seg =3D seg->next;
> +       }
> +
> +       if (sg_alloc_table_from_pages(sgt, pages, n_pages, 0, sz, GFP_KER=
NEL))
> +               goto err;
> +
> +       /*
> +        * Save first segment dma address to sg dma_address field for the=
 sideband
> +        * client to have access to the IOVA of the ring.
> +        */
> +       sg_dma_address(sgt->sgl) =3D ring->first_seg->dma;
> +
> +       return sgt;
> +
> +err:
> +       kvfree(pages);
> +       kfree(sgt);
> +
> +       return NULL;
> +}
> +
> +static void
> +__xhci_sideband_remove_endpoint(struct xhci_sideband *sb, struct xhci_vi=
rt_ep *ep)
> +{
> +       /*
> +        * Issue a stop endpoint command when an endpoint is removed.
> +        * The stop ep cmd handler will handle the ring cleanup.
> +        */
> +       xhci_stop_endpoint_sync(sb->xhci, ep, 0, GFP_KERNEL);
> +
> +       ep->sideband =3D NULL;
> +       sb->eps[ep->ep_index] =3D NULL;
> +}
> +
> +/* sideband api functions */
> +
> +/**
> + * xhci_sideband_add_endpoint - add endpoint to sideband access list
> + * @sb: sideband instance for this usb device
> + * @host_ep: usb host endpoint
> + *
> + * Adds an endpoint to the list of sideband accessed endpoints for this =
usb
> + * device.
> + * After an endpoint is added the sideband client can get the endpoint t=
ransfer
> + * ring buffer by calling xhci_sideband_endpoint_buffer()
> + *
> + * Return: 0 on success, negative error otherwise.
> + */
> +int
> +xhci_sideband_add_endpoint(struct xhci_sideband *sb,
> +                          struct usb_host_endpoint *host_ep)
> +{
> +       struct xhci_virt_ep *ep;
> +       unsigned int ep_index;
> +
> +       mutex_lock(&sb->mutex);
> +       ep_index =3D xhci_get_endpoint_index(&host_ep->desc);
> +       ep =3D &sb->vdev->eps[ep_index];
> +
> +       if (ep->ep_state & EP_HAS_STREAMS) {
> +               mutex_unlock(&sb->mutex);
> +               return -EINVAL;
> +       }
> +
> +       /*
> +        * Note, we don't know the DMA mask of the audio DSP device, if i=
ts
> +        * smaller than for xhci it won't be able to access the endpoint =
ring
> +        * buffer. This could be solved by not allowing the audio class d=
river
> +        * to add the endpoint the normal way, but instead offload it imm=
ediately,
> +        * and let this function add the endpoint and allocate the ring b=
uffer
> +        * with the smallest common DMA mask
> +        */
> +       if (sb->eps[ep_index] || ep->sideband) {
> +               mutex_unlock(&sb->mutex);
> +               return -EBUSY;
> +       }
> +
> +       ep->sideband =3D sb;
> +       sb->eps[ep_index] =3D ep;
> +       mutex_unlock(&sb->mutex);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(xhci_sideband_add_endpoint);
> +
> +/**
> + * xhci_sideband_remove_endpoint - remove endpoint from sideband access =
list
> + * @sb: sideband instance for this usb device
> + * @host_ep: usb host endpoint
> + *
> + * Removes an endpoint from the list of sideband accessed endpoints for =
this usb
> + * device.
> + * sideband client should no longer touch the endpoint transfer buffer a=
fter
> + * calling this.
> + *
> + * Return: 0 on success, negative error otherwise.
> + */
> +int
> +xhci_sideband_remove_endpoint(struct xhci_sideband *sb,
> +                             struct usb_host_endpoint *host_ep)
> +{
> +       struct xhci_virt_ep *ep;
> +       unsigned int ep_index;
> +
> +       mutex_lock(&sb->mutex);
> +       ep_index =3D xhci_get_endpoint_index(&host_ep->desc);
> +       ep =3D sb->eps[ep_index];
> +
> +       if (!ep || !ep->sideband || ep->sideband !=3D sb) {
> +               mutex_unlock(&sb->mutex);
> +               return -ENODEV;
> +       }
> +
> +       __xhci_sideband_remove_endpoint(sb, ep);
> +       xhci_initialize_ring_info(ep->ring);
> +       mutex_unlock(&sb->mutex);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(xhci_sideband_remove_endpoint);
> +
> +int
> +xhci_sideband_stop_endpoint(struct xhci_sideband *sb,
> +                           struct usb_host_endpoint *host_ep)
> +{
> +       struct xhci_virt_ep *ep;
> +       unsigned int ep_index;
> +
> +       ep_index =3D xhci_get_endpoint_index(&host_ep->desc);
> +       ep =3D sb->eps[ep_index];
> +
> +       if (!ep || !ep->sideband || ep->sideband !=3D sb)
> +               return -EINVAL;
> +
> +       return xhci_stop_endpoint_sync(sb->xhci, ep, 0, GFP_KERNEL);
> +}
> +EXPORT_SYMBOL_GPL(xhci_sideband_stop_endpoint);
> +
> +/**
> + * xhci_sideband_get_endpoint_buffer - gets the endpoint transfer buffer=
 address
> + * @sb: sideband instance for this usb device
> + * @host_ep: usb host endpoint
> + *
> + * Returns the address of the endpoint buffer where xHC controller reads=
 queued
> + * transfer TRBs from. This is the starting address of the ringbuffer wh=
ere the
> + * sideband client should write TRBs to.
> + *
> + * Caller needs to free the returned sg_table
> + *
> + * Return: struct sg_table * if successful. NULL otherwise.
> + */
> +struct sg_table *
> +xhci_sideband_get_endpoint_buffer(struct xhci_sideband *sb,
> +                                 struct usb_host_endpoint *host_ep)
> +{
> +       struct xhci_virt_ep *ep;
> +       unsigned int ep_index;
> +
> +       ep_index =3D xhci_get_endpoint_index(&host_ep->desc);
> +       ep =3D sb->eps[ep_index];
> +
> +       if (!ep || !ep->ring || !ep->sideband || ep->sideband !=3D sb)
> +               return NULL;
> +
> +       return xhci_ring_to_sgtable(sb, ep->ring);
> +}
> +EXPORT_SYMBOL_GPL(xhci_sideband_get_endpoint_buffer);
> +
> +/**
> + * xhci_sideband_get_event_buffer - return the event buffer for this dev=
ice
> + * @sb: sideband instance for this usb device
> + *
> + * If a secondary xhci interupter is set up for this usb device then thi=
s
> + * function returns the address of the event buffer where xHC writes
> + * the transfer completion events.
> + *
> + * Caller needs to free the returned sg_table
> + *
> + * Return: struct sg_table * if successful. NULL otherwise.
> + */
> +struct sg_table *
> +xhci_sideband_get_event_buffer(struct xhci_sideband *sb)
> +{
> +       if (!sb || !sb->ir)
> +               return NULL;
> +
> +       return xhci_ring_to_sgtable(sb, sb->ir->event_ring);
> +}
> +EXPORT_SYMBOL_GPL(xhci_sideband_get_event_buffer);
> +
> +/**
> + * xhci_sideband_create_interrupter - creates a new interrupter for this=
 sideband
> + * @sb: sideband instance for this usb device
> + * @num_seg: number of event ring segments to allocate
> + * @ip_autoclear: IP autoclearing support such as MSI implemented
> + *
> + * Sets up a xhci interrupter that can be used for this sideband accesse=
d usb
> + * device. Transfer events for this device can be routed to this interru=
pters
> + * event ring by setting the 'Interrupter Target' field correctly when q=
ueueing
> + * the transfer TRBs.
> + * Once this interrupter is created the interrupter target ID can be obt=
ained
> + * by calling xhci_sideband_interrupter_id()
> + *
> + * Returns 0 on success, negative error otherwise
> + */
> +int
> +xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
> +                                bool ip_autoclear, u32 imod_interval)
> +{
> +       int ret =3D 0;
> +
> +       if (!sb || !sb->xhci)
> +               return -ENODEV;
> +
> +       mutex_lock(&sb->mutex);
> +       if (sb->ir) {
> +               ret =3D -EBUSY;
> +               goto out;
> +       }
> +
> +       sb->ir =3D xhci_create_secondary_interrupter(xhci_to_hcd(sb->xhci=
),
> +                                                  num_seg, imod_interval=
);
> +       if (!sb->ir) {
> +               ret =3D -ENOMEM;
> +               goto out;
> +       }
> +
> +       sb->ir->ip_autoclear =3D ip_autoclear;
> +
> +out:
> +       mutex_unlock(&sb->mutex);
> +
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(xhci_sideband_create_interrupter);
> +
> +/**
> + * xhci_sideband_remove_interrupter - remove the interrupter from a side=
band
> + * @sb: sideband instance for this usb device
> + *
> + * Removes a registered interrupt for a sideband.  This would allow for =
other
> + * sideband users to utilize this interrupter.
> + */
> +void
> +xhci_sideband_remove_interrupter(struct xhci_sideband *sb)
> +{
> +       if (!sb || !sb->ir)
> +               return;
> +
> +       mutex_lock(&sb->mutex);
> +       xhci_remove_secondary_interrupter(xhci_to_hcd(sb->xhci), sb->ir);
> +
> +       sb->ir =3D NULL;
> +       mutex_unlock(&sb->mutex);
> +}
> +EXPORT_SYMBOL_GPL(xhci_sideband_remove_interrupter);
> +
> +/**
> + * xhci_sideband_interrupter_id - return the interrupter target id
> + * @sb: sideband instance for this usb device
> + *
> + * If a secondary xhci interrupter is set up for this usb device then th=
is
> + * function returns the ID used by the interrupter. The sideband client
> + * needs to write this ID to the 'Interrupter Target' field of the trans=
fer TRBs
> + * it queues on the endpoints transfer ring to ensure transfer completio=
n event
> + * are written by xHC to the correct interrupter event ring.
> + *
> + * Returns interrupter id on success, negative error othgerwise
> + */
> +int
> +xhci_sideband_interrupter_id(struct xhci_sideband *sb)
> +{
> +       if (!sb || !sb->ir)
> +               return -ENODEV;
> +
> +       return sb->ir->intr_num;
> +}
> +EXPORT_SYMBOL_GPL(xhci_sideband_interrupter_id);
> +
> +/**
> + * xhci_sideband_register - register a sideband for a usb device
> + * @intf: usb interface associated with the sideband device
> + *
> + * Allows for clients to utilize XHCI interrupters and fetch transfer an=
d event
> + * ring parameters for executing data transfers.
> + *
> + * Return: pointer to a new xhci_sideband instance if successful. NULL o=
therwise.
> + */
> +struct xhci_sideband *
> +xhci_sideband_register(struct usb_interface *intf, enum xhci_sideband_ty=
pe type)
> +{
> +       struct usb_device *udev =3D interface_to_usbdev(intf);
> +       struct usb_hcd *hcd =3D bus_to_hcd(udev->bus);
> +       struct xhci_hcd *xhci =3D hcd_to_xhci(hcd);
> +       struct xhci_virt_device *vdev;
> +       struct xhci_sideband *sb;
> +
> +       /*
> +        * Make sure the usb device is connected to a xhci controller.  F=
ail
> +        * registration if the type is anything other than  XHCI_SIDEBAND=
_VENDOR,
> +        * as this is the only type that is currently supported by xhci-s=
ideband.
> +        */
> +       if (!udev->slot_id || type !=3D XHCI_SIDEBAND_VENDOR)
> +               return NULL;
> +
> +       sb =3D kzalloc_node(sizeof(*sb), GFP_KERNEL, dev_to_node(hcd->sel=
f.sysdev));
> +       if (!sb)
> +               return NULL;
> +
> +       mutex_init(&sb->mutex);
> +
> +       /* check this device isn't already controlled via sideband */
> +       spin_lock_irq(&xhci->lock);
> +
> +       vdev =3D xhci->devs[udev->slot_id];
> +
> +       if (!vdev || vdev->sideband) {
> +               xhci_warn(xhci, "XHCI sideband for slot %d already in use=
\n",
> +                         udev->slot_id);
> +               spin_unlock_irq(&xhci->lock);
> +               kfree(sb);
> +               return NULL;
> +       }
> +
> +       sb->xhci =3D xhci;
> +       sb->vdev =3D vdev;
> +       sb->intf =3D intf;
> +       sb->type =3D type;
> +       vdev->sideband =3D sb;
> +
> +       spin_unlock_irq(&xhci->lock);
> +
> +       return sb;
> +}
> +EXPORT_SYMBOL_GPL(xhci_sideband_register);
> +
> +/**
> + * xhci_sideband_unregister - unregister sideband access to a usb device
> + * @sb: sideband instance to be unregistered
> + *
> + * Unregisters sideband access to a usb device and frees the sideband
> + * instance.
> + * After this the endpoint and interrupter event buffers should no longe=
r
> + * be accessed via sideband. The xhci driver can now take over handling
> + * the buffers.
> + */
> +void
> +xhci_sideband_unregister(struct xhci_sideband *sb)
> +{
> +       struct xhci_hcd *xhci;
> +       int i;
> +
> +       if (!sb)
> +               return;
> +
> +       xhci =3D sb->xhci;
> +
> +       mutex_lock(&sb->mutex);
> +       for (i =3D 0; i < EP_CTX_PER_DEV; i++)
> +               if (sb->eps[i])
> +                       __xhci_sideband_remove_endpoint(sb, sb->eps[i]);
> +       mutex_unlock(&sb->mutex);
> +
> +       xhci_sideband_remove_interrupter(sb);
> +
> +       spin_lock_irq(&xhci->lock);
> +       sb->xhci =3D NULL;
> +       sb->vdev->sideband =3D NULL;
> +       spin_unlock_irq(&xhci->lock);
> +
> +       kfree(sb);
> +}
> +EXPORT_SYMBOL_GPL(xhci_sideband_unregister);
> +MODULE_DESCRIPTION("xHCI sideband driver for secondary interrupter manag=
ement");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index 37860f1e3aba..39db228f0b84 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -701,6 +701,8 @@ struct xhci_virt_ep {
>         int                     next_frame_id;
>         /* Use new Isoch TRB layout needed for extended TBC support */
>         bool                    use_extended_tbc;
> +       /* set if this endpoint is controlled via sideband access*/
> +       struct xhci_sideband    *sideband;
>  };
>
>  enum xhci_overhead_type {
> @@ -763,6 +765,8 @@ struct xhci_virt_device {
>         u16                             current_mel;
>         /* Used for the debugfs interfaces. */
>         void                            *debugfs_private;
> +       /* set if this endpoint is controlled via sideband access*/
> +       struct xhci_sideband    *sideband;
>  };
>
>  /*
> diff --git a/include/linux/usb/xhci-sideband.h b/include/linux/usb/xhci-s=
ideband.h
> new file mode 100644
> index 000000000000..4b382af892fa
> --- /dev/null
> +++ b/include/linux/usb/xhci-sideband.h
> @@ -0,0 +1,74 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * xHCI host controller sideband support
> + *
> + * Copyright (c) 2023-2025, Intel Corporation.
> + *
> + * Author: Mathias Nyman <mathias.nyman@linux.intel.com>
> + */
> +#ifndef __LINUX_XHCI_SIDEBAND_H
> +#define __LINUX_XHCI_SIDEBAND_H
> +
> +#include <linux/scatterlist.h>
> +#include <linux/usb.h>
> +
> +#define        EP_CTX_PER_DEV          31      /* FIXME defined twice, f=
rom xhci.h */
> +
> +struct xhci_sideband;
> +
> +enum xhci_sideband_type {
> +       XHCI_SIDEBAND_AUDIO,
> +       XHCI_SIDEBAND_VENDOR,
> +};
> +
> +/**
> + * struct xhci_sideband - representation of a sideband accessed usb devi=
ce.
> + * @xhci: The xhci host controller the usb device is connected to
> + * @vdev: the usb device accessed via sideband
> + * @eps: array of endpoints controlled via sideband
> + * @ir: event handling and buffer for sideband accessed device
> + * @type: xHCI sideband type
> + * @mutex: mutex for sideband operations
> + * @intf: USB sideband client interface
> + *
> + * FIXME usb device accessed via sideband Keeping track of sideband acce=
ssed usb devices.
> + */
> +struct xhci_sideband {
> +       struct xhci_hcd                 *xhci;
> +       struct xhci_virt_device         *vdev;
> +       struct xhci_virt_ep             *eps[EP_CTX_PER_DEV];
> +       struct xhci_interrupter         *ir;
> +       enum xhci_sideband_type         type;
> +
> +       /* Synchronizing xHCI sideband operations with client drivers ope=
rations */
> +       struct mutex                    mutex;
> +
> +       struct usb_interface            *intf;
> +};
> +
> +struct xhci_sideband *
> +xhci_sideband_register(struct usb_interface *intf, enum xhci_sideband_ty=
pe type);
> +void
> +xhci_sideband_unregister(struct xhci_sideband *sb);
> +int
> +xhci_sideband_add_endpoint(struct xhci_sideband *sb,
> +                          struct usb_host_endpoint *host_ep);
> +int
> +xhci_sideband_remove_endpoint(struct xhci_sideband *sb,
> +                             struct usb_host_endpoint *host_ep);
> +int
> +xhci_sideband_stop_endpoint(struct xhci_sideband *sb,
> +                           struct usb_host_endpoint *host_ep);
> +struct sg_table *
> +xhci_sideband_get_endpoint_buffer(struct xhci_sideband *sb,
> +                                 struct usb_host_endpoint *host_ep);
> +struct sg_table *
> +xhci_sideband_get_event_buffer(struct xhci_sideband *sb);
> +int
> +xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
> +                                bool ip_autoclear, u32 imod_interval);
> +void
> +xhci_sideband_remove_interrupter(struct xhci_sideband *sb);
> +int
> +xhci_sideband_interrupter_id(struct xhci_sideband *sb);
> +#endif /* __LINUX_XHCI_SIDEBAND_H */
>

