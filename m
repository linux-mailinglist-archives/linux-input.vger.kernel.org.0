Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7178C13B803
	for <lists+linux-input@lfdr.de>; Wed, 15 Jan 2020 03:58:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728894AbgAOC6q (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 14 Jan 2020 21:58:46 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:49052 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728883AbgAOC6q (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 14 Jan 2020 21:58:46 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 25934B7FB7549D8DC35F;
        Wed, 15 Jan 2020 10:58:43 +0800 (CST)
Received: from [127.0.0.1] (10.133.215.186) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.439.0; Wed, 15 Jan 2020
 10:58:39 +0800
Subject: Re: [PATCH 1/1] HID: hiddev: remove a duplicated check
To:     Jiri Kosina <jikos@kernel.org>
CC:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-usb <linux-usb@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        "Hillf Danton" <hdanton@sina.com>
References: <20191224035117.98816-1-thunder.leizhen@huawei.com>
 <50fd522f-e276-420c-3c6a-0f193bc16ca2@huawei.com>
 <nycvar.YFH.7.76.2001141518000.31058@cbobk.fhfr.pm>
From:   "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <358ce05d-a01b-fa54-802c-995724d506f6@huawei.com>
Date:   Wed, 15 Jan 2020 10:58:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <nycvar.YFH.7.76.2001141518000.31058@cbobk.fhfr.pm>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.215.186]
X-CFilter-Loop: Reflected
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



On 2020/1/14 22:19, Jiri Kosina wrote:
> On Tue, 14 Jan 2020, Leizhen (ThunderTown) wrote:
> 
>> Does no one pay attention to this problem? Although there is no
>> functional problem, but it seems confusing.
>>
>>         if (!list->hiddev->exist) {                 <---------
>>                 res = -ENODEV;                                |
>>                 goto bail_unlock;                             |
>>         }                                                     |
>>         if (!list->hiddev->open++)                            |
>>                 if (list->hiddev->exist) {          <--------- //It's always true.
> 
> This code no longer exists after refactoring that happened in commit 
> 18a1b06e5b91d47.
OK

> 

