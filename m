Return-Path: <linux-input+bounces-5999-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD45965E39
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 12:14:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C091D1C24E59
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 10:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA85D18C35A;
	Fri, 30 Aug 2024 10:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XNVMrX4Z"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDA917B506;
	Fri, 30 Aug 2024 10:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725012694; cv=none; b=sZQsosNq/q3hmHHeq7d4QMrNTrST7xFQLAhc4/a2r47T+Q+d3Rrnql7LY9EYpJsPi82L7TZESlspvlN/VvAEXKYcvfDasqP/DCLJOryzYlltPv6nz/tBaq7G/wFLHCTyl9r9AWtTcgOs9OJhDVFu9qU+m2ajwOHQQMue50g14NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725012694; c=relaxed/simple;
	bh=WjrGopvfWBwqadCF5AMZbTn86mU67OhWuakpxI4+ldA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kK/86XGVOEPksywLl53i/PTVQjgiH+wLLaXg4QXEmcNVlHmKMh1phEk228lyWgj2a6eP0eYjmah58zp9dlkjVKzDEikNxPXVJmUQ0U+93z8qGHamYN4nX5nxq+Ae06OWiKYjLD4Ej7v7HE5aki01kYhHC56RE3A0dJ/Cew/joB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XNVMrX4Z; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725012693; x=1756548693;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WjrGopvfWBwqadCF5AMZbTn86mU67OhWuakpxI4+ldA=;
  b=XNVMrX4ZLLQWvOs6g+X1hzVA5VjDrEpvzHXO96a+RFs7LHiP9H8G6d/c
   GO3wuoEIuF1sGtRHVPZ92/QK0BEt4V/yKZoD8ukwYbRhqKDRiLQdwzBuy
   Bam8TR2GdaYK9vnKv27WQviBt2dcx7AeQBZ0lvmmCxj51QEfIFWvwfgb9
   2wLB9QVcdVquKFD/LqY3zl2EuQRGAAReftqoUdQlnL1tNMLmX6krJJFUf
   T4oOHB9LH1DVk9I9WCxVWQWE9trwXO7WgZUDBpRRo8g6FEdehR1iLJmck
   HftOVekmUMV/cjdhJHr8wCPbhDQ1FsycesIyewlPAwI9W4BR/SunX9zWT
   w==;
X-CSE-ConnectionGUID: QaCaVC0LQFqwErzFn8THrg==
X-CSE-MsgGUID: iUoBpJnQRT2G313ws72OWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34218716"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="34218716"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 03:11:33 -0700
X-CSE-ConnectionGUID: fdk8jU+yTuSP5Li9jQhozA==
X-CSE-MsgGUID: iX//HswMRjeENxKXJX8Byw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="63481353"
Received: from ltuz-desk.ger.corp.intel.com (HELO [10.245.246.101]) ([10.245.246.101])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 03:11:27 -0700
Message-ID: <fedfc810-fcc2-49fa-9165-34003b111fc5@linux.intel.com>
Date: Fri, 30 Aug 2024 10:34:12 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 11/33] ALSA: usb-audio: Check for support for
 requested audio format
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
 <20240829194105.1504814-12-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240829194105.1504814-12-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/29/24 21:40, Wesley Cheng wrote:
> Allow for checks on a specific USB audio device to see if a requested PCM
> format is supported.  This is needed for support when playback is
> initiated by the ASoC USB backend path.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>


