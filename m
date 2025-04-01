Return-Path: <linux-input+bounces-11443-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CF7A774CC
	for <lists+linux-input@lfdr.de>; Tue,  1 Apr 2025 08:56:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B377E167351
	for <lists+linux-input@lfdr.de>; Tue,  1 Apr 2025 06:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48ADD1E5B66;
	Tue,  1 Apr 2025 06:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="z2VdxEfN"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73C03BBC9;
	Tue,  1 Apr 2025 06:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743490601; cv=none; b=OKiz4tSCtDJmKSzvmWVTGe1ONRCWaBFXR/glQy0TSD7mf2TCpmhGCl8xe3switHPDSx86e+ETovGulgbRm0cexd7g+/tiKCZIHBS5bKBUrzYwp8KVgLR8nTHW3pxJ7q+0PNBk5e4HIid3Ux2SGu+yexIFvJRJI0fYJf/zNN2Vh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743490601; c=relaxed/simple;
	bh=GFKxsd0OGuU+pV6q/WYGlQsX3XgcsM/kbJXOW/wuxto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Spa4DXVQpK3kSMvPawBtCGjqbq0yvTY0MqjohjEcct+WB3ZGPxMIjQkETX0c81T0mgVQENt7THK+C3hTGRS43CZvHYczwG/WAudMSM/aEc9wqD5WD2CXZ85W+YAXqqqdancN0F5NnRWcODZFg0RNmUCCs9BybEz/VqJ9RAkdeZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=z2VdxEfN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D03E2C4CEE8;
	Tue,  1 Apr 2025 06:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743490600;
	bh=GFKxsd0OGuU+pV6q/WYGlQsX3XgcsM/kbJXOW/wuxto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=z2VdxEfNTJIvE/HabgSJSvBeMu4NUAIELc43S3sHXIHHv8cDKZ309/WN1crbCrQA9
	 Qz8OStnhhm5xDZNQ2fcsGbfgQRst8oEmLyZjkAgKTX9I+So2r9h7MeNWnZdcz6tga5
	 ltKV63S7ixU3vUUNTVG7GGbS3nrdyIU8lyTi1JSM=
Date: Tue, 1 Apr 2025 07:55:13 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jung Daehwan <dh10.jung@samsung.com>
Cc: Wesley Cheng <quic_wcheng@quicinc.com>, Puma Hsu <pumahsu@google.com>,
	srinivas.kandagatla@linaro.org, mathias.nyman@intel.com,
	perex@perex.cz, conor+dt@kernel.org, dmitry.torokhov@gmail.com,
	corbet@lwn.net, broonie@kernel.org, lgirdwood@gmail.com,
	krzk+dt@kernel.org, pierre-louis.bossart@linux.intel.com,
	Thinh.Nguyen@synopsys.com, tiwai@suse.com, robh@kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v36 01/31] xhci: sideband: add initial api to register a
 secondary interrupter entity
Message-ID: <2025040109-dove-declared-9466@gregkh>
References: <20250319005141.312805-1-quic_wcheng@quicinc.com>
 <20250319005141.312805-2-quic_wcheng@quicinc.com>
 <CAGCq0LZoi0MOJLJYUeQJW6EfOU_Ch=v1Sg8L4_B-KhdDCx1fCw@mail.gmail.com>
 <2025032734-reward-fantasize-dc16@gregkh>
 <CAGCq0LamxvvE8b45VAshw9aWJNC2so_vK9t+pzXd3C7Y7tfYAg@mail.gmail.com>
 <CGME20250327161254epcas2p35ea7c80bdcefaefc645c061531dd6833@epcas2p3.samsung.com>
 <87746e66-84c1-4ff3-8b69-fbee1664eff6@quicinc.com>
 <20250401022336.GA98772@ubuntu>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401022336.GA98772@ubuntu>

On Tue, Apr 01, 2025 at 11:23:36AM +0900, Jung Daehwan wrote:
> On Thu, Mar 27, 2025 at 09:12:12AM -0700, Wesley Cheng wrote:
> > 
> > 
> > On 3/27/2025 3:14 AM, Puma Hsu wrote:
> > > On Thu, Mar 27, 2025 at 3:02 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > >>
> > >> On Thu, Mar 27, 2025 at 02:27:00PM +0800, Puma Hsu wrote:
> > >>> Hi,
> > >>>
> > >>> We have implemented and verified the USB audio offloading feature with
> > >>> the xhci sideband driver on our Google Pixel products. We would
> > >>> appreciate it if this solution can be accepted. Thank you all for the
> > >>> work!
> > >>>
> > >>
> > >> Great, can you properly send a "Tested-by:" line for this against the
> > >> 00/XX email so that it will be properly saved?
> > >>
> > > 
> > > We(Google Pixel) only use the xhci sideband related changes and two
> > > changes in the sound card driver. For the details, what we actually
> > > tested are patch [01], [02], [03], [04], [05], [06], [08], and [12].
> > > Do I still send the "Tested-by:" line to 00/31 email? Or should I just
> > > send the "Tested-by:" line to the 8 changes above? (I added
> > > "Tested-by" line for this [01/31] first.)
> > > 
> > >> Also, I think a new version of the series is coming, can you test that
> > >> to verify it works properly?  We have to wait until after -rc1 is out
> > >> anyway.
> > >>
> > > 
> > > I think this v36 is the last version of the series as I discussed with
> > > QCOM Wesley. And for sure I will test it if they do have a new
> > > version.
> > > 
> > 
> > Hi Puma,
> > 
> > I'm discussing with Stephan on the QC specific stuff, so the common changes
> > won't change on v37.  Please provide your tested-by tags for each commit,
> > so I can carry them accordingly on the next submission.  If I do end up
> > making changes to any of the common patches, I will remove your tested by
> > tag, which means you might have to test it again.
> > 
> > Thanks
> > Wesley Cheng
> > 
> > 
> > 
> 
> Hi Wesley,
> 
> Thanks for your effort to upstream usb audio offload.
> I've also used your patchset like Puma.
> ([01], [02], [03], [04], [05], [06], [08], and [12])
> 
> It works well on Exynos. Please let me know if you need also
> "Tested-by:" on our side.

Yes please.

