Return-Path: <linux-input+bounces-11728-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A58A85B0E
	for <lists+linux-input@lfdr.de>; Fri, 11 Apr 2025 13:07:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1D8417854E
	for <lists+linux-input@lfdr.de>; Fri, 11 Apr 2025 11:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9AE521018F;
	Fri, 11 Apr 2025 11:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BN+AMmfA"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212761DE3C7;
	Fri, 11 Apr 2025 11:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744369483; cv=none; b=JUgrMEuyvYRVcYUfX+hvERfgp++TgRHQT3zSixAAtJAFGFSlgQEQpsZmqJ4ppWBTv9u+VONe+NyOAF8ULOogVf0J1WK2hh1pfIRPeYPWFfQCdSr244sadcZ0t2xUb9gPvU5FLHqNb/6MPVc+ILAxIEW/2tYBbtc/t1lUwCIqLB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744369483; c=relaxed/simple;
	bh=0KqGQD32cA/2yKE2JGtWJRqB0cD6N0rORycBv1UgRB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hheuEqiJW14kK8yKIWk21qnvL88fBkw6oizlal/7vTkWiTJHqpPRUZsgpD0QoHEN/Il6KhP5lX3buiW2+WugPYXWJVTt+skKYJ6rh6hlhJbppHaDEmoUX6Pjkpdm3FrG9sFlRvtnEFHC6v8ZvvLK8AVYyAaVyTBJEYaPVfQfitM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BN+AMmfA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13B5CC4CEE2;
	Fri, 11 Apr 2025 11:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744369480;
	bh=0KqGQD32cA/2yKE2JGtWJRqB0cD6N0rORycBv1UgRB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BN+AMmfAD9S58qQpIxWaib5iCJNvI4z/lfBFpjD0ocp+E/nz2mF2/zoIIvDt+wo4E
	 jkh+cz7by8Sth9cf3nLjPjQAorBQkupm+AJyCyS6fM3l6sz9ef64bVHzD7kJE0GukK
	 J1p7tqpBZPu9my3U+oYHR21j7onRTVD7mJv4Stiw=
Date: Fri, 11 Apr 2025 13:04:37 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz,
	conor+dt@kernel.org, dmitry.torokhov@gmail.com, corbet@lwn.net,
	broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, pierre-louis.bossart@linux.intel.com,
	Thinh.Nguyen@synopsys.com, tiwai@suse.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v38 00/31] Introduce QC USB SND audio offloading support
Message-ID: <2025041144-imitation-reappear-a0d9@gregkh>
References: <20250409194804.3773260-1-quic_wcheng@quicinc.com>
 <2025041029-oval-cavity-7896@gregkh>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025041029-oval-cavity-7896@gregkh>

On Thu, Apr 10, 2025 at 09:11:42AM +0200, Greg KH wrote:
> On Wed, Apr 09, 2025 at 12:47:33PM -0700, Wesley Cheng wrote:
> > Requesting to see if we can get some Acked-By tags, and merge on usb-next.
> 
> let me give it some 0-day bot testing to see how that goes...

All looks good, so let me go apply this to my usb-next branch now.

Thanks for sticking with this, I think it deserves the "most versions ever"
of a patch series award.

greg k-h

