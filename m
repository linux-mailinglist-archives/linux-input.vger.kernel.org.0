Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FD8C1D6829
	for <lists+linux-input@lfdr.de>; Sun, 17 May 2020 15:08:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727956AbgEQNIf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 May 2020 09:08:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727893AbgEQNIe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 May 2020 09:08:34 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CC3BC061A0C;
        Sun, 17 May 2020 06:08:34 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id z22so5649468lfd.0;
        Sun, 17 May 2020 06:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aKLX6VTSdRiK9YTLmZQPvCDlkSARMjWiCKvL6+N4SsM=;
        b=ARxbEcTMlApvt0jToNOC++bf5g9cpZWXPfXh2ZQ4yILhpPXcpx+KnOpcEIVWUIduux
         78WCdMKEhpwQXPlmc6EJAVwgPNMQh53lfauVqhJMtOCvJiKLjapck68/f/vaS+jbndrz
         6jr+MwnvXvV9AamXrumbnoq1Q7iH65v4UgnA0o6YisRDm5xiZMzZFWyukZTkmTv0/uC6
         B9KXIYSCtoR6BfBYMTzKYS7PNFJ21QQ1I8HT5ISjNc+KZ2bg57e/W4qeF6Sj0072N3jr
         r4JhG9UW6mo0v6DMLhUBfWdmGFeC3XfxA1lJInlboU7+zk0unaGHt7W9VmL7BIGnSTjd
         N2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aKLX6VTSdRiK9YTLmZQPvCDlkSARMjWiCKvL6+N4SsM=;
        b=NYXQNfZN+mUV8DNsgrRcsrHxQ1bvJri20BbfaPBtpUV8ZeBgrOR4OsFHByV691oDYz
         hnt4rT0UvxIvip2q7+6QmPOtUB4XGrlh8PiPLPInsP5xwdwvAg8ugr+125KflyMPh0WS
         SEEG15du6NGl8I9sfPc0f+nv/g0lhHaCi/MdRCzg7GBZoNK438E+reQ4LyInNCq4Ppvl
         0VKx6Tw1vot3OC+oMRhXmsIga4oP8N+jtGPGZBDCjMIk1xETKhvmOwIEvBZqj/Pjc1Lo
         TseHz/OcxdFVh56BvNp9buh7IoyvOBTz4T0vb0n685R+Uhy5P7SL5aO3qFoI9tk5r/eB
         nn5w==
X-Gm-Message-State: AOAM533i0QKjhY2+mqN6tsWbAu7i6461GtDs7K4pQynTtBISsCE2EKk7
        vx+yskPGwzMm0YHy8/DhNvs=
X-Google-Smtp-Source: ABdhPJwzGiXoJSyYrOM4t1lYkY/l5h0javR+XPysJOQttuqzPuboHKC4FPW4dbKr1xcQ6sKh9P/iEg==
X-Received: by 2002:a19:c04:: with SMTP id 4mr8457763lfm.17.1589720912837;
        Sun, 17 May 2020 06:08:32 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id j15sm4098636lja.71.2020.05.17.06.08.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2020 06:08:32 -0700 (PDT)
Subject: Re: [PATCH v11 33/56] Input: atmel_mxt_ts - delay enabling IRQ when
 not using regulators
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2e41656c-e7e4-5dcb-1156-bcfcbc8ea595@gmail.com>
Date:   Sun, 17 May 2020 16:08:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <8c6f73a2-f613-b402-d727-5cb7fb3e1f09@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

17.05.2020 06:32, Wang, Jiada пишет:
> Hello Dmitry
> 
> On 2020/05/14 13:53, Dmitry Osipenko wrote:
>> 13.05.2020 08:07, Wang, Jiada пишет:
>>> Hello Dmitry
>>>
>>> On 2020/05/12 8:13, Dmitry Osipenko wrote:
>>>> 11.05.2020 05:05, Wang, Jiada пишет:
>>>>> Hello Dmitry
>>>>>
>>>>> Thanks for your comment and test,
>>>>>
>>>>> can you let me know which platform (board) you are using for test,
>>>>> and DTS changes if you have added any.
>>>>
>>>> That's this device-tree [1] without any extra changes.
>>>>
>>> I am using Samsung Chromebook Pro for testing,
>>> but obviously some of the use cases it can't cover.
>>>
>>> I also would like to test on same device you are using,
>>> would you please let me know how to boot Acer Iconia Tab A500
>>> with custom images. Are you booting Linux or Android on it?
>>
>> I'm using Ubuntu 20.04 on it at the moment. In order to boot custom
>> images you'll need at least to install a custom recovery, which will
>> allow to flash boot.img on eMMC storage.
>>
>> Ideally, you'll need to install an unlocked bootloader that will enable
>> Android's fastboot, and thus, allow to easily boot kernel zImage without
>> messing with flashing boot images.
>>
>> Could you please tell what is the current state of yours device: does it
>> have a stock Android installed? is it rooted? is custom recovery
>> installed?
>>
> Thanks for your information
> 
> By following instructions found in XDA forums,
> now I am able to install an unlocked bootloader,
> boot among primary kernel, recovery kernel or fastboot,
> an Android custom stock rom also has been installed

Awesome!

> Could you please let me know how to install local built ubuntu images

Sure, please follow these steps:

1. Download rootfs from
http://cdimage.ubuntu.com/ubuntu-base/releases/20.04/release/ubuntu-base-20.04-base-armhf.tar.gz

2. Extract it wherever you want yours root to be, like ExternalSD card
or eMMC /data partition or even NFS directory if you'll use usbnet.

3. Clone this kernel https://github.com/grate-driver/linux which is a
recent upstream linux-next + work-in-progress patches that haven't been
merged into upstream yet. For example DRM bridges and Tegra Partition
Table patches are under review now.

4. Select tegra_defconfig:

	ARCH=arm make tegra_defconfig

5. Compile kernel:

	ARCH=arm make

6. Append DTB to zImage:

	cat arch/arm/boot/zImage
arch/arm/boot/dts/tegra20-acer-a500-picasso.dtb > arch/arm/boot/zImage-dtb

7. Turn on A500 and select 'fastboot' option in the bootloader's menu.

8. Boot compiled kernel:

	fastboot -c "root=/dev/mmcblk2p8 gpt tegraboot=sdmmc" boot
arch/arm/boot/zImage-dtb

9. Grab touchscreen/WiFi/Bluetooth firmware files from
https://github.com/digetx/linux-firmware

10. Grab ALSA UCM rule from https://github.com/digetx/alsa-ucm-conf

11. Enjoy!

Please let me know you'll experience any problems, I'll be glad to help.
