Return-Path: <linux-input+bounces-6714-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB25986360
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 17:25:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C88EF1F280FD
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 15:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36BF917F4F2;
	Wed, 25 Sep 2024 15:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IPJSh30f"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F6E16EC19;
	Wed, 25 Sep 2024 15:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727276733; cv=none; b=IK9X3uABdf7Hw851lJ0zGN/qaIaIWmOyXJ5EIn1GblyaJ15kVq9Wsa1vjPj6UYwavGnxMPvbWWTfDyK/QLKahTEVCV7k8+5PYd9ScJdBrrd70QNIfe8fPwUkhQFWCLf4aKG/M6N/ggDuTnzfTQiEnRbFnBmnDBsMww1qq0WW9Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727276733; c=relaxed/simple;
	bh=oUEDKfr3g2+OPN66lqRdCh/RebgOM2ORzt3yS88puJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rqEooliebUccuuGXOs1exAvTtmt0eTviTbHThK3H+HAZVIANXdSsmjo7rzaSPwuqmKSCBDC20lp1m3XNPEWmHoGWMCyC3Y5ZvwrrawIWkwX8lHxBiO1b413grugPVUJCEJGzFxp/ZFJcbjCqaDXQFxXbecAp0LZFonOftwgTvWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IPJSh30f; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727276732; x=1758812732;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=oUEDKfr3g2+OPN66lqRdCh/RebgOM2ORzt3yS88puJc=;
  b=IPJSh30fmxlSKqjLJYotYYiGfYR7kKGf6zwpmK4HCW20V2n1oclDJinL
   Js+VoqLVNgj7JyN+HbsH1HoFcw7UmAsNMRIeCTFaQVgKi7Vu/8mw5GBnm
   WAziHMA45e97jPdvdpaMn5U6YD6rYaw+WJF+MGKtenluuZbCN8hgweoEG
   /eAnbNHY04KIjDczdEksPW+1P88CePleqj6Gc2UOSdqcMPpd9JUmXuFys
   HXTWbimC2HNfFGLY7H2BNzhUNZPeM0/HHAg0SEwMei/oiBnZR50ibLObD
   wyhSggKNa80WjR7+YoJtLSGPysLRvH4afDkAAsI5gguxYcYlEzgldn9Em
   Q==;
X-CSE-ConnectionGUID: Gwlp/nFYRrO0w+Jpm4raDw==
X-CSE-MsgGUID: JN4MNJDgShKgDRfpsJ4BTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26482979"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="26482979"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 08:05:31 -0700
X-CSE-ConnectionGUID: UJBsXjh0QG6gd/Q+NIpkLw==
X-CSE-MsgGUID: Q21AA1FjTgeEkddoyjPTvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="76317772"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.246.30]) ([10.245.246.30])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 08:05:26 -0700
Message-ID: <4552c7fb-2c59-485d-af67-0bf36d2424e5@linux.intel.com>
Date: Wed, 25 Sep 2024 17:04:20 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v28 00/32] Introduce QC USB SND audio offloading support
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
References: <20240925010000.2231406-1-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240925010000.2231406-1-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Overall the patchset is much improved but you still have misleading
information, see e.g. the rather poor description of error codes for the
update_offload_route() helper.

I hope other reviewers step-in to cover this large set of patches...
Cheers,
-Pierre

