Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87D771A0A0E
	for <lists+linux-input@lfdr.de>; Tue,  7 Apr 2020 11:28:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728049AbgDGJ2F (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Apr 2020 05:28:05 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:43934 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726720AbgDGJ2E (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Apr 2020 05:28:04 -0400
IronPort-SDR: ZGroXjKKri4pdlkPsMBB5WOGAA9A/2ZUSD9A2NN8wB33pfg3DRYaYww7P1xOd6TDstN5jp/RUj
 JPl2/8fjbi7dgiWganQbgzpzrPP+4lqMXP1qhIwxc9rOfer8AyrWk6fyvyh2NAApLCay/wOKKZ
 +vsjBcZlXMuv5RO6fjcGsyls0rZ0jXR4dySZitIEPCpPnqG/FqGqsCQRRRMZcnSDs5QEs0Lxmk
 nilFl9oZUl7wvSayhuAZSO3RSSkw/97fMIpMjwU6EiabXXo5h6lucRvZY1yOq44fQnzO3z6h4f
 ryg=
X-IronPort-AV: E=Sophos;i="5.72,353,1580803200"; 
   d="scan'208";a="47422403"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 07 Apr 2020 01:27:55 -0800
IronPort-SDR: mYeNVzai53H22P+qIY4UWkBDzXs+r/WaUZR9bewhQ75mLiPoLVGVRdI+H4hnIqxVyYkM+95MyN
 MkVgRUzhYICePJ+MQ11f6JYgxytY1QzRUvjEqp7+WQzAijIEfHMMRgcDlDLnmKGKHqFxXvsDf+
 40EiOI94KMnQtSJPoRsKcnmDrlc6I6hs1042BmuwXJQ5DgGtOaH9wopqyHDQKy4//8g1hZjQx9
 oK6roMKzLrephT0E+H7fTdBMZWZBUHd1N1ByITwBfVpWwTGtaEegxCzcMhkCdOU1uHgCvur7r4
 jHw=
Subject: Re: [PATCH v10 43/55] dt-bindings: input: atmel: support to set max
 bytes transferred
To:     Dmitry Osipenko <digetx@gmail.com>, <nick@shmanahar.org>,
        <dmitry.torokhov@gmail.com>, <jikos@kernel.org>,
        <benjamin.tissoires@redhat.com>, <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>
References: <20200331105051.58896-1-jiada_wang@mentor.com>
 <20200331105051.58896-44-jiada_wang@mentor.com>
 <a15d312d-587e-5b10-e031-dde1965f6f89@gmail.com>
From:   "Wang, Jiada" <jiada_wang@mentor.com>
Message-ID: <9b98a3fc-b7ee-fc01-dc5c-248df507d4a2@mentor.com>
Date:   Tue, 7 Apr 2020 18:27:49 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <a15d312d-587e-5b10-e031-dde1965f6f89@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202) To
 svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry

On 2020/04/01 23:38, Dmitry Osipenko wrote:
> 31.03.2020 13:50, Jiada Wang пишет:
>> Add support to set max bytes transferred in an i2c transaction
>>
>> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
>> ---
>>   Documentation/devicetree/bindings/input/atmel,maxtouch.txt | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
>> index 126266891cdc..37a798cab0dd 100644
>> --- a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
>> +++ b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
>> @@ -45,6 +45,8 @@ Optional properties for main touchpad device:
>>   
>>   - atmel,input_name: Override name of input device from the default.
>>   
>> +- atmel,mtu: Maximum number of bytes that can read/transferred in an i2c transaction
>> +
>>   Example:
>>   
>>   	touch@4b {
>> @@ -52,4 +54,5 @@ Example:
>>   		reg = <0x4b>;
>>   		interrupt-parent = <&gpio>;
>>   		interrupts = <TEGRA_GPIO(W, 3) IRQ_TYPE_LEVEL_LOW>;
>> +		atmel,mtu = <200>
>>   	};
>>
> 
> Is this a software (firmware) limitation which varies from version to
> version?
> 

the timeout issue trying to be addressed in this patch is from software,
one of our board a Serializer/Deserializer bridge exists between the SoC 
(imx6) and the Atmel touch controller.
imx6 i2c controller driver has a timeout value(100ms) for each i2c 
transaction,
Large i2c read transaction failed to complete within this timeout value 
and therefore imx6 i2c controller driver aborts the transaction
and returns failure.

Therefore this patch was created to split the large i2c transaction into 
smaller chunks which can complete
within the timeout defined by i2c controller driver.

Thanks,
Jiada
> If the limitation is per-hardware version, then perhaps should be better
> to have a hardcoded per-hardware table of limits in the driver?
> 
