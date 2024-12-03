Return-Path: <linux-input+bounces-8369-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E81ED9E285D
	for <lists+linux-input@lfdr.de>; Tue,  3 Dec 2024 17:57:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB6791697B2
	for <lists+linux-input@lfdr.de>; Tue,  3 Dec 2024 16:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAAB31F8EE3;
	Tue,  3 Dec 2024 16:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="a9HWlm9G"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4CC1304BA;
	Tue,  3 Dec 2024 16:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733245057; cv=none; b=pUf/y7JNG9brNJ5WTHDP8MjYSX5xQaxU/trUpFcIJTMyvx7ZGDHe8sNc0HGw0ezVYKXZlAK4qms9lskpM0o7re1sOyxlFQXqRCFy3He5MxX/zEYGY/lAqjBSvoH1KJbD7rNYnGvG3nEJsihAG0tlpSPCOgWnVW2/Yagyj2ryyJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733245057; c=relaxed/simple;
	bh=wGKBlGJR9PYQuQmm+KN9fPDWsy9XNuxCnD1p9Jbj42g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bxbE4pgNxEUVA3c8INzdd0QLQi83VbbiTo2wepVj0bskp6ABYy08CaQ0DWA1U86Qaa0IYWC/cLYQDOmwyhKlhZaPgNzrIalQriBlz5Yb/Wln8DkcfCBNt1JqJ/7UkS6LSzhbg36p2OKoqPg98+YwCJHgPTAE5eH3Rr2juEMBeZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=a9HWlm9G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38AF0C4CECF;
	Tue,  3 Dec 2024 16:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1733245056;
	bh=wGKBlGJR9PYQuQmm+KN9fPDWsy9XNuxCnD1p9Jbj42g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a9HWlm9GsQYghXAdB/zR5ovWElWz2sGgYAbhIdEJYdM/LvFW+9filE4+EP+QnLmEP
	 zG6dFpFYYTyUsFqQyR7iEKkEHI/cBlX9Mhh2xRauscv5BAxYUPhR17HqooidCPJS2T
	 2xzN0iEuVQi6loIif9+i2LAv3i5ZkPUshTxSoa+Q=
Date: Tue, 3 Dec 2024 17:57:33 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Takashi Iwai <tiwai@suse.de>, srinivas.kandagatla@linaro.org,
	mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
	dmitry.torokhov@gmail.com, corbet@lwn.net, broonie@kernel.org,
	lgirdwood@gmail.com, krzk+dt@kernel.org, Thinh.Nguyen@synopsys.com,
	tiwai@suse.com, robh@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v30 00/30] Introduce QC USB SND audio offloading support
Message-ID: <2024120320-recant-tameness-6c81@gregkh>
References: <20241106193413.1730413-1-quic_wcheng@quicinc.com>
 <edfeb642-297e-42bb-ad09-cbf74f995514@quicinc.com>
 <2024111655-approve-throwback-e7df@gregkh>
 <2f512d8d-e5f3-4bdd-8172-37114a382a69@quicinc.com>
 <875xoi3wqw.wl-tiwai@suse.de>
 <d0da6552-238a-41be-b596-58da6840efbb@quicinc.com>
 <CF49CA0A-4562-40BC-AA98-E550E39B366A@linux.dev>
 <65273bba-5ec1-44ea-865b-fb815afccc91@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65273bba-5ec1-44ea-865b-fb815afccc91@intel.com>

On Tue, Dec 03, 2024 at 05:17:48PM +0100, Cezary Rojewski wrote:
> On 2024-12-01 4:14 AM, Pierre-Louis Bossart wrote:
> > Sorry to chime in late, I only look at email occasionally.
> > 
> 
> ...
> 
> > My Reviewed-by tags were added in the last updates. I am not sure if anyone else at Intel had the time to review this large patchset.
> > 
> > > I believe Amadeusz was still against having the two card design, and wants the routing to automatically happen when playback happens on the sound card created by the USB SND layer.  However, even with that kind of implementation, the major pieces brought in by this series should still be relevant, ie soc-usb and the vendor offload driver.  The only thing that would really change is adding a path from the USB SND PCM ops to interact with the ASoC entities.  Complexity-wise, this would obviously have a good amount of changes to the USB SND/ASoC core drivers.  Some things I can think of that we'd need to introduce:
> > 
> > The notion of two cards was agreed inside Intel as far back as 2018, when Rakesh first looked at USB offload.
> 
> 
> Well, I believe a lot has changed since then, not sure if USB Audio Offload
> (UAOL) was even stable on the Windows solution back then. Obviously we want
> to incorporate what we have learned during all that time into our solution
> before it lands on upstream.

Great, can you help review this series please?

thanks,

greg k-h

