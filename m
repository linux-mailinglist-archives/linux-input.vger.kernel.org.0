Return-Path: <linux-input+bounces-6013-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69493965EB3
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 12:20:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1837728BDD9
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 10:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76BA31B5818;
	Fri, 30 Aug 2024 10:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PKJsrap0"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE59B1917FE;
	Fri, 30 Aug 2024 10:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725012794; cv=none; b=cbuLReki5FXP4InT6WG1R1bjCVYBjjsPHUI2PmcIvYT2lOUUpglRn5rd1yKZDG3Ro4Ae0nMPOsfDy/bQrb9cmwysbSBqtQWkv5AJPsdoMElf2lopZ31rHVsfDCYsdg9GwOaJzsNE5XIimHvLkuFkLlXP9bN8mOD2zBVm+AYo10w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725012794; c=relaxed/simple;
	bh=FBnecxHaa8FwyoOrzXwFoI00y4P/e6lJs2nAYsSX1dk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H/LaK8x45CWhdNqgn7f1BTsl7V2pjAVF8ftU/VOx9unwU10z0sKJIeQzjVmPCwHIJqjPkUElYNYOXdapAy7Oe4e8GaIbwXuHkLwy/wHZ5xeq4VBJ/7PmH44WoX6R0+JNv6+dHGuK33Iek5tP6Gn4sxvtTKXt3Ud/rfZVpRdKPwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PKJsrap0; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725012794; x=1756548794;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=FBnecxHaa8FwyoOrzXwFoI00y4P/e6lJs2nAYsSX1dk=;
  b=PKJsrap02Zw7hvlWVgkwguhhJrImCx3k+xaxtkRrn6FGYc+e98qjzCWZ
   khp85jrCFkNTWogpugXIyIjjpdXkKq2MGNSJ6WrGio4Txw3QEdhFbtmIh
   Ruz1pWif/1BiSUM5ZfNanDZJzSG98X9Sr1fNrnTV6vFLJj0bcLKT5Dvpc
   vcvPKuky/eHkNkMJ5PkEFgWDXhkbdnGI0/0H5SOKI31nFN68lGAYnpaKG
   hNqaFn7CWYHp9SHDK1B5JI5cBo9ZxujIr8x4JHLkKVnqKTXusBjao8kNt
   G68c5XgNHybYLUg0jXdOe+/ny9UjfFiCCqWxiE1/AzxOW1RLxpK56P0ra
   A==;
X-CSE-ConnectionGUID: GSnXmFP7SpiHmvgQrLuktg==
X-CSE-MsgGUID: Az4bD/PDScCrLpGUDZZD6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="27526372"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="27526372"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 03:13:13 -0700
X-CSE-ConnectionGUID: 67kO7DlMQa6vWM3WrtkI3w==
X-CSE-MsgGUID: Gzceg7CkQ9+QUidV4VtYTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="68013133"
Received: from ltuz-desk.ger.corp.intel.com (HELO [10.245.246.101]) ([10.245.246.101])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 03:13:07 -0700
Message-ID: <e7955dd7-95b1-4999-a2a1-519e8d7297a6@linux.intel.com>
Date: Fri, 30 Aug 2024 11:52:55 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 28/33] ALSA: usb-audio: qcom: Introduce QC USB SND
 offloading support
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
 <20240829194105.1504814-29-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240829194105.1504814-29-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


> +/* Stream disable request timeout during USB device disconnect */
> +#define DEV_RELEASE_WAIT_TIMEOUT 10000 /* in ms */

10s really? That seems rather large for a stream disable timeout...

> +static struct snd_usb_platform_ops offload_ops = {
> +	.connect_cb = qc_usb_audio_offload_probe,
> +	.disconnect_cb = qc_usb_audio_offload_disconnect,
> +	.suspend_cb = qc_usb_audio_offload_suspend,
> +};

You probably want to explain why there's no .resume_cb?

The comments mention also that the suspend_cb has to stop playback, but
then who resumes playback :-)



