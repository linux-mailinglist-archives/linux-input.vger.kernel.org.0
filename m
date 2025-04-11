Return-Path: <linux-input+bounces-11730-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E3DA85DF5
	for <lists+linux-input@lfdr.de>; Fri, 11 Apr 2025 14:59:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E80B16A807
	for <lists+linux-input@lfdr.de>; Fri, 11 Apr 2025 12:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B8DF2367D0;
	Fri, 11 Apr 2025 12:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="D+1poUm5"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450892367B7;
	Fri, 11 Apr 2025 12:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744376075; cv=none; b=NlgwAVb1xUnEcNXovUfDs17LZ05mJL+dOj5FTMpVAA4palwU0aFxqWSHResORKhTC4s1mJ66jUUcfnXD0BAiRBYWjNQkOJ0ueJe6QVX8cn3o8GgUh75yQlpKFRgMUjRQcK98bpk0GTR1hRKNp3UvC8RyhsN3bSnBS6Sf2s35EXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744376075; c=relaxed/simple;
	bh=1FMfL5JnI997PT62pkJADHSoxPEsKGsxLvDEqOfq+8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kC/V7kH2NIa2JbJqbq0CpNWudf0xzGfZeIXru625GrLpz/F4IgXuIjamDLvm2AVtQMnII/Ap3kiyx5sCA6RjCFfWY5XSYapoyCd2srZJNeXUiQFhaGhVvCm0Co0Q/aa509pv8ajqJBMMsmzcWUp+YeR4E/SRuWN1fh2W/tBiEEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=D+1poUm5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31EC1C4CEE2;
	Fri, 11 Apr 2025 12:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744376074;
	bh=1FMfL5JnI997PT62pkJADHSoxPEsKGsxLvDEqOfq+8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D+1poUm5qqgIM4f5Y+ygHQRvTmE/bDvELlFFTrXnk8o9amrj9+VwDjvaI3UHLLXfm
	 tuvUNtFa0w0fegdzpUTp173lRcHis64JPwwddmp2rS0SIa/5pyLHSpuJsh73wQmqaM
	 eeyHnimkbrv+XaHd28Y80irAKGZcQH0CzvNaEUXI=
Date: Fri, 11 Apr 2025 14:54:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
	mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
	dmitry.torokhov@gmail.com, corbet@lwn.net, broonie@kernel.org,
	lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com,
	tiwai@suse.com, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-input@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v38 00/31] Introduce QC USB SND audio offloading support
Message-ID: <2025041152-eternal-harmonize-d608@gregkh>
References: <20250409194804.3773260-1-quic_wcheng@quicinc.com>
 <2025041029-oval-cavity-7896@gregkh>
 <2025041144-imitation-reappear-a0d9@gregkh>
 <Z_kNr52hM-iWUgyZ@linaro.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_kNr52hM-iWUgyZ@linaro.org>

On Fri, Apr 11, 2025 at 02:40:15PM +0200, Stephan Gerhold wrote:
> Hi Greg,
> 
> On Fri, Apr 11, 2025 at 01:04:37PM +0200, Greg KH wrote:
> > On Thu, Apr 10, 2025 at 09:11:42AM +0200, Greg KH wrote:
> > > On Wed, Apr 09, 2025 at 12:47:33PM -0700, Wesley Cheng wrote:
> > > > Requesting to see if we can get some Acked-By tags, and merge on usb-next.
> > > 
> > > let me give it some 0-day bot testing to see how that goes...
> > 
> > All looks good, so let me go apply this to my usb-next branch now.
> > 
> > Thanks for sticking with this, I think it deserves the "most versions ever"
> > of a patch series award.
> > 
> 
> I have honestly no intention of blocking this series any longer, but the
> comments I raised on PATCH 26/31 are likely valid and suggest the series
> wasn't fully tested on v38. So I would personally prefer to get fixes
> and confirmation on that from Wesley and then merge v39. It doesn't feel
> like the kind of thing to fix incrementally on top, since the commit
> message is also misleading now.

I think a fixup is probably sufficient, especially as I can't rebase my
tree, and reverting all of these is just a mess.

thanks,

greg k-h

