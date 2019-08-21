Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6771C97AB8
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2019 15:26:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728125AbfHUN0k (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Aug 2019 09:26:40 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:40784 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727696AbfHUN0k (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Aug 2019 09:26:40 -0400
IronPort-SDR: 7j2Z56FFfIepJyetTZovoxgviVJOH7ipw3hJQMdBeVoPswvP5Ti4MNfOcxb3AWgQL34enU5IJY
 r5wAMHittg4puQiq+vUegD2ITNodIFy0Kqg8B348eavI8F1NC0q6v1eYQMBBwY2bsYjEBqbBZU
 o5BBAFJYCleyE/66vtzoZTR1dNHDZxpkpwuf7PCUpjo6XukvcwVUCclIi3Yz28SC4BXdLRCqnp
 BpfgFwGEuoGFrKO6vseINY8iWOEcSbBbA3eehKui5StzwGqglksVA3z/dqLZlNRMr5QE6GBvRS
 CIk=
X-IronPort-AV: E=Sophos;i="5.64,412,1559548800"; 
   d="scan'208";a="42441806"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 21 Aug 2019 05:26:39 -0800
IronPort-SDR: 0Vak9Dte74vvmXy+EK/D6kEgdUPzQJTOQHvY9KYoCb8EXdCalOfxT9m75zsu3YrybU+jjvqRyG
 Y49rCq9p82P/N3Mhm+etbys7AMIWIjM40tdKmSmf4O3k+xmRB9Z9UhW+AXyZ5zkGn+tnvDLrXs
 smweiatWLsRpA+YdlxyCHYMa94L+agNIN/7L6be8AO+ckym/qW5i4DdvE6ndESeadDbBfX37Mw
 eRRWgqRGkTiR/LmzST43hS64Dm39UQ5+B5o0szZXW1jYwJ//ZK1lq1KFewI0Pm9VPIaNa6bCWX
 WmY=
Subject: Re: [PATCH v1 03/63] Input: atmel_mxt_ts - only read messages in
 mxt_acquire_irq() when necessary
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     <nick@shmanahar.org>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <george_davis@mentor.com>
References: <20190816082952.17985-1-jiada_wang@mentor.com>
 <20190816082952.17985-4-jiada_wang@mentor.com>
 <20190816171622.GF121898@dtor-ws>
From:   Jiada Wang <jiada_wang@mentor.com>
Message-ID: <558e1227-7671-0838-d4e0-f234833c0973@mentor.com>
Date:   Wed, 21 Aug 2019 22:26:31 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190816171622.GF121898@dtor-ws>
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

On 2019/08/17 2:16, Dmitry Torokhov wrote:
> On Fri, Aug 16, 2019 at 05:28:52PM +0900, Jiada Wang wrote:
>> From: Nick Dyer <nick.dyer@itdev.co.uk>
>>
>> The workaround of reading all messages until an invalid is received is a
>> way of forcing the CHG line high, which means that when using
>> edge-triggered interrupts the interrupt can be acquired.
>>
>> With level-triggered interrupts the workaround is unnecessary.
>>
>> Also, most recent maXTouch chips have a feature called RETRIGEN which, when
>> enabled, reasserts the interrupt line every cycle if there are messages
>> waiting. This also makes the workaround unnecessary.
>>
>> Note: the RETRIGEN feature is only in some firmware versions/chips, it's
>> not valid simply to enable the bit.
> 
> Instead of trying to work around of misconfiguration for IRQ/firmware,
> can we simply error out of probe if we see a level interrupt with
> !RETRIGEN firmware?
> 
I think for old firmwares, which doesn't support RETRIGEN feature, this 
workaround is needed, otherwise we will break all old firmwares, which 
configured with edge-triggered IRQ

for recent firmwares which support RETRIGEN feature, we can fail probe, 
if RETRIGEN is not enabled, and configured with edge-triggered IRQ.

what is your thought?

Thanks,
Jiada
> Thanks.
> 
