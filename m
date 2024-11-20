Return-Path: <linux-input+bounces-8164-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E1F9D39C7
	for <lists+linux-input@lfdr.de>; Wed, 20 Nov 2024 12:46:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E81161F22977
	for <lists+linux-input@lfdr.de>; Wed, 20 Nov 2024 11:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CFFF19F41D;
	Wed, 20 Nov 2024 11:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fJ5w4NSY"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62C81865E1;
	Wed, 20 Nov 2024 11:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732103153; cv=none; b=cgBMd+St7KMq74sUlT5z7i2jj2XAzC1W+Eprfi2HamrPXE0bpYquCgbHK8l7fb3hj0OQbd0gAlXJ49pWNqHnRLZhVKh7rzTA2Zf2HYnwfGagNMlKldqZpBjEREEW2whsT5QcvavGSu5j8+cwGl5yRRyIfakmzSsatAbyekScOXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732103153; c=relaxed/simple;
	bh=2/whBXtLl01qHsz9y/HxzllZz/4ll8CgpqYA7gqJMyU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MERRJDQginbAYQ1Bg/aPFQjCdOf5ZsX/cOBpJdbyq9Gif3J/xOdNSrLEk0FqjUmVNIzQRqnnidptAB7dmwDHwgORnfDUCRavk5a5ImoSrrodgA7ytVG3EB7pgBb3aKeEN1GI9fg8ld+qFIHqS3xiQxps9NQTb6VVnQxITekqo78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fJ5w4NSY; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732103152; x=1763639152;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=2/whBXtLl01qHsz9y/HxzllZz/4ll8CgpqYA7gqJMyU=;
  b=fJ5w4NSYw10c4vdmghBrzhsW/WtoJKoeUCkcAur+2y/IcyFhwWaPJIXS
   WHDx5M87CW/2jH0BdbhkE9JbVmm0LcjXz5Fz19d6cW9aWlezPfEX8FdWE
   Vp5HJUbQjB3Cv5HCx4PXG0OgB1Jb5RbDe3hSv/NDUYuO8brXa3ci9a8o1
   y186YCceTbrsb83nWHKAHp9Q2cIi1pH0Lg1dHJUoiqyfLIcjwKHJKI7Sm
   twaesEpUWo0inuFRYp/8zRSkq9cyYRhLmC1wMLPn91BEOpdzsqOip8qYI
   slKQik8o7mJ0I+GYarbn+DXHSZMHWBnrnn3/dNI+g/s8+Jugk+Tb6AeP5
   Q==;
X-CSE-ConnectionGUID: MQEqo+9NTtWYgnysDaly1g==
X-CSE-MsgGUID: 6n+hzpAlT5SJejW7ydmgCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="43222780"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="43222780"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 03:45:52 -0800
X-CSE-ConnectionGUID: na3r3SMiQFqhaD8+hnDfIg==
X-CSE-MsgGUID: 7KWy1XxYSUaTmmSzIbNcAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="90701180"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa008.jf.intel.com with ESMTP; 20 Nov 2024 03:45:45 -0800
Message-ID: <18a691df-e7b6-42fc-8dbc-c10c2608cd9c@linux.intel.com>
Date: Wed, 20 Nov 2024 13:48:03 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v30 01/30] usb: host: xhci: Repurpose event handler for
 skipping interrupter events
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
 <20241106193413.1730413-2-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20241106193413.1730413-2-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6.11.2024 21.33, Wesley Cheng wrote:
> Depending on the interrupter use case, the OS may only be used to handle
> the interrupter event ring clean up.  In these scenarios, event TRBs don't
> need to be handled by the OS, so introduce an xhci interrupter flag to tag
> if the events from an interrupter needs to be handled or not.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>   drivers/usb/host/xhci-ring.c | 17 +++++++++++++----
>   drivers/usb/host/xhci.h      |  1 +
>   2 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 9f1e150a1c76..b8f6983b7369 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -2931,14 +2931,22 @@ static int handle_tx_event(struct xhci_hcd *xhci,
>   }
>   
>   /*
> - * This function handles one OS-owned event on the event ring. It may drop
> - * xhci->lock between event processing (e.g. to pass up port status changes).
> + * This function handles one OS-owned event on the event ring, or ignores one event
> + * on interrupters which are non-OS owned. It may drop xhci->lock between event
> + * processing (e.g. to pass up port status changes).
>    */
>   static int xhci_handle_event_trb(struct xhci_hcd *xhci, struct xhci_interrupter *ir,
>   				 union xhci_trb *event)
>   {
>   	u32 trb_type;
>   
> +	/*
> +	 * Some interrupters do not need to handle event TRBs, as they may be
> +	 * managed by another entity, but rely on the OS to clean up.
> +	 */
> +	if (ir->skip_events)
> +		return 0;

This works for your special case but is a small step sideways from other possible xhci
secondary interrupter usecases.

We currently support just one event handler function even if we support several secondary
interrupters. Idea was to add support to pass dedicated handlers for each secondary interrupter,
set when the secondary interrupter is requested.

In your case this dedicated handler wouldn't do anything.

This patch again has a different approach, it keeps the default handler, and instead adds
flags to it, preventing it from handling the event trb.

Not sure if we should take the time and implement dedicated handlers now, even if we don't
have any real users yet, or just take this quick change and rework it later when needed.

Thanks
Mathias


