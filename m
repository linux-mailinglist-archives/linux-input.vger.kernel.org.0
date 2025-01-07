Return-Path: <linux-input+bounces-8990-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6FDA03C7B
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 11:34:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CAFD07A2D6A
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 10:34:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F5BB1EBA04;
	Tue,  7 Jan 2025 10:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NxuL0Xj4"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D001E9B23;
	Tue,  7 Jan 2025 10:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736245961; cv=none; b=Vt325zCTU6eayv8J+QBIbmgio63eI9mXaXIKY3TCzMjfuTr3VGHkrkahuAGkZCT5C/aoCsTmoUAdr7YE1TxEe1TZ4UdoS36netmy6kCb5Xj5SavbztU6wE2QRZ175KSsh9umj3tqy23oGJoJO0AcZvvaeYjTkVVcTtgr4BO9Lwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736245961; c=relaxed/simple;
	bh=y945zRPZXxqbC7qoxwS2DYQ82kDuB7aeeU7AIfBejhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xd4n6sFe8GjuRY5/Iy0hx2gONnRfdiZSxRH/Re3LRwc6p/QBJemCbGcy6djYeCQPakYDuIVP4X3OjFy484yJ/geUj8ncA8c/PMhxqmhlH5DdBpoNLqaovpMGM9HcPoPT93S1SVlOdujXI7roWOv7hKDjEY+wWAn/hy6LyNeJlbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NxuL0Xj4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A87E2C4CEDF;
	Tue,  7 Jan 2025 10:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736245960;
	bh=y945zRPZXxqbC7qoxwS2DYQ82kDuB7aeeU7AIfBejhk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NxuL0Xj4ZkKdlnRI3lbKwuLCj8qFaLv1VWLOoCMKdWYfFr4aXhWl4GPs0M/T6gWfv
	 ccu2PevwtNzXdKCVDGr9+JeP/+RX8Dz9OZwyuHcri/e146QuD9Ju/OgwEUBKt311vr
	 55YrrRcW2xx0sWy+etgEAJXv0kCyOEKByTfj/yUo=
Date: Tue, 7 Jan 2025 11:32:37 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz,
	conor+dt@kernel.org, dmitry.torokhov@gmail.com, corbet@lwn.net,
	broonie@kernel.org, lgirdwood@gmail.com, tiwai@suse.com,
	krzk+dt@kernel.org, pierre-louis.bossart@linux.dev,
	Thinh.Nguyen@synopsys.com, robh@kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v31 00/32] Introduce QC USB SND audio offloading support
Message-ID: <2025010713-stack-recycler-7f05@gregkh>
References: <20241213235403.4109199-1-quic_wcheng@quicinc.com>
 <f5e5ef90-f9b2-4d0d-b127-b3f2490fbdc4@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f5e5ef90-f9b2-4d0d-b127-b3f2490fbdc4@quicinc.com>

On Mon, Jan 06, 2025 at 03:02:37PM -0800, Wesley Cheng wrote:
> Hi,
> 
> On 12/13/2024 3:53 PM, Wesley Cheng wrote:
> > Requesting to see if we can get some Acked-By tags, and merge on usb-next.
> 
> 
> Happy new years to everyone.  Before sending out another revision to
> update the year for the license, did anyone have any feedback yet for
> the current revision?

Let's just send a new version and if no one complains, I'll queue it up,
I feel like this has gone on too long...

thanks,

greg k-h

