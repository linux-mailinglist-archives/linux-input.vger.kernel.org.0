Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C82A1352BF2
	for <lists+linux-input@lfdr.de>; Fri,  2 Apr 2021 18:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234738AbhDBOqK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 2 Apr 2021 10:46:10 -0400
Received: from mga18.intel.com ([134.134.136.126]:40102 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234361AbhDBOqK (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 2 Apr 2021 10:46:10 -0400
IronPort-SDR: y8Zet9CI5jWvuRxlN6t6ACVBVIvIhCyk6EAcGZhLSFJFd50h7ySMIQoHi9pX51nIA+TBkpDSEH
 PY53YU3ziR4g==
X-IronPort-AV: E=McAfee;i="6000,8403,9942"; a="180008390"
X-IronPort-AV: E=Sophos;i="5.81,300,1610438400"; 
   d="scan'208";a="180008390"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2021 07:46:08 -0700
IronPort-SDR: CSsqwVgnkpUyABPya9YjKXv0gBtS3CvlbKsTVuUFjb31UqWZqChSE3ZcwLqoqYO4Cj/vP/hfmO
 lgNfuu+B111Q==
X-IronPort-AV: E=Sophos;i="5.81,300,1610438400"; 
   d="scan'208";a="378106000"
Received: from elizondo-mobl.amr.corp.intel.com ([10.212.205.64])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2021 07:46:08 -0700
Message-ID: <de3adb5c71525908e8021763cc379db35bf5cac4.camel@linux.intel.com>
Subject: Re: [PATCH] HID: intel-ish-hid: Remove an unused variable 'ret'
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Fri, 02 Apr 2021 07:46:08 -0700
In-Reply-To: <1617357988-108792-1-git-send-email-yang.lee@linux.alibaba.com>
References: <1617357988-108792-1-git-send-email-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 2021-04-02 at 18:06 +0800, Yang Li wrote:
> Fixes the following W=1 kernel build warning(s):
> 
> drivers/hid/intel-ish-hid/ipc/pci-ish.c:264:6: warning: variable
> ‘ret’
> set but not used
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

> ---
>  drivers/hid/intel-ish-hid/ipc/pci-ish.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
> b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
> index 06081cf..61efc30 100644
> --- a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
> +++ b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
> @@ -261,7 +261,6 @@ static void __maybe_unused
> ish_resume_handler(struct work_struct *work)
>  	struct pci_dev *pdev = to_pci_dev(ish_resume_device);
>  	struct ishtp_device *dev = pci_get_drvdata(pdev);
>  	uint32_t fwsts = dev->ops->get_fw_status(dev);
> -	int ret;
>  
>  	if (ish_should_leave_d0i3(pdev) && !dev->suspend_flag
>  			&& IPC_IS_ISH_ILUP(fwsts)) {
> @@ -273,7 +272,7 @@ static void __maybe_unused
> ish_resume_handler(struct work_struct *work)
>  
>  		/* Waiting to get resume response */
>  		if (dev->resume_flag)
> -			ret = wait_event_interruptible_timeout(dev-
> >resume_wait,
> +			wait_event_interruptible_timeout(dev-
> >resume_wait,
>  				!dev->resume_flag,
>  				msecs_to_jiffies(WAIT_FOR_RESUME_ACK_MS
> ));
>  

