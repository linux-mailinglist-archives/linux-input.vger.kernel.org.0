Return-Path: <linux-input+bounces-6008-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91490965E8F
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 12:18:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41A90283249
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 10:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A177F1B1D6D;
	Fri, 30 Aug 2024 10:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L6Vhn+8C"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356641B1D65;
	Fri, 30 Aug 2024 10:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725012759; cv=none; b=I+MWgs3Zm+/ndVFuoAw9IL+Bd0hJacULt4fujXZFZ7bnOnsJpHTCfyFCQ4d/ACXdDS/TIyF7JLTBvVpc/u5lOWcC9GT1YdCToQXfmWT5rP++uRLgIbXrhqBPlZ3CUbmcaXdIa3V/rYKQPAMdO87n5QyNN42GAq3Upeb1NH/l+ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725012759; c=relaxed/simple;
	bh=cJ4zekY4nY/hrZXn6e6Oix0rkFFzk6yzaxUwLzAdoJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q8XfPer8S+WkYAEo0Ta8cVeJVJqzJFpSF2qTMiRMTJ/awrgPivORMnIYPlpZou2rhxfjl7BEQalkxAIvFHuDEw7365fWNyUlAjUbQPTcyBnd7kKht39zwUh9CowsezLfsXQMy3XXfDuljgUniDW2jSO2HvHkt2SmjvbCINUnp+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L6Vhn+8C; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725012758; x=1756548758;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cJ4zekY4nY/hrZXn6e6Oix0rkFFzk6yzaxUwLzAdoJM=;
  b=L6Vhn+8ChjA0XWCbEFsn3Bmhip5prPMS/SOjpJC7qBjvI6vNXPxQxIZN
   UySrtWdnsmT3FaRPEgzPKKHzLBxXRFNgANxmiAlG3OKzsxHtm9p1Pnkpz
   XiBcTynUz9geuoOb3yvQ2LQ9rRIXLBXu2Tvd1biriYfsg637yyTmPWLz4
   L5CQv1V96OuMevalCp8ZoOBO6DNKQdnKtTF3H+nMDrmtmLWVVvPo9Y1t0
   e54pY4O9C/hrBBQ7wb2ZQHE+uv6PsesJJJZcMCrWwuPjKzM4IEOJ40Jvm
   h3d0Z5JvUp8BHSyxLYfqVbNO9gDyjRiu3dZTo/Ws2teQvSo5G/u3QA5eH
   A==;
X-CSE-ConnectionGUID: QMVtk3i1SYGF23LS/S0O8Q==
X-CSE-MsgGUID: uq4ndKY8TROZCxGv8wGpZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34218896"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="34218896"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 03:12:38 -0700
X-CSE-ConnectionGUID: Cvjsu1XNRWO8wvK1K+mugw==
X-CSE-MsgGUID: gpSvdWLkRjKotyvtx6UTlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="63481752"
Received: from ltuz-desk.ger.corp.intel.com (HELO [10.245.246.101]) ([10.245.246.101])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 03:12:32 -0700
Message-ID: <39e1e90e-116c-4f13-b223-84e6991c8a32@linux.intel.com>
Date: Fri, 30 Aug 2024 11:27:02 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 22/33] ASoC: qcom: qdsp6: Add headphone jack for
 offload connection status
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
 <20240829194105.1504814-23-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240829194105.1504814-23-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



>  		/* Selects the latest USB headset plugged in for offloading */
> +		if (data->hs_jack && list_empty(&data->devices))
> +			snd_jack_report(data->hs_jack->jack, SND_JACK_USB);
> +

with the list_empty check, this looks like only the first connected
headset will be handled, not the last?

>  		list_add_tail(&sdev->list, &data->devices);
>  	} else {
>  		list_del(&sdev->list);
> +
> +		if (data->hs_jack && list_empty(&data->devices))
> +			snd_jack_report(data->hs_jack->jack, 0);
>  	}
>  	mutex_unlock(&data->mutex);
>  
>  	return 0;
>  }

