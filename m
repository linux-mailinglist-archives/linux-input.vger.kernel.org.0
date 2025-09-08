Return-Path: <linux-input+bounces-14539-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DC4B482F4
	for <lists+linux-input@lfdr.de>; Mon,  8 Sep 2025 05:42:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2BA717C00A
	for <lists+linux-input@lfdr.de>; Mon,  8 Sep 2025 03:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3F22218ADD;
	Mon,  8 Sep 2025 03:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a6oYDmKr"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18931218827;
	Mon,  8 Sep 2025 03:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757302939; cv=none; b=Z5UJCzDaSRQCaGG0qmwIvhTYLzZj7Sbzr5Cq8MSlvCAlcERXKGn1ejfxeW0O//QXvFNFEX90Y/MRzEydnJvsUf/AQqzY+SSM6OoRcHB4huuAo9mHAp/xxuLdUu8j9FhwKT14VUhrAkjdgzGUG04a8FebcRTU8X6/UnKwKC343Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757302939; c=relaxed/simple;
	bh=MBX710NxvGm0v3LEfyFhHX7kzobujGNsorQ1LrWFIZM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i9JzkB8XWj+D8EN7IfNrvfJZ9uKb5xArOAnsAxTVAt6Kb5ynfYolApmIGH4rza92y9g6zOaCzi27s2roNV6UA06SsS2PsAZpbAk483NcYLG4SWbURIptdApUVecxJAXC9xXZ66bFVNHeSQ0omlbnErcnTvWffntLT/CXAj0zRcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a6oYDmKr; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757302938; x=1788838938;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MBX710NxvGm0v3LEfyFhHX7kzobujGNsorQ1LrWFIZM=;
  b=a6oYDmKrinoZHvEEFr9TuIAVSf1uy2X4CgVZGlHjDXJqzyPdilYJ6H4M
   /ddM6tKTnyWpvujEwbBDGW280Yas3FXA4iVPXLZjE05oouXt+T6qaBvNJ
   z33KG2JwDSMbBfLnsBAyQQXuAJExawJsSiyxZ4xS5BzhwNWyDTMMSPl4K
   gRRgIrwfdUD5yk+ycs/krSN+42FNHTJackUeo7UiSV3dUlh2f+XFalmhD
   3UN52/+aNDkLtuPGni2W+fzfkNeYrEijWvF+d2SrHEN+Nqw53RrgD+0Xi
   LVJJKpg9V3jPxDjx8MFYtCVmb0kS8WpROXwRJMgixqdg7iZRQjMuSGFEm
   Q==;
X-CSE-ConnectionGUID: y7eAGGKOTCyP/Joiw0R99w==
X-CSE-MsgGUID: nDz3OXHTTPGjo9q5g62HCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="47126580"
X-IronPort-AV: E=Sophos;i="6.18,247,1751266800"; 
   d="scan'208";a="47126580"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2025 20:42:14 -0700
X-CSE-ConnectionGUID: VeeHUBRMSyKHN74DVTYbUA==
X-CSE-MsgGUID: 3wFllgK2Sp++NlPrwb3t7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,247,1751266800"; 
   d="scan'208";a="172244680"
Received: from shsensorbuild.sh.intel.com ([10.239.132.250])
  by orviesa009.jf.intel.com with ESMTP; 07 Sep 2025 20:42:12 -0700
From: Even Xu <even.xu@intel.com>
To: xinpeng.sun@intel.com
Cc: bentiss@kernel.org,
	jikos@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	Even Xu <even.xu@intel.com>
Subject: Re: [PATCH v2 2/2] hid: intel-thc-hid: intel-quickspi: Add WCL Device IDs
Date: Mon,  8 Sep 2025 11:42:05 +0800
Message-Id: <20250908034205.1157182-1-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250828021000.3299377-2-xinpeng.sun@intel.com>
References: <20250828021000.3299377-2-xinpeng.sun@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> From: Xinpeng Sun <xinpeng.sun@intel.com>
> To: jikos@kernel.org, bentiss@kernel.org
> Cc: srinivas.pandruvada@linux.intel.com, linux-input@vger.kernel.org,
> 	linux-kernel@vger.kernel.org, Xinpeng Sun <xinpeng.sun@intel.com>
> Subject: [PATCH v2 2/2] hid: intel-thc-hid: intel-quickspi: Add WCL Device IDs
> Date: Thu, 28 Aug 2025 10:09:59 +0800	[thread overview]
> Message-ID: <20250828021000.3299377-2-xinpeng.sun@intel.com> (raw)
> In-Reply-To: <20250828021000.3299377-1-xinpeng.sun@intel.com>
> 
> Add THC SPI WildcatLake device IDs.
> 
> Signed-off-by: Xinpeng Sun <xinpeng.sun@intel.com>

LGTM, thanks for the patch!

Reviewed-by: Even Xu <even.xu@intel.com>

> ---
>  drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c | 2 ++
>  drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
> index 5e5f179dd113..84314989dc53 100644
> --- a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
> +++ b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
> @@ -976,6 +976,8 @@ static const struct pci_device_id quickspi_pci_tbl[] = {
>  	{PCI_DEVICE_DATA(INTEL, THC_PTL_H_DEVICE_ID_SPI_PORT2, &ptl), },
>  	{PCI_DEVICE_DATA(INTEL, THC_PTL_U_DEVICE_ID_SPI_PORT1, &ptl), },
>  	{PCI_DEVICE_DATA(INTEL, THC_PTL_U_DEVICE_ID_SPI_PORT2, &ptl), },
> +	{PCI_DEVICE_DATA(INTEL, THC_WCL_DEVICE_ID_SPI_PORT1, &ptl), },
> +	{PCI_DEVICE_DATA(INTEL, THC_WCL_DEVICE_ID_SPI_PORT2, &ptl), },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(pci, quickspi_pci_tbl);
> diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h
> index 6fdf674b21c5..f3532d866749 100644
> --- a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h
> +++ b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h
> @@ -19,6 +19,8 @@
>  #define PCI_DEVICE_ID_INTEL_THC_PTL_H_DEVICE_ID_SPI_PORT2	0xE34B
>  #define PCI_DEVICE_ID_INTEL_THC_PTL_U_DEVICE_ID_SPI_PORT1	0xE449
>  #define PCI_DEVICE_ID_INTEL_THC_PTL_U_DEVICE_ID_SPI_PORT2	0xE44B
> +#define PCI_DEVICE_ID_INTEL_THC_WCL_DEVICE_ID_SPI_PORT1 	0x4D49
> +#define PCI_DEVICE_ID_INTEL_THC_WCL_DEVICE_ID_SPI_PORT2 	0x4D4B
>  
>  /* HIDSPI special ACPI parameters DSM methods */
>  #define ACPI_QUICKSPI_REVISION_NUM			2
> -- 
> 2.40.1

