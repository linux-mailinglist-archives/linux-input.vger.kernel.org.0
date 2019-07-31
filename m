Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 333077C03D
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2019 13:41:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbfGaLlX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 31 Jul 2019 07:41:23 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:55172 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726301AbfGaLlX (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 31 Jul 2019 07:41:23 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 052F69A63D0C3EB13A6F;
        Wed, 31 Jul 2019 19:41:20 +0800 (CST)
Received: from [127.0.0.1] (10.133.213.239) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Wed, 31 Jul 2019
 19:41:16 +0800
Subject: Re: [PATCH] HID: logitech-dj: Fix check of
 logi_dj_recv_query_paired_devices()
To:     Hans de Goede <hdegoede@redhat.com>, Petr Vorel <pvorel@suse.cz>
References: <20190725145719.8344-1-yuehaibing@huawei.com>
 <20190731105927.GA5092@dell5510> <20190731110629.GB5092@dell5510>
 <3e9bda5b-68dc-15b9-ca79-2e73567ea0a5@redhat.com>
CC:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>
From:   Yuehaibing <yuehaibing@huawei.com>
Message-ID: <917e5209-8e58-076d-bb25-0716d7414e5a@huawei.com>
Date:   Wed, 31 Jul 2019 19:41:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <3e9bda5b-68dc-15b9-ca79-2e73567ea0a5@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 2019/7/31 19:29, Hans de Goede wrote:
> Hi Petr,
> 
> On 31-07-19 13:06, Petr Vorel wrote:
>> Hi,
>>
>>>> In delayedwork_callback(), logi_dj_recv_query_paired_devices
>>>> may return positive value while success now, so check it
>>>> correctly.
>>
>>>> Fixes: dbcbabf7da92 ("HID: logitech-dj: fix return value of logi_dj_recv_query_hidpp_devices")
>>>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>>> Reviewed-by: Petr Vorel <pvorel@suse.cz>
>> OK, not only it didn't fix problems with logitech mouse (see below),
>> but removing mouses USB dongle effectively crashes kernel, so this one probably
>> shouldn't be applied :).
>>
>> [  330.721629] logitech-djreceiver: probe of 0003:046D:C52F.0013 failed with error 7
>> [  331.462335] hid 0003:046D:C52F.0013: delayedwork_callback: logi_dj_recv_query_paired_devices error: 7
> 
> Please test my patch titled: "HID: logitech-dj: Really fix return value of logi_dj_recv_query_hidpp_devices"
> which should fix this.

Yes, this is better one, thanks!

> 
> Regards,
> 
> Hans
> 
> .
> 

