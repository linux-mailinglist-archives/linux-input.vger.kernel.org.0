Return-Path: <linux-input+bounces-7502-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6079F9A1AD1
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2024 08:40:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 896801C2084B
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2024 06:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2853219308E;
	Thu, 17 Oct 2024 06:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qL1dy/+S"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FB015FD16;
	Thu, 17 Oct 2024 06:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729147223; cv=none; b=N35cQQtpbTcVdgSxHLBraDR+TGFyQRcmiAD9wH4MHA4B+x/nFyofrTBA5XFQ/mzQYMjWiR06FIYqOW/LuHtzpCWUm5yW4VUzlEg9qrA/zycHsf3u4kddMbv98NdPIkXlQchFc3AIfxZR2VBrFB9t0hMloem64+gyfM799oN3ZGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729147223; c=relaxed/simple;
	bh=Q3YK1YytJHA4b0L4yocqevQZD3SkUiTtzwE9kUxDuBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P+L5vsjpnprCR7iTnemxLUPLXQVSCzpVNosjBz15JuqDRv9oBznY4kpV2SARtX58Mo5LldRSjBrguwtC/xoR19Lanx4X9EiAFV90tqEh7ywg3NHuW90KQ6kGqbew2Rcv4SEaRof1xeiw8T4a5bxRwDuRFxIobWg+IcCY8cjAYyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qL1dy/+S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B8F3C4CEC3;
	Thu, 17 Oct 2024 06:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1729147222;
	bh=Q3YK1YytJHA4b0L4yocqevQZD3SkUiTtzwE9kUxDuBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qL1dy/+SiO5IHzdVF2yCqHnZHdolQ6tyRxX+MU5LSoT3iEkA8qdNuM4z/ywhAcId9
	 U9vv61Hha1JlFE5EFH1L5zCcLCLg6hbvXqbxDwerRvz9Hqm3OiOdRYe5tl+16JfuqS
	 DjjK7Q9a7gzIEbD7bVNjJS64a4NYJJHZ6P/0tQ9g=
Date: Thu, 17 Oct 2024 08:40:17 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz,
	conor+dt@kernel.org, dmitry.torokhov@gmail.com, corbet@lwn.net,
	lgirdwood@gmail.com, tiwai@suse.com, krzk+dt@kernel.org,
	pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com,
	broonie@kernel.org, bgoswami@quicinc.com, robh@kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-doc@vger.kernel.org, alsa-devel@alsa-project.org,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v29 01/33] xhci: support setting interrupt moderation
 IMOD for secondary interrupters
Message-ID: <2024101747-defog-squiggly-ef54@gregkh>
References: <20241015212915.1206789-1-quic_wcheng@quicinc.com>
 <20241015212915.1206789-2-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015212915.1206789-2-quic_wcheng@quicinc.com>

On Tue, Oct 15, 2024 at 02:28:43PM -0700, Wesley Cheng wrote:
> From: Mathias Nyman <mathias.nyman@linux.intel.com>
> 
> Allow creators of xHCI secondary interrupters to specify the interrupt
> moderation interval value in nanoseconds when creating the interrupter.
> 
> If not sure what value to use then use the xhci driver default
> xhci->imod_interval
> 
> Suggested-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> Link: https://lore.kernel.org/r/20240905143300.1959279-13-mathias.nyman@linux.intel.com
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/usb/host/xhci-mem.c | 8 +++++++-
>  drivers/usb/host/xhci.c     | 4 ++--
>  drivers/usb/host/xhci.h     | 5 ++++-
>  3 files changed, 13 insertions(+), 4 deletions(-)

This is already in 6.12-rc1, which makes me confused as to what tree you
made this series against.

thanks,

greg k-h

