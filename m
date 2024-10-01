Return-Path: <linux-input+bounces-6961-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6884598BE52
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 15:49:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 918011C23438
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 13:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0506A1C68B3;
	Tue,  1 Oct 2024 13:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HNwkIeX2"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572B81C579F;
	Tue,  1 Oct 2024 13:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727790513; cv=none; b=LxUy62IptB7/GSENaoNABA5amEdSq1+Fw2NORTEEPraIidDo1Xe5Sg4eH+C4nxbuTSU81DRUombF31nOZWLZ2CxFd+LUtFkIi9P2vTF2GOKPN2KqdYpvFuBbjR3cxdqtSt4zNTy/FRvDG9Ys1OEQGRA4CHd9hxmFswo21zw6JBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727790513; c=relaxed/simple;
	bh=hYg0Fu0D6IoftEUgUjWbcBn5SdluW6xHgOAg9+UBNzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fJ17iRkkELM23Ux+20ljUFWpSL26/ghYtXc4VKEGxZ+rOOmzWXiQrDnGCCajH2aOQJ4coo9FH4KsP1qRE9Tv1E1hxXILg8JJZLPNZzJbE+PQEe+jlpDwwj2Nk//Pgc+2koZ6JF1nNutW1ttQHDCrR6h/+G+SZJE1G3m52VgeUAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HNwkIeX2; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727790513; x=1759326513;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hYg0Fu0D6IoftEUgUjWbcBn5SdluW6xHgOAg9+UBNzA=;
  b=HNwkIeX2M3ZbW84YnM698zxb087PJN++6JW31D4Mddf+hb1rVpFzKQPo
   PYthRGh/rsHH+VheNasG0bnVN+fzVm3cfH5TPP2+0980ISaPlRE6MuTmZ
   /8WPez2+kp5T3Z+OzGuqD8aQZObJoijCkR+WVEzEYcY1yS7XAQ75ae7Yy
   E8H0GrhCHoGUzRVbauGSHPhsXbkJguhkFju3TwMNzWvE5VQLV/0ZlNwxE
   rnXndD5EhFZ6YqF9UbLZuy+HhdeZlDcXe5SIG6hrzfFRPyJ/Xh+ZkU4pk
   k2/HKFn/2aWrnDMybh7/SwZA7fFx0hJyFXytW6w+Eozv6OsXnepK3Ygo7
   Q==;
X-CSE-ConnectionGUID: CEurDm+zSXK1F7c5n/RCQQ==
X-CSE-MsgGUID: LhkMJ57JTpaK8Wjlv+nc/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27018698"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="27018698"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 06:48:31 -0700
X-CSE-ConnectionGUID: vvOEWfuOQp6aUElZPlvVAw==
X-CSE-MsgGUID: jKRp70E6QsmfnSnjQ90fUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="78534228"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53]) ([10.94.0.53])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 06:48:25 -0700
Message-ID: <04f17b40-cb63-4758-80fb-91996f71a07c@linux.intel.com>
Date: Tue, 1 Oct 2024 15:48:22 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v28 18/32] ASoC: doc: Add documentation for SOC USB
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 dmitry.torokhov@gmail.com, corbet@lwn.net, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, krzk+dt@kernel.org,
 pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com,
 bgoswami@quicinc.com, robh@kernel.org, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-doc@vger.kernel.org, alsa-devel@alsa-project.org
References: <20240925010000.2231406-1-quic_wcheng@quicinc.com>
 <20240925010000.2231406-19-quic_wcheng@quicinc.com>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20240925010000.2231406-19-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/2024 2:59 AM, Wesley Cheng wrote:
> With the introduction of the soc-usb driver, add documentation highlighting
> details on how to utilize the new driver and how it interacts with
> different components in USB SND and ASoC.  It provides examples on how to
> implement the drivers that will need to be introduced in order to enable
> USB audio offloading.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---

...

> +USB Offload Related Kcontrols
> +=============================
> +Details
> +-------
> +A set of kcontrols can be utilized by applications to help select the proper sound
> +devices to enable USB audio offloading.  SOC USB exposes the get_offload_dev()
> +callback that designs can use to ensure that the proper indices are returned to the
> +application.
> +
> +Implementation
> +--------------
> +
> +**Example:**
> +
> +  **Sound Cards**:
> +
> +	::
> +
> +	  0 [SM8250MTPWCD938]: sm8250 - SM8250-MTP-WCD9380-WSA8810-VA-D
> +						SM8250-MTP-WCD9380-WSA8810-VA-DMIC
> +	  1 [Seri           ]: USB-Audio - Plantronics Blackwire 3225 Seri
> +						Plantronics Plantronics Blackwire
> +						3225 Seri at usb-xhci-hcd.1.auto-1.1,
> +						full sp
> +	  2 [C320M          ]: USB-Audio - Plantronics C320-M
> +                      Plantronics Plantronics C320-M at usb-xhci-hcd.1.auto-1.2, full speed
> +
> +  **USB Sound Card** - card#1:
> +
> +	::
> +
> +	  USB Offload Playback Route PCM#0        -1, -1 (range -1->255)
> +
> +  **USB Sound Card** - card#2:
> +
> +	::
> +
> +	  USB Offload Playback Route PCM#0        0, 1 (range -1->255)
> +
> +The above example shows a scenario where the system has one ASoC platform card
> +(card#0) and two USB sound devices connected (card#1 and card#2).  When reading
> +the available kcontrols for each USB audio device, the following kcontrol lists
> +the mapped offload path for the specific device:
> +
> +	``USB Offload Playback Route#*``
> +

Those examples would probably be easier to follow if you also provided 
something similar to "aplay -l" output in addition to above sound card list.

> +The kcontrol is indexed, because a USB audio device could potentially have
> +several PCM devices.  The above kcontrols are defined as:
> +
> +  - ``USB Offload Playback Route PCM`` **(R)**: Returns the ASoC platform sound
> +    card and PCM device index.  The output **"0, 1"** (card index, PCM device index)
> +    signifies that there is an available offload path for the USB SND device
> +    through card#0 - PCM device#1.  If **"-1, -1"** is seen, then no offload path is
> +    available for the USB SND device.
> +



