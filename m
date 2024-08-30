Return-Path: <linux-input+bounces-6006-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD74965E81
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 12:17:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D498EB2662E
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 10:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2ECD1AD5D7;
	Fri, 30 Aug 2024 10:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FSNXp81p"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F4B189B96;
	Fri, 30 Aug 2024 10:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725012744; cv=none; b=UCRcAXYD4xt2I8rtMiuMsdzHGlCJCqjCzBYM+56WBCMJDLfVVR3XyzfphjKge8j7HeXgA0nc6GnZpyIk8+37ZsL8TkOHJ2lZzsyTVv5TvTC7ZLwWOwR6E9n9OayJQV+oqE4nh6ECbM1ypk+WdBvrXMJCpqjmMzmUBTHa3QEmM7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725012744; c=relaxed/simple;
	bh=pc1q714dbUikwMjGYuDlSj2kVYqhqeoRjzc/gcNeW2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MSZPY0/7WNqZZghYSx0yXuTRBPhXlmrfpLWLL5lGbja4dkBoP2Ts6XTUR9pbYqwMv5AVvjmPHNyS3bjJpbIWSnz2W/bXw5C+2EcHO+BiHg0TqypBVzI70ONIpQSCxA1mQU3tKBTP+VG+XaWX5kmHq7S5aNFSDWIrRrz2US068G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FSNXp81p; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725012743; x=1756548743;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=pc1q714dbUikwMjGYuDlSj2kVYqhqeoRjzc/gcNeW2o=;
  b=FSNXp81pYJbfQf5mB4tg7CRaC+LTGDNDLoLsW4mEMBNLzuKn7k1E9yUl
   rrGyI6NJD7eGP9+bi0YsICVKncrvF+Csj56BcvRnjnWufN8Bux3RzlrkV
   rQzasoPuG6ISghtFXX/13LKvKQtYkG2oNQ3Q7ZakqlMG0csMy1y1topKW
   74qg86Bzy698bhKExNe5j3h4H2ZqWkjRieYQj/SVoTlyQo6GQrQeuMZKZ
   MbANh0mBsN8mAcP799PjX2mhcGz10V8rxx36hygbU/GThwxrQBcLdzNyz
   joE51Pk2MxX0NsMLF+8tiEh7ho4bXmW0iMxJP43kdoWA5p8UIwYnSpxpw
   g==;
X-CSE-ConnectionGUID: sLWoPPjxSKGOqux7ZEv53w==
X-CSE-MsgGUID: ecBxRkiTTdW2ZlQlDMZJQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34218861"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="34218861"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 03:12:22 -0700
X-CSE-ConnectionGUID: Oq/VD6neQaOi23JKF17flA==
X-CSE-MsgGUID: toAB1mXCROuwmz0s55/uLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="63481679"
Received: from ltuz-desk.ger.corp.intel.com (HELO [10.245.246.101]) ([10.245.246.101])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 03:12:16 -0700
Message-ID: <edf2eb3b-e573-465c-b6d0-58bcca5079db@linux.intel.com>
Date: Fri, 30 Aug 2024 11:13:08 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 20/33] ASoC: qcom: qdsp6: q6afe: Increase APR timeout
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 dmitry.torokhov@gmail.com, corbet@lwn.net, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, robh@kernel.org,
 gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-doc@vger.kernel.org, alsa-devel@alsa-project.org
References: <20240829194105.1504814-1-quic_wcheng@quicinc.com>
 <20240829194105.1504814-21-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240829194105.1504814-21-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/29/24 21:40, Wesley Cheng wrote:
> For USB offloading situations, the AFE port start command will result in a
> QMI handshake between the Q6DSP and the main processor.  Depending on if
> the USB bus is suspended, this routine would require more time to complete,
> as resuming the USB bus has some overhead associated with it.  Increase the
> timeout to 3s to allow for sufficient time for the USB QMI stream enable
> handshake to complete.
> 
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  sound/soc/qcom/qdsp6/q6afe.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
> index 3ee6ff8a6bc3..b5b2af2ce50c 100644
> --- a/sound/soc/qcom/qdsp6/q6afe.c
> +++ b/sound/soc/qcom/qdsp6/q6afe.c
> @@ -366,7 +366,7 @@
>  #define AFE_API_VERSION_SLOT_MAPPING_CONFIG	1
>  #define AFE_API_VERSION_CODEC_DMA_CONFIG	1
>  
> -#define TIMEOUT_MS 1000
> +#define TIMEOUT_MS 3000
>  #define AFE_CMD_RESP_AVAIL	0
>  #define AFE_CMD_RESP_NONE	1
>  #define AFE_CLK_TOKEN		1024


