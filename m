Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82FCC1CB63E
	for <lists+linux-input@lfdr.de>; Fri,  8 May 2020 19:45:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbgEHRpg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 May 2020 13:45:36 -0400
Received: from mga12.intel.com ([192.55.52.136]:19487 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726756AbgEHRpg (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 8 May 2020 13:45:36 -0400
IronPort-SDR: rlgJAHm+FaLCVsQsSdPCdSDyiTBH08LJxCp6CRNjS1/EVeeYWRtEQ4hoUgTtNrwsdkGniwtHqq
 4+n/krnFkwuA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2020 10:45:36 -0700
IronPort-SDR: wTcfihD0NNV2804+JxRH1laZQ/a3bO5O6W0XP4NxLz4tu9mpvF5YuzQ8klSFvGV3HOjicqzJtV
 ZotstwOdI+qA==
X-IronPort-AV: E=Sophos;i="5.73,368,1583222400"; 
   d="scan'208";a="285548624"
Received: from spandruv-mobl.amr.corp.intel.com ([10.212.66.17])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2020 10:45:34 -0700
Message-ID: <dd8033a053be145fd178a89dc362a25a22e17a42.camel@linux.intel.com>
Subject: Re: [PATCH] HID: intel-ish-hid: Replace PCI_DEV_FLAGS_NO_D3 with
 pci_save_state
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc:     rafael.j.wysocki@intel.com, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Zhang Lixu <lixu.zhang@intel.com>, Even Xu <even.xu@intel.com>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Song Hongyan <hongyan.song@intel.com>,
        "open list:INTEL INTEGRATED SENSOR HUB DRIVER" 
        <linux-input@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Date:   Fri, 08 May 2020 10:45:32 -0700
In-Reply-To: <20200505131730.22118-1-kai.heng.feng@canonical.com>
References: <20200505131730.22118-1-kai.heng.feng@canonical.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 2020-05-05 at 21:17 +0800, Kai-Heng Feng wrote:
> PCI_DEV_FLAGS_NO_D3 should not be used outside of PCI core.
> 
> Instead, we can use pci_save_state() to hint PCI core that the device
> should stay at D0 during suspend.

Your changes are doing more than just changing the flag. Can you
explain more about the other changes?
Also make sure that you test on both platforms which has regular S3 and
S0ix (modern standby system).

Thanks,
Srinivas


> 
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
>  drivers/hid/intel-ish-hid/ipc/pci-ish.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
> b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
> index f491d8b4e24c..ab588b9c8d09 100644
> --- a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
> +++ b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
> @@ -106,6 +106,11 @@ static inline bool ish_should_enter_d0i3(struct
> pci_dev *pdev)
>  	return !pm_suspend_via_firmware() || pdev->device ==
> CHV_DEVICE_ID;
>  }
>  
> +static inline bool ish_should_leave_d0i3(struct pci_dev *pdev)
> +{
> +	return !pm_resume_via_firmware() || pdev->device ==
> CHV_DEVICE_ID;
> +}
> +
>  /**
>   * ish_probe() - PCI driver probe callback
>   * @pdev:	pci device
> @@ -215,9 +220,7 @@ static void __maybe_unused
> ish_resume_handler(struct work_struct *work)
>  	struct ishtp_device *dev = pci_get_drvdata(pdev);
>  	int ret;
>  
> -	/* Check the NO_D3 flag to distinguish the resume paths */
> -	if (pdev->dev_flags & PCI_DEV_FLAGS_NO_D3) {
> -		pdev->dev_flags &= ~PCI_DEV_FLAGS_NO_D3;
> +	if (ish_should_leave_d0i3(pdev) && !dev->suspend_flag) {
>  		disable_irq_wake(pdev->irq);
>  
>  		ishtp_send_resume(dev);
> @@ -281,8 +284,10 @@ static int __maybe_unused ish_suspend(struct
> device *device)
>  			 */
>  			ish_disable_dma(dev);
>  		} else {
> -			/* Set the NO_D3 flag, the ISH would enter D0i3
> */
> -			pdev->dev_flags |= PCI_DEV_FLAGS_NO_D3;
> +			/* Save state so PCI core will keep the device
> at D0,
> +			 * the ISH would enter D0i3
> +			 */
> +			pci_save_state(pdev);
>  
Did you test on some C


>  			enable_irq_wake(pdev->irq);
>  		}

