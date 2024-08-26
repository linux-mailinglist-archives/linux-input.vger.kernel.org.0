Return-Path: <linux-input+bounces-5872-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0657495ED48
	for <lists+linux-input@lfdr.de>; Mon, 26 Aug 2024 11:33:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1FBD1F22686
	for <lists+linux-input@lfdr.de>; Mon, 26 Aug 2024 09:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CE2E146A6B;
	Mon, 26 Aug 2024 09:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kvAiglF9"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D35145FEE;
	Mon, 26 Aug 2024 09:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724664784; cv=none; b=LhLakcyv9HMt1a4ny2tazgAzPlmLL+NUn5TXTcsuWOoh7nb1709PJngCNnbRu4nFR9iK50MZzZ/JJxTSVxTJUv2Fgwp6yuOFfUAmcy2p0xF7xoBERAOed1cnmNQisk19FbjY9hyAnp90oxsm1pcDK4vjthlhrZmrn+7DElCXCis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724664784; c=relaxed/simple;
	bh=hLsfUSzR0HEhVpFfdXscTD8zyuZTM22+rpebelyMh1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YcBD6JdaPmwyCFrbAbgb24tKLBI3Ey6fBEmvaqQklvyMKUzrQEshWkcgLNYJzjaPptH8Nad4rleyEUyBxWBeJ8R6CdHzVZm+2CgsngGaNnzhnWiUOWoaFvI/1bC5I4sH3QQgipYm1egW9zKJ/uOkwJjIpdIBs/xBlRdrbu4KrY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kvAiglF9; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724664783; x=1756200783;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hLsfUSzR0HEhVpFfdXscTD8zyuZTM22+rpebelyMh1E=;
  b=kvAiglF94UFmsqyOHS7vasKHowSkNvZxK/UnrCHe3TIw3fNXkIToVxfD
   9rGHmZFQ6U93hcFycMgjpYVLWKYaOehnnyZF0t46861z2Kdrqoro7IgUP
   CJR0E7U//1yVodDPUQ6aIOFTe6kmv4bV5VabypUL+1XPcu9yj3QqW9TM7
   SKZbw/WM8uFKiSVQbLqiie8uVIMizrS4xJYv94SFbdLibz1sSD9K0887Q
   zFz7uLwVMGVqPVg803w18rdYbMp+VitQZ+Zv1BDcrwszcPcToQkTIepbc
   bxQ1/iIY6Q8rLDN8f1/ElGV6MtOrYP+d8xba/inzOoO/n4v10w4KuS+BS
   A==;
X-CSE-ConnectionGUID: PJwgxjykR6ibOUktBPIWhw==
X-CSE-MsgGUID: XPr01gcPTHWwEu3+NU2oVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="25967078"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="25967078"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 02:33:02 -0700
X-CSE-ConnectionGUID: GheEIs6PTFaDrqiKV0o3lA==
X-CSE-MsgGUID: ftyAxPLYSzyC0hc4jGqEmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="62134683"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO [10.245.246.121]) ([10.245.246.121])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 02:32:56 -0700
Message-ID: <4149884a-7c60-40d8-848b-8876f16d6d7f@linux.intel.com>
Date: Mon, 26 Aug 2024 11:09:08 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v25 31/33] ALSA: usb-audio: Add USB offload route kcontrol
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 dmitry.torokhov@gmail.com, corbet@lwn.net, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, robh@kernel.org,
 gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-doc@vger.kernel.org, alsa-devel@alsa-project.org
References: <20240823200101.26755-1-quic_wcheng@quicinc.com>
 <20240823200101.26755-32-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240823200101.26755-32-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



> +config SND_USB_OFFLOAD_MIXER
> +	tristate "Qualcomm USB Audio Offload mixer control"
> +	help
> +	 Say Y to enable the Qualcomm USB audio offloading mixer controls.
> +	 This exposes an USB offload capable kcontrol to signal to
> +	 applications about which platform sound card can support USB
> +	 audio offload.  This can potentially be used to fetch further
> +	 information about the offloading status from the platform sound
> +	 card.

I would remove reference to Qualcomm for this Kconfig, all the code
seems generic to me? Probably a left-over from the previous version.


