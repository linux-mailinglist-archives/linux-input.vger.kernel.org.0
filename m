Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A3B7F8242
	for <lists+linux-input@lfdr.de>; Mon, 11 Nov 2019 22:31:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726978AbfKKVbo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 Nov 2019 16:31:44 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37021 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726964AbfKKVbn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 Nov 2019 16:31:43 -0500
Received: by mail-wr1-f65.google.com with SMTP id t1so16275425wrv.4;
        Mon, 11 Nov 2019 13:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zpMdf9Zf4V87YfSpTZ8rGYwI9I4/bosrdyopToB6CW0=;
        b=XN5csH7hiqFMVU/m0+qvQUDYecrJSgmP4kswWqzfG+K6ZaRv1NP1rRkZVFusBWTZbE
         dFr1Qz8ahQDzfoig/202f+yiHqu2FLeckY6dgro49NqAT1BBfIQeFMYrqEY5HKYVLOxx
         QMEwC3vNcvZwZvoZpkJCFoXY5yWJ6VJOcMPby4uTWAg9kfUS8tXGuQ/v8kaZRoUBvI0W
         ZjQYWxe7OLPqSB3Ack2qTtwEsP/5As0dYG/Qz49lx+URpfjCLhEdm5uLdClZdUBiFO20
         GnaDUjVI/UF39rLc99TkZ8NhHhC3RC3T7BdamcBdCCh+WLrSAyIN/j3zXlfVo9a3EsQL
         nL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zpMdf9Zf4V87YfSpTZ8rGYwI9I4/bosrdyopToB6CW0=;
        b=WGvea9zwH+Z3wEVVIb/XSVJI2ZGN+IkXrnBkW+s60yIsIuu2Wg2t9tT6g3STv3ZZbK
         oItc39wJ9BhN0uzX0mR/qcTCqRvQ7b9CfvGoRVZG7ImWAadDQBiDkP8YvClxqO/LO5Wd
         YMyr6DjQqY2OBmuaj2Y2rH6kQZmSHa0xhMXmu3UPi/hRiK0j6/PzFMBdhPsrY+8VD84k
         K+7h6rKM4zifBFunD9gxqimrRffrA4o2hUYz2X7AMCHE+KbC5Gg/i1XpN+uNX+00ETUs
         HhGa2ovK9+OUDIRKWCiOwPDS7G24A6OfzIO3R654pN9612WgW6DWrrbhOUlgYaWYsGJa
         OZNg==
X-Gm-Message-State: APjAAAWOFh2m4jZ5YQtw7NMu4AnRuKdRulVLF/NXZswH9j0QjgC5SXf+
        J6+QsiJlHC4l7VO40y6BMrKW1yt4
X-Google-Smtp-Source: APXvYqzkz4xyldpmMRk38swANADw/GshBfxtb7EPvj/K/a1BBdV/FJOVZu6fUGLGU1dHiImThJ/R6A==
X-Received: by 2002:adf:dc02:: with SMTP id t2mr8808775wri.39.1573507899707;
        Mon, 11 Nov 2019 13:31:39 -0800 (PST)
Received: from ?IPv6:2003:ea:8f2d:7d00:e9b5:1831:3cbd:a0c3? (p200300EA8F2D7D00E9B518313CBDA0C3.dip0.t-ipconnect.de. [2003:ea:8f2d:7d00:e9b5:1831:3cbd:a0c3])
        by smtp.googlemail.com with ESMTPSA id v10sm1302212wmg.48.2019.11.11.13.31.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Nov 2019 13:31:38 -0800 (PST)
Subject: Re: Linux "hid_led" vs "hidraw" USB HID question
To:     "Tod E. Kurt" <tod@todbot.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>
References: <6A37A3D7-96A6-49A4-83E5-ABE5DB417E8B@todbot.com>
 <b93817a2-97a2-3bcc-9741-5622b74bcd3c@gmail.com>
 <8A4D1E2D-9918-4A6C-9F8A-6447EE50F9F7@todbot.com>
 <ab4e0840-72ee-4e65-db17-083c187b03ec@gmail.com>
 <B63E1B37-D7A3-4A71-A3F1-73C5952B2653@todbot.com>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <0a4ff44d-02a5-5fab-0d27-850513288953@gmail.com>
Date:   Mon, 11 Nov 2019 22:31:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <B63E1B37-D7A3-4A71-A3F1-73C5952B2653@todbot.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 11.11.2019 00:07, Tod E. Kurt wrote:
> Hi Heiner,
> 
> Yes, that was what I was starting from. I was hoping there was now an in-situ way of replacing kernel modules without a full kernel recompile.
> 
> I have tried this patch on Raspian 4.19.81 and Ubuntu 19 kernel 5.0.0-32 with no config changes.  I believe it solves the main issue.  However, I'm seeing another problem that I can't explain.
> 
> Specifically:
> - On reboot, device shows up in /sys/class/hidraw/
> - Opening with hidapi and (mis)using hidapi functions works, but,
> - Device is then removed from /sys/class/hidraw/
> 
> Under what circumstances can a device be removed from /sys/class/hidraw? 
> 
> If you'd like to trigger this yourself, run "blink1-tool --list" and see the blink(1) disappear. And yet "blink1-tool" can subsequently still communicate with the blink(1). Which I don't quite understand yet either.
> 
Once a dedicated device driver (like hid-led) is loaded, the raw device disappears.

I compiled blink1-tool on latest linux-next with the hid quirk patch I sent, but the blink(1) never disappears.
According to strace the tool doesn't use the /sys/class/hidraw interface but a low-level USB
interface via libusb.

> Cheers,
> -=Tod
> 
>> On Nov 10, 2019, at 9:25 a, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>>
>> On 10.11.2019 17:59, Tod E. Kurt wrote:
>>> Hi Heiner, (and others on the list)
>>>
>>> Thanks for your quick and detailed response. 
>>>
>>> I am endeavoring to try the patch out now.  But I've not built a desktop Linux kernel or kernel modules in about 15 years.  Do you have a preferred recipe for applying this patch to an existing distro?  Since 'hid-quirks' isn't a module, this means recompiling the entire HID driver, correct?  I mostly test against various modern Ubuntu or Raspian flavors of Debian, if that matters.
>>>
>> See e.g. here: https://wiki.ubuntu.com/Kernel/BuildYourOwnKernel
>>
>>> Also, is there a mitigation for users running production distros that doesn't involve a recompile? 
>>>
>> I don't think so (at least from kernel perspective). What you could do is adding an integration with
>> the /sys/class/led interface in your library (if it should be suitable for your use cases) and
>> auto-detect which interface to use.
>>
>>> Thanks,
>>> -=Tod
>>>
>> Heiner
>>
>>>> On Nov 10, 2019, at 2:44 a, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>>>>
>>>> On 10.11.2019 04:26, Tod E. Kurt wrote:
>>>>> HiI
>>>>>
>>>> Hi Tod,
>>>>
>>>>> Since you are listed as author of "hid-led.c": 
>>>>>  https://github.com/torvalds/linux/blob/master/drivers/hid/hid-led.c, 
>>>>> I was wondering if you could offer some insight on an issue I'm seeing.
>>>>> I'm a maintainer of "hidapi" and "node-hid", cross-platform C and NodeJs libraries for accessing HID devices, and I'm the creator of the ThingM blink(1) USB LED that "hid-led" controls.
>>>>>
>>>>> On the distros I've seen (Ubuntu, Raspian) where "hid-led" is enabled, when inserting a blink(1) device, the "hid-led" driver appears to grab the device and remove it from available "hidraw" devices.  This makes generic hidraw-based systems (like "hidapi" and the upcoming Chrome WebHID) unable to see the blink(1)
>>>>>
>>>>> I have tried blacklisting the "hid-led" module but the problem persist. Ffrom dmesg and lsmod the module does appear to not be loaded on reboot.
>>>>>
>>>>> Any insights on what's going on?  Any tips on how to debug this or how to prevent this from occurring?
>>>>>
>>>> When hid-led was written it was needed to add the LED devices to hid_have_special_driver list.
>>>> Else the driver can't take control over the device. Side effect is that even if hid-led
>>>> isn't loaded hid-generic can't take control.
>>>> I think since e04a0442d33b ("HID: core: remove the absolute need of hid_have_special_driver[]")
>>>> it's no longer needed to have the LED devices in hid_have_special_driver.
>>>> Could you please test the following patch? If hid-led is loaded is should control the
>>>> device, if it's blacklisted hid-generic should have the control.
>>>>
>>>>
>>>> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
>>>> index c50bcd967..bdaab79f7 100644
>>>> --- a/drivers/hid/hid-quirks.c
>>>> +++ b/drivers/hid/hid-quirks.c
>>>> @@ -419,13 +419,6 @@ static const struct hid_device_id hid_have_special_driver[] = {
>>>> #if IS_ENABLED(CONFIG_HID_LCPOWER)
>>>> 	{ HID_USB_DEVICE(USB_VENDOR_ID_LCPOWER, USB_DEVICE_ID_LCPOWER_LC1000) },
>>>> #endif
>>>> -#if IS_ENABLED(CONFIG_HID_LED)
>>>> -	{ HID_USB_DEVICE(USB_VENDOR_ID_DREAM_CHEEKY, USB_DEVICE_ID_DREAM_CHEEKY_WN) },
>>>> -	{ HID_USB_DEVICE(USB_VENDOR_ID_DREAM_CHEEKY, USB_DEVICE_ID_DREAM_CHEEKY_FA) },
>>>> -	{ HID_USB_DEVICE(USB_VENDOR_ID_MICROCHIP, USB_DEVICE_ID_LUXAFOR) },
>>>> -	{ HID_USB_DEVICE(USB_VENDOR_ID_RISO_KAGAKU, USB_DEVICE_ID_RI_KA_WEBMAIL) },
>>>> -	{ HID_USB_DEVICE(USB_VENDOR_ID_THINGM, USB_DEVICE_ID_BLINK1) },
>>>> -#endif
>>>> #if IS_ENABLED(CONFIG_HID_LENOVO)
>>>> 	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_TPKBD) },
>>>> 	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_CUSBKBD) },
>>>> -- 
>>>> 2.24.0
>>>>
>>>>> I can send you blink(1) devices and "hidapi" test programs if you'd like to try to replicate this.
>>>>>
>>>> Thanks for the offer, I've got a blink(1) already. Just tested the patch with this device
>>>> and it worked properly like described above.
>>>>
>>>>> Thanks!
>>>>> -=Tod
>>>>
>>>> Heiner
>>>
>>>
>>
> 
> 

