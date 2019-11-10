Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E03A8F6892
	for <lists+linux-input@lfdr.de>; Sun, 10 Nov 2019 11:44:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726749AbfKJKoo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 10 Nov 2019 05:44:44 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:33217 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbfKJKoo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 10 Nov 2019 05:44:44 -0500
Received: by mail-wm1-f66.google.com with SMTP id a17so9909933wmb.0;
        Sun, 10 Nov 2019 02:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:cc:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eryEuzW5LLYUQSnAXY+CWSHyAchI3nh6wj0+J18wG0s=;
        b=CWGAkg1fXKEyVghxfK/WeubgW5ZiTFHYgyKIoUB9DqPnIC8+8BXzlvC/4LbxW7RNQB
         neqANLILBqJalbbpTV/u6v31ZsywOfEJ5FFwcU6lbyoDYQn0ti76u6PO4MyD6eocI3Ug
         hne/PkT7kLjCXWYdVN3uXu6ycGWHpempj9q+TK/gWkdj5HbU8JLrl7suVH3ePQeSGirm
         DiYweHVO4AMTvjXLAhwFkMHj28zBJjZ2uKhHLQipw5rNo8H9Z/7aOmTkFE7QN0tNcsg5
         52jC621FZmy6loslsyBT3L+DpuMUIOASA/UB7GaqrnOKJ+rhWEsTrWF6IFg/9hqmmYwK
         Un3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:cc:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eryEuzW5LLYUQSnAXY+CWSHyAchI3nh6wj0+J18wG0s=;
        b=eBkTh1TDIb9iW11VphhjL2pfLlJuef7Nory1zYy2pwD67hch+bdMzUalV/Y7SYlq7I
         N/Z2cI/aokLKJbqjDDEDkdaat0c7hiRL6cCqzkZPC3rS7J8Xlcav0Vzsp4W9rCq/lMVU
         9Zbuhf3n3QPp7XOXTtu3UtlAlSM1jP6vRd+JXSUIlXaNCZ6ZDEp1uQhyV/W3mNsuXItY
         6JEeIycOZ/KX9GwXY4QbogJjIgsDbMdb9owNg7hly1GWFsZh+WEsj3sttffWoNEz/nJ0
         9NnBaLYyL156ZfiJ0rCvCEEtlsmwjYbcp1HGFnSil/SdZqX8ltOfZNfy0silRP9kCUts
         4nPQ==
X-Gm-Message-State: APjAAAUHsm8d6PVGk0LOgAB36jVzbG71lvraoCAvR8m5HOS4SlN3bDnO
        ZkOtXsQ1m0RjZoexgfusMcLyFRDu
X-Google-Smtp-Source: APXvYqyx/vE/A32OgxJRCe0jw8yt6yqurmLGhljXLOCGdeO7rSBIxTshkLSsH+SrXyflCiSFQa3+JA==
X-Received: by 2002:a1c:7905:: with SMTP id l5mr16847189wme.76.1573382681670;
        Sun, 10 Nov 2019 02:44:41 -0800 (PST)
Received: from ?IPv6:2003:ea:8f4d:a200:6547:67a0:39a9:9bba? (p200300EA8F4DA200654767A039A99BBA.dip0.t-ipconnect.de. [2003:ea:8f4d:a200:6547:67a0:39a9:9bba])
        by smtp.googlemail.com with ESMTPSA id l4sm11646235wml.33.2019.11.10.02.44.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 10 Nov 2019 02:44:39 -0800 (PST)
Subject: Re: Linux "hid_led" vs "hidraw" USB HID question
To:     "Tod E. Kurt" <tod@todbot.com>
References: <6A37A3D7-96A6-49A4-83E5-ABE5DB417E8B@todbot.com>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>
Message-ID: <b93817a2-97a2-3bcc-9741-5622b74bcd3c@gmail.com>
Date:   Sun, 10 Nov 2019 11:44:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <6A37A3D7-96A6-49A4-83E5-ABE5DB417E8B@todbot.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 10.11.2019 04:26, Tod E. Kurt wrote:
> HiI
> 
Hi Tod,

> Since you are listed as author of "hid-led.c": 
>   https://github.com/torvalds/linux/blob/master/drivers/hid/hid-led.c, 
> I was wondering if you could offer some insight on an issue I'm seeing.
> I'm a maintainer of "hidapi" and "node-hid", cross-platform C and NodeJs libraries for accessing HID devices, and I'm the creator of the ThingM blink(1) USB LED that "hid-led" controls.
> 
> On the distros I've seen (Ubuntu, Raspian) where "hid-led" is enabled, when inserting a blink(1) device, the "hid-led" driver appears to grab the device and remove it from available "hidraw" devices.  This makes generic hidraw-based systems (like "hidapi" and the upcoming Chrome WebHID) unable to see the blink(1)
> 
> I have tried blacklisting the "hid-led" module but the problem persist. Ffrom dmesg and lsmod the module does appear to not be loaded on reboot.
> 
> Any insights on what's going on?  Any tips on how to debug this or how to prevent this from occurring?
> 
When hid-led was written it was needed to add the LED devices to hid_have_special_driver list.
Else the driver can't take control over the device. Side effect is that even if hid-led
isn't loaded hid-generic can't take control.
I think since e04a0442d33b ("HID: core: remove the absolute need of hid_have_special_driver[]")
it's no longer needed to have the LED devices in hid_have_special_driver.
Could you please test the following patch? If hid-led is loaded is should control the
device, if it's blacklisted hid-generic should have the control.


diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index c50bcd967..bdaab79f7 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -419,13 +419,6 @@ static const struct hid_device_id hid_have_special_driver[] = {
 #if IS_ENABLED(CONFIG_HID_LCPOWER)
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LCPOWER, USB_DEVICE_ID_LCPOWER_LC1000) },
 #endif
-#if IS_ENABLED(CONFIG_HID_LED)
-	{ HID_USB_DEVICE(USB_VENDOR_ID_DREAM_CHEEKY, USB_DEVICE_ID_DREAM_CHEEKY_WN) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_DREAM_CHEEKY, USB_DEVICE_ID_DREAM_CHEEKY_FA) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_MICROCHIP, USB_DEVICE_ID_LUXAFOR) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_RISO_KAGAKU, USB_DEVICE_ID_RI_KA_WEBMAIL) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_THINGM, USB_DEVICE_ID_BLINK1) },
-#endif
 #if IS_ENABLED(CONFIG_HID_LENOVO)
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_TPKBD) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_CUSBKBD) },
-- 
2.24.0

> I can send you blink(1) devices and "hidapi" test programs if you'd like to try to replicate this.
> 
Thanks for the offer, I've got a blink(1) already. Just tested the patch with this device
and it worked properly like described above.

> Thanks!
> -=Tod

Heiner
