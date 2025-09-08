Return-Path: <linux-input+bounces-14538-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB6CB482DB
	for <lists+linux-input@lfdr.de>; Mon,  8 Sep 2025 05:26:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B99373BDEAD
	for <lists+linux-input@lfdr.de>; Mon,  8 Sep 2025 03:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C361E202C30;
	Mon,  8 Sep 2025 03:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PqdiuiBZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098877263E;
	Mon,  8 Sep 2025 03:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757302013; cv=none; b=hSH+IqeM06eTCha0SEwxzql951LsZTiPCPocpDb1W9aTGJN3rLOa7avAtac0RP7j1Sla5cJTFDZD+dqq4mQ0OmNmJ7N/lrJrGp+RS3ATux3lyp8BerB95DL6kcfaO5UhHU25FgjQngKiSnMSKy8Nj40uciz7W+xDoGQVrAZD/Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757302013; c=relaxed/simple;
	bh=rZNYmw/70yMdjxJYnR6jEUKkMb4RlqjEnkyFq1nx8hA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kzl3pCO0H5FbX1jSx6FdopoeG2xvmr5eQA3UgW5nVBvPfG3HWS7YDl7vDTM8gLEVL1AH7iYOfTmNL5BYGKgsOUZebcnsE+QLdqGpbO3a2OYkA8tCzVefoX4oFT+uwLpuqABhjRzSfWUEhGv+bsUIQAagVKQ3dvxQLaBKlr/u3ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PqdiuiBZ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757302012; x=1788838012;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rZNYmw/70yMdjxJYnR6jEUKkMb4RlqjEnkyFq1nx8hA=;
  b=PqdiuiBZqrqQZ5gQfW/EHB/mwToas5mse4aISoTkNkKuxKwFhNYjq2Uy
   +hGyDilzL3FRqEr+8K1W68g8i6EdIlownjeAZzoHFWvvAfe9o02Gkjp5c
   2L10GYDMC5FtJFqnjg6VJ4PLlGH+bAcB8ks9dpgoHGUkX898eWyUUswIm
   saCu1nEv3WbrW7DVu/bWt1K0qMkOLza/FWEhC/vXtYFRyXcK35vzwjvJp
   wOwgi2ylW08hLtn8F+S0TWpFqO6TsV+SNJgLj7hnB1OCgwCnmoUaJRpkr
   2aA4dbbhvTp8GWFcIB3if6n8+5k4TmC8HISdQy4QwMmOf8P2XHakzwp33
   w==;
X-CSE-ConnectionGUID: hg+dna3lSMOKuqFupWrGUw==
X-CSE-MsgGUID: PkNNY1UETh6OapPf1zrxaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="47124810"
X-IronPort-AV: E=Sophos;i="6.18,247,1751266800"; 
   d="scan'208";a="47124810"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2025 20:26:52 -0700
X-CSE-ConnectionGUID: A4BTjG6USqS0D/opF28n1Q==
X-CSE-MsgGUID: MmnphY7BSlugVqp4NccDOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,247,1751266800"; 
   d="scan'208";a="177024497"
Received: from shsensorbuild.sh.intel.com ([10.239.132.250])
  by fmviesa005.fm.intel.com with ESMTP; 07 Sep 2025 20:26:49 -0700
From: Even Xu <even.xu@intel.com>
To: xinpeng.sun@intel.com
Cc: bentiss@kernel.org,
	jikos@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	Even Xu <even.xu@intel.com>
Subject: Re: [PATCH v2 1/2] hid: intel-thc-hid: intel-quicki2c: Add WCL Device IDs
Date: Mon,  8 Sep 2025 11:26:33 +0800
Message-Id: <20250908032633.1143113-1-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250828021000.3299377-1-xinpeng.sun@intel.com>
References: <20250828021000.3299377-1-xinpeng.sun@intel.com>
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
> Subject: [PATCH v2 1/2] hid: intel-thc-hid: intel-quicki2c: Add WCL Device IDs
> Date: Thu, 28 Aug 2025 10:09:58 +0800	[thread overview]
> Message-ID: <20250828021000.3299377-1-xinpeng.sun@intel.com> (raw)
> 
> Add THC I2C WildcatLake device IDs.
> 
> Signed-off-by: Xinpeng Sun <xinpeng.sun@intel.com>

Thanks for the patch!

Reviewed-by: Even Xu <even.xu@intel.com>

> ---
>  drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c | 2 ++
>  drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
> index f122fde879b9..17b1f2df8f8a 100644
> --- a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
> +++ b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
> @@ -1019,6 +1019,8 @@ static const struct pci_device_id quicki2c_pci_tbl[] = {
>  	{ PCI_DEVICE_DATA(INTEL, THC_PTL_H_DEVICE_ID_I2C_PORT2, &ptl_ddata) },
>  	{ PCI_DEVICE_DATA(INTEL, THC_PTL_U_DEVICE_ID_I2C_PORT1, &ptl_ddata) },
>  	{ PCI_DEVICE_DATA(INTEL, THC_PTL_U_DEVICE_ID_I2C_PORT2, &ptl_ddata) },
> +	{ PCI_DEVICE_DATA(INTEL, THC_WCL_DEVICE_ID_I2C_PORT1, &ptl_ddata) },
> +	{ PCI_DEVICE_DATA(INTEL, THC_WCL_DEVICE_ID_I2C_PORT2, &ptl_ddata) },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(pci, quicki2c_pci_tbl);
> diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
> index b78c8864d39e..240492a38c24 100644
> --- a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
> +++ b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
> @@ -13,6 +13,8 @@
>  #define PCI_DEVICE_ID_INTEL_THC_PTL_H_DEVICE_ID_I2C_PORT2	0xE34A
>  #define PCI_DEVICE_ID_INTEL_THC_PTL_U_DEVICE_ID_I2C_PORT1	0xE448
>  #define PCI_DEVICE_ID_INTEL_THC_PTL_U_DEVICE_ID_I2C_PORT2	0xE44A
> +#define PCI_DEVICE_ID_INTEL_THC_WCL_DEVICE_ID_I2C_PORT1 	0x4D48
> +#define PCI_DEVICE_ID_INTEL_THC_WCL_DEVICE_ID_I2C_PORT2 	0x4D4A
>  
>  /* Packet size value, the unit is 16 bytes */
>  #define MAX_PACKET_SIZE_VALUE_LNL			256
> -- 
> 2.40.1

