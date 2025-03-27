Return-Path: <linux-input+bounces-11308-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E0CA72A5C
	for <lists+linux-input@lfdr.de>; Thu, 27 Mar 2025 08:02:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4AA33B86FF
	for <lists+linux-input@lfdr.de>; Thu, 27 Mar 2025 07:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B601A1C7004;
	Thu, 27 Mar 2025 07:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ha2EyVm8"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9071624DC;
	Thu, 27 Mar 2025 07:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743058944; cv=none; b=DBOhU967NakWluC3Z6/m5AZ1TOBJbjUoAPMogbYBbnCeD0YRVFJFEhJFZCcUFN+9hLt+2Vehk+QWC0JqOSGwPQBFReQ7PNxv12DEAADsNykn9jUmcsWs/SyyhuG3XZ5gWrs3Jg2cWyuuyBOZSW+pVesk5zpubjCKE/T8ymd62io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743058944; c=relaxed/simple;
	bh=rahj8n/g/fCJxulj8uYGukhsVfUSTm5Q8ORfoy2mA+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VrJpxp6GJPkORSy6ahM0/uVkP8wNh83GWmSz1eQYJEZLW4rSWUG7ZEma4ugLtjtfsQ0LHgizRddSxC7OpLeBjB6EdeobtMocFZH7jai1hc+WaiJGndLqyQwibNhD0KBj5aHky+CWUzsu0Gs/Ydg5NwJLCGrdvZq3sGjTRF/L8t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ha2EyVm8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CB81C4CEDD;
	Thu, 27 Mar 2025 07:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743058943;
	bh=rahj8n/g/fCJxulj8uYGukhsVfUSTm5Q8ORfoy2mA+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ha2EyVm8lrapGVoOIpR3L1EYlHgRAXpQX/S1tpm7U42Gi2cQ+/aaXUCOZihg/9B8B
	 2Q4AVHx2qseM2T01sYSwwKfic9Kv5sb9Wn1bxUSJI/Qfyu0aaabeqdg/RV04OMsv01
	 M/ReF8VYnXR036ZrM29U20J9wogHRlWFFTqq6Dt8=
Date: Thu, 27 Mar 2025 08:02:20 +0100
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
Message-ID: <2025032734-reward-fantasize-dc16@gregkh>
References: <20250319005141.312805-1-quic_wcheng@quicinc.com>
 <20250319005141.312805-2-quic_wcheng@quicinc.com>
 <CAGCq0LZoi0MOJLJYUeQJW6EfOU_Ch=v1Sg8L4_B-KhdDCx1fCw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGCq0LZoi0MOJLJYUeQJW6EfOU_Ch=v1Sg8L4_B-KhdDCx1fCw@mail.gmail.com>

On Thu, Mar 27, 2025 at 02:27:00PM +0800, Puma Hsu wrote:
> Hi,
> 
> We have implemented and verified the USB audio offloading feature with
> the xhci sideband driver on our Google Pixel products. We would
> appreciate it if this solution can be accepted. Thank you all for the
> work!
> 

Great, can you properly send a "Tested-by:" line for this against the
00/XX email so that it will be properly saved?

Also, I think a new version of the series is coming, can you test that
to verify it works properly?  We have to wait until after -rc1 is out
anyway.

thanks,

greg k-h

