Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F04CF6A91
	for <lists+linux-input@lfdr.de>; Sun, 10 Nov 2019 18:25:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbfKJRZT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 10 Nov 2019 12:25:19 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42513 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726733AbfKJRZT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 10 Nov 2019 12:25:19 -0500
Received: by mail-wr1-f65.google.com with SMTP id a15so12120895wrf.9;
        Sun, 10 Nov 2019 09:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=U4vBXLKVbz6r/jE6nHQI9E/JPgEv3fEzaNLN1zvpv8o=;
        b=i4022JV0hz54efMfmvWp1KUKUNWaBcrb6PIF3MEsD6Uo6DAvW6OPbfVB2gL0ShCxlJ
         sjm+wIUeXlNWRAbnFkahJd/QN4VznRwsKXQDAvzGWZxosb6rz4Q8OB7Cwv6vD6B76n4S
         LtrZINz13+E0VgGws6ZbwBssL2HsPEehJ7t7E11Cj4LAvuYeeNYo5ddDKk+w2zTBcUv1
         Q/1B9KYV0XKBXQSCfHaIn87t8zVgER20n+kLfhIy7Z1auRLcT943WH+KwuvrIargXru4
         nQ0k/Tjvl6m1Zezoy6b2EIxwl2tf0yAR7pPTge2LAbhqJC/9usO7pvB+HwFBbp5vmVeS
         fejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=U4vBXLKVbz6r/jE6nHQI9E/JPgEv3fEzaNLN1zvpv8o=;
        b=EfDN2a0Wk296CflJZrAyJxQJBNTKWd/VdG2OR3PW2sBa/vpVlWJFHbVFBsZs8aNnUA
         8RB2EaLfD8cw4EWKtRJ/IRO0Ic+c4RF69WErtmNFILM2Z5C5/MFtaW2pfH18vv7FPZbf
         H97jE7e2lar5oIehXidETPQ1Xc4rktT2CN0HJuMULVvmRYN/LIAdPIrvLFvvJBU4pAVt
         /lORe+iHf7eqkgomWjSIqbEsobDwxmqz26NcAFCJ62M3MDtizoZ2X/wWH2NPetiX7BVY
         zZ3kjNUfMHXXW62lvaZX/5QxLjHNn+H0t3LCzZK7mq7G2w+YjBVMqJmle0UblxcHAWPX
         K4gw==
X-Gm-Message-State: APjAAAWn0867u64ceaYuV+Cazv7Y4hjJpABDtti6P6+YQEsmSCxNW9ws
        dZm8seZDU8lfpLHcvY/DXGiXlfTR
X-Google-Smtp-Source: APXvYqwHRzpTAv0eFAuFpdwwYANx9Tbm6Bw6xKXa1R6Sk5KBtgCOs5who0PlWTnJzDuVWyIS4ffh3w==
X-Received: by 2002:adf:b64e:: with SMTP id i14mr16498788wre.332.1573406716881;
        Sun, 10 Nov 2019 09:25:16 -0800 (PST)
Received: from ?IPv6:2003:ea:8f4d:a200:28cc:fc46:23c5:94c5? (p200300EA8F4DA20028CCFC4623C594C5.dip0.t-ipconnect.de. [2003:ea:8f4d:a200:28cc:fc46:23c5:94c5])
        by smtp.googlemail.com with ESMTPSA id a6sm13214846wrh.69.2019.11.10.09.25.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 10 Nov 2019 09:25:16 -0800 (PST)
Subject: Re: Linux "hid_led" vs "hidraw" USB HID question
To:     "Tod E. Kurt" <tod@todbot.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>
References: <6A37A3D7-96A6-49A4-83E5-ABE5DB417E8B@todbot.com>
 <b93817a2-97a2-3bcc-9741-5622b74bcd3c@gmail.com>
 <8A4D1E2D-9918-4A6C-9F8A-6447EE50F9F7@todbot.com>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <ab4e0840-72ee-4e65-db17-083c187b03ec@gmail.com>
Date:   Sun, 10 Nov 2019 18:25:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <8A4D1E2D-9918-4A6C-9F8A-6447EE50F9F7@todbot.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 10.11.2019 17:59, Tod E. Kurt wrote:
> Hi Heiner, (and others on the list)
> 
> Thanks for your quick and detailed response. 
> 
> I am endeavoring to try the patch out now.  But I've not built a desktop Linux kernel or kernel modules in about 15 years.  Do you have a preferred recipe for applying this patch to an existing distro?  Since 'hid-quirks' isn't a module, this means recompiling the entire HID driver, correct?  I mostly test against various modern Ubuntu or Raspian flavors of Debian, if that matters.
> 
See e.g. here: https://wiki.ubuntu.com/Kernel/BuildYourOwnKernel

> Also, is there a mitigation for users running production distros that doesn't involve a recompile? 
> 
I don't think so (at least from kernel perspective). What you could do is adding an integration with
the /sys/class/led interface in your library (if it should be suitable for your use cases) and
auto-detect which interface to use.

> Thanks,
> -=Tod
> 
Heiner

>> On Nov 10, 2019, at 2:44 a, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>>
>> On 10.11.2019 04:26, Tod E. Kurt wrote:
>>> HiI
>>>
>> Hi Tod,
>>
>>> Since you are listed as author of "hid-led.c": 
>>>   https://github.com/torvalds/linux/blob/master/drivers/hid/hid-led.c, 
>>> I was wondering if you could offer some insight on an issue I'm seeing.
>>> I'm a maintainer of "hidapi" and "node-hid", cross-platform C and NodeJs libraries for accessing HID devices, and I'm the creator of the ThingM blink(1) USB LED that "hid-led" controls.
>>>
>>> On the distros I've seen (Ubuntu, Raspian) where "hid-led" is enabled, when inserting a blink(1) device, the "hid-led" driver appears to grab the device and remove it from available "hidraw" devices.  This makes generic hidraw-based systems (like "hidapi" and the upcoming Chrome WebHID) unable to see the blink(1)
>>>
>>> I have tried blacklisting the "hid-led" module but the problem persist. Ffrom dmesg and lsmod the module does appear to not be loaded on reboot.
>>>
>>> Any insights on what's going on?  Any tips on how to debug this or how to prevent this from occurring?
>>>
>> When hid-led was written it was needed to add the LED devices to hid_have_special_driver list.
>> Else the driver can't take control over the device. Side effect is that even if hid-led
>> isn't loaded hid-generic can't take control.
>> I think since e04a0442d33b ("HID: core: remove the absolute need of hid_have_special_driver[]")
>> it's no longer needed to have the LED devices in hid_have_special_driver.
>> Could you please test the following patch? If hid-led is loaded is should control the
>> device, if it's blacklisted hid-generic should have the control.
>>
>>
>> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
>> index c50bcd967..bdaab79f7 100644
>> --- a/drivers/hid/hid-quirks.c
>> +++ b/drivers/hid/hid-quirks.c
>> @@ -419,13 +419,6 @@ static const struct hid_device_id hid_have_special_driver[] = {
>> #if IS_ENABLED(CONFIG_HID_LCPOWER)
>> 	{ HID_USB_DEVICE(USB_VENDOR_ID_LCPOWER, USB_DEVICE_ID_LCPOWER_LC1000) },
>> #endif
>> -#if IS_ENABLED(CONFIG_HID_LED)
>> -	{ HID_USB_DEVICE(USB_VENDOR_ID_DREAM_CHEEKY, USB_DEVICE_ID_DREAM_CHEEKY_WN) },
>> -	{ HID_USB_DEVICE(USB_VENDOR_ID_DREAM_CHEEKY, USB_DEVICE_ID_DREAM_CHEEKY_FA) },
>> -	{ HID_USB_DEVICE(USB_VENDOR_ID_MICROCHIP, USB_DEVICE_ID_LUXAFOR) },
>> -	{ HID_USB_DEVICE(USB_VENDOR_ID_RISO_KAGAKU, USB_DEVICE_ID_RI_KA_WEBMAIL) },
>> -	{ HID_USB_DEVICE(USB_VENDOR_ID_THINGM, USB_DEVICE_ID_BLINK1) },
>> -#endif
>> #if IS_ENABLED(CONFIG_HID_LENOVO)
>> 	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_TPKBD) },
>> 	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_CUSBKBD) },
>> -- 
>> 2.24.0
>>
>>> I can send you blink(1) devices and "hidapi" test programs if you'd like to try to replicate this.
>>>
>> Thanks for the offer, I've got a blink(1) already. Just tested the patch with this device
>> and it worked properly like described above.
>>
>>> Thanks!
>>> -=Tod
>>
>> Heiner
> 
> 

