Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BDA52F479A
	for <lists+linux-input@lfdr.de>; Wed, 13 Jan 2021 10:32:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726987AbhAMJ3g (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 Jan 2021 04:29:36 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2332 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726951AbhAMJ3f (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 Jan 2021 04:29:35 -0500
Received: from fraeml702-chm.china.huawei.com (unknown [172.18.147.226])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4DG27P5CVNz67bW0;
        Wed, 13 Jan 2021 17:23:45 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml702-chm.china.huawei.com (10.206.15.51) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Wed, 13 Jan 2021 10:28:53 +0100
Received: from [10.47.0.70] (10.47.0.70) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 13 Jan
 2021 09:28:52 +0000
Subject: Re: [Linuxarm] [PATCH v2] input - mk712: remove the driver as it is
 obsolete and causes kernel crash
To:     "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
CC:     "linuxarm@openeuler.org" <linuxarm@openeuler.org>,
        Daniel Quinlan <quinlan@pathname.com>,
        Vojtech Pavlik <vojtech@suse.cz>
References: <20210112055129.7840-1-song.bao.hua@hisilicon.com>
 <7094caf0-4faf-4958-e1cf-fdf1d2a8cec9@huawei.com>
 <1758f0370ffc46499077d4e261dbde53@hisilicon.com>
From:   John Garry <john.garry@huawei.com>
Message-ID: <39ddc462-766a-383a-1b7d-c5de5e203073@huawei.com>
Date:   Wed, 13 Jan 2021 09:27:44 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <1758f0370ffc46499077d4e261dbde53@hisilicon.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.0.70]
X-ClientProxiedBy: lhreml736-chm.china.huawei.com (10.201.108.87) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 12/01/2021 21:54, Song Bao Hua (Barry Song) wrote:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dr
>> ivers/hwmon/Kconfig?h=v5.11-rc3#n551
>>
>> But not a great solution.
> Yep. It looks buggy as powerpc and arm64 could have the device literally
> though practically people might not use them.
> 
>> I tried to guard against it in this series, but never got it over the line:
>> https://lore.kernel.org/linux-pci/1560262374-67875-1-git-send-email-john.g
>> arry@huawei.com/
> Cool. I didn't realize you have tried to figure out a patchset
> to fix it in common code. It seems it is worth revisiting the
> patchset?
> 

So that patchset would stop the system crashing when there is no IO port 
mapped upon access. But I still did not like how those drivers 
unconditionally access those ports, which could have side-effects when 
some PCI IO port is mapped to the same IO port address.

Anyway, I'll look again at it.

Thanks,
John
