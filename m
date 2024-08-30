Return-Path: <linux-input+bounces-6015-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F294965EC0
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 12:21:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE4ECB271DF
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 10:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 579131B5ED3;
	Fri, 30 Aug 2024 10:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q4Bn0AtE"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8FF192B62;
	Fri, 30 Aug 2024 10:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725012807; cv=none; b=al5k7AHPvmc/2zXKuLVIm+4EnlHOeeeem0q28olWkfjSkULntNgQN7CyAm6PzOksk+dGb17PW2UiOIsC3aAz2ErgWZVTmfM2QYxbYydVNHMDTdaOG2NqpZyf40RP07Tbz0I/Cn8Zfnj4IDRg+EIWHoaUefJvMwLIh4il4qG3iL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725012807; c=relaxed/simple;
	bh=A8aWXN5Sp34TzSH4dhSf5NJABlsNqU80GROTYH4oG3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kh8HA1kyLpzCGi535fLje5rMzK0aqW0zL7D8Ihq2YvjKoRSYDRn/E2MZk8MwRPd9NK6yWSqrZ0Bd0foLABcZyCqQZ6zWXI7lLiSdzGF9B1vJxlwz86YCH0QOnLSp5dpHAW81cqz5b2GG89gjk5W89q7HsYqfC3068bp/326s7qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q4Bn0AtE; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725012806; x=1756548806;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=A8aWXN5Sp34TzSH4dhSf5NJABlsNqU80GROTYH4oG3o=;
  b=Q4Bn0AtE+EYMXWC5yyun9ED/SYFwZTOkep21VYSQ9CkIhMyNlCUxan03
   p9o+JS5IbxWD96Q2+lcFUluBvTyycfn/7r+NN5Oksta9MKDEzEiAJ+B4Z
   8wRGoWPK3cjfRWT9u8rkpcrE2aKjWQTc1zrHzvtVHNPPJ6soxrfMyIaHq
   xj+FyLQlTcdYPQmg+qZA53GX6sLtLgK5h5E4/GdN+gDzEX2G+AJGD7gD+
   sZVOzjZs7JVBMCM8coYO7/0b7k+XhE8RSOf7fjSBb7hNQzVSpINijYN6f
   4d1ccjPC+GZz7NFFgVK8IVVZq5DavjpGT1tuAxQ587RAzlPzxGEqfRzEh
   Q==;
X-CSE-ConnectionGUID: 7y0CZ7+oQJy21YxtXbF4Gg==
X-CSE-MsgGUID: 3+PeIK0uTPOe70hjZft8xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="27526426"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="27526426"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 03:13:26 -0700
X-CSE-ConnectionGUID: eZXzYYhsSYCoULUdPjNTwQ==
X-CSE-MsgGUID: cF3F0kTKQAu7oXkB6FpSBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="68013152"
Received: from ltuz-desk.ger.corp.intel.com (HELO [10.245.246.101]) ([10.245.246.101])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 03:13:19 -0700
Message-ID: <f8090415-e0ae-4923-bdc8-58622623fc9d@linux.intel.com>
Date: Fri, 30 Aug 2024 11:58:43 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 30/33] ALSA: usb-audio: qcom: Use card and PCM index
 from QMI request
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
 <20240829194105.1504814-31-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240829194105.1504814-31-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/29/24 21:41, Wesley Cheng wrote:
> Utilize the card and PCM index coming from the USB QMI stream request.
> This field follows what is set by the ASoC USB backend, and could
> potentially carry information about a specific device selected through the
> ASoC USB backend.  The backend also has information about the last USB
> sound device plugged in, so it can choose to select the last device plugged
> in, accordingly.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  sound/usb/qcom/qc_audio_offload.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
> index 0bd533f539e4..a7ad15404fd1 100644
> --- a/sound/usb/qcom/qc_audio_offload.c
> +++ b/sound/usb/qcom/qc_audio_offload.c
> @@ -106,8 +106,6 @@ struct uaudio_qmi_dev {
>  	bool er_mapped;
>  	/* reference count to number of possible consumers */
>  	atomic_t qdev_in_use;
> -	/* idx to last udev card number plugged in */
> -	unsigned int last_card_num;
>  };
>  
>  struct uaudio_dev {
> @@ -1261,7 +1259,7 @@ static int prepare_qmi_response(struct snd_usb_substream *subs,
>  
>  	pcm_dev_num = (req_msg->usb_token & QMI_STREAM_REQ_DEV_NUM_MASK) >> 8;
>  	xfer_buf_len = req_msg->xfer_buff_size;
> -	card_num = uaudio_qdev->last_card_num;
> +	card_num = (req_msg->usb_token & QMI_STREAM_REQ_CARD_NUM_MASK) >> 16;
>  
>  	if (!uadev[card_num].ctrl_intf) {
>  		dev_err(&subs->dev->dev, "audio ctrl intf info not cached\n");
> @@ -1455,8 +1453,7 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
>  
>  	direction = (req_msg->usb_token & QMI_STREAM_REQ_DIRECTION);
>  	pcm_dev_num = (req_msg->usb_token & QMI_STREAM_REQ_DEV_NUM_MASK) >> 8;
> -	pcm_card_num = req_msg->enable ? uaudio_qdev->last_card_num :
> -				ffs(uaudio_qdev->card_slot) - 1;
> +	pcm_card_num = (req_msg->usb_token & QMI_STREAM_REQ_CARD_NUM_MASK) >> 16;
>  	if (pcm_card_num >= SNDRV_CARDS) {
>  		ret = -EINVAL;
>  		goto response;
> @@ -1706,7 +1703,6 @@ static void qc_usb_audio_offload_probe(struct snd_usb_audio *chip)
>  		sdev->card_idx = chip->card->number;
>  		sdev->chip_idx = chip->index;
>  
> -		uaudio_qdev->last_card_num = chip->card->number;
>  		snd_soc_usb_connect(usb_get_usb_backend(udev), sdev);
>  	}

This entire path seems like a bad split/merge, it removes stuff that was
done earlier. Also it's not clear what this has to do with 'QMI', card
and PCM device management is usually done at a higher level.

not following, please be mindful of reviewer fatigue when adding such
changes in patch 30/33....


