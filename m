Return-Path: <linux-input+bounces-11312-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAF7A72E23
	for <lists+linux-input@lfdr.de>; Thu, 27 Mar 2025 11:48:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0057F189962E
	for <lists+linux-input@lfdr.de>; Thu, 27 Mar 2025 10:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AFC920FAA4;
	Thu, 27 Mar 2025 10:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jIpW6AQ8"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0153B12CDA5;
	Thu, 27 Mar 2025 10:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743072495; cv=none; b=TVTfKvwT0hZf4x8OmyMorLe8g72vy8sShVPFOFh4yGgoMvfQSNANhuTwfSRIS3lrKea/ynz6QE+sNnq7RfmKfNW0k4tvSvaQ0OFAy3jIeZ3x5xghY/SzCUmcFs07Ld11gdl0TIypmyPnolI7IcQCOuJt5ag7wdW3nfC8qFLmJ00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743072495; c=relaxed/simple;
	bh=cc+rihPL886jm67zgwnhpdSaWFW4sArwqBrkbQ93OEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N84Dmo7jI3DahFFqJnM715m5/IyBghvU3F4kJ9AMtkSTHAnOzZYzGUc4hrJ5DkHpGk9YRtwmvMuHQ0EqSBbGwcXpPyMRYouWwa0ZWTQZBL6/MgKwwaEVeWBI4tYLpojH++wt9EqD6EOkkV1LoVUEZ/krzdcaGIhrwsnNfWE3Isg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jIpW6AQ8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB5FCC4CEE8;
	Thu, 27 Mar 2025 10:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743072494;
	bh=cc+rihPL886jm67zgwnhpdSaWFW4sArwqBrkbQ93OEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jIpW6AQ8T5RYpWHEGnZ9YQNZSgS2s8IYLWSN7kYrB/izjUOcJHkgtE4n9udupx3ea
	 dIcro9GGdFLCLwNlHc+mCFMNOslXRLd698jpM7b2u0frFPFiBHFEP89bxH4CEBiPeN
	 j+GGTkWrFDc5xledDW6VSIOqcxtP8dSDxEU8bQZY=
Date: Thu, 27 Mar 2025 11:48:11 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Puma Hsu <pumahsu@google.com>
Cc: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
	mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
	dmitry.torokhov@gmail.com, corbet@lwn.net, broonie@kernel.org,
	lgirdwood@gmail.com, krzk+dt@kernel.org,
	pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com,
	tiwai@suse.com, robh@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-input@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v36 01/31] xhci: sideband: add initial api to register a
 secondary interrupter entity
Message-ID: <2025032756-aliens-ibuprofen-79e5@gregkh>
References: <20250319005141.312805-1-quic_wcheng@quicinc.com>
 <20250319005141.312805-2-quic_wcheng@quicinc.com>
 <CAGCq0LZoi0MOJLJYUeQJW6EfOU_Ch=v1Sg8L4_B-KhdDCx1fCw@mail.gmail.com>
 <2025032734-reward-fantasize-dc16@gregkh>
 <CAGCq0LamxvvE8b45VAshw9aWJNC2so_vK9t+pzXd3C7Y7tfYAg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGCq0LamxvvE8b45VAshw9aWJNC2so_vK9t+pzXd3C7Y7tfYAg@mail.gmail.com>

On Thu, Mar 27, 2025 at 06:14:00PM +0800, Puma Hsu wrote:
> On Thu, Mar 27, 2025 at 3:02 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Mar 27, 2025 at 02:27:00PM +0800, Puma Hsu wrote:
> > > Hi,
> > >
> > > We have implemented and verified the USB audio offloading feature with
> > > the xhci sideband driver on our Google Pixel products. We would
> > > appreciate it if this solution can be accepted. Thank you all for the
> > > work!
> > >
> >
> > Great, can you properly send a "Tested-by:" line for this against the
> > 00/XX email so that it will be properly saved?
> >
> 
> We(Google Pixel) only use the xhci sideband related changes and two
> changes in the sound card driver. For the details, what we actually
> tested are patch [01], [02], [03], [04], [05], [06], [08], and [12].
> Do I still send the "Tested-by:" line to 00/31 email? Or should I just
> send the "Tested-by:" line to the 8 changes above? (I added
> "Tested-by" line for this [01/31] first.)

Send it to the commits that you used if you only used portions.

But that feels odd, why are you only using portions here?  Why not the
whole thing?  Are you going to have to revert portions of this series in
order for your device to work properly?

> > Also, I think a new version of the series is coming, can you test that
> > to verify it works properly?  We have to wait until after -rc1 is out
> > anyway.
> >
> 
> I think this v36 is the last version of the series as I discussed with
> QCOM Wesley. And for sure I will test it if they do have a new
> version.

See:
	https://lore.kernel.org/r/ee95520b-cdcc-4e10-a70e-683993cafe36@quicinc.com
for where the need for a new version is discussed.

thanks,

greg k-h

