Return-Path: <linux-input+bounces-7619-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 331A29AB055
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2024 16:02:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7BF5DB21D68
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2024 14:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 285861A072A;
	Tue, 22 Oct 2024 14:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="X3K4hVJd"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D479C1A01CC;
	Tue, 22 Oct 2024 14:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729605740; cv=none; b=VqO005Je9pcNH9ZNzK4317nPLMMtO/DLP1lh+qGzITFhiSXwIW/4j/CJxU1Lp5hOzgO7gTPTQNQ5fmX2c0ojrwZ+CecE5X7z+4PnbnlptoRO/4re51YHA34E3capaImn2tYgn3anROEBGIJC2WWZLXGScTzTBdYNcS7MN9Gr0u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729605740; c=relaxed/simple;
	bh=LmyL3KEbkYZuNuIInWGrQBEfqsb4AkMQu7FSENmaHVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mqdk8Gju94hDMyXGzTWyXB2cT7Hf5VGlJ+S7tFdIisnLv63LE1ukL5RIWnl+Ef2TSfGvZ7rQD51sRqFIF2JOyGJHwSeY91IBLHc4jaT2Axo5Kv/2WYzOMVaP5pUN9+Q739uaAO8WuJs6VpB8K8TUPf2CLvgWnCWrD+n+M6YrLSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=X3K4hVJd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C658BC4CEE6;
	Tue, 22 Oct 2024 14:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1729605739;
	bh=LmyL3KEbkYZuNuIInWGrQBEfqsb4AkMQu7FSENmaHVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X3K4hVJdwnNbAOVCh8gkIv75QtRIj0U0iziJQUzJ3OvJ+BzSsCP39chI/kNPCd/xr
	 7cyiElt8+paHPGsCOYOa7AHtEUSFTn9Na7ha5JWevo8EOJ+zUeRbSU9rJhGzALzKt9
	 b8oA/8lxhkOqj14DpsMNKXRyTugJoprE9jTfrFdA=
Date: Tue, 22 Oct 2024 16:02:16 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
	mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
	dmitry.torokhov@gmail.com, corbet@lwn.net, lgirdwood@gmail.com,
	tiwai@suse.com, krzk+dt@kernel.org,
	pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com,
	broonie@kernel.org, bgoswami@quicinc.com, robh@kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-doc@vger.kernel.org, alsa-devel@alsa-project.org,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v29 01/33] xhci: support setting interrupt moderation
 IMOD for secondary interrupters
Message-ID: <2024102240-gag-famished-245c@gregkh>
References: <20241015212915.1206789-1-quic_wcheng@quicinc.com>
 <20241015212915.1206789-2-quic_wcheng@quicinc.com>
 <2024101747-defog-squiggly-ef54@gregkh>
 <5847c380-75ce-492a-9a30-0899b7ebe98c@quicinc.com>
 <2024101824-hammock-elastic-8d38@gregkh>
 <87wmi02qcj.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wmi02qcj.wl-tiwai@suse.de>

On Tue, Oct 22, 2024 at 03:56:44PM +0200, Takashi Iwai wrote:
> On Fri, 18 Oct 2024 07:52:35 +0200,
> Greg KH wrote:
> > 
> > On Thu, Oct 17, 2024 at 05:07:12PM -0700, Wesley Cheng wrote:
> > > Hi Greg,
> > > 
> > > On 10/16/2024 11:40 PM, Greg KH wrote:
> > > > On Tue, Oct 15, 2024 at 02:28:43PM -0700, Wesley Cheng wrote:
> > > >> From: Mathias Nyman <mathias.nyman@linux.intel.com>
> > > >>
> > > >> Allow creators of xHCI secondary interrupters to specify the interrupt
> > > >> moderation interval value in nanoseconds when creating the interrupter.
> > > >>
> > > >> If not sure what value to use then use the xhci driver default
> > > >> xhci->imod_interval
> > > >>
> > > >> Suggested-by: Wesley Cheng <quic_wcheng@quicinc.com>
> > > >> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> > > >> Link: https://lore.kernel.org/r/20240905143300.1959279-13-mathias.nyman@linux.intel.com
> > > >> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > >> ---
> > > >>  drivers/usb/host/xhci-mem.c | 8 +++++++-
> > > >>  drivers/usb/host/xhci.c     | 4 ++--
> > > >>  drivers/usb/host/xhci.h     | 5 ++++-
> > > >>  3 files changed, 13 insertions(+), 4 deletions(-)
> > > > This is already in 6.12-rc1, which makes me confused as to what tree you
> > > > made this series against.
> > > 
> > > Sorry, I didn't fetch the latest changes from usb-next.
> > 
> > It wasn't even usb-next, it was 6.12-rc1, so I don't know what tree you
> > based this on :(
> > 
> > > In this case, should I rebase and resbumit?
> > 
> > As the series can't be applied as-is, probably.  But I think you might
> > want to collect some acks from the sound people and xhci developers, as
> > I can't do anything with this until they look at the changes.
> 
> Honestly speaking, I couldn't follow fully the discussions about the
> fundamental design -- IIRC, Pierre and others had concerns to the way
> to manage the offload device via kcontrols.  Did we get consensus?

I don't think so.

> I believe that's the biggest obstacle in the audio side, i.e. what's
> visible to users.  The kernel internals can be corrected at any time
> later.

I would like to see that agreed on before I even look at the usb side.

thanks,

greg k-h

