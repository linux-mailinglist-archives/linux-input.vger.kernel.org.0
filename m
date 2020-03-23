Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D211018EDF3
	for <lists+linux-input@lfdr.de>; Mon, 23 Mar 2020 03:25:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbgCWCZj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 22 Mar 2020 22:25:39 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:26587 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726946AbgCWCZj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 22 Mar 2020 22:25:39 -0400
IronPort-SDR: oTHr/xuWbcMqzEs7Pl93CAY7efHXkbfHrxbMsWekF5Kcnrji7qnVUaptxzbFyfbShH0TcRBaUb
 TzMMOaTcxaWryv9n6Di3I2ZeMthIliGtCJmoV5+SS27Git8zeNzJ/cvx3y7Xon9u8p6ngzxneA
 rqnaMFVSSUBsnRgml2In529bLmO9Gv9lTJB7UYyfIU7UzdXs/85ckpKThsb1wPwygShFVzZ0nQ
 lT95+rZ65nCQ4XozU4NQhMsiG4pwnsPCxWOVXv77a6ux78YOBAlieHvNi7iDXFhaAMxE4dLocH
 PiY=
X-IronPort-AV: E=Sophos;i="5.72,294,1580803200"; 
   d="scan'208";a="46900258"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 22 Mar 2020 18:25:38 -0800
IronPort-SDR: wr1s1LqmQRKwjqXoRK0E6cEyEj9fZ5fHXctbQTkpThcSjl09EYhw6tpOS2CW3xwjkH8XmGqvCE
 MRiKNEF3lynyWxkHWEOWLp8aN7je5ZfIdM7XCN/zFAoN/BXwyYe4f5wxflA+QRnvibn8NQ+kSO
 t2IAZ6hkffxwU8eBveIRPA1Ab4WtJtgEJZS9KficHw10h/sAwL7nJr7qBq1gKLVAOJB+i48IAM
 8JvNapJC5vPsbRvrSC+ZYKjyPHJN8heKARUQWmYAv8eIpJx5EHM4b3yJfRfVpgbcvu/Bt4HLho
 mI8=
Subject: Re: [PATCH v7 00/48] atmel_mxt_ts misc
To:     Dmitry Osipenko <digetx@gmail.com>, <jikos@kernel.org>,
        <benjamin.tissoires@redhat.com>, <rydberg@bitmath.org>,
        <dmitry.torokhov@gmail.com>, <nick@shmanahar.org>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>
References: <20200212084218.32344-1-jiada_wang@mentor.com>
 <c583d151-9243-cbde-a04b-bc0389d9be5a@gmail.com>
 <89e4bb0b-b2eb-0b67-4307-fb2af914b1c0@mentor.com>
 <f9b221e7-f189-3e47-adab-1cbc49490d4b@gmail.com>
From:   "Wang, Jiada" <jiada_wang@mentor.com>
Message-ID: <bd3c487b-b065-3e4f-6ab1-f344a4113fcd@mentor.com>
Date:   Mon, 23 Mar 2020 11:25:20 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <f9b221e7-f189-3e47-adab-1cbc49490d4b@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202) To
 svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Dmitry

On 2020/03/21 0:53, Dmitry Osipenko wrote:
> Hello Jiada,
> 
> 20.03.2020 06:37, Wang, Jiada пишет:
>> Hello Dmitry
>>
>> I have submitted v8 patch-set to address your comments towards v7
>> patch-set,
>> most of checkpatch warnings and errors have been addressed,
>>
>> But I didn't update for following two types of warnings
>> since I want to keep consistency with legacy code
>>
>> WARNING: DEVICE_ATTR unusual permissions '0600' used
>> #290: FILE: drivers/input/touchscreen/atmel_mxt_ts.c:3761:
>> +static DEVICE_ATTR(debug_v2_enable, 0600, NULL,
> 
> What will happen if you'll use 0644? Will an empty line be returned or
> driver will crash?
> 
debug_v2_enable doesn't have .show callback implemented, so after change 
permission to 644, read of it results in an I/O error,

for other 0600 permission interfaces (t38_data, t25 and debug_enable)
added in this series,
change to 644 can return expected information when read.

Do you think it's better to change debug_v2_enable to 0200,
and others to 0644?

Thanks,
Jiada

>> WARNING: Consider renaming function(s) 'mxt_debug_notify_show' to
>> 'debug_notify_show'
>> #292: FILE: drivers/input/touchscreen/atmel_mxt_ts.c:3763:
>> +static DEVICE_ATTR(debug_notify, 0444, mxt_debug_notify_show, NULL);
> 
> Perhaps this should be fine to ignore, although the prefix is indeed a
> bit superfluous.
> 
>> please let me know if you have different view on this
> 
> Thank you very much, I'll test v8 during the weekend.
> 
