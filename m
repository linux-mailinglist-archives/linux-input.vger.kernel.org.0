Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 292DE2F2D43
	for <lists+linux-input@lfdr.de>; Tue, 12 Jan 2021 11:57:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727730AbhALK4a (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Jan 2021 05:56:30 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2314 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727236AbhALK4a (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Jan 2021 05:56:30 -0500
Received: from fraeml736-chm.china.huawei.com (unknown [172.18.147.226])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4DFS8g38sMz67S65;
        Tue, 12 Jan 2021 18:52:51 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml736-chm.china.huawei.com (10.206.15.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 12 Jan 2021 11:55:48 +0100
Received: from [10.210.171.61] (10.210.171.61) by
 lhreml724-chm.china.huawei.com (10.201.108.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 12 Jan 2021 10:55:47 +0000
Subject: Re: [Linuxarm] [PATCH v2] input - mk712: remove the driver as it is
 obsolete and causes kernel crash
To:     Barry Song <song.bao.hua@hisilicon.com>,
        <dmitry.torokhov@gmail.com>, <linux-input@vger.kernel.org>
CC:     <linuxarm@openeuler.org>, Daniel Quinlan <quinlan@pathname.com>,
        "Vojtech Pavlik" <vojtech@suse.cz>
References: <20210112055129.7840-1-song.bao.hua@hisilicon.com>
From:   John Garry <john.garry@huawei.com>
Message-ID: <7094caf0-4faf-4958-e1cf-fdf1d2a8cec9@huawei.com>
Date:   Tue, 12 Jan 2021 10:54:40 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20210112055129.7840-1-song.bao.hua@hisilicon.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.210.171.61]
X-ClientProxiedBy: lhreml744-chm.china.huawei.com (10.201.108.194) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 12/01/2021 05:51, Barry Song wrote:
> While debugging other issues, I enabled mk712 then I got the below crash
> during arm64 linux boot:
> [    1.150412] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO BTYPE=--)
> [    1.150541] pc : logic_outb+0x3c/0xa8
> [    1.150657] lr : mk712_init+0x74/0x1ec
> [    1.150745] sp : ffff800011efbd40
> [    1.150950] x29: ffff800011efbd40 x28: 0000000000000000
> [    1.151098] x27: ffff800011681078 x26: ffff8000115d04b8
> [    1.151192] x25: ffff8000116ff6b4 x24: ffff8000115bac10
> [    1.151287] x23: ffff800011dfa000 x22: ffff800011b8dbe0
> [    1.151421] x21: ffff800011eac000 x20: 0000000000000000
> [    1.151527] x19: fffffbfffe800266 x18: 0000000000000000
> [    1.151674] x17: ffff800010a7bc38 x16: ffff800010a7b0e0
> [    1.151944] x15: 0000a0d665e7ee58 x14: 000000000000011a
> [    1.152060] x13: 0000000000000001 x12: 0000000000000000
> [    1.152149] x11: 0000000000000000 x10: 0000000000000a60
> [    1.152291] x9 : 0000000000000000 x8 : ffff0000c0a2a480
> [    1.152429] x7 : 0000000000000000 x6 : ffff0000c0b0c9b8
> [    1.152522] x5 : 0000000000001000 x4 : ffff0000c03613b0
> [    1.152614] x3 : 0000000000000267 x2 : 0000000000000260
> [    1.152731] x1 : fffffbfffe800000 x0 : 0000000000ffbffe
> [    1.153135] Call trace:
> [    1.153342]  logic_outb+0x3c/0xa8
> [    1.153434]  mk712_init+0x74/0x1ec
> [    1.153571]  do_one_initcall+0x54/0x1b8
> [    1.153705]  kernel_init_freeable+0x1d0/0x238
> [    1.153860]  kernel_init+0x14/0x118
> [    1.153960]  ret_from_fork+0x10/0x30
> [    1.154304] Code: d2bfd001 f2df7fe1 f2ffffe1 8b010273 (39000274)
> [    1.155013] ---[ end trace f9b157c311d20edd ]---
> [    1.155854] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> [    1.156236] SMP: stopping secondary CPUs
> 
> The driver is very old and resources are totally hardcoded, no bus model.
> And it seems there is no way to stop users from enabling it in Kconfig.
> Plus, it is likely that there is no "Gateway AOL Connected Touchpad
> computers" running 5.x kernel any more. So remove this driver.
> 
> Cc: Daniel Quinlan<quinlan@pathname.com>
> Cc: Vojtech Pavlik<vojtech@suse.cz>
> Signed-off-by: Barry Song<song.bao.hua@hisilicon.com>

JFYI, this is a common problem for many IO port drivers on architectures 
which don't natively support IO ports, like arm64 and powerpc. Some 
drivers guard against it simply by depending on !ARCH_XXX, like:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/hwmon/Kconfig?h=v5.11-rc3#n551

But not a great solution.

I tried to guard against it in this series, but never got it over the line:
https://lore.kernel.org/linux-pci/1560262374-67875-1-git-send-email-john.garry@huawei.com/

Thanks,
John
