Return-Path: <linux-input+bounces-10034-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7236A358FB
	for <lists+linux-input@lfdr.de>; Fri, 14 Feb 2025 09:34:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D24CB3ACE6F
	for <lists+linux-input@lfdr.de>; Fri, 14 Feb 2025 08:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05AA1224885;
	Fri, 14 Feb 2025 08:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FNu+xLOR"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D501F8908;
	Fri, 14 Feb 2025 08:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739522040; cv=none; b=Hw4CYF4Yi3WTI7JPCoOdr2GJ0E57f1+9htbX+DZoUPCfykpP7PLWch1FvmmcnxpuEwTe8G4aB6l2e/T/V8OOpFOnm3wgJFCI1tXkgLTBxevIH8KhlRxQF6VAkwu9/iVObMRvIdjRf3QYjqV9usaH6LRcpwqc4IM82ttV2iO+j7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739522040; c=relaxed/simple;
	bh=nmFhArK4AnTrdKpCbsSm7ZRbrnkx1riW9CxzZjbQ13c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=geGJ2Z6n9ErvzZp+AwPIM7AeQfLUrjw+WQ4iyekq2pfWpknEpLH8W+43bdL4YLCH9cQ0/YZLWsiBGMAUoL5nvE6YohVKkQ3jn8AhHW2nWDCm5/Wni4aWyQJ1tpIPIOxc90ZMNlZaJmrsTXNBmP5w1TY5KBM+CYmLfEEwBIfDAT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FNu+xLOR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E1CFC4CED1;
	Fri, 14 Feb 2025 08:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739522040;
	bh=nmFhArK4AnTrdKpCbsSm7ZRbrnkx1riW9CxzZjbQ13c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FNu+xLORwYR2hpmCMVT+Fa2ZI7TmUVcx9/ewk/dKUWZvhue46gFLY/h6OnLMjhAXQ
	 dATpap4eb99CGMFgyqHAzM7wOFTc+1t7Ra4obRg9GI+zPf+jDa/GJEp3NB+RFw1nnB
	 +w5KwVYciGgH9iIQQtZjFcUgXwMf4GG5YZ+Wk/ow=
Date: Fri, 14 Feb 2025 09:33:18 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz,
	conor+dt@kernel.org, dmitry.torokhov@gmail.com, corbet@lwn.net,
	broonie@kernel.org, lgirdwood@gmail.com, tiwai@suse.com,
	krzk+dt@kernel.org, pierre-louis.bossart@linux.intel.com,
	Thinh.Nguyen@synopsys.com, robh@kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v34 00/31] Introduce QC USB SND audio offloading support
Message-ID: <2025021413-favorable-manatee-6859@gregkh>
References: <20250121210518.2436771-1-quic_wcheng@quicinc.com>
 <3b9447e2-4be8-479b-a418-5fd45369fb55@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b9447e2-4be8-479b-a418-5fd45369fb55@quicinc.com>

On Tue, Feb 11, 2025 at 12:35:23PM -0800, Wesley Cheng wrote:
> Hi,
> 
> On 1/21/2025 1:04 PM, Wesley Cheng wrote:
> > Requesting to see if we can get some Acked-By tags, and merge on usb-next.
> > 
> 
> Just seeing if we have any further feedback on this series? Thanks.

Given the lack of responses, and the huge number of iterations of this,
I've applied it now to my usb-testing branch to give 0-day some better
runs at it.  If it passes that in a few days, I'll move it to my
usb-next branch for inclusion into linux-next and hopefully 6.15-rc1.

thanks for sticking with this!

greg k-h

