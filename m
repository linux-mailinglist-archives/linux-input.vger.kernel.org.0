Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43D1C30F5F6
	for <lists+linux-input@lfdr.de>; Thu,  4 Feb 2021 16:17:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237161AbhBDPQC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Feb 2021 10:16:02 -0500
Received: from mga17.intel.com ([192.55.52.151]:4525 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237107AbhBDPPr (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 4 Feb 2021 10:15:47 -0500
IronPort-SDR: TiQ9iVcpZUcHYK5pPxich3UODayVnWNYWtkoKEby4l8Jll8YXdw7EFSFv+sOIcLszSumaj4g3J
 rSW8U4rkV+rQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="161013714"
X-IronPort-AV: E=Sophos;i="5.79,401,1602572400"; 
   d="scan'208";a="161013714"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2021 07:14:01 -0800
IronPort-SDR: fUWOH2XXoBytr+VSynl5yUbVuoa1+cd1LEsUGWADXT64FliTJN0lqF2nChXzaX3E1YgmiPTNu2
 iFVYhjhS3esA==
X-IronPort-AV: E=Sophos;i="5.79,401,1602572400"; 
   d="scan'208";a="508170614"
Received: from anumolux-mobl1.amr.corp.intel.com (HELO spandruv-mobl.amr.corp.intel.com) ([10.209.40.39])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2021 07:14:00 -0800
Message-ID: <85a4e6e61ac977d0d00dd9140a9e85f1102b3a6d.camel@linux.intel.com>
Subject: Re: [PATCH] HID: intel-ish-hid: ipc: Add Tiger Lake H PCI device ID
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     You-Sheng Yang <vicamo.yang@canonical.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Thu, 04 Feb 2021 07:13:47 -0800
In-Reply-To: <20210204083315.122952-1-vicamo.yang@canonical.com>
References: <20210204083315.122952-1-vicamo.yang@canonical.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 2021-02-04 at 16:33 +0800, You-Sheng Yang wrote:
> Added Tiger Lake H PCI device ID to the supported device list.
> 
> Signed-off-by: You-Sheng Yang <vicamo.yang@canonical.com>
Did you get chance to verify on a platform?
Do you see sensors enumerated in /sys/bus/iio?

Thanks,
Srinivas

> ---
>  drivers/hid/intel-ish-hid/ipc/hw-ish.h  | 1 +
>  drivers/hid/intel-ish-hid/ipc/pci-ish.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/hid/intel-ish-hid/ipc/hw-ish.h
> b/drivers/hid/intel-ish-hid/ipc/hw-ish.h
> index 1fb294ca463e..21b0e6123754 100644
> --- a/drivers/hid/intel-ish-hid/ipc/hw-ish.h
> +++ b/drivers/hid/intel-ish-hid/ipc/hw-ish.h
> @@ -27,6 +27,7 @@
>  #define CMP_H_DEVICE_ID		0x06FC
>  #define EHL_Ax_DEVICE_ID	0x4BB3
>  #define TGL_LP_DEVICE_ID	0xA0FC
> +#define TGL_H_DEVICE_ID		0x43FC
>  
>  #define	REVISION_ID_CHT_A0	0x6
>  #define	REVISION_ID_CHT_Ax_SI	0x0
> diff --git a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
> b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
> index c6d48a8648b7..6dea657b7b15 100644
> --- a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
> +++ b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
> @@ -37,6 +37,7 @@ static const struct pci_device_id ish_pci_tbl[] = {
>  	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, CMP_H_DEVICE_ID)},
>  	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, EHL_Ax_DEVICE_ID)},
>  	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, TGL_LP_DEVICE_ID)},
> +	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, TGL_H_DEVICE_ID)},
>  	{0, }
>  };
>  MODULE_DEVICE_TABLE(pci, ish_pci_tbl);

