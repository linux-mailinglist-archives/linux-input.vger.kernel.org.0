Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FD171F7768
	for <lists+linux-input@lfdr.de>; Fri, 12 Jun 2020 13:43:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725791AbgFLLnV convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Fri, 12 Jun 2020 07:43:21 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:32841 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbgFLLnU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 12 Jun 2020 07:43:20 -0400
Received: from mail-pl1-f199.google.com ([209.85.214.199])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1jji5d-00088M-Do
        for linux-input@vger.kernel.org; Fri, 12 Jun 2020 11:43:17 +0000
Received: by mail-pl1-f199.google.com with SMTP id s7so5994371plp.13
        for <linux-input@vger.kernel.org>; Fri, 12 Jun 2020 04:43:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=tX6T036XKpQGxpEe93S96KsVk1SJ0qpeUi5sT/LTWg0=;
        b=s5x8Ap9d48yjBVI8JSN5bP5M6flb08bHCwAjAuMRjti30TwSKqSFh1VfiAfGyLyw3O
         FMOxK3C03FhZ8b1ZQK4MXf3ATtcDTThPF+0CfHh/nPFyAByrE3JEtogKKXFMKO9DoUEz
         BhLSuozYrr4BBMijcxG3uecCn/uI56MRn2BRMpbWe21KpsF9VBhksPAapNW5vVpsi4Up
         LLWWFEcLjQsu1GStR2mXwnaTd6iKNYz9dWKKkEyfo11xei5RrvEmi1M3BHU0Lq4Tbw7p
         kEZZGElLgBYKcEP1827gUc5fI2GAPHj+yy4hzzqwJNVEvGxeRwjXD2E3bSFlB++Q39Bv
         sDrw==
X-Gm-Message-State: AOAM530DtydzY9XEtW4+taPziMFQaIFe8UbnwZvbZA9N05zntdEFdZqm
        Se/7YOP85iRP+H3tuOSOZSVMLaHDXDRQ6TSLufGI0fxMQ9Pi4VsHpqok+g/HeKSjXtUOSjiMbqS
        bIE8OTF48pUHaMAp+3vXQgTGvFps0bsnyhtQy0ZWI
X-Received: by 2002:a05:6a00:1592:: with SMTP id u18mr7181386pfk.26.1591962195972;
        Fri, 12 Jun 2020 04:43:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNLrjKPMekm6EZDo957A/izfwCYUmN88T9k29qkhw1VSuhndg3IARKc8GvW7HriAbpIeY9pw==
X-Received: by 2002:a05:6a00:1592:: with SMTP id u18mr7181362pfk.26.1591962195591;
        Fri, 12 Jun 2020 04:43:15 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net. [220.133.187.190])
        by smtp.gmail.com with ESMTPSA id q22sm6124729pfg.192.2020.06.12.04.43.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Jun 2020 04:43:15 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH] HID: intel-ish-hid: Replace PCI_DEV_FLAGS_NO_D3 with
 pci_save_state
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <7E88D4A8-8056-4E12-8B2C-27307A7C5E7D@canonical.com>
Date:   Fri, 12 Jun 2020 19:43:11 +0800
Cc:     "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Zhang Lixu <lixu.zhang@intel.com>, Even Xu <even.xu@intel.com>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Song Hongyan <hongyan.song@intel.com>,
        "open list:INTEL INTEGRATED SENSOR HUB DRIVER" 
        <linux-input@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <68C336BB-C2E1-4DE4-8137-18F7FBEF140C@canonical.com>
References: <20200505131730.22118-1-kai.heng.feng@canonical.com>
 <dd8033a053be145fd178a89dc362a25a22e17a42.camel@linux.intel.com>
 <7E88D4A8-8056-4E12-8B2C-27307A7C5E7D@canonical.com>
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



> On May 21, 2020, at 12:43, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
> 
> Hi Srinivas,
> 
>> On May 9, 2020, at 01:45, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com> wrote:
>> 
>> On Tue, 2020-05-05 at 21:17 +0800, Kai-Heng Feng wrote:
>>> PCI_DEV_FLAGS_NO_D3 should not be used outside of PCI core.
>>> 
>>> Instead, we can use pci_save_state() to hint PCI core that the device
>>> should stay at D0 during suspend.
>> 
>> Your changes are doing more than just changing the flag. Can you
>> explain more about the other changes?
> 
> By using pci_save_state(), in addition to keep itself stay at D0, the parent bridge will also stay at D0.
> So it's a better approach to achieve the same thing.
> 
>> Also make sure that you test on both platforms which has regular S3 and
>> S0ix (modern standby system).
> 
> Actually I don't have any physical hardware to test the patch, I found the issue when I search for D3 quirks through the source code.
> 
> Can you guys do a quick smoketest for this patch?

Tested this patch on an S2idle system with intel-ish (Latitude 9510) and it works fine.
Please consider merging this patch, thanks!

Kai-Heng

> 
> Kai-Heng
> 
>> 
>> Thanks,
>> Srinivas
>> 
>> 
>>> 
>>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>>> ---
>>> drivers/hid/intel-ish-hid/ipc/pci-ish.c | 15 ++++++++++-----
>>> 1 file changed, 10 insertions(+), 5 deletions(-)
>>> 
>>> diff --git a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
>>> b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
>>> index f491d8b4e24c..ab588b9c8d09 100644
>>> --- a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
>>> +++ b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
>>> @@ -106,6 +106,11 @@ static inline bool ish_should_enter_d0i3(struct
>>> pci_dev *pdev)
>>> 	return !pm_suspend_via_firmware() || pdev->device ==
>>> CHV_DEVICE_ID;
>>> }
>>> 
>>> +static inline bool ish_should_leave_d0i3(struct pci_dev *pdev)
>>> +{
>>> +	return !pm_resume_via_firmware() || pdev->device ==
>>> CHV_DEVICE_ID;
>>> +}
>>> +
>>> /**
>>> * ish_probe() - PCI driver probe callback
>>> * @pdev:	pci device
>>> @@ -215,9 +220,7 @@ static void __maybe_unused
>>> ish_resume_handler(struct work_struct *work)
>>> 	struct ishtp_device *dev = pci_get_drvdata(pdev);
>>> 	int ret;
>>> 
>>> -	/* Check the NO_D3 flag to distinguish the resume paths */
>>> -	if (pdev->dev_flags & PCI_DEV_FLAGS_NO_D3) {
>>> -		pdev->dev_flags &= ~PCI_DEV_FLAGS_NO_D3;
>>> +	if (ish_should_leave_d0i3(pdev) && !dev->suspend_flag) {
>>> 		disable_irq_wake(pdev->irq);
>>> 
>>> 		ishtp_send_resume(dev);
>>> @@ -281,8 +284,10 @@ static int __maybe_unused ish_suspend(struct
>>> device *device)
>>> 			 */
>>> 			ish_disable_dma(dev);
>>> 		} else {
>>> -			/* Set the NO_D3 flag, the ISH would enter D0i3
>>> */
>>> -			pdev->dev_flags |= PCI_DEV_FLAGS_NO_D3;
>>> +			/* Save state so PCI core will keep the device
>>> at D0,
>>> +			 * the ISH would enter D0i3
>>> +			 */
>>> +			pci_save_state(pdev);
>>> 
>> Did you test on some C
>> 
>> 
>>> 			enable_irq_wake(pdev->irq);
>>> 		}
> 

