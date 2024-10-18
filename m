Return-Path: <linux-input+bounces-7518-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F23F9A3502
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2024 08:01:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9034A1C222A4
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2024 06:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 547DA183CD1;
	Fri, 18 Oct 2024 05:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cSyiPMGN"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C8E1822E5;
	Fri, 18 Oct 2024 05:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729230759; cv=none; b=KLaxR2uap01bStcKZ4NNN9NRVzKAha2Yw3UBDxvVryDVWCQl5IrVA6E0KHzEd6vX+zy7nx999hx4gygOBK9DneXc8DL7Xxbix8xfAMchN9RcLdffbPQvdcneMDOGJrUJ2aSr4ZfzmcNZafHI6aqzxaXoLDbZPkOpghvjEnzO3gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729230759; c=relaxed/simple;
	bh=t72qPYFH5qW9CSTUoUWBfe21Vq2ukayl51YEp/oosEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KP8m7lUDSGSs+1YiUVSA0Q/FSK63GCzmNXK0sz3/hJ17lYNrRYWMjxQuYKRP1v0IIVsk9h/+ILwYRTEKR+JSL0bQfBCzpOAZPmvTjpwIP0vxyPmw6pvoF21FscAt8xknOauKK9g/F8bsUwbZlqC3iFm5uDdGC8OKA/XV6psX/Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cSyiPMGN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB8EAC4CEC3;
	Fri, 18 Oct 2024 05:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1729230758;
	bh=t72qPYFH5qW9CSTUoUWBfe21Vq2ukayl51YEp/oosEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cSyiPMGNKU212TJ+q0GtMzycjpfO32+6AkR/8bwoCghlU21012x0Aoki6eVJI1/U+
	 6iELNc2vLqcqt7GQZsDvXNrVAYO8yAWTNuDglWB8WFpY0dGOUQxr22xiyNl/HZRJ2C
	 zYMq/2SyFRgLmomkI7ENxVvBoXwiCQGZBe4D5gqY=
Date: Fri, 18 Oct 2024 07:52:35 +0200
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
Message-ID: <2024101824-hammock-elastic-8d38@gregkh>
References: <20241015212915.1206789-1-quic_wcheng@quicinc.com>
 <20241015212915.1206789-2-quic_wcheng@quicinc.com>
 <2024101747-defog-squiggly-ef54@gregkh>
 <5847c380-75ce-492a-9a30-0899b7ebe98c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5847c380-75ce-492a-9a30-0899b7ebe98c@quicinc.com>

On Thu, Oct 17, 2024 at 05:07:12PM -0700, Wesley Cheng wrote:
> Hi Greg,
> 
> On 10/16/2024 11:40 PM, Greg KH wrote:
> > On Tue, Oct 15, 2024 at 02:28:43PM -0700, Wesley Cheng wrote:
> >> From: Mathias Nyman <mathias.nyman@linux.intel.com>
> >>
> >> Allow creators of xHCI secondary interrupters to specify the interrupt
> >> moderation interval value in nanoseconds when creating the interrupter.
> >>
> >> If not sure what value to use then use the xhci driver default
> >> xhci->imod_interval
> >>
> >> Suggested-by: Wesley Cheng <quic_wcheng@quicinc.com>
> >> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> >> Link: https://lore.kernel.org/r/20240905143300.1959279-13-mathias.nyman@linux.intel.com
> >> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >> ---
> >>  drivers/usb/host/xhci-mem.c | 8 +++++++-
> >>  drivers/usb/host/xhci.c     | 4 ++--
> >>  drivers/usb/host/xhci.h     | 5 ++++-
> >>  3 files changed, 13 insertions(+), 4 deletions(-)
> > This is already in 6.12-rc1, which makes me confused as to what tree you
> > made this series against.
> 
> Sorry, I didn't fetch the latest changes from usb-next.

It wasn't even usb-next, it was 6.12-rc1, so I don't know what tree you
based this on :(

> In this case, should I rebase and resbumit?

As the series can't be applied as-is, probably.  But I think you might
want to collect some acks from the sound people and xhci developers, as
I can't do anything with this until they look at the changes.

thanks,

greg k-h

