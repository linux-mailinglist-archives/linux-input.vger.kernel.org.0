Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 567171D683E
	for <lists+linux-input@lfdr.de>; Sun, 17 May 2020 15:26:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727910AbgEQN0f (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 May 2020 09:26:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727893AbgEQN0f (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 May 2020 09:26:35 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27C42C061A0C;
        Sun, 17 May 2020 06:26:35 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id h26so5657668lfg.6;
        Sun, 17 May 2020 06:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=W84wXIL0NQcT3OvZ70B+DYFri+U6bqyzquUpS33uBSk=;
        b=ll5q4FSKI7XKnlyRTk0D9+zt3YTM6eTbjPHj189AsjvXjiyj44YM1ijd43VLrlNFI9
         yJHxTELAFObX5PP/x42S8D5JosrfJ6mT7m0N5ABEIoboPFV06+AoiSW04kZKil5iQBaR
         0B57pzu1JzbKvqq+uzSCIdtnsmU1t/bd5VOtceiDO7CW+mWbf9ID2079qqpiVTEJRalU
         N+HFzlphkvjbGGcoVkwXLexeTIEuN/BDCL6Q/NDzd1TBmsvbZouOSLsIy5lDODbx04il
         btCunaurBr05Ytzdd57+OZExLJus33/9bNk9ZGsiPZ4YH0HAij7Jp0b/TUe7APRqGnFa
         A10g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=W84wXIL0NQcT3OvZ70B+DYFri+U6bqyzquUpS33uBSk=;
        b=GdsUw6kqBwiD3WijSM8fhpfxsWhlCxiNIHOGc4v1eW20EfDIptZ5Btb9mZZw/gXm4T
         sCLAhAC+/8FUmXGd6Xwk7+SK1fJBS2Da1CfKBg6FXtQxCU5B+kMU2N9pgaqvRtbWCexK
         /GaM9AKB+dG1VhJnTeyeAA6POyhHNIM0Ka7VWP1Cib6n9lZ5gYW0iGugnU/x6li/+1rw
         mJ+W5tRvbOlPqYEbJy4aHSwePkI9leGApEiwQ7odmmS2iXDrecgvM+W5nbHwa2mZ0nDf
         7LEjjp1VV0qBVzQszLGca3j4a3+ldx9XZbZVnmbA12zaTQCVXCJKF11pJnrMs+VaFEP9
         eVXQ==
X-Gm-Message-State: AOAM531feTmEWjr296Noddc3BBOhGGoTOztxUXMwkc/ekxko490juQj8
        XpGiDWXdRJefkXFv0SxHjEU=
X-Google-Smtp-Source: ABdhPJwsTCjmJG8ON/aXCUhUqcjuvDg+q8Fk/jH5fwniCwBIgwbzG/i2Cc3O9JCOwYEssDTgZPac5Q==
X-Received: by 2002:ac2:4105:: with SMTP id b5mr8612264lfi.94.1589721993618;
        Sun, 17 May 2020 06:26:33 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id x10sm1374694ljd.25.2020.05.17.06.26.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2020 06:26:33 -0700 (PDT)
Subject: Re: [PATCH v11 33/56] Input: atmel_mxt_ts - delay enabling IRQ when
 not using regulators
From:   Dmitry Osipenko <digetx@gmail.com>
To:     "Wang, Jiada" <jiada_wang@mentor.com>
Cc:     nick@shmanahar.org, dmitry.torokhov@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, bsz@semihalf.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
References: <20200508055656.96389-1-jiada_wang@mentor.com>
 <20200508055656.96389-34-jiada_wang@mentor.com>
 <3a942afa-c047-2c88-1c8e-a90fa018738e@gmail.com>
 <6af23ae6-2f1c-0459-d2b6-1b01ddb0c3dc@mentor.com>
 <c88d24ef-e0e0-db3b-1000-b21af906eb4f@gmail.com>
 <aaf99a11-037e-93d8-93e4-d83e3aa4a42e@mentor.com>
 <63c93fc0-ac09-ec77-c590-08e419734205@gmail.com>
 <8c6f73a2-f613-b402-d727-5cb7fb3e1f09@mentor.com>
 <2e41656c-e7e4-5dcb-1156-bcfcbc8ea595@gmail.com>
Message-ID: <f5da1587-02e7-5704-a676-1829b915c6f8@gmail.com>
Date:   Sun, 17 May 2020 16:26:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <2e41656c-e7e4-5dcb-1156-bcfcbc8ea595@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

17.05.2020 16:08, Dmitry Osipenko пишет:
> 17.05.2020 06:32, Wang, Jiada пишет:
>> Hello Dmitry
>>
>> On 2020/05/14 13:53, Dmitry Osipenko wrote:
>>> 13.05.2020 08:07, Wang, Jiada пишет:
>>>> Hello Dmitry
>>>>
>>>> On 2020/05/12 8:13, Dmitry Osipenko wrote:
>>>>> 11.05.2020 05:05, Wang, Jiada пишет:
>>>>>> Hello Dmitry
>>>>>>
>>>>>> Thanks for your comment and test,
>>>>>>
>>>>>> can you let me know which platform (board) you are using for test,
>>>>>> and DTS changes if you have added any.
>>>>>
>>>>> That's this device-tree [1] without any extra changes.
>>>>>
>>>> I am using Samsung Chromebook Pro for testing,
>>>> but obviously some of the use cases it can't cover.
>>>>
>>>> I also would like to test on same device you are using,
>>>> would you please let me know how to boot Acer Iconia Tab A500
>>>> with custom images. Are you booting Linux or Android on it?
>>>
>>> I'm using Ubuntu 20.04 on it at the moment. In order to boot custom
>>> images you'll need at least to install a custom recovery, which will
>>> allow to flash boot.img on eMMC storage.
>>>
>>> Ideally, you'll need to install an unlocked bootloader that will enable
>>> Android's fastboot, and thus, allow to easily boot kernel zImage without
>>> messing with flashing boot images.
>>>
>>> Could you please tell what is the current state of yours device: does it
>>> have a stock Android installed? is it rooted? is custom recovery
>>> installed?
>>>
>> Thanks for your information
>>
>> By following instructions found in XDA forums,
>> now I am able to install an unlocked bootloader,
>> boot among primary kernel, recovery kernel or fastboot,
>> an Android custom stock rom also has been installed
> 
> Awesome!
> 
>> Could you please let me know how to install local built ubuntu images
> 
> Sure, please follow these steps:
> 
> 1. Download rootfs from
> http://cdimage.ubuntu.com/ubuntu-base/releases/20.04/release/ubuntu-base-20.04-base-armhf.tar.gz
> 
> 2. Extract it wherever you want yours root to be, like ExternalSD card
> or eMMC /data partition or even NFS directory if you'll use usbnet.
> 
> 3. Clone this kernel https://github.com/grate-driver/linux which is a
> recent upstream linux-next + work-in-progress patches that haven't been
> merged into upstream yet. For example DRM bridges and Tegra Partition
> Table patches are under review now.
> 
> 4. Select tegra_defconfig:
> 
> 	ARCH=arm make tegra_defconfig
> 
> 5. Compile kernel:
> 
> 	ARCH=arm make
> 
> 6. Append DTB to zImage:
> 
> 	cat arch/arm/boot/zImage
> arch/arm/boot/dts/tegra20-acer-a500-picasso.dtb > arch/arm/boot/zImage-dtb
> 
> 7. Turn on A500 and select 'fastboot' option in the bootloader's menu.
> 
> 8. Boot compiled kernel:
> 
> 	fastboot -c "root=/dev/mmcblk2p8 gpt tegraboot=sdmmc" boot
> arch/arm/boot/zImage-dtb
> 
> 9. Grab touchscreen/WiFi/Bluetooth firmware files from
> https://github.com/digetx/linux-firmware
> 
> 10. Grab ALSA UCM rule from https://github.com/digetx/alsa-ucm-conf
> 
> 11. Enjoy!
> 
> Please let me know you'll experience any problems, I'll be glad to help.
> 

Also, there is an Ubuntu PPA for Tegra20/30 devices with drivers from
GRATE-driver project:
https://launchpad.net/~grate-driver/+archive/ubuntu/ppa

Please keep in mind that there is no GL driver that work with upstream
kernel.

I'd recommend to use KDE Plasma 5 for the desktop environment. For the
good experience you'll need to tell Qt to use software render, the
easiest way is to set required env variables globally:

echo -e
"QT_QUICK_BACKEND=software\nLIBGL_ALWAYS_SOFTWARE=1\nQT_IM_MODULE=qtvirtualkeyboard"
>> /etc/security/pam_env.conf
