Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 189641D062F
	for <lists+linux-input@lfdr.de>; Wed, 13 May 2020 07:08:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726138AbgEMFIJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 May 2020 01:08:09 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:2160 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726092AbgEMFII (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 May 2020 01:08:08 -0400
IronPort-SDR: AYEkzC17u4EcaQr4vJtUmit1hGHfhCseBc0BqkMOgmYP7M2sFwAL3gIGTW2qtZtj9bBhracTRX
 wWgLIMWqpTB9mQEZ8de/oQ1Y6OPQHbqDw61Givc7XCQmMaGv/WnTGJzQm3bJQtLNzFQ/zU8Q6x
 3sx+4xQf3BAFAq++kOeHMjlCZln78ycDNixDJWVl85TDtZYKw+FY/WjM1WZp9cDAoPzkXJQgN9
 3mkgf8Vncl2PN1BgxrfhMlv8SYw6amSUeudNlKRB/db3Ib3KNSCqT2v3Dis/Eh14qpmmDt3/U1
 b+c=
X-IronPort-AV: E=Sophos;i="5.73,386,1583222400"; 
   d="scan'208";a="48785508"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 12 May 2020 21:08:07 -0800
IronPort-SDR: Jco0Vwy2QJjJR+clRKOdybXCpfWORQbJsebH4uQnWESlKgiufuoHSsOrC97JNT/ipchQ47fc5Q
 r4gU15J7DKaLz4gsNmc5DpGfAIWb8BK7ZiLBf8E7uA+h9MJLoOvKJ86T6s//8oR9bn/RJU25+I
 88evoASHJQmiKIzgpvULWf7hRljfj41H/fqMsJG27klOzI6nd5LFrvT/GJVey11moyqIyc/15r
 0/9+vBrcHF57JCmM4bv/YQTF/xGzPBLNQWlMdtoRGLrOXEvX7Sg8JP4PVOIiHb7FDukx2MmpLm
 X4g=
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
From:   "Wang, Jiada" <jiada_wang@mentor.com>
Message-ID: <aaf99a11-037e-93d8-93e4-d83e3aa4a42e@mentor.com>
Date:   Wed, 13 May 2020 14:07:55 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <c88d24ef-e0e0-db3b-1000-b21af906eb4f@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SVR-ORW-MBX-09.mgc.mentorg.com (147.34.90.209) To
 svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Dmitry

On 2020/05/12 8:13, Dmitry Osipenko wrote:
> 11.05.2020 05:05, Wang, Jiada пишет:
>> Hello Dmitry
>>
>> Thanks for your comment and test,
>>
>> can you let me know which platform (board) you are using for test,
>> and DTS changes if you have added any.
> 
> That's this device-tree [1] without any extra changes.
> 
I am using Samsung Chromebook Pro for testing,
but obviously some of the use cases it can't cover.

I also would like to test on same device you are using,
would you please let me know how to boot Acer Iconia Tab A500
with custom images. Are you booting Linux or Android on it?

> [1]
> https://patchwork.ozlabs.org/project/linux-tegra/patch/20200505022517.30523-2-digetx@gmail.com/
> 
> The v10 was working fine. I'm take a more detailed look at the problem
> later this week.
>
Thanks, it is very helpful

Thanks,
Jiada

