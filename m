Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 849F520D6DF
	for <lists+linux-input@lfdr.de>; Mon, 29 Jun 2020 22:06:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731858AbgF2TYr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Jun 2020 15:24:47 -0400
Received: from mga11.intel.com ([192.55.52.93]:22498 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732144AbgF2TYM (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Jun 2020 15:24:12 -0400
IronPort-SDR: fugI7SEnECD8AcUrpPHl2Xm5xd7GVForJiOXr6uS0/Q6baUz9pxuSsaMfB0N2rtQJ703BA3CAR
 mIqm26Bip02w==
X-IronPort-AV: E=McAfee;i="6000,8403,9666"; a="144218730"
X-IronPort-AV: E=Sophos;i="5.75,295,1589266800"; 
   d="scan'208";a="144218730"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2020 11:43:17 -0700
IronPort-SDR: 2J4kH3ECOEn2x8rudw4qFHfxJNd+hi7C5BzkjhtJL2RgnSBmdXcfphgfQtu1zmq40tmcXCkTVQ
 gfm3h3i66LWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,295,1589266800"; 
   d="scan'208";a="318924324"
Received: from spandruv-mobl3.amr.corp.intel.com ([10.254.77.33])
  by orsmga007.jf.intel.com with ESMTP; 29 Jun 2020 11:43:16 -0700
Message-ID: <651b555b0723352ad5c624a68bf4ed76429314d8.camel@linux.intel.com>
Subject: Re: [PATCH v3] HID: intel-ish-hid: Replace PCI_DEV_FLAGS_NO_D3 with
 pci_save_state
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Zhang Lixu <lixu.zhang@intel.com>, Even Xu <even.xu@intel.com>,
        "open list:INTEL INTEGRATED SENSOR HUB DRIVER" 
        <linux-input@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Date:   Mon, 29 Jun 2020 11:43:16 -0700
In-Reply-To: <20200629041648.19113-1-kai.heng.feng@canonical.com>
References: <20200629041648.19113-1-kai.heng.feng@canonical.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 2020-06-29 at 12:16 +0800, Kai-Heng Feng wrote:
> PCI_DEV_FLAGS_NO_D3 should not be used outside of PCI core.
> 
> Instead, we can use pci_save_state() to hint PCI core that the device
> should stay at D0 during suspend. By doing so, PCI core will let the
> upstream bridges also stays at D0 so the entire hierarchy is in the
> correct power state as PCI spec mandates.
> 
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

> ---
> v3:
>  - Use multi-line comments.
> v2:
>  - Wording change.
> 
>  drivers/hid/intel-ish-hid/ipc/pci-ish.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
> b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
> index f491d8b4e24c..c6d48a8648b7 100644
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
> @@ -281,8 +284,11 @@ static int __maybe_unused ish_suspend(struct
> device *device)
>  			 */
>  			ish_disable_dma(dev);
>  		} else {
> -			/* Set the NO_D3 flag, the ISH would enter D0i3
> */
> -			pdev->dev_flags |= PCI_DEV_FLAGS_NO_D3;
> +			/*
> +			 * Save state so PCI core will keep the device
> at D0,
> +			 * the ISH would enter D0i3
> +			 */
> +			pci_save_state(pdev);
>  
>  			enable_irq_wake(pdev->irq);
>  		}

