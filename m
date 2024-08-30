Return-Path: <linux-input+bounces-6001-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6634965E49
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 12:15:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F3BA280D9B
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 10:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46F6D199958;
	Fri, 30 Aug 2024 10:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="inmSwT4B"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF57018DF66;
	Fri, 30 Aug 2024 10:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725012708; cv=none; b=nwTKCiN3KCcAvqBYEHtTwzpPvq6OcYldsqnTJZjGL0yWaOlV7IasZ3fJvvw3dqtxHgeMW9In+YHnY1qN8R2sHxWtw+ttZJPQWYXqqG1ejb1jj9MnAQ0u8Id/zeMHKrFIE4YU76dPqSIa6CzkYuvwflSX0J0KFDxlH/cGrxeS0WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725012708; c=relaxed/simple;
	bh=UpTmzOP42IVxntFMr0nG3D61CjBK6fcj9WYVDT2cEZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N5u6Wb+BmB7Z0NrMNih2fXnFTOun7a2JSZo7Mjd99kEo6eI/wRmXOofKDCjuLYzzUg9DmfXPi0gew+fJMA6fEP80E+rIDqsGXMhxkLOONicRXSiiOR+QLY/7TRYymkcXc7SkscNoAkVShk4Ayr7VDRmjiL98JFZjy6HHM5XGPo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=inmSwT4B; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725012707; x=1756548707;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=UpTmzOP42IVxntFMr0nG3D61CjBK6fcj9WYVDT2cEZU=;
  b=inmSwT4BaZ5ux4Mpv99bov0hg8sueJAKNtywqV0VaMvOhPAQV11OTUvj
   nWFBpB+hL7DJIsXwMWYEKgMum5d9ZT4dlYQIjy5BbyI9W9EMnhzIi8Pfw
   4IMLi1tBlMT2lSJhctLpiFxIcJ75UJ3e+bru7LKGNrkKUtUMVAgpZYVbk
   vhSYbnMQlEyb/Eh2CCvC92697aJxJrqGWYds5qfXB1VtyQlib8Gp4e1s6
   K13Kxbqv1EyEKI12CPquETeRxtMUK2Sb/VLG/O9dkbAetkCbBWzfHJZAP
   8McE0Cmyyop9Ci34E+EoZMETceGbfP28uyXDFxxENGAtQPqCamBZP23x0
   Q==;
X-CSE-ConnectionGUID: swKYI4FFTJuMUvMs5B/0qg==
X-CSE-MsgGUID: WfvB+JQ3Q8eoT70Ec8Sc6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34218762"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="34218762"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 03:11:47 -0700
X-CSE-ConnectionGUID: Ki9Eg43rQ/+PxbAGJYTdXw==
X-CSE-MsgGUID: 72Avl33yT3CwuiA4mfUsLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="63481454"
Received: from ltuz-desk.ger.corp.intel.com (HELO [10.245.246.101]) ([10.245.246.101])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 03:11:40 -0700
Message-ID: <2b5e40bc-060c-403f-a320-a98f975c857a@linux.intel.com>
Date: Fri, 30 Aug 2024 10:41:49 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 13/33] ASoC: usb: Add PCM format check API for USB
 backend
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
 <20240829194105.1504814-14-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240829194105.1504814-14-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/29/24 21:40, Wesley Cheng wrote:
> Introduce a helper to check if a particular PCM format is supported by the
> USB audio device connected.  If the USB audio device does not have an
> audio profile which can support the requested format, then notify the USB
> backend.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>


