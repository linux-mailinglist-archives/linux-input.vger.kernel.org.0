Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70A89201B5A
	for <lists+linux-input@lfdr.de>; Fri, 19 Jun 2020 21:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389541AbgFSTem (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Jun 2020 15:34:42 -0400
Received: from mga01.intel.com ([192.55.52.88]:3024 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389119AbgFSTel (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Jun 2020 15:34:41 -0400
IronPort-SDR: 9GiwiiIZG9Lqzd1oMMCmtkd5IFAmpJ3DSz1wbqrhYR9+X25HOuT99LEY86pEZePfmp1/KBdpIf
 HEuQaACROI8A==
X-IronPort-AV: E=McAfee;i="6000,8403,9657"; a="161183233"
X-IronPort-AV: E=Sophos;i="5.75,256,1589266800"; 
   d="scan'208";a="161183233"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2020 12:34:40 -0700
IronPort-SDR: /zcQv9YbkGIwn1+XjFiS3sJN6uw77MllKtuvkY/QZZXic8iPtpaLi0Vt862EbbiaZv5LVAsx75
 3rw/UWZ70DwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,256,1589266800"; 
   d="scan'208";a="292223300"
Received: from spandruv-mobl3.amr.corp.intel.com ([10.254.109.157])
  by orsmga002.jf.intel.com with ESMTP; 19 Jun 2020 12:34:40 -0700
Message-ID: <a27d9ebf83fde4dd596ff426e6413b12b947d973.camel@linux.intel.com>
Subject: Re: [PATCH v2] HID: intel-ish-hid: Replace PCI_DEV_FLAGS_NO_D3 with
 pci_save_state
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Zhang Lixu <lixu.zhang@intel.com>, Even Xu <even.xu@intel.com>,
        Song Hongyan <hongyan.song@intel.com>,
        "open list:INTEL INTEGRATED SENSOR HUB DRIVER" 
        <linux-input@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Date:   Fri, 19 Jun 2020 12:34:39 -0700
In-Reply-To: <20200619140215.11779-1-kai.heng.feng@canonical.com>
References: <20200619140215.11779-1-kai.heng.feng@canonical.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 2020-06-19 at 22:02 +0800, Kai-Heng Feng wrote:
> PCI_DEV_FLAGS_NO_D3 should not be used outside of PCI core.
> 
> Instead, we can use pci_save_state() to hint PCI core that the device
> should stay at D0 during suspend. By doing so, PCI core will let the
> upstream bridges also stays at D0 so the entire hierachy is in the
> correct power state as PCI spec mandates.
> 
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
> v2:
>  - Wording change.
> 
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
Better to use multi-line comment style.
Otherwise you can add my ACK.

Thanks,
Srinivas

> +			pci_save_state(pdev);
>  
>  			enable_irq_wake(pdev->irq);
>  		}

