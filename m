Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6828814CA00
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2020 12:59:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbgA2L7d (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 29 Jan 2020 06:59:33 -0500
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:34584 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbgA2L7d (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 29 Jan 2020 06:59:33 -0500
X-Greylist: delayed 427 seconds by postgrey-1.27 at vger.kernel.org; Wed, 29 Jan 2020 06:59:32 EST
IronPort-SDR: +iI0BjRVuvOjgbvcqHgxxLfxwDgAXPVWZhdrY8CEHBgdr4PZyqOjLtt3y3yVsie9tKn+gIfNK/
 UuRd0/zNEg/zSSgXY+UUfT+E7RD/Zz3jcuZ+t2tQ46Q42NnQm039uOVUTv7qv2UiiMuKk9keK6
 Vf0b8bWlMXfiHyULVzwM9R8L0ohVHoM3i0BxDv7DeiePTDw4NdJM9jgwZ27xAavhclRAPZYze7
 wqjD9qxbnM1BjgJvJ1yVkVVqfde78pQJma/134RAnkccqv0yRYpGsTp0SPyEH01iihWJpd6XJn
 svg=
X-IronPort-AV: E=Sophos;i="5.70,377,1574150400"; 
   d="scan'208";a="47219317"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 29 Jan 2020 03:52:25 -0800
IronPort-SDR: 6DT1J8DgygeSeODfXba2E5y98oSykhyivTsvkj6BwLSUzh5+AQ4vPRkCXrywWnrzEGqG5tjAIk
 zIivE0J87TqQ==
Subject: Re: [PATCH v6 24/48] Input: atmel_mxt_ts - make bootloader interrupt
 driven
To:     Bartosz Szczepanek <bsz@semihalf.com>, <nick.dyer@itdev.co.uk>
CC:     <Andrew_Gabbasov@mentor.com>, <benjamin.tissoires@redhat.com>,
        <dmitry.torokhov@gmail.com>, <erosca@de.adit-jv.com>,
        <jikos@kernel.org>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <nick@shmanahar.org>,
        <rydberg@bitmath.org>, <levinale@google.com>, <rad@semihalf.com>
References: <20191122082402.18173-25-jiada_wang@mentor.com>
 <20200127174127.25522-1-bsz@semihalf.com>
From:   "Wang, Jiada (ESD)" <jiada_wang@mentor.com>
Message-ID: <4665e505-4f33-2a29-fc95-cacd40767e43@mentor.com>
Date:   Wed, 29 Jan 2020 20:52:19 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200127174127.25522-1-bsz@semihalf.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: svr-orw-mbx-08.mgc.mentorg.com (147.34.90.208) To
 svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Bartosz

thanks for the report,
I will test firmware update on my chromebook

Thanks,
Jiada

On 2020/01/28 2:41, Bartosz Szczepanek wrote:
> Hi,
> 
> I've been testing this patchset on Chromebook equipped with Atmel touchscreen &
> touchpad. In my setup, this particular patch seems to introduce a regression
> on firmware update:
> 
>> localhost /sys/devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-6/i2c-ATML0001:00 # echo maxtouch-ts.fw > update_fw
>> bash: echo: write error: Remote I/O error
> 
> Kernel logs show that the reason is failed I2C transfer:
> 
>> [ 111.632131] atmel_mxt_ts i2c-ATML0001:00: Found bootloader addr:27 ID:21 version:4
>> [ 111.637711] atmel_mxt_ts i2c-ATML0001:00: Unlocking bootloader
>> [ 129.155091] atmel_mxt_ts i2c-ATML0001:00: Sent 1356 frames, 212224 bytes
>> [ 129.263269] atmel_mxt_ts i2c-ATML0001:00: The firmware update succeeded
>> [ 129.263952] atmel_mxt_ts i2c-ATML0001:00: __mxt_read_chunk: i2c transfer failed (-121)
>> [ 129.265072] atmel_mxt_ts i2c-ATML0001:00: mxt_bootloader_read: i2c recv failed (-121)
>> [ 129.265588] atmel_mxt_ts i2c-ATML0001:00: Trying alternate bootloader address
>> [ 129.266375] atmel_mxt_ts i2c-ATML0001:00: mxt_bootloader_read: i2c recv failed (-121)
> 
> Surprisingly, only touchscreen device is affected. When I checked out to
> 119e1b7e8481 ("Input: atmel_mxt_ts - refactor code to enter bootloader into
> separate func") all worked fine. In between these commits I got some mixed
> results, including timeout while waiting for completion:
> 
>> [ 190.006174] atmel_mxt_ts i2c-ATML0001:00: Found bootloader addr:27 ID:21 version:4
>> [ 190.317819] atmel_mxt_ts i2c-ATML0001:00: Wait for completion timed out.
>> [ 190.318267] atmel_mxt_ts i2c-ATML0001:00: Update wait error -110
>> [ 190.319310] atmel_mxt_ts i2c-ATML0001:00: Unlocking bootloader
>> [ 208.369825] atmel_mxt_ts i2c-ATML0001:00: Sent 1356 frames, 212224 bytes
>> [ 208.536942] atmel_mxt_ts i2c-ATML0001:00: The firmware update succeeded
>> [ 208.544835] atmel_mxt_ts i2c-ATML0001:00: Family: 164 Variant: 14 Firmware V2.3.AA Objects: 40
>> [ 208.547623] atmel_mxt_ts i2c-ATML0001:00: Touchscreen size X4095Y2729
> 
> Some more details - the touchscreen device reports itself as:
> 
>> atmel_mxt_ts i2c-ATML0001:00: Family: 164 Variant: 14 Firmware V2.3.AA Objects: 40
> 
> Due to Chromebook limitations on kernel version, I'm running 4.19 kernel
> with patches backported from master (so that atmel_mxt_ts is aligned between
> master and 4.19). The platform is Samsung Chromebook Pro.
> 
> Best regards,
> Bartosz
> 
