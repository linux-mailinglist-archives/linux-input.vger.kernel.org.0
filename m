Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2D31F0E08
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2019 06:01:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725535AbfKFFBG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Nov 2019 00:01:06 -0500
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:63027 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725294AbfKFFBG (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Nov 2019 00:01:06 -0500
IronPort-SDR: LEjyBz/hShNhraoTai+ddYuiJnC1TtvDitH1geiFEYqBgSNnPJ5yyTpNes34b20w6BzO/ESa4Q
 Q1jxx0EeFreH/4yyQPN8VINzeXOuowgWy4zeF5O/d0OPcrCQwwVzZ8vrKBK5hNWMpvgmjQs4Cu
 jYLLgiedWyxri+t4QZU7bAtwAoJhuTk4C2pl/gxfMbXWZu3x/ZhMR6r7eKcBdjXbykUrVwh+X/
 4r0BP/x4V+UipLocTcCfUhdJdo2tRZu9aFpsSLYkQjwKEs8+R1Z74YrfqMO4vQRhV7Fu6rx2/5
 WNg=
X-IronPort-AV: E=Sophos;i="5.68,272,1569312000"; 
   d="scan'208";a="42941235"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 05 Nov 2019 21:01:05 -0800
IronPort-SDR: DEnSIc8sTnkLz5TFHo1a55qhTvAGt9UxuO2A7jtmFGllmL/3TK6ahhHsxD4lub43mEv+fXH8zN
 OOSQ6QW3Os9QirBX6VSMORtYK80kVPhsmuQ+9XuZ1xJOATJZudosND+xPWiMnNXIkrHWZ2bwWX
 ZiOyKXf4fsSyTRvgBvKEJS3heEX/xY3QBHmOMKPEdKuOGUflVjVL2i+wxbBVOsiCqwb7Ksgpnj
 OUUgA3ETpDGQKv5egt0aij8PYaqRTkjVw4j9WFtWx8izFGqJytzZJ7fXQLa7UVkfvFIsEWmWtW
 JII=
Subject: Re: [PATCH v4 01/48] Input: introduce input_mt_report_slot_inactive
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>
CC:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>
References: <20191029072010.8492-1-jiada_wang@mentor.com>
 <20191029072010.8492-2-jiada_wang@mentor.com>
 <b3de4c05-d2d1-58f8-a447-d5e127574ac0@bitmath.org>
 <20191030232311.GK57214@dtor-ws>
From:   Jiada Wang <jiada_wang@mentor.com>
Message-ID: <d16af9ab-0814-0986-1558-06b7ea60d4f7@mentor.com>
Date:   Wed, 6 Nov 2019 14:00:55 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191030232311.GK57214@dtor-ws>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SVR-ORW-MBX-06.mgc.mentorg.com (147.34.90.206) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry

thanks for your comment,
I will update accordingly in v5 patch-set

Thanks,
Jiada

On 2019/10/31 8:23, Dmitry Torokhov wrote:
> On Tue, Oct 29, 2019 at 06:13:09PM +0100, Henrik Rydberg wrote:
>> Hi Jiada,
>>
>>> input_mt_report_slot_state() ignores the tool when the slot is closed.
>>> which has caused a bit of confusion.
>>> This patch introduces input_mt_report_slot_inactive() to report slot
>>> inactive state.
>>> replaces all input_mt_report_slot_state() with
>>> input_mt_report_slot_inactive() in case of close of slot.
>>>
>>> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
>>
>> NACK on this one.
>>
>> We already discussed this patch and the potentially changed behavior to
>> existing setups stemming from ignoring the MT state.
>>
>> On the upside, what I can see this patch does exactly no difference to the
>> cases where the MT state is set, so it can be safely dropped without
>> affecting the rest of the patch series.
> 
> I guess Jiada's concern that we are forcing to pass tool type even
> though we end up ignoring it intervally, which confuses users of the API
> as they might not know what tool to specify.
> 
> How about we do:
> 
> static inline void input_mt_report_slot_inactive(struct input_dev *dev)
> {
> 	input_mt_report_slot_state(dev, 0, false);
> }
> 
> This should not change any behavior.
> 
> Thanks.
> 
