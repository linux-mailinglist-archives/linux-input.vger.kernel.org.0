Return-Path: <linux-input+bounces-14317-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8429AB364EC
	for <lists+linux-input@lfdr.de>; Tue, 26 Aug 2025 15:42:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 844D046634F
	for <lists+linux-input@lfdr.de>; Tue, 26 Aug 2025 13:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7597D23817D;
	Tue, 26 Aug 2025 13:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QtTplz1q"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1461C4609;
	Tue, 26 Aug 2025 13:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756215330; cv=none; b=D3XCa2RYwdBUFj9VWp5dtkwu36E0+95/XUJyAukQ7S3wi150JF0Bzr36uEpktsphnhyXxYda/B6rLJO54XhRrvSoYpN6LNJkWbaryx4rjilQMdm5+dRkGJ4lg3qc7Md95QvzpAcad/b68YPgyMhp2UiDbj6AL7f0pYa5+ALakbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756215330; c=relaxed/simple;
	bh=4zzOWz3tOCVtj3UxT2pkXPzRk86vf+e/s92XUhn9BKE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OBY9e1NkmG6bxzswNsr4Umf/VG+8u0slthUy8NZV4V3uFoTzGK+1zc1zKuaXfQy9NP8YihyMCcsPUeR9tWrqBScpkQwnnK46l7ncQCJkypY7c5uPYDlMUdb2zBeT+Xhn9ozqAXbWLEytDApbDjnHEOl3RcQe0wPc95ojcjw4DMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QtTplz1q; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756215329; x=1787751329;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=4zzOWz3tOCVtj3UxT2pkXPzRk86vf+e/s92XUhn9BKE=;
  b=QtTplz1qpwX6RrhGieS+lbuH33RyoeNwmF0v6wKORQ8vAXMRlrnexrH/
   dxee+YrqteFJQhfZv5TkAVfIsl5i5Iby6or5GYbjpOliMJaBW7CntHCru
   HZXDDqShvIg1PRsgXOAk0GJ5GLRQrATzITb0V4cHNVJ6/+cebkXg76SLG
   2WaQ6j2A5qFVJyoTHzd+6Op2iC4DLfUif7lBjM6wM6wUyOwvANYDe+K/l
   tuqUtM7WRFSCmGll30vSCWTWP0y+UEY5xF2pXBnP1gFVex328xfv7d9Zu
   nUdCRQeJd/RhppsNmrm1iGlYzdru7pa7s0kfKXg9wLxJx0/An4d6P4aPS
   w==;
X-CSE-ConnectionGUID: yO4GD17hSwWkPt4OnqR+eg==
X-CSE-MsgGUID: 0Bp5GsydSea+QLKKIoL/lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="46025427"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="46025427"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 06:35:29 -0700
X-CSE-ConnectionGUID: iUioBfLQT/eTdGJcwtpAtg==
X-CSE-MsgGUID: NRItNlDURsiUfHCVIM6bcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="169951396"
Received: from spandruv-desk1.amr.corp.intel.com ([10.125.109.13])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 06:35:28 -0700
Message-ID: <e783088816bdf9ab95b1becde94b6b7bf2a2e93f.camel@linux.intel.com>
Subject: Re: [PATCH 1/2] hid: intel-thc-hid: intel-quicki2c: Add WCL Device
 IDs
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Xinpeng Sun <xinpeng.sun@intel.com>, jikos@kernel.org, bentiss@kernel.org
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 26 Aug 2025 06:35:26 -0700
In-Reply-To: <20250826072701.991046-1-xinpeng.sun@intel.com>
References: <20250826072701.991046-1-xinpeng.sun@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-08-26 at 15:27 +0800, Xinpeng Sun wrote:

Not even a single line of description?

Thanks,
Srinivas

> Signed-off-by: Xinpeng Sun <xinpeng.sun@intel.com>
> ---
> =C2=A0drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c | 2 ++
> =C2=A0drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h | 2 ++
> =C2=A02 files changed, 4 insertions(+)
>=20
> diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
> b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
> index f122fde879b9..17b1f2df8f8a 100644
> --- a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
> +++ b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
> @@ -1019,6 +1019,8 @@ static const struct pci_device_id
> quicki2c_pci_tbl[] =3D {
> =C2=A0	{ PCI_DEVICE_DATA(INTEL, THC_PTL_H_DEVICE_ID_I2C_PORT2,
> &ptl_ddata) },
> =C2=A0	{ PCI_DEVICE_DATA(INTEL, THC_PTL_U_DEVICE_ID_I2C_PORT1,
> &ptl_ddata) },
> =C2=A0	{ PCI_DEVICE_DATA(INTEL, THC_PTL_U_DEVICE_ID_I2C_PORT2,
> &ptl_ddata) },
> +	{ PCI_DEVICE_DATA(INTEL, THC_WCL_DEVICE_ID_I2C_PORT1,
> &ptl_ddata) },
> +	{ PCI_DEVICE_DATA(INTEL, THC_WCL_DEVICE_ID_I2C_PORT2,
> &ptl_ddata) },
> =C2=A0	{ }
> =C2=A0};
> =C2=A0MODULE_DEVICE_TABLE(pci, quicki2c_pci_tbl);
> diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
> b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
> index b78c8864d39e..240492a38c24 100644
> --- a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
> +++ b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
> @@ -13,6 +13,8 @@
> =C2=A0#define
> PCI_DEVICE_ID_INTEL_THC_PTL_H_DEVICE_ID_I2C_PORT2	0xE34A
> =C2=A0#define
> PCI_DEVICE_ID_INTEL_THC_PTL_U_DEVICE_ID_I2C_PORT1	0xE448
> =C2=A0#define
> PCI_DEVICE_ID_INTEL_THC_PTL_U_DEVICE_ID_I2C_PORT2	0xE44A
> +#define
> PCI_DEVICE_ID_INTEL_THC_WCL_DEVICE_ID_I2C_PORT1=C2=A0	0x4D48
> +#define
> PCI_DEVICE_ID_INTEL_THC_WCL_DEVICE_ID_I2C_PORT2=C2=A0	0x4D4A
> =C2=A0
> =C2=A0/* Packet size value, the unit is 16 bytes */
> =C2=A0#define MAX_PACKET_SIZE_VALUE_LNL			256


