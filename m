Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 929FC200103
	for <lists+linux-input@lfdr.de>; Fri, 19 Jun 2020 06:16:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbgFSEQ5 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Fri, 19 Jun 2020 00:16:57 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:45921 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726094AbgFSEQ4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Jun 2020 00:16:56 -0400
Received: from mail-pf1-f198.google.com ([209.85.210.198])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1jm8ST-0003Bk-P5
        for linux-input@vger.kernel.org; Fri, 19 Jun 2020 04:16:54 +0000
Received: by mail-pf1-f198.google.com with SMTP id c7so5984023pfi.21
        for <linux-input@vger.kernel.org>; Thu, 18 Jun 2020 21:16:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=xPGhMsH5BAJY2SnMB4S7uPRyLNT6K14xlqaxOAZv3to=;
        b=KPigvXhrn3g/lnmTkF1NIHhEB+V5cTufYuwFBlmLJP2c5Vjg7CHecEtDnlBKy57+bg
         pAHX3ggIGltac7GcsVb4IKHWihHMU1UmdSXXbYxOOpPhVilWeptQbhyQRs9QLexjqP0T
         IYwGdG4QfwpLyFhYgca/XmAb4oQO3+w5KazTrTdql2RGSEcfhr1yfTrawZmFeLywywq1
         r0p1EFSuCncRAFBKmqDlWs6QIB8zYnroDzeeWdmSNHigSFVG1N2HX8VQnQyIULFmNt0P
         WjVetBwz/8hhsxrgj2wi75tAAPeCl6N9KS0MIZ2aeMGERyMrr0deTr4dRzRJ6bjoqY6A
         WldQ==
X-Gm-Message-State: AOAM5326OAFFxbFvVmOdvIX6Dv+xoVp0z1fN8u5douDnu5AwGYlLz3Y4
        nMs5+QilWBWys5/EqwUWQOfdHhMnoeVitvZkTrQe1swTTPY7zch3gq4lSlD06UDL5GULfyWZgGP
        xY2XRtz9XR0E+PULICWgpCe+xFxaY9H1hMEGGaZ+I
X-Received: by 2002:a65:4c8a:: with SMTP id m10mr1507703pgt.138.1592540212091;
        Thu, 18 Jun 2020 21:16:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFWyjdmQuBq3Tq7NpYQ2+kssm4u29Qa/b3v33nhK4iOvAtAidX052gjfmchPjC6b9FtGhrEg==
X-Received: by 2002:a65:4c8a:: with SMTP id m10mr1507679pgt.138.1592540211604;
        Thu, 18 Jun 2020 21:16:51 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net. [220.133.187.190])
        by smtp.gmail.com with ESMTPSA id gm11sm3834302pjb.9.2020.06.18.21.16.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Jun 2020 21:16:51 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v3] HID: i2c-hid: Enable touchpad wakeup from
 Suspend-to-Idle
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <c280d8b5-05bf-e560-51df-c57edeffe8a3@redhat.com>
Date:   Fri, 19 Jun 2020 12:16:47 +0800
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        You-Sheng Yang <vicamo.yang@canonical.com>,
        Daniel Playfair Cal <daniel.playfair.cal@gmail.com>,
        HungNien Chen <hn.chen@weidahitech.com>,
        Pavel Balan <admin@kryma.net>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <FAF68BF5-FCBC-4D08-AF0F-98EEA209BB86@canonical.com>
References: <20200618145515.5055-1-kai.heng.feng@canonical.com>
 <c280d8b5-05bf-e560-51df-c57edeffe8a3@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

> On Jun 18, 2020, at 23:28, Hans de Goede <hdegoede@redhat.com> wrote:
> 
> Hi,
> 
> On 6/18/20 4:55 PM, Kai-Heng Feng wrote:
>> Many laptops can be woken up from Suspend-to-Idle by touchpad. This is
>> also the default behavior on other OSes.
>> So let's enable the wakeup support if the system defaults to
>> Suspend-to-Idle.
> 
> I have been debugging a spurious wakeup issue on an Asus T101HA,
> where the system would not stay suspended when the lid was closed.
> 
> The issue turns out to be that the touchpad is generating touch
> events when the lid/display gets close to the touchpad. In this case
> wakeup is already enabled by default because it is an USB device.

Sounds like a mechanical/hardware issue to me.
I've seen some old laptops have the same issue.

Swollen battery can push up the touchpad, makes it contact to touchscreen, and wakes up the system.

> 
> So I do not believe that this is a good idea, most current devices
> with a HID multi-touch touchpad use i2c-hid and also use S2idle,
> so this will basically enable wakeup by touchpad on almost all
> current devices.

However, it's really handy to wake up the system from touchpad.

> 
> There will likely be other devices with the same issue as the T101HA,
> but currently we are not seeing this issue because by default i2c-hid
> devices do not have wakeup enabled. This change will thus likely cause
> new spurious wakeup issues on more devices. So this seems like a
> bad idea.

But only under lid is closed?

I wonder if it's okay to handle the case in s2idle_loop() or in userspace?
Lid close -> Wakeup event from touchpad -> Found the lid is closed 
-> Turn off touchpad wakeup -> continue suspend.

> 
> Also your commit message mentions touchpads, but the change
> will also enable wakeup on most touchscreens out there, meaning
> that just picking up a device in tablet mode and accidentally
> touching the screen will wake it up.

I tried touch and i2c-hid touchscreen and it doesn't wake up the system.
However we should still handle the two different cases, probably differentiate touchpad and touchscreen in hid-multitouch.

> 
> Also hid multi-touch devices have 3 modes, see the diagrams
> in Microsoft hw design guides for win8/10 touch devices:
> 1. Reporting events with low latency (high power mode)
> 2. Reporting events with high latency (lower power mode)
> 3. Not reporting events (lowest power mode)
> 
> I actually still need to write some patches for hid-multitouch.c
> to set the mode to 2 or 3 on suspend depending on the device_may_wakeup
> setting of the parent. Once that patch is written, it should
> put most i2c-hid mt devices in mode 3, hopefully also helping
> with Linux' relative high power consumption when a device is
> suspended. With your change instead my to-be-written patch
> would put the device in mode 2, which would still be an
> improvement but less so.

IIRC, touchpad and touchscreen connect to different parents on all laptops I worked on.
So I think it's possible to enable mode 2 for touchpad, and mode 3 for touchscreen.

Touchpad wake is really handy, let's figure out how to enable it while covering all potential regression risks.

Kai-Heng

> 
> Regards,
> 
> Hans
> 
> 
> 
> 
> 
> 
>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>> ---
>> v3:
>>  - Use device_init_wakeup().
>>  - Wording change.
>> v2:
>>  - Fix compile error when ACPI is not enabled.
>>  drivers/hid/i2c-hid/i2c-hid-core.c | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
>> index 294c84e136d7..dae1d072daf6 100644
>> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
>> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
>> @@ -931,6 +931,12 @@ static void i2c_hid_acpi_fix_up_power(struct device *dev)
>>  		acpi_device_fix_up_power(adev);
>>  }
>>  +static void i2c_hid_acpi_enable_wakeup(struct device *dev)
>> +{
>> +	if (acpi_gbl_FADT.flags & ACPI_FADT_LOW_POWER_S0)
>> +		device_init_wakeup(dev, true);
>> +}
>> +
>>  static const struct acpi_device_id i2c_hid_acpi_match[] = {
>>  	{"ACPI0C50", 0 },
>>  	{"PNP0C50", 0 },
>> @@ -945,6 +951,8 @@ static inline int i2c_hid_acpi_pdata(struct i2c_client *client,
>>  }
>>    static inline void i2c_hid_acpi_fix_up_power(struct device *dev) {}
>> +
>> +static inline void i2c_hid_acpi_enable_wakeup(struct device *dev) {}
>>  #endif
>>    #ifdef CONFIG_OF
>> @@ -1072,6 +1080,8 @@ static int i2c_hid_probe(struct i2c_client *client,
>>    	i2c_hid_acpi_fix_up_power(&client->dev);
>>  +	i2c_hid_acpi_enable_wakeup(&client->dev);
>> +
>>  	device_enable_async_suspend(&client->dev);
>>    	/* Make sure there is something at this address */
> 

