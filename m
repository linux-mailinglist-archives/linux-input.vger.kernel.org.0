Return-Path: <linux-input+bounces-5997-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 27177965E29
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 12:13:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A2A41C24B9B
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 10:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88FE017DFF6;
	Fri, 30 Aug 2024 10:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MgI12sEg"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF00917BB17;
	Fri, 30 Aug 2024 10:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725012680; cv=none; b=g8usNO3BQ3IjeN8hUcaO+t6sM9LgCUtDn4UxAw4KhsaMwpGttlaVLJgqfhCzn8O3lU6vwbo4Tjxk582jRKCH4T0hsDDjBoeY9EKPC1/jV7MwKyzcaqoxbu+8duRoonnUgcu+3A4AGFOkqWPHRw/pApMBc7YX3fYMpX0Hb1HuNls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725012680; c=relaxed/simple;
	bh=mzpoRm6pkWleBrw0wleX4p6vApAgUsGuMXqYcVu4waM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lKee66HoKUuwuHN290S2RlkJIdqUDRZxyceDik4JzC392a36zCf0EdjejT34p+35Ny+1thRu/+aqPyWAEiIOECL4Sdk+Tpeiaxuwhn+Qi3YhHhEh5cSxcNAlnR03FcILwZ38eHOlc48GUZ71uA1zHZPDNOmH5jgA5GvaGC3UTXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MgI12sEg; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725012679; x=1756548679;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=mzpoRm6pkWleBrw0wleX4p6vApAgUsGuMXqYcVu4waM=;
  b=MgI12sEgRbm39334K+AAaz60K/9yHrggeh/yHCcHFvQ1aynZUgBZluVZ
   JzS5Y11CUe/8J5CgbRjiNFL8LTKfoyNbWlA8Ov0cuvhTvBUkD1qqGzEpe
   ly3Nyd5loJf0cABXzeDowIpc9Ii69fOmuLFlpi6p1CLn6fLTwLfRoYlHH
   psF4bxdku5FPSMhzqWwRLjFzA/D/hXPwaNdRQ3RtBYx+5bAf8VIAEcDTq
   O3TPPwpvEtBhknN9uSOfAJ5lQPIVIPn1r2PhcX5Gzwt1dOpqVLVcxWVS7
   0LkXA/lCjH7dyB+P/qddoC7m8mGXx78ioqLyUR4/xvHzkdUaGTLAt9nrH
   g==;
X-CSE-ConnectionGUID: fzxIv760RDKICvG7UzPBBQ==
X-CSE-MsgGUID: 6pKAfOeYTQS1Ms5f07YOwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34218680"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="34218680"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 03:11:18 -0700
X-CSE-ConnectionGUID: UdDa5sGcRTmh0+HQzTNJ/A==
X-CSE-MsgGUID: d92XtbghTcSNVx17hlh1Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="63481267"
Received: from ltuz-desk.ger.corp.intel.com (HELO [10.245.246.101]) ([10.245.246.101])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 03:11:12 -0700
Message-ID: <ec7d01d4-7887-4a61-9387-9669762c35aa@linux.intel.com>
Date: Fri, 30 Aug 2024 10:28:10 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 09/33] ALSA: Add USB audio device jack type
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
 <20240829194105.1504814-10-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240829194105.1504814-10-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/29/24 21:40, Wesley Cheng wrote:
> Add an USB jack type, in order to support notifying of a valid USB audio
> device.  Since USB audio devices can have a slew of different
> configurations that reach beyond the basic headset and headphone use cases,
> classify these devices differently.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>


