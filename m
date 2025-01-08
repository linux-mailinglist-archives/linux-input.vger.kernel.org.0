Return-Path: <linux-input+bounces-9068-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A97A05E0C
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2025 15:09:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 502571883FD1
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2025 14:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AF4F1FC7E0;
	Wed,  8 Jan 2025 14:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SCtxyL65"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DA21FDE09;
	Wed,  8 Jan 2025 14:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736345366; cv=none; b=qOIhguOcS1VXDxFlZ9Z6NB1FrZUilk/Wyq7WdzwdxAugEPJqGMhTEhI31n2ABsfgH6QJ7PhWcbTVZL1OJVe7JCYlTlh9HXn9egGAkzspREV2zWfNbhJzbPRuoYJ4Y9f87z8h8MovzHHfoinFspMGL6gsdC/imev3lHb/X2nO7is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736345366; c=relaxed/simple;
	bh=PuHFyvQcUpNFXvyiurlAF4absPlp7FXEo06xZZ4fOyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EK0eKsMUScRMkBfLXzZqFkmHPsede/qOJg1P+rFCQLa37qt1kSh5ypGjxGkdMEIiBeQscUw5GhpAw6h9ihCA1bYCNFESRkUoxjKOLvlkp6jPW4NiLt2qyDTFJlORtAoArmTSVhvMJghTcnzyUWgXAwsut41mPYOfzOzTA97Ymj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SCtxyL65; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736345364; x=1767881364;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=PuHFyvQcUpNFXvyiurlAF4absPlp7FXEo06xZZ4fOyY=;
  b=SCtxyL65pT1jJukT8JbBK0SsD8ZqiwPPABTYCSYIiQYg28BfjVLrju4i
   GEvkVMbuMhZwLTIQPbegNNfFB35Va1YZUo9oV0b8wseqJ7ofyqfcngNMf
   5DzM4mExHvW1HxqOlCG/7Fl4SjNW8gRnRF3MQIpeNpRC7Q9LpEIvkH3E3
   Tq7RgSr4uf3wGHwwTmE+lgi+ycGJE/AzpEMOnc7nOTUXRf7o5xDOD+X7P
   JxhdTo08EE6QPjeuCiGuyskbR2qol1qW90hwA/FOJfqpr0zoRVWY369Je
   rxcCxet/HWx96P/P7Cydnk3AQ2lIeWmKwNTW55+1NGU5m566Z/o2bzsNB
   g==;
X-CSE-ConnectionGUID: XQR70E4hQi6ejIEi9Dzb9A==
X-CSE-MsgGUID: G5cLkamWTuq0d3a7y+8fwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36266773"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="36266773"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 06:09:23 -0800
X-CSE-ConnectionGUID: 5MuKVUQjTz6NCWioya/ZbQ==
X-CSE-MsgGUID: ten+V83oQxySAdeEDBFw7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="102903221"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa006.fm.intel.com with ESMTP; 08 Jan 2025 06:09:17 -0800
Message-ID: <b029c775-a0cf-4991-95b7-a02187c0863b@linux.intel.com>
Date: Wed, 8 Jan 2025 16:10:12 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v32 02/32] xhci: sideband: add initial api to register a
 secondary interrupter entity
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 dmitry.torokhov@gmail.com, corbet@lwn.net, broonie@kernel.org,
 lgirdwood@gmail.com, krzk+dt@kernel.org,
 pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com,
 tiwai@suse.com, robh@kernel.org, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250108012213.1659364-1-quic_wcheng@quicinc.com>
 <20250108012213.1659364-3-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20250108012213.1659364-3-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8.1.2025 3.21, Wesley Cheng wrote:
> From: Mathias Nyman <mathias.nyman@linux.intel.com>
> 
> Introduce XHCI sec intr, which manages the USB endpoints being requested by
> a client driver.  This is used for when client drivers are attempting to
> offload USB endpoints to another entity for handling USB transfers.  XHCI
> sec intr will allow for drivers to fetch the required information about the
> transfer ring, so the user can submit transfers independently.  Expose the
> required APIs for drivers to register and request for a USB endpoint and to
> manage XHCI secondary interrupters.

The "sec intr" above should also be renamed back to "sideband"

-Mathias

