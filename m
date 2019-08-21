Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1342D975C0
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2019 11:14:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726291AbfHUJN0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Aug 2019 05:13:26 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:40364 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbfHUJN0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Aug 2019 05:13:26 -0400
IronPort-SDR: TuW/pQYYiQNbETT4R7AMwfz8PNDBcGgJ6WLk1yefCleouL7qyJu8riQ/qoAyNt9Xqly/rpTtnE
 Gkbolii9o3c73hxhS/hjYe03rH/VnhYij5rCW8pqhgT7sAvcJkziXHs4qTu/WKowgT5RcATEQj
 gocAv5eggevnkqBUm7zgTXtekz8Pe3gTpwiiLvXV4i86JpGUEOVxcjCNQL1fPSYJpuiLQ/SM76
 XqL6U92EZKf9vUax/7oWmLFGTEEdFl8wqypJgiab8ApSf/fj8ageWKsbroo6bh9Kx6n9Iuku2j
 X8Y=
X-IronPort-AV: E=Sophos;i="5.64,412,1559548800"; 
   d="scan'208";a="40629105"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 21 Aug 2019 01:13:25 -0800
IronPort-SDR: TLxGY4qzZaLiR7+c98LNMwFWJZZknU1Tsf9nEToIajuKTQ2kteX6eMqgq20IBVip3Isi4DcTzd
 gSLd3+D6MM9n5FWsX4ClawCdn/PcbDvSh39PbRrboNszOph7JyMavVs2AerPeorXdg7ldjaCW/
 zc/8CMRn1rx+gv6zfLmN1Zcar4sddp6jYSki0gYy44vjg3xV+mT9Lbj2V6AjIvO6ezzPRBtk4X
 fAwpyW9vuemK5C+8Yw+HO3ffzFc/K2VUriLUFeV8sbQkGwe1p0/wO1XYA4bjzZLid+DWuUWF/u
 0us=
Subject: Re: [PATCH v1 01/63] Input: introduce input_mt_report_slot_inactive
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     <nick@shmanahar.org>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <george_davis@mentor.com>
References: <20190816082952.17985-1-jiada_wang@mentor.com>
 <20190816082952.17985-2-jiada_wang@mentor.com>
 <20190816171226.GE121898@dtor-ws>
From:   Jiada Wang <jiada_wang@mentor.com>
Message-ID: <9359e5aa-0121-7165-1699-f62aecd1c583@mentor.com>
Date:   Wed, 21 Aug 2019 18:13:18 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190816171226.GE121898@dtor-ws>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry

On 2019/08/17 2:12, Dmitry Torokhov wrote:
> Hi Jiada,
> 
> On Fri, Aug 16, 2019 at 05:28:50PM +0900, Jiada Wang wrote:
>> input_mt_report_slot_state() ignores the tool when the slot is closed.
>> which has caused a bit of confusion.
>> This patch introduces input_mt_report_slot_inactive() to report slot
>> inactive state.
>> replaces all input_mt_report_slot_state() with input_mt_report_slot_inactive()
>> in case of close of slot, also some other related changes.
> 
> This seems to actually contain 2 changes:
> 
> - switching to use return value of input_mt_report_slot_state()
> - actually introducing and using input_mt_report_slot_inactive()
> 
> Please split them.
> 
will split this patch into two in v2 patchset

>>   
>> +/**
>> + * input_mt_report_slot_inactive() - report contact inactive state
>> + * @dev: input device with allocated MT slots
>> + *
>> + * Reports the contact inactive state via ABS_MT_TRACKING_ID
>> + *
>> + */
>> +void input_mt_report_slot_inactive(struct input_dev *dev)
>> +{
>> +	input_event(dev, EV_ABS, ABS_MT_TRACKING_ID, -1);
>> +}
>> +EXPORT_SYMBOL(input_mt_report_slot_inactive);
> 
> I think this should be a static inline, there is no need to have out of
> line implementation for a 1-liner.
>
will change to a inline function in v2 patchset.

Thanks,
Jiada

> Thanks.
> 
