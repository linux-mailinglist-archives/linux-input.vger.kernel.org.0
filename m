Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3165720F74F
	for <lists+linux-input@lfdr.de>; Tue, 30 Jun 2020 16:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729950AbgF3Oe6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Jun 2020 10:34:58 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:52161 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728506AbgF3Oe5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Jun 2020 10:34:57 -0400
IronPort-SDR: 4I8/vFeNRXlhMlEpZcVV1IeyDlqRUjfqjysrXpI7YQ5XXyO9VWifYDX94ejNZgEMi3nlA2bOZP
 tlzBO/U8sglH6xCY419aHZS7zFldDTB+xOsdr/Fa19ays6XxKwP4SVkndeyWwPB0CZoypsMNa5
 4WGeC/oxe4E0L3C42NIuet3yIBcoCS9AQUmDOFUs29aTGbjuVwtGf3AYBHuV7p34ZRKWfubGkv
 pBvxG0xQfPO/Jiei0OjdekcDWhJw6DGo1hNp91P9PdBdz7T51e4qNZeYG1yOHe8gl8mqCFZEmL
 eJM=
X-IronPort-AV: E=Sophos;i="5.75,297,1589270400"; 
   d="scan'208";a="52594895"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 30 Jun 2020 06:34:56 -0800
IronPort-SDR: 32+6r2MiDOyHDFTHTPQkDXrsJFWUqG8DPXUk+FSjEtbVI5Qm35vjVue2739JLsK3TZLVdylCC7
 37cx5Trcu9fgccn2fKHR42Zqwkhk7fhx6pZxz1RJbxgzysoMwpCO2mxSn4j6n1/3yzmHKyjWKY
 yz6yYuqYyhxxFXa0p6zMBUXX0caDPKEkPvkQPB77poZ7fFzqf1QPiTDzCc/R0oFn5VXb7EPp5B
 JmBUu67oQqQGcT8skdzg9FweWDJGJ0lQMRZEpqThqK/9myWMowCzXDumWvKkhBbsOEYrqlG2kJ
 xeE=
Subject: Re: [PATCH v11 05/56] Input: atmel_mxt_ts - output status from T48
 Noise Supression
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     <nick@shmanahar.org>, <jikos@kernel.org>,
        <benjamin.tissoires@redhat.com>, <bsz@semihalf.com>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>
References: <20200508055656.96389-1-jiada_wang@mentor.com>
 <20200508055656.96389-6-jiada_wang@mentor.com>
 <20200511222347.GZ89269@dtor-ws>
From:   "Wang, Jiada" <jiada_wang@mentor.com>
Message-ID: <448a6d77-56bd-a45a-2ccf-dee93f9fc5e8@mentor.com>
Date:   Tue, 30 Jun 2020 23:34:51 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200511222347.GZ89269@dtor-ws>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SVR-ORW-MBX-06.mgc.mentorg.com (147.34.90.206) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Dmitry

On 2020/05/12 7:23, Dmitry Torokhov wrote:
> On Thu, May 07, 2020 at 10:56:05PM -0700, Jiada Wang wrote:
>> From: Nick Dyer <nick.dyer@itdev.co.uk>
>>
>> This patch outputs status from T48 Noise Supression
>>
>> Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
>> Acked-by: Benson Leung <bleung@chromium.org>
>> Acked-by: Yufeng Shen <miletus@chromium.org>
>> (cherry picked from ndyer/linux/for-upstream commit 2895a6ff150a49f27a02938f8d262be238b296d8)
>> Signed-off-by: George G. Davis <george_davis@mentor.com>
>> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
>> ---
>>   drivers/input/touchscreen/atmel_mxt_ts.c | 25 ++++++++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>>
>> diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
>> index 7e6a66e3e1e0..a53985a7736f 100644
>> --- a/drivers/input/touchscreen/atmel_mxt_ts.c
>> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
>> @@ -324,6 +324,7 @@ struct mxt_data {
>>   	u16 T18_address;
>>   	u8 T19_reportid;
>>   	u16 T44_address;
>> +	u8 T48_reportid;
>>   	u8 T100_reportid_min;
>>   	u8 T100_reportid_max;
>>   
>> @@ -978,6 +979,24 @@ static void mxt_proc_t100_message(struct mxt_data *data, u8 *message)
>>   	data->update_input = true;
>>   }
>>   
>> +static int mxt_proc_t48_messages(struct mxt_data *data, u8 *msg)
>> +{
>> +	struct device *dev = &data->client->dev;
>> +	u8 status, state;
>> +
>> +	status = msg[1];
>> +	state  = msg[4];
>> +
>> +	dev_dbg(dev, "T48 state %d status %02X %s%s%s%s%s\n", state, status,
>> +		status & 0x01 ? "FREQCHG " : "",
>> +		status & 0x02 ? "APXCHG " : "",
>> +		status & 0x04 ? "ALGOERR " : "",
>> +		status & 0x10 ? "STATCHG " : "",
>> +		status & 0x20 ? "NLVLCHG " : "");
> 
> Should we define symbolic names for these bits, like you did for T42
> in the next patch?

will replace with symbolic names in next version

Thanks,
Jiada
> 
> Thanks.
> 
