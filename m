Return-Path: <linux-input+bounces-8119-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE189CFD00
	for <lists+linux-input@lfdr.de>; Sat, 16 Nov 2024 08:42:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1BF9286010
	for <lists+linux-input@lfdr.de>; Sat, 16 Nov 2024 07:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18789191F92;
	Sat, 16 Nov 2024 07:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bq6/7bie"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4DF190462;
	Sat, 16 Nov 2024 07:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731742969; cv=none; b=Or9jd+sXAWJYYzj6qn7B80n3h4NwBwXJ0kNJCcZoW5VbnNhFke4IwvwK8052pYCSuoFgEvLxJEowb5d3dHMs6xlOU/hvQufzuTfzgHTeitiJQPkSVFjol928Pvtw0nvcoLmqpdTRCGprl8RYe9oMKldBf9wc6mEOKPBjkAm7oMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731742969; c=relaxed/simple;
	bh=9hoNfWiopjM2WDnJEC9rERz7WmJEo0Y7eLyng1Sev4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aj/an85t8MwbcRqBcRmYV7d8NwZAA+Yrj4OAhI4nBgIRcY5pNUtMcfKR/HhgCxb7/Bw7ol/wyVJNYK2O4s3PLp9Rwa7MmOR3/HKHR+nMyG65X3UUaUfxwSQ1xXjxc38YAMHsFWuv0Ilc6wzTTDUNNPPHp/6K7z65iQ7jhYXdL4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bq6/7bie; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B56DC4CEC3;
	Sat, 16 Nov 2024 07:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1731742968;
	bh=9hoNfWiopjM2WDnJEC9rERz7WmJEo0Y7eLyng1Sev4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bq6/7bie3iTZI2KD72eBWk4n2GxnMJoqIfzsnZdKL4Td3fsO8D4FqKBlXvOm6tbv+
	 NXdfca/WKJ4ynTQxyTsD+T0H/Pj6pZI2Txvn0FD+jyORgTZ+9vVgebIuz6SbtiCrGr
	 jwa12quYXluFcQ+xRgBq05YvNR8cv/UTujuy5wfA=
Date: Sat, 16 Nov 2024 08:42:24 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz,
	conor+dt@kernel.org, dmitry.torokhov@gmail.com, corbet@lwn.net,
	broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org,
	pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com,
	tiwai@suse.com, robh@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v30 00/30] Introduce QC USB SND audio offloading support
Message-ID: <2024111655-approve-throwback-e7df@gregkh>
References: <20241106193413.1730413-1-quic_wcheng@quicinc.com>
 <edfeb642-297e-42bb-ad09-cbf74f995514@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <edfeb642-297e-42bb-ad09-cbf74f995514@quicinc.com>

On Fri, Nov 15, 2024 at 02:42:47PM -0800, Wesley Cheng wrote:
> Hi,
> 
> On 11/6/2024 11:33 AM, Wesley Cheng wrote:
> > Requesting to see if we can get some Acked-By tags, and merge on usb-next.
> 
> Are there any more clarifications that I can help with to get this
> series going?  I know its been a long time coming, so folks may have
> lost context, but if there are any points that might be blocking the
> series from getting merged, please let me know.

I would like others to review this (xhci maintainer for one), to give
their blessing before I even consider this.

thanks,

greg k-h

