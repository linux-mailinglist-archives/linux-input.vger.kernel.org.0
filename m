Return-Path: <linux-input+bounces-5998-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D05B965E33
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 12:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE4CD288C4E
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 10:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28D5D18B479;
	Fri, 30 Aug 2024 10:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iaLhAfoj"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F34D18A6D2;
	Fri, 30 Aug 2024 10:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725012689; cv=none; b=mFHyPPL14I7hKcCzcdM0AChe58UBmvhjuFGQAtggWjkCdX7hmVF5bcloMPowCI14oVRZRlZYN3xQ0Z/AKGmT+TiC4nOc9qHHOYcfMUaZ0i7rPHzFQRdehP1T+WDf4mN9iY3DYYtVDCR96sOmko0jYHdCShiajqblE3BMLT6ZZ1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725012689; c=relaxed/simple;
	bh=ua6iHb2IsSlmaZf5LZNpVADheaj2qxDuHc6BnNLIYyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sZ8d7zteT2fGzHn72ffAyyqNm/FwjIoa3VXVd7gINUxrOonOHAHAvBm4wN47QBB9KoDymdpl91JZIOXRyZYCldWkciaO4Jwsj039/4/JPcnN2V+ib3gS47kdzndeLPda9sBh3hZA7l20gTL0VegsKN2DdW+GmocSNzCWlSfBQEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iaLhAfoj; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725012688; x=1756548688;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ua6iHb2IsSlmaZf5LZNpVADheaj2qxDuHc6BnNLIYyo=;
  b=iaLhAfojEzZRr8nWkv3/hW6pQaICQ3cnvo0SKSa2kof5n1sjbP99Ssfh
   Lhp2HXWj1CY3t0hSShMIHJ764pX829RUSp/gJqNADbYzEEu12xWVXRSTR
   LIYlBvVyyUro6pyaYL9c3GZqSxINsDYU/ZbTmO19/oveJ3maVYR9wI38C
   UHsw+okdWfAayfRYCYGi4nZDlO9Dq7wnvuIy9bC0p3smQOJ7JypPU1nDg
   iGEqiM1VpKJLvOpwNn6pDAk8Pg0le6GzbdRvdAzp/yRVeczWPU7c1mTcj
   ODBvLRRODEfTIvn9YViFzQ1Cyqn/Uwiqqj+wpoG5NznACqzBe+VHCHjpX
   g==;
X-CSE-ConnectionGUID: ME/eQahvTFSawidXBR9MNQ==
X-CSE-MsgGUID: dZyk0F0XRjKS+A2JuTKLWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34218696"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="34218696"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 03:11:27 -0700
X-CSE-ConnectionGUID: Wz/y45B2RJqKptUFmsGXnQ==
X-CSE-MsgGUID: VUy1r+MtSniUz1ZM8Ut4sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="63481306"
Received: from ltuz-desk.ger.corp.intel.com (HELO [10.245.246.101]) ([10.245.246.101])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 03:11:19 -0700
Message-ID: <c5508a0a-faa4-4548-87cb-7255d7a5e7b7@linux.intel.com>
Date: Fri, 30 Aug 2024 10:33:07 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 10/33] ALSA: usb-audio: Export USB SND APIs for
 modules
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
 <20240829194105.1504814-11-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240829194105.1504814-11-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/29/24 21:40, Wesley Cheng wrote:
> Some vendor modules will utilize useful parsing and endpoint management
> APIs to start audio playback/capture.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>



