Return-Path: <linux-input+bounces-5871-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A730595ED43
	for <lists+linux-input@lfdr.de>; Mon, 26 Aug 2024 11:33:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FF4D1F22319
	for <lists+linux-input@lfdr.de>; Mon, 26 Aug 2024 09:33:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46512145B10;
	Mon, 26 Aug 2024 09:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EOIanDy6"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88C1143C70;
	Mon, 26 Aug 2024 09:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724664778; cv=none; b=Z2xH97e0woklw6WltLoSC3BXAbssL2EyfM+PLgRwYDnmW6R43epjkWYLcZ/Y/KGBM9xGFLodDLMQ5ABOR3gAlrR54tWqzNZW2mWHRI+TNWkqXre8p8+UCYxT2TN+w1GPBpTm8WZXFJdCQgHRoBjsil4YOUb0Jqzhp7VFFhMtPTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724664778; c=relaxed/simple;
	bh=CNlgUOIhnZS0GrsQng07UAMdA7zQHT5HyZ7gwUjR7Rk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=afSrq7tqzAt0FBocXkWCBZ6YdC6J/hWb3uo7DV7IWFt6/s6rXpiswmopsrS6NIgdn8yXy4POtyEBCxOsfw9oMcAseK+m/xMP+vdkkmKPSu5IdWTC+gj5ONGyl5F2GBBw9gzS47VVIxbfL8UZdiIHFfWTBXNCjAo3vog/pPK5kuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EOIanDy6; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724664776; x=1756200776;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=CNlgUOIhnZS0GrsQng07UAMdA7zQHT5HyZ7gwUjR7Rk=;
  b=EOIanDy6WKVOWqNGb8VoKVTyz5MHq827hmKYXYOglpGNGU2O4KN44xJH
   MB96NL5Ql9/BBRP1aPCw6FJS7eNFu9LnMMBaS0Fgnf9xHR0UNkCGlvf84
   wtqIA38ZlIdyN3rvUXmsJerdiGtHa8LvsEkXL2UwNuz02qzAnecMIueqZ
   0HyrcFcHX9Z0b019Eq41ATGjWvcEjtTFLhiqqRH9dcsPexOzS68gY+EUy
   W7iawrrkhadQJRet03mp2NGq5p9kG5qyB7i5YddoaP2+CG3avXFMCQK3U
   m3inFtu0q5b2UXnHU1wOb/pAd0j9ML72EHDQ0ChoT5fcvdrjGEMTJVAny
   A==;
X-CSE-ConnectionGUID: /MZactx/QFC/l6uKqmMQxg==
X-CSE-MsgGUID: HKpjTBjSTeSwwz2paY1HuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="25967061"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="25967061"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 02:32:55 -0700
X-CSE-ConnectionGUID: wdvPnAEPTqmZhETgD1WLmA==
X-CSE-MsgGUID: RKvQAKVwRa24HsNafnwANQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="62134672"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO [10.245.246.121]) ([10.245.246.121])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 02:32:49 -0700
Message-ID: <9f25b900-ae1c-41af-a380-ac5e00860283@linux.intel.com>
Date: Mon, 26 Aug 2024 10:48:24 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v25 01/33] xhci: add helper to stop endpoint and wait for
 completion
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 dmitry.torokhov@gmail.com, corbet@lwn.net, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, robh@kernel.org,
 gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-doc@vger.kernel.org, alsa-devel@alsa-project.org,
 Mathias Nyman <mathias.nyman@linux.intel.com>
References: <20240823200101.26755-1-quic_wcheng@quicinc.com>
 <20240823200101.26755-2-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240823200101.26755-2-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/23/24 22:00, Wesley Cheng wrote:
> From: Mathias Nyman <mathias.nyman@linux.intel.com>
> 
> Expose xhci_stop_endpoint_sync() which is a synchronous variant of
> xhci_queue_stop_endpoint().  This is useful for client drivers that are
> using the secondary interrupters, and need to stop/clean up the current
> session.  The stop endpoint command handler will also take care of cleaning
> up the ring.
> 
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  drivers/usb/host/xhci.c | 39 +++++++++++++++++++++++++++++++++++++++
>  drivers/usb/host/xhci.h |  2 ++
>  2 files changed, 41 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 37eb37b0affa..3a051ed32907 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -2784,6 +2784,45 @@ static int xhci_reserve_bandwidth(struct xhci_hcd *xhci,
>  	return -ENOMEM;
>  }
>  
> +/*
> + * Synchronous XHCI stop endpoint helper.  Issues the stop endpoint command and
> + * waits for the command completion before returning.
> + */
> +int xhci_stop_endpoint_sync(struct xhci_hcd *xhci, struct xhci_virt_ep *ep, int suspend,
> +			    gfp_t gfp_flags)
> +{
> +	struct xhci_command *command;
> +	unsigned long flags;
> +	int ret;
> +
> +	command = xhci_alloc_command(xhci, true, gfp_flags);
> +	if (!command)
> +		return -ENOMEM;
> +
> +	spin_lock_irqsave(&xhci->lock, flags);
> +	ret = xhci_queue_stop_endpoint(xhci, command, ep->vdev->slot_id,
> +				       ep->ep_index, suspend);
> +	if (ret < 0) {
> +		spin_unlock_irqrestore(&xhci->lock, flags);
> +		goto out;
> +	}
> +
> +	xhci_ring_cmd_db(xhci);
> +	spin_unlock_irqrestore(&xhci->lock, flags);
> +
> +	wait_for_completion(command->completion);
> +
> +	if (command->status == COMP_COMMAND_ABORTED ||
> +	    command->status == COMP_COMMAND_RING_STOPPED) {
> +		xhci_warn(xhci, "Timeout while waiting for stop endpoint command\n");

nit-pick: is this really a timeout? In that case you would have used
wait_for_completion_timeout(), no?

> +		ret = -ETIME;
> +	}
> +out:
> +	xhci_free_command(xhci, command);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(xhci_stop_endpoint_sync);
>  
>  /* Issue a configure endpoint command or evaluate context command
>   * and wait for it to finish.
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index 30415158ed3c..1c6126ed55b0 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -1914,6 +1914,8 @@ void xhci_ring_doorbell_for_active_rings(struct xhci_hcd *xhci,
>  void xhci_cleanup_command_queue(struct xhci_hcd *xhci);
>  void inc_deq(struct xhci_hcd *xhci, struct xhci_ring *ring);
>  unsigned int count_trbs(u64 addr, u64 len);
> +int xhci_stop_endpoint_sync(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
> +			    int suspend, gfp_t gfp_flags);
>  
>  /* xHCI roothub code */
>  void xhci_set_link_state(struct xhci_hcd *xhci, struct xhci_port *port,


