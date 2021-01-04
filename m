Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BD2C2E9A09
	for <lists+linux-input@lfdr.de>; Mon,  4 Jan 2021 17:07:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728876AbhADQCi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Jan 2021 11:02:38 -0500
Received: from mga11.intel.com ([192.55.52.93]:16444 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728867AbhADQCh (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 4 Jan 2021 11:02:37 -0500
IronPort-SDR: ujtu2biZ8lVMSj4prL3+p+l4fz7H/tTtFKHvjOVbhyYbxZKAC6JPTlksG9vAc1WpGlhyZ6d57W
 USsEnNaJvmhA==
X-IronPort-AV: E=McAfee;i="6000,8403,9854"; a="173462300"
X-IronPort-AV: E=Sophos;i="5.78,474,1599548400"; 
   d="scan'208";a="173462300"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2021 08:00:50 -0800
IronPort-SDR: vwnvJaU/a6I5h5zaXPncVosTvcPloa/uHL/E3L7TzSPubkXuivLFgdZgw7ZXU8bAVMzvuGa7U1
 G8BR428/69dg==
X-IronPort-AV: E=Sophos;i="5.78,474,1599548400"; 
   d="scan'208";a="349990952"
Received: from hnanjund-mobl.amr.corp.intel.com ([10.254.115.148])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2021 08:00:46 -0800
Message-ID: <add58401d7d9962402628fd4746cf16a31ec4b10.camel@linux.intel.com>
Subject: Re: [PATCH 2/2] hid: intel-ish-hid: ipc: Address EHL Sx resume
 issues
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     Zhang Lixu <lixu.zhang@intel.com>, jikos@kernel.org,
        linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, benjamin.tissoires@redhat.com,
        Wei Jiang <wei.w.jiang@intel.com>, Even Xu <even.xu@intel.com>
Date:   Mon, 04 Jan 2021 08:00:42 -0800
In-Reply-To: <20201216063640.4086068-3-lixu.zhang@intel.com>
References: <20201216063640.4086068-1-lixu.zhang@intel.com>
         <20201216063640.4086068-3-lixu.zhang@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 (3.38.2-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 2020-12-16 at 14:36 +0800, Zhang Lixu wrote:
> When OOB is disabled, FW will be power gated when system is in
> S3/S4/S5
> which is the same behavior with legacy ISH FW.
> When OOB is enabled, FW will always power on which is totally
> different
> comparing to legacy ISH FW.
> 
> So NO_D3 flag is not enough to check FW's status after resume.
> Here we can use IPC FW status register to check host link status.
> If it is false, it means FW get reset after power gated, need go
> through
> the whole initialization flow; If it is true, it means FW is alive,
> just
> set host ready bit to let fw know host is up.
> 
> Co-developed-by: Wei Jiang <wei.w.jiang@intel.com>
> Signed-off-by: Wei Jiang <wei.w.jiang@intel.com>
> Signed-off-by: Even Xu <even.xu@intel.com>
> Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

> ---
>  drivers/hid/intel-ish-hid/ipc/hw-ish.h  |  1 +
>  drivers/hid/intel-ish-hid/ipc/ipc.c     | 27
> +++++++++++++++++++++++++
>  drivers/hid/intel-ish-hid/ipc/pci-ish.c |  6 +++++-
>  3 files changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/intel-ish-hid/ipc/hw-ish.h
> b/drivers/hid/intel-ish-hid/ipc/hw-ish.h
> index 1fb294ca463e..111ad259ba74 100644
> --- a/drivers/hid/intel-ish-hid/ipc/hw-ish.h
> +++ b/drivers/hid/intel-ish-hid/ipc/hw-ish.h
> @@ -81,5 +81,6 @@ struct ishtp_device *ish_dev_init(struct pci_dev
> *pdev);
>  int ish_hw_start(struct ishtp_device *dev);
>  void ish_device_disable(struct ishtp_device *dev);
>  int ish_disable_dma(struct ishtp_device *dev);
> +void ish_set_host_ready(struct ishtp_device *dev);
>  
>  #endif /* _ISHTP_HW_ISH_H_ */
> diff --git a/drivers/hid/intel-ish-hid/ipc/ipc.c b/drivers/hid/intel-
> ish-hid/ipc/ipc.c
> index a45ac7fa417b..47bbeb8b492b 100644
> --- a/drivers/hid/intel-ish-hid/ipc/ipc.c
> +++ b/drivers/hid/intel-ish-hid/ipc/ipc.c
> @@ -193,6 +193,33 @@ static void ish_clr_host_rdy(struct ishtp_device
> *dev)
>         ish_reg_write(dev, IPC_REG_HOST_COMM, host_status);
>  }
>  
> +static bool ish_chk_host_rdy(struct ishtp_device *dev)
> +{
> +       uint32_t host_status = ish_reg_read(dev, IPC_REG_HOST_COMM);
> +
> +       return (host_status & IPC_HOSTCOMM_READY_BIT);
> +}
> +
> +/**
> + * ish_set_host_ready() - reconfig ipc host registers
> + * @dev: ishtp device pointer
> + *
> + * Set host to ready state
> + * This API is called in some case:
> + *    fw is still on, but ipc is powered down.
> + *    such as OOB case.
> + *
> + * Return: 0 for success else error fault code
> + */
> +void ish_set_host_ready(struct ishtp_device *dev)
> +{
> +       if (ish_chk_host_rdy(dev))
> +               return;
> +
> +       ish_set_host_rdy(dev);
> +       set_host_ready(dev);
> +}
> +
>  /**
>   * _ishtp_read_hdr() - Read message header
>   * @dev: ISHTP device pointer
> diff --git a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
> b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
> index c9c5488e44cb..8cb40696984a 100644
> --- a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
> +++ b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
> @@ -259,11 +259,15 @@ static void __maybe_unused
> ish_resume_handler(struct work_struct *work)
>  {
>         struct pci_dev *pdev = to_pci_dev(ish_resume_device);
>         struct ishtp_device *dev = pci_get_drvdata(pdev);
> +       uint32_t fwsts = dev->ops->get_fw_status(dev);
>         int ret;
>  
> -       if (ish_should_leave_d0i3(pdev) && !dev->suspend_flag) {
> +       if (ish_should_leave_d0i3(pdev) && !dev->suspend_flag
> +                       && IPC_IS_ISH_ILUP(fwsts)) {
>                 disable_irq_wake(pdev->irq);
>  
> +               ish_set_host_ready(dev);
> +
>                 ishtp_send_resume(dev);
>  
>                 /* Waiting to get resume response */


