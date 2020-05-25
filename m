Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 279F01E10FB
	for <lists+linux-input@lfdr.de>; Mon, 25 May 2020 16:51:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391039AbgEYOvT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 May 2020 10:51:19 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:7173 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391026AbgEYOvT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 May 2020 10:51:19 -0400
IronPort-SDR: VxLQ0GXeDDgBGBFKzf4IpJ9NZBX3MqOPNBWdekDfEk1fBxyjS537AWbx8nDlr0Ow0d9tjmwXkT
 PYJGQjXwgyWoJmnUbNx/FvV9Pfjo72+h1RE9Btgq5Y5Brd3MlFSKWqvx4tebAEVQBs78ad/rxW
 NCA3y5g6vhH3Z8aoEkauUM+Vtk/hEqqKG67OHt6GpkVd25zsUlNzW6fHB9yaRnyap6mj6gBvKe
 LPjFji78xxVBWn79c8Si2wjv7ZlT3RFuj5Fw8IssJISU5eTWnwLpCzQxwxyAbsFvgXqA+cD4X7
 oBQ=
X-IronPort-AV: E=Sophos;i="5.73,433,1583222400"; 
   d="scan'208";a="49106013"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 25 May 2020 06:51:17 -0800
IronPort-SDR: ryL97YPesDvO2C8qEzsl5ZOMKvlzmmY1jTJ68wT+iL1qZzcX0B1i9qcKGIrgWBK7PZQBqGnlIO
 WdLyIOoXcBCYtGVZaU3I6a2jdCL76hb+AFe/Evp4wHZYrPvpUf4lJ4gVGblgCi38BvV4WnnAgV
 ykxR71WFL1kODoMDADxFLNtTf1PnwIfGm5Mfj6ZjwxSMQYQd/2YkGbO4CPgctQmOsckNQpLrd5
 j89veevt9aFsINhVbNk5ZvHusGfmbqK0hq7qmAHh3bWHABOanXUxInZ9Aud9hXTiBPSTzhTFwi
 TyE=
Subject: Re: [PATCH v11 33/56] Input: atmel_mxt_ts - delay enabling IRQ when
 not using regulators
To:     Dmitry Osipenko <digetx@gmail.com>
CC:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <erosca@de.adit-jv.com>,
        <Andrew_Gabbasov@mentor.com>
References: <20200508055656.96389-1-jiada_wang@mentor.com>
 <20200508055656.96389-34-jiada_wang@mentor.com>
 <3a942afa-c047-2c88-1c8e-a90fa018738e@gmail.com>
 <6af23ae6-2f1c-0459-d2b6-1b01ddb0c3dc@mentor.com>
 <c88d24ef-e0e0-db3b-1000-b21af906eb4f@gmail.com>
 <aaf99a11-037e-93d8-93e4-d83e3aa4a42e@mentor.com>
 <63c93fc0-ac09-ec77-c590-08e419734205@gmail.com>
 <8c6f73a2-f613-b402-d727-5cb7fb3e1f09@mentor.com>
 <2e41656c-e7e4-5dcb-1156-bcfcbc8ea595@gmail.com>
 <f5da1587-02e7-5704-a676-1829b915c6f8@gmail.com>
From:   "Wang, Jiada" <jiada_wang@mentor.com>
Message-ID: <0e439df9-ccd4-699f-dbb3-51431d7f0fbe@mentor.com>
Date:   Mon, 25 May 2020 23:51:11 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <f5da1587-02e7-5704-a676-1829b915c6f8@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201) To
 svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Dmitry

On 2020/05/17 22:26, Dmitry Osipenko wrote:
> 17.05.2020 16:08, Dmitry Osipenko пишет:
>> 17.05.2020 06:32, Wang, Jiada пишет:
>>> Hello Dmitry
>>>
>>> On 2020/05/14 13:53, Dmitry Osipenko wrote:
>>>> 13.05.2020 08:07, Wang, Jiada пишет:
>>>>> Hello Dmitry
>>>>>
>>>>> On 2020/05/12 8:13, Dmitry Osipenko wrote:
>>>>>> 11.05.2020 05:05, Wang, Jiada пишет:
>>>>>>> Hello Dmitry
>>>>>>>
>>>>>>> Thanks for your comment and test,
>>>>>>>
>>>>>>> can you let me know which platform (board) you are using for test,
>>>>>>> and DTS changes if you have added any.
>>>>>>
>>>>>> That's this device-tree [1] without any extra changes.
>>>>>>
>>>>> I am using Samsung Chromebook Pro for testing,
>>>>> but obviously some of the use cases it can't cover.
>>>>>
>>>>> I also would like to test on same device you are using,
>>>>> would you please let me know how to boot Acer Iconia Tab A500
>>>>> with custom images. Are you booting Linux or Android on it?
>>>>
>>>> I'm using Ubuntu 20.04 on it at the moment. In order to boot custom
>>>> images you'll need at least to install a custom recovery, which will
>>>> allow to flash boot.img on eMMC storage.
>>>>
>>>> Ideally, you'll need to install an unlocked bootloader that will enable
>>>> Android's fastboot, and thus, allow to easily boot kernel zImage without
>>>> messing with flashing boot images.
>>>>
>>>> Could you please tell what is the current state of yours device: does it
>>>> have a stock Android installed? is it rooted? is custom recovery
>>>> installed?
>>>>
>>> Thanks for your information
>>>
>>> By following instructions found in XDA forums,
>>> now I am able to install an unlocked bootloader,
>>> boot among primary kernel, recovery kernel or fastboot,
>>> an Android custom stock rom also has been installed
>>
>> Awesome!
>>
>>> Could you please let me know how to install local built ubuntu images
>>
>> Sure, please follow these steps:
>>
>> 1. Download rootfs from
>> http://cdimage.ubuntu.com/ubuntu-base/releases/20.04/release/ubuntu-base-20.04-base-armhf.tar.gz
>>
>> 2. Extract it wherever you want yours root to be, like ExternalSD card
>> or eMMC /data partition or even NFS directory if you'll use usbnet.
>>
>> 3. Clone this kernel https://github.com/grate-driver/linux which is a
>> recent upstream linux-next + work-in-progress patches that haven't been
>> merged into upstream yet. For example DRM bridges and Tegra Partition
>> Table patches are under review now.
>>
>> 4. Select tegra_defconfig:
>>
>> 	ARCH=arm make tegra_defconfig
>>
>> 5. Compile kernel:
>>
>> 	ARCH=arm make
>>
>> 6. Append DTB to zImage:
>>
>> 	cat arch/arm/boot/zImage
>> arch/arm/boot/dts/tegra20-acer-a500-picasso.dtb > arch/arm/boot/zImage-dtb
>>
>> 7. Turn on A500 and select 'fastboot' option in the bootloader's menu.
>>
>> 8. Boot compiled kernel:
>>
>> 	fastboot -c "root=/dev/mmcblk2p8 gpt tegraboot=sdmmc" boot
>> arch/arm/boot/zImage-dtb
>>
>> 9. Grab touchscreen/WiFi/Bluetooth firmware files from
>> https://github.com/digetx/linux-firmware
>>
>> 10. Grab ALSA UCM rule from https://github.com/digetx/alsa-ucm-conf
>>
>> 11. Enjoy!
>>
>> Please let me know you'll experience any problems, I'll be glad to help.
>>
> 
> Also, there is an Ubuntu PPA for Tegra20/30 devices with drivers from
> GRATE-driver project:
> https://launchpad.net/~grate-driver/+archive/ubuntu/ppa
> 
> Please keep in mind that there is no GL driver that work with upstream
> kernel.
> 
> I'd recommend to use KDE Plasma 5 for the desktop environment. For the
> good experience you'll need to tell Qt to use software render, the
> easiest way is to set required env variables globally:
> 
> echo -e
> "QT_QUICK_BACKEND=software\nLIBGL_ALWAYS_SOFTWARE=1\nQT_IM_MODULE=qtvirtualkeyboard"
>>> /etc/security/pam_env.conf

Thanks for detailed information to help me boot ubuntu on acer tab a500,
now I am able to boot it with ubuntu and reproduced the issue with v11 
patch-set.

I will start to investigate the root cause,
from now on, my update patch-set will be tested on both samsung 
chromebook pro and acer tab a500

Thanks for your help

Thanks,
Jiada
