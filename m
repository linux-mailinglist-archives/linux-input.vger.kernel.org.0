Return-Path: <linux-input+bounces-8180-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAB19D4548
	for <lists+linux-input@lfdr.de>; Thu, 21 Nov 2024 02:34:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75BC31F2256C
	for <lists+linux-input@lfdr.de>; Thu, 21 Nov 2024 01:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 161BC1BDC3;
	Thu, 21 Nov 2024 01:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Z6P0SMTd"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89811FB3;
	Thu, 21 Nov 2024 01:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732152866; cv=none; b=T1yytGpLB5aqN2k6bDGFNgIk/IScEQw6k/YvysgO0dBTS4XW9wbOut3FbYnUExsXdctvqdjgFBM/0elaS5NZovS80QTfGcMglkY5jaG8VO7IGYq7UA90Xpo/YdVJOWzCX09e9qLYetKjrGK5kED3WDI7ABDlAULX4JtwuAkdt8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732152866; c=relaxed/simple;
	bh=oo5ihjA0mkroWWKL3Kd/8ULLcQ1FBQ0PJk4VQaf4NG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JtrDEKfkbPAultc3rwdXYa/QpLmhdfiouV1PdITVUDHst8uP1GtDvqSZ1LkD/MJL0hy5S4OVbFsR0h/lDLWanXPtuS44PN6ptz94zjMG05TkMW0Kafk4UvEAtPd5ly6vndJxGNpgZ4TEJKrrc5RI4ZaCavxKGHYMKN9VGGdvDZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Z6P0SMTd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKKaRf7014434;
	Thu, 21 Nov 2024 01:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oo5ihjA0mkroWWKL3Kd/8ULLcQ1FBQ0PJk4VQaf4NG4=; b=Z6P0SMTd7gHyXC7D
	MzkccYvzYug8Q2O6Z2wfhefS12BGE88bIfPVFGsE3uvi2ANVqRLWV5/EUXxmd1ZV
	P6EYbgKa9uspINdXvdXB6NuOpXHa5vzofIQPJW0/YiMCO/9V1sKps8uZ8OcjSfWJ
	nqlRaX70cASjfUCe5FLj/06F1O80PjFMOIRKZQB1sn3YYld2szu1OVIVCjIpDqMP
	oLkLq5uOuW/1ed9xQnZq9UkTS4spmwa17IwPAlyfGClKcOmz7XhzRO9UBrzDFVhX
	uRkQwkdosuPI13H9O6IF2Gt1H6rgfU3P2N7A1EjetxXheXjfo0n2p/gxCL52PR23
	odLfCA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y97hw6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 01:34:06 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL1Y5be024059
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 01:34:05 GMT
Received: from [10.110.30.192] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 20 Nov
 2024 17:34:04 -0800
Message-ID: <2384956c-7aae-4890-8dca-f12e9874709f@quicinc.com>
Date: Wed, 20 Nov 2024 17:34:04 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v30 02/30] xhci: sec-intr: add initial api to register a
 secondary interrupter entity
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <krzk+dt@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
        <Thinh.Nguyen@synopsys.com>, <tiwai@suse.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>
References: <20241106193413.1730413-1-quic_wcheng@quicinc.com>
 <20241106193413.1730413-3-quic_wcheng@quicinc.com>
 <9b86a2c9-de7f-46b7-b63d-451ebc9c87dd@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <9b86a2c9-de7f-46b7-b63d-451ebc9c87dd@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Um56wrbbRJO-4cfL0SR0z8zTyK4gqwQe
X-Proofpoint-ORIG-GUID: Um56wrbbRJO-4cfL0SR0z8zTyK4gqwQe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411210011

Hi Mathias,

On 11/20/2024 6:36 AM, Mathias Nyman wrote:
> On 6.11.2024 21.33, Wesley Cheng wrote:
>> From: Mathias Nyman <mathias.nyman@linux.intel.com>
>>
>> Introduce XHCI sec intr, which manages the USB endpoints being requested by
>> a client driver.  This is used for when client drivers are attempting to
>> offload USB endpoints to another entity for handling USB transfers.  XHCI
>> sec intr will allow for drivers to fetch the required information about the
>> transfer ring, so the user can submit transfers independently.  Expose the
>> required APIs for drivers to register and request for a USB endpoint and to
>> manage XHCI secondary interrupters.
>>
>> Driver renaming, multiple ring segment page linking, proper endpoint clean
>> up, and allowing module compilation added by Wesley Cheng to complete
>> original concept code by Mathias Nyman.
>>
>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>> Co-developed-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>   drivers/usb/host/Kconfig          |  11 +
>>   drivers/usb/host/Makefile         |   2 +
>>   drivers/usb/host/xhci-sec-intr.c  | 438 ++++++++++++++++++++++++++++++
>>   drivers/usb/host/xhci.h           |   4 +
>>   include/linux/usb/xhci-sec-intr.h |  70 +++++
>>   5 files changed, 525 insertions(+)
>>   create mode 100644 drivers/usb/host/xhci-sec-intr.c
>>   create mode 100644 include/linux/usb/xhci-sec-intr.h
>>
>> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
>> index d011d6c753ed..a2d549e3e076 100644
>> --- a/drivers/usb/host/Kconfig
>> +++ b/drivers/usb/host/Kconfig
>> @@ -104,6 +104,17 @@ config USB_XHCI_RZV2M
>>         Say 'Y' to enable the support for the xHCI host controller
>>         found in Renesas RZ/V2M SoC.
>>   +config USB_XHCI_SEC_INTR
>> +    tristate "xHCI support for secondary interrupter management"
>> +    help
>> +      Say 'Y' to enable the support for the xHCI secondary management.
>> +      Provide a mechanism for a sideband datapath for payload associated
>> +      with audio class endpoints. This allows for an audio DSP to use
>> +      xHCI USB endpoints directly, allowing CPU to sleep while playing
>> +      audio.  This is not the same feature as the audio sideband
>> +      capability mentioned within the xHCI specification, and continues
>> +      to utilize main system memory for data transfers.
>
> This same API should be used for the hardware xHCI sideband capability.
> We should add a function that checks which types of xHC sideband capability xHC
> hardware can support, and pick and pass a type to xhci xhci_sec_intr_register()
> when registering a sideband/sec_intr

Just to make sure we're on the same page, when you mention the term sideband capability, are you referring to section 7.9 xHCI Audio Sideband Capability in the xHCI spec?  If so, I'm not entirely sure if that capability relies much on secondary interrupters.  From reading the material, it just seems like its a way to map audio endpoints directly to another USB device connected to the controller? (I might be wrong, couldn't find much about potential use cases)

>
>> +
>>   config USB_XHCI_TEGRA
>>       tristate "xHCI support for NVIDIA Tegra SoCs"
>>       depends on PHY_TEGRA_XUSB
>> diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
>> index be4e5245c52f..d4b127f48cf9 100644
>> --- a/drivers/usb/host/Makefile
>> +++ b/drivers/usb/host/Makefile
>> @@ -32,6 +32,8 @@ endif
>>   xhci-rcar-hcd-y                += xhci-rcar.o
>>   xhci-rcar-hcd-$(CONFIG_USB_XHCI_RZV2M)    += xhci-rzv2m.o
>>   +obj-$(CONFIG_USB_XHCI_SEC_INTR) += xhci-sec-intr.o
>> +
>>   obj-$(CONFIG_USB_PCI)    += pci-quirks.o
>>     obj-$(CONFIG_USB_EHCI_HCD)    += ehci-hcd.o
>> diff --git a/drivers/usb/host/xhci-sec-intr.c b/drivers/usb/host/xhci-sec-intr.c
>> new file mode 100644
>> index 000000000000..b112c3388368
>> --- /dev/null
>> +++ b/drivers/usb/host/xhci-sec-intr.c
>> @@ -0,0 +1,438 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +/*
>> + * xHCI host controller secondary interrupter management
>> + *
>> + * Provides logic for client drivers that support utilizing xHCI secondary
>> + * interrupters.
>> + *
>> + * Copyright (c) 2023-2024, Intel Corporation.
>> + *
>> + * Author: Mathias Nyman
>> + */
>> +
>> +#include <linux/usb/xhci-sec-intr.h>
>> +#include <linux/dma-direct.h>
>> +
>> +#include "xhci.h"
>> +
>> +/* internal helpers */
>> +static struct sg_table *
>> +xhci_ring_to_sgtable(struct xhci_sec_intr *si, struct xhci_ring *ring)
>> +{
>> +    struct xhci_segment *seg;
>> +    struct sg_table    *sgt;
>> +    unsigned int n_pages;
>> +    struct page **pages;
>> +    struct device *dev;
>> +    size_t sz;
>> +    int i;
>> +
>> +    dev = xhci_to_hcd(si->xhci)->self.sysdev;
>> +    sz = ring->num_segs * TRB_SEGMENT_SIZE;
>> +    n_pages = PAGE_ALIGN(sz) >> PAGE_SHIFT;
>> +    pages = kvmalloc_array(n_pages, sizeof(struct page *), GFP_KERNEL);
>> +    if (!pages)
>> +        return NULL;
>> +
>> +    sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
>> +    if (!sgt) {
>> +        kvfree(pages);
>> +        return NULL;
>> +    }
>> +
>> +    seg = ring->first_seg;
>> +    if (!seg)
>> +        goto err;
>> +    /*
>> +     * Rings can potentially have multiple segments, create an array that
>> +     * carries page references to allocated segments.  Utilize the
>> +     * sg_alloc_table_from_pages() to create the sg table, and to ensure
>> +     * that page links are created.
>> +     */
>> +    for (i = 0; i < ring->num_segs; i++) {
>> +        dma_get_sgtable(dev, sgt, seg->trbs, seg->dma,
>> +                TRB_SEGMENT_SIZE);
>> +        pages[i] = sg_page(sgt->sgl);
>> +        sg_free_table(sgt);
>> +        seg = seg->next;
>> +    }
>> +
>> +    if (sg_alloc_table_from_pages(sgt, pages, n_pages, 0, sz, GFP_KERNEL))
>> +        goto err;
>> +
>> +    /*
>> +     * Save first segment dma address to sg dma_address field for the sideband
>> +     * client to have access to the IOVA of the ring.
>> +     */
>> +    sg_dma_address(sgt->sgl) = ring->first_seg->dma;
>> +
>> +    return sgt;
>> +
>> +err:
>> +    kvfree(pages);
>> +    kfree(sgt);
>> +
>> +    return NULL;
>> +}
>> +
>> +static void
>> +__xhci_sec_intr_remove_endpoint(struct xhci_sec_intr *si, struct xhci_virt_ep *ep)
>> +{
>> +    /*
>> +     * Issue a stop endpoint command when an endpoint is removed.
>> +     * The stop ep cmd handler will handle the ring cleanup.
>> +     */
>> +    xhci_stop_endpoint_sync(si->xhci, ep, 0, GFP_KERNEL);
>> +
>> +    ep->sec = NULL;
>> +    si->eps[ep->ep_index] = NULL;
>> +}
>> +
>> +/* endpoint api functions */
>> +
>> +/**
>> + * xhci_sec_intr_add_endpoint - add endpoint to access list
>> + * @si: secondary interrupter instance for this usb device
>> + * @host_ep: usb host endpoint
>> + *
>> + * Adds an endpoint to the list of endpoints utilizing secondary interrupters
>> + * for this usb device.
>> + * After an endpoint is added the client can get the endpoint transfer ring
>> + * buffer by calling xhci_sec_intr_get_endpoint_buffer()
>> + *
>> + * Return: 0 on success, negative error otherwise.
>> + */
>> +int
>> +xhci_sec_intr_add_endpoint(struct xhci_sec_intr *si,
>> +               struct usb_host_endpoint *host_ep)
>> +{
>> +    struct xhci_virt_ep *ep;
>> +    unsigned int ep_index;
>> +
>> +    mutex_lock(&si->mutex);
>> +    ep_index = xhci_get_endpoint_index(&host_ep->desc);
>> +    ep = &si->vdev->eps[ep_index];
>> +
>> +    if (ep->ep_state & EP_HAS_STREAMS) {
>> +        mutex_unlock(&si->mutex);
>> +        return -EINVAL;
>> +    }
>> +
>> +    /*
>> +     * Note, we don't know the DMA mask of the audio DSP device, if its
>> +     * smaller than for xhci it won't be able to access the endpoint ring
>> +     * buffer. This could be solved by not allowing the audio class driver
>> +     * to add the endpoint the normal way, but instead offload it immediately,
>> +     * and let this function add the endpoint and allocate the ring buffer
>> +     * with the smallest common DMA mask
>> +     */
>> +    if (si->eps[ep_index] || ep->sec) {
>> +        mutex_unlock(&si->mutex);
>> +        return -EBUSY;
>> +    }
>> +
>> +    ep->sec = si;
>> +    si->eps[ep_index] = ep;
>> +    mutex_unlock(&si->mutex);
>
> We should probably check in xhci-mem.c if ep->sec is set before freeing the
> endpoint ring.
> We don't want the sideband client driver to touch freed rings.
> Maybe we even need a way for xhci driver to notify this sideband/sec_intr client
> in case a offloaded device or endpoint is being freed.
>
Coincidentally, we did see a corner case where there was a situation where the hub driver utilized the xhci_discover_or_reset_device() path, which the class driver is not notified on.  This is why I added some extra NULL checks on some of the XHCI sec intr API when fetching the endpoint ring address.  However, I do agree that it might not fully cover all the scenarios, because we need to ensure the audio DSP stops all transfers before the transfer ring is freed, in case the audio DSP is busy executing audio transfers.

I think we'd need a way to notify the client (either through some registered callback or notifier block), so that the offload path can be stopped before the ring is freed.  I'll write up some changes to do so and submit on the next revision.

Thanks

Wesley Cheng

> I guess usb core in most cases ensures class drivers are properly removed,
> and thus this sideband/sec_interrupt should be unregistered before xhci starts
> freeing endpoints, but I'm not sure sure this is true in all corner cases.
> This is the first time we share endpoint ring addresses.
>
> Thanks
> Mathias
>

