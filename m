Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D9F31DC65A
	for <lists+linux-input@lfdr.de>; Thu, 21 May 2020 06:43:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726909AbgEUEnX convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Thu, 21 May 2020 00:43:23 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:58278 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726394AbgEUEnX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 May 2020 00:43:23 -0400
Received: from mail-pg1-f200.google.com ([209.85.215.200])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1jbd3A-0001CK-I2
        for linux-input@vger.kernel.org; Thu, 21 May 2020 04:43:20 +0000
Received: by mail-pg1-f200.google.com with SMTP id m15so4268178pgl.15
        for <linux-input@vger.kernel.org>; Wed, 20 May 2020 21:43:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=G6sbmJ1zMyepwuVJjLXFEG2LKkrAExiS+RYzx1Mub/E=;
        b=C+Re0TY3YeskTfVkpo2gJKXcA6D2BdbXRdEcE6iL56/GPcoCY77N6CbibJBEDyRjej
         hO8XDn+VjrMn5xSVz1jDZLBbPHB80HPhbWqnGIYLCCLriuSUixdyDpEe2x+xCtF8eME6
         JiaiL+eTlsykjNLP5vBeOOZ4vvGJAd9E5EhTj6A4+acK7gq3pjRUKv5Gem4Aovc25sM9
         NK+28Diu8tUggNR7pn0yO4Ihte6plW6Xk9oh/GfNUiXdo3qkqHAmMMDUCq913Ed4vgeZ
         l9S02tLh4qhmTWW6/H6Fqv0Jfr8HpsrFeaFiuYVl9qeukHtbe5TcOIgQH4D86NsWCfaj
         9Fmw==
X-Gm-Message-State: AOAM533bY93U/y/oygQ1WE9KAKipQPNklnt7uRx80TL0ausJf1gqx7AQ
        PcO8/HGtVQ4F6NVQMOl40lZXwGOyqp2nhA1XhzAGM+WRI+v7gbamCI19nFVmg2I9e6IsWMi5bye
        +HlZXdr6DNUNFngtDDt1X+5PaOvoTyErzvm9b/LGB
X-Received: by 2002:a17:90a:db0f:: with SMTP id g15mr9457912pjv.8.1590036199153;
        Wed, 20 May 2020 21:43:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6b4J9SqcR0p1GIzK0YdT6SwhtFzDL/W7puHYv1k+vVRvkUXNZl1xoH/lTmtU82Cj8wZZ2Zw==
X-Received: by 2002:a17:90a:db0f:: with SMTP id g15mr9457886pjv.8.1590036198760;
        Wed, 20 May 2020 21:43:18 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net. [220.133.187.190])
        by smtp.gmail.com with ESMTPSA id k12sm3313947pfg.177.2020.05.20.21.43.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 May 2020 21:43:18 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH] HID: intel-ish-hid: Replace PCI_DEV_FLAGS_NO_D3 with
 pci_save_state
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <dd8033a053be145fd178a89dc362a25a22e17a42.camel@linux.intel.com>
Date:   Thu, 21 May 2020 12:43:15 +0800
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
Message-Id: <7E88D4A8-8056-4E12-8B2C-27307A7C5E7D@canonical.com>
References: <20200505131730.22118-1-kai.heng.feng@canonical.com>
 <dd8033a053be145fd178a89dc362a25a22e17a42.camel@linux.intel.com>
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Srinivas,

> On May 9, 2020, at 01:45, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com> wrote:
> 
> On Tue, 2020-05-05 at 21:17 +0800, Kai-Heng Feng wrote:
>> PCI_DEV_FLAGS_NO_D3 should not be used outside of PCI core.
>> 
>> Instead, we can use pci_save_state() to hint PCI core that the device
>> should stay at D0 during suspend.
> 
> Your changes are doing more than just changing the flag. Can you
> explain more about the other changes?

By using pci_save_state(), in addition to keep itself stay at D0, the parent bridge will also stay at D0.
So it's a better approach to achieve the same thing.

> Also make sure that you test on both platforms which has regular S3 and
> S0ix (modern standby system).

Actually I don't have any physical hardware to test the patch, I found the issue when I search for D3 quirks through the source code.

Can you guys do a quick smoketest for this patch?

Kai-Heng

> 
> Thanks,
> Srinivas
> 
> 
>> 
>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>> ---
>> drivers/hid/intel-ish-hid/ipc/pci-ish.c | 15 ++++++++++-----
>> 1 file changed, 10 insertions(+), 5 deletions(-)
>> 
>> diff --git a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
>> b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
>> index f491d8b4e24c..ab588b9c8d09 100644
>> --- a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
>> +++ b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
>> @@ -106,6 +106,11 @@ static inline bool ish_should_enter_d0i3(struct
>> pci_dev *pdev)
>> 	return !pm_suspend_via_firmware() || pdev->device ==
>> CHV_DEVICE_ID;
>> }
>> 
>> +static inline bool ish_should_leave_d0i3(struct pci_dev *pdev)
>> +{
>> +	return !pm_resume_via_firmware() || pdev->device ==
>> CHV_DEVICE_ID;
>> +}
>> +
>> /**
>>  * ish_probe() - PCI driver probe callback
>>  * @pdev:	pci device
>> @@ -215,9 +220,7 @@ static void __maybe_unused
>> ish_resume_handler(struct work_struct *work)
>> 	struct ishtp_device *dev = pci_get_drvdata(pdev);
>> 	int ret;
>> 
>> -	/* Check the NO_D3 flag to distinguish the resume paths */
>> -	if (pdev->dev_flags & PCI_DEV_FLAGS_NO_D3) {
>> -		pdev->dev_flags &= ~PCI_DEV_FLAGS_NO_D3;
>> +	if (ish_should_leave_d0i3(pdev) && !dev->suspend_flag) {
>> 		disable_irq_wake(pdev->irq);
>> 
>> 		ishtp_send_resume(dev);
>> @@ -281,8 +284,10 @@ static int __maybe_unused ish_suspend(struct
>> device *device)
>> 			 */
>> 			ish_disable_dma(dev);
>> 		} else {
>> -			/* Set the NO_D3 flag, the ISH would enter D0i3
>> */
>> -			pdev->dev_flags |= PCI_DEV_FLAGS_NO_D3;
>> +			/* Save state so PCI core will keep the device
>> at D0,
>> +			 * the ISH would enter D0i3
>> +			 */
>> +			pci_save_state(pdev);
>> 
> Did you test on some C
> 
> 
>> 			enable_irq_wake(pdev->irq);
>> 		}

