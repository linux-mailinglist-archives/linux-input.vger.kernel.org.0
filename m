Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21E28989E7
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2019 05:37:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729212AbfHVDhU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Aug 2019 23:37:20 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:42898 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728275AbfHVDhU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Aug 2019 23:37:20 -0400
IronPort-SDR: 3IyRZjWhAPCvFyFzdZKgUjmoPesQJQtV4T2H9YWESXKo2QpeaGQtmTQDLotdCW7pLJs+YmqE3x
 p5hV/VdWUDxCoqbEZVqRQiJ8bRkhDHdP5gLQM69zyNjCl7k4ADmK5c7yV7TzGdeb5kk354WawT
 7LqLUWojhrQzJgCjNCUY8mVeS7wUUHxCUCcUXWW8B8Ya+lP2bE7xMvnLnCk/caD+tymqBChyWp
 lGXM7h2ncaiesREDGX4gnv3USNo8cyXw1XDW2Fi6NOQpq9h6kekFMJsM4gJjM38SiajlenZuka
 l3g=
X-IronPort-AV: E=Sophos;i="5.64,415,1559548800"; 
   d="scan'208";a="40633198"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 21 Aug 2019 19:37:19 -0800
IronPort-SDR: knej7h//JlhpiEVQ7A8cM21t3Tj7uWAZJhNy2Dh3bBaBtIWQdiB9h6lYm/zpZN+JDJpP+NZg5Y
 U3GEISDT8GZaSNBgDT9qNRwVVj3KqEwKysOmlob4/TXPHgbukoACxZtsbeURHRBYESudzFruBC
 +jjsxSHPyJY2OnKuvDljpLJWSa91MevcS6/dAr0vkHJUHqqUP62BSl6uvrfL5+nV2BJhMr136/
 2FGMwfdjUaHjM2uiD251CbOk0rRt7vpdpVbK8xwirDE+jvJQu7XHoL5EMG+T0HwJ1Ol41hwezO
 awU=
Subject: Re: [PATCH v1 03/63] Input: atmel_mxt_ts - only read messages in
 mxt_acquire_irq() when necessary
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     <nick@shmanahar.org>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <george_davis@mentor.com>
References: <20190816082952.17985-1-jiada_wang@mentor.com>
 <20190816082952.17985-4-jiada_wang@mentor.com>
 <20190816171622.GF121898@dtor-ws>
 <558e1227-7671-0838-d4e0-f234833c0973@mentor.com>
 <20190821175422.GE76194@dtor-ws>
From:   Jiada Wang <jiada_wang@mentor.com>
Message-ID: <cab8d0cd-21ec-3844-5e4f-eb5b582aa432@mentor.com>
Date:   Thu, 22 Aug 2019 12:37:12 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821175422.GE76194@dtor-ws>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi

On 2019/08/22 2:54, Dmitry Torokhov wrote:
> On Wed, Aug 21, 2019 at 10:26:31PM +0900, Jiada Wang wrote:
>> Hi Dmitry
>>
>> On 2019/08/17 2:16, Dmitry Torokhov wrote:
>>> On Fri, Aug 16, 2019 at 05:28:52PM +0900, Jiada Wang wrote:
>>>> From: Nick Dyer <nick.dyer@itdev.co.uk>
>>>>
>>>> The workaround of reading all messages until an invalid is received is a
>>>> way of forcing the CHG line high, which means that when using
>>>> edge-triggered interrupts the interrupt can be acquired.
>>>>
>>>> With level-triggered interrupts the workaround is unnecessary.
>>>>
>>>> Also, most recent maXTouch chips have a feature called RETRIGEN which, when
>>>> enabled, reasserts the interrupt line every cycle if there are messages
>>>> waiting. This also makes the workaround unnecessary.
>>>>
>>>> Note: the RETRIGEN feature is only in some firmware versions/chips, it's
>>>> not valid simply to enable the bit.
>>>
>>> Instead of trying to work around of misconfiguration for IRQ/firmware,
>>> can we simply error out of probe if we see a level interrupt with
>>> !RETRIGEN firmware?
>>>
>> I think for old firmwares, which doesn't support RETRIGEN feature, this
>> workaround is needed, otherwise we will break all old firmwares, which
>> configured with edge-triggered IRQ
> 
> Do you know if there are any? I know Chrome OS firmware have RETRIGEN
> activated and they are pretty old (original Pixel is from 2013). But if
> we indeed have devices with edge interrupt and old not firmware that
> does not retrigger, I guess we'll have to keep it...
> 

Honestly I don't know firmwares/chips which don't support RETRIGEN feature.

BUT Dyer originally authored this patch in 2012, I assume here "old" 
firmware/chips means, those before 2012.


Thanks,
Jiada

> Thanks.
> 
