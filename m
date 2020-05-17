Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD5631D6573
	for <lists+linux-input@lfdr.de>; Sun, 17 May 2020 05:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726932AbgEQDct (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 16 May 2020 23:32:49 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:2450 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726908AbgEQDcs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 16 May 2020 23:32:48 -0400
IronPort-SDR: NaEPZz90g8c/zqW1DsrTbzuX/hC9puSktqmxONSRsKGV84rKQetgUiIGozgldV6MKhd/ugFWqO
 /0uo9Tq/95AkrNWWVPB+CGj0WOqCnaYnDgDngg+SNuKwGasTajSPsD3A8ndXwb7dGG5fNz5fom
 stTCCMyUuuHYCbXmPKIQ/UPe5jVH2nNFaYDxXVPkyJdBVUmAQxlLCRX62cIsUA+OHlp5R67dui
 rVp37fD25r04r4HMSBqliddk79Tka2elJKQZWSs6NJqAkYBBbp6IzjF8UQ9kaWpwf7qbUg0zto
 zG0=
X-IronPort-AV: E=Sophos;i="5.73,401,1583222400"; 
   d="scan'208";a="50948193"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 16 May 2020 19:32:47 -0800
IronPort-SDR: jW7d68kwo/4bC3nOkaV/TzDUc/le45OT7uf1mzkOHGN7ZcLcjXFEBj83lGH5BW3t4rCwV7YMfw
 SV8H4vzHssKc+KPpzCeZfjaBO6l6ir827sa5Vntnj3SJo8M3WcUpIfBYMKZqyckanr1qjDhjcr
 j/6jJtWuPhDoFoiLYty2LnwQ3yZG/RJmXtqEbx6J9dh8BEo9a3sE4LdW/GPg9kVA9hNZrYUexU
 eOb7jqK3v4zTIS6gYZjRTbgmP9kwXldBPrxetsW6QgJFmjhyCYmPyDjVZkOz9jOkp0fwU74lsX
 M14=
Subject: Re: [PATCH v11 33/56] Input: atmel_mxt_ts - delay enabling IRQ when
 not using regulators
To:     Dmitry Osipenko <digetx@gmail.com>, <nick@shmanahar.org>,
        <dmitry.torokhov@gmail.com>, <jikos@kernel.org>,
        <benjamin.tissoires@redhat.com>, <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>
References: <20200508055656.96389-1-jiada_wang@mentor.com>
 <20200508055656.96389-34-jiada_wang@mentor.com>
 <3a942afa-c047-2c88-1c8e-a90fa018738e@gmail.com>
 <6af23ae6-2f1c-0459-d2b6-1b01ddb0c3dc@mentor.com>
 <c88d24ef-e0e0-db3b-1000-b21af906eb4f@gmail.com>
 <aaf99a11-037e-93d8-93e4-d83e3aa4a42e@mentor.com>
 <63c93fc0-ac09-ec77-c590-08e419734205@gmail.com>
From:   "Wang, Jiada" <jiada_wang@mentor.com>
Message-ID: <8c6f73a2-f613-b402-d727-5cb7fb3e1f09@mentor.com>
Date:   Sun, 17 May 2020 12:32:42 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <63c93fc0-ac09-ec77-c590-08e419734205@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: svr-orw-mbx-08.mgc.mentorg.com (147.34.90.208) To
 svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Dmitry

On 2020/05/14 13:53, Dmitry Osipenko wrote:
> 13.05.2020 08:07, Wang, Jiada пишет:
>> Hello Dmitry
>>
>> On 2020/05/12 8:13, Dmitry Osipenko wrote:
>>> 11.05.2020 05:05, Wang, Jiada пишет:
>>>> Hello Dmitry
>>>>
>>>> Thanks for your comment and test,
>>>>
>>>> can you let me know which platform (board) you are using for test,
>>>> and DTS changes if you have added any.
>>>
>>> That's this device-tree [1] without any extra changes.
>>>
>> I am using Samsung Chromebook Pro for testing,
>> but obviously some of the use cases it can't cover.
>>
>> I also would like to test on same device you are using,
>> would you please let me know how to boot Acer Iconia Tab A500
>> with custom images. Are you booting Linux or Android on it?
> 
> I'm using Ubuntu 20.04 on it at the moment. In order to boot custom
> images you'll need at least to install a custom recovery, which will
> allow to flash boot.img on eMMC storage.
> 
> Ideally, you'll need to install an unlocked bootloader that will enable
> Android's fastboot, and thus, allow to easily boot kernel zImage without
> messing with flashing boot images.
> 
> Could you please tell what is the current state of yours device: does it
> have a stock Android installed? is it rooted? is custom recovery installed?
> 
Thanks for your information

By following instructions found in XDA forums,
now I am able to install an unlocked bootloader,
boot among primary kernel, recovery kernel or fastboot,
an Android custom stock rom also has been installed

Could you please let me know how to install local built ubuntu images

Thanks,
Jiada

> My device was unlocked about 8+ years ago, so I'm not sure what's the
> best way to do it nowadays. The XDA forums [1] could be a good starting
> point, I may give you some advises once you'll tell what's the current
> status of yours device.
> 
> [1] https://forum.xda-developers.com/iconia-a500
> 
