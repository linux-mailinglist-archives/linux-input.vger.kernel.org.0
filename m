Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6FFE1A42B3
	for <lists+linux-input@lfdr.de>; Fri, 10 Apr 2020 08:53:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725858AbgDJGxo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Apr 2020 02:53:44 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:3985 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725844AbgDJGxn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Apr 2020 02:53:43 -0400
IronPort-SDR: U2DmNUMOmEaRTNv3w56LX2kzv2X4EyQNLqsJHagvuuLkFcEh0QCnfRkbPj0CqY3tETT/9ZWrAN
 TPzGuUq8gvgAOas9aAEjwhgGsj93XFWoUCah8SGxUBcX4PF8klxzDljwc6Ny7S9UsYZJNxynuX
 9GfAp4+D8FSpQx6NFMOU7PGzNkJ/tH3At+0NQ6XAvY7lbQoPdIA1kYDP05rWC4CLH5naIpHtR9
 rlMq5vuTZmhSWWT96GxxalWF0EXMJEzwU+RBUgUAi3gBy1rHnyq9oHhcPH0DrTOd9tCqw5Yosf
 GNc=
X-IronPort-AV: E=Sophos;i="5.72,364,1580803200"; 
   d="scan'208";a="47549097"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 09 Apr 2020 22:53:43 -0800
IronPort-SDR: KfhfzDl3cuQJF/PMnO2Z0QuhtBDRaI6p2RHRH4v0qywLwCY2YFPNiVRZMuRmgchkCvAMJWW991
 hQ/E3XQ+Yw8qh1w/vhcpMgHkVT2UYSJduS/Sgp/Bx32dSV+nYGhzruJUgIMxA+oXSZkDe4vGsF
 5IXf0X9dWkKyEgfuJsRIP9E0lKmlB13n+hcbopky5TJfihxTYmOzdF8lyYSJaNEWc93WVXUmfZ
 XV6YyQt6XQWyXbOahEWSG4adErPVhs5SIronAS9J4QIYTOW7U+7KkqZ3pP1Qu/1AGWZUTjk4b6
 dBY=
Subject: Re: [PATCH v10 43/55] dt-bindings: input: atmel: support to set max
 bytes transferred
To:     Dmitry Osipenko <digetx@gmail.com>, <nick@shmanahar.org>,
        <dmitry.torokhov@gmail.com>, <jikos@kernel.org>,
        <benjamin.tissoires@redhat.com>, <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <Balasubramani_Vivekanandan@mentor.com>
References: <20200331105051.58896-1-jiada_wang@mentor.com>
 <20200331105051.58896-44-jiada_wang@mentor.com>
 <a15d312d-587e-5b10-e031-dde1965f6f89@gmail.com>
 <9b98a3fc-b7ee-fc01-dc5c-248df507d4a2@mentor.com>
 <008d019c-2de7-4fe4-0c22-2668312f808b@gmail.com>
 <5abe310f-094c-9355-d533-fb64efcbf726@mentor.com>
 <270812bc-8c2c-c564-be8e-4cc18de8670f@gmail.com>
From:   "Wang, Jiada" <jiada_wang@mentor.com>
Message-ID: <fa4c4352-a368-5c83-2c72-a077946b7975@mentor.com>
Date:   Fri, 10 Apr 2020 15:53:38 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <270812bc-8c2c-c564-be8e-4cc18de8670f@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203) To
 SVR-ORW-MBX-04.mgc.mentorg.com (147.34.90.204)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry

On 2020/04/10 0:10, Dmitry Osipenko wrote:
> 09.04.2020 09:25, Wang, Jiada пишет:
>> Hi Dmitry
>>
>> On 2020/04/07 23:47, Dmitry Osipenko wrote:
>>> 07.04.2020 12:27, Wang, Jiada пишет:
>>> ..
>>>>> Is this a software (firmware) limitation which varies from version to
>>>>> version?
>>>>>
>>>>
>>>> the timeout issue trying to be addressed in this patch is from software,
>>>> one of our board a Serializer/Deserializer bridge exists between the SoC
>>>> (imx6) and the Atmel touch controller.
>>>> imx6 i2c controller driver has a timeout value(100ms) for each i2c
>>>> transaction,
>>>> Large i2c read transaction failed to complete within this timeout value
>>>> and therefore imx6 i2c controller driver aborts the transaction
>>>> and returns failure.
>>>>
>>>> Therefore this patch was created to split the large i2c transaction into
>>>> smaller chunks which can complete
>>>> within the timeout defined by i2c controller driver.
>>>
>>> Isn't it possible to use the max_read/write_len of the generic struct
>>> i2c_adapter_quirks for limiting the transfer size?
>>>
>>> BTW, it looks like the i.MX I2C driver doesn't specify the
>>> i2c_adapter_quirks, which probably needs to be fixed.
>>>
>> yes, i.MX I2C driver can specify i2c_adapter_quirks to limit the size be
>> transferred in one transaction.
>>
>> But even in this case, mxt_process_messages_t44() fails when it tries to
>> transfer data count larger than max_read/write_len set in i.MX I2C
>> driver, which we would like to avoid.
> 
> IIUC, the transfer's limitation is a part of I2C controller hardware and
> not the touch controller, so it should be wrong to describe that
> limitation in the maxtouch's DT node.
> 
> I meant that we probably could set the data->mtu based on
> i2c_client->adapter->quirks->max_read and then the DT property shouldn't
> be needed, couldn't this be done?
>Thanks, now I understand your point,
and yes, by this way, we can address the I2C controller limitation issue
by its own configuration.

I will replace this commit with your proposed solution

Thanks,
jiada


> The I2C core only rejects transfers that don't fit into the
> max_read/write_len and nothing more.
> 
