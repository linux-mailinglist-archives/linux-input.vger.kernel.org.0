Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5C3B195605
	for <lists+linux-input@lfdr.de>; Fri, 27 Mar 2020 12:09:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbgC0LJd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 Mar 2020 07:09:33 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:61392 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726465AbgC0LJd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 Mar 2020 07:09:33 -0400
IronPort-SDR: +7D9fZIlK+srQyoLhhNieXB0F7wjNfKB6SSrPG0OUsXaywo45G2nVW8M4eKBvEU32KCkCc7jaT
 KIyi6aClmlADjJmPG7xS353R28KyQJ0bUdtWaRRpfQT3OBV9ihWDEPUlesW5kXaDkY+1g6DoUw
 JJUESGaaMCJ6HZBtpQyLZJH/qd3bq/Hku+arODP8ic6OhKjOfaKuA1Ih4YGwgTDzafrRnzsvC1
 n4Ddj8o4ETuATPrJFcQjZL5xGE8yXAejpidaE0qIpiCLdWqtBF35ntLh5T0dHOnw0/YqvYIN3b
 z1c=
X-IronPort-AV: E=Sophos;i="5.72,312,1580803200"; 
   d="scan'208";a="47217299"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 27 Mar 2020 03:09:32 -0800
IronPort-SDR: lNqGnN+FOlsnCDSvrlYAVyeDU8ehyq2a/QJrpszgOPmR5Awj0FdGRSWtlamZPTu80HNuVCO6ok
 uwTzOnvODhn9Ohspry3l1BFpRCgbREtUxRZ70wFNu1hsvjA9JkpNPfYPpKvJ7athytU4zjYbxw
 WQmbU+QCm0mdIhhJOh1hlM5PPSHnJZohWVVv4LCKXDB8KuwwTkR7ZzSJE0Mud2VWd/KhIiG79j
 ncc+reBd4aiyA0j2COZD7mGG38QzRL4CTAnvCYuOqWrCpi7m9NKFxYTIlhpVKEhnZ9Nyz0L0DJ
 R9E=
Subject: Re: [PATCH v9 13/55] Input: atmel_mxt_ts - add regulator control
 support
To:     Dmitry Osipenko <digetx@gmail.com>, <nick@shmanahar.org>,
        <dmitry.torokhov@gmail.com>, <jikos@kernel.org>,
        <benjamin.tissoires@redhat.com>, <bsz@semihalf.com>,
        <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>
References: <20200325133334.19346-1-jiada_wang@mentor.com>
 <20200325133334.19346-14-jiada_wang@mentor.com>
 <672615bc-adce-213f-9e44-864163c0a770@gmail.com>
From:   "Wang, Jiada" <jiada_wang@mentor.com>
Message-ID: <85a74259-6f52-34a0-af34-0217a088cc5b@mentor.com>
Date:   Fri, 27 Mar 2020 20:09:13 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <672615bc-adce-213f-9e44-864163c0a770@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: svr-orw-mbx-04.mgc.mentorg.com (147.34.90.204) To
 svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry

On 2020/03/26 4:05, Dmitry Osipenko wrote:
> 25.03.2020 16:32, Jiada Wang пишет:
>> From: Nick Dyer <nick.dyer@itdev.co.uk>
>>
>> Allow the driver to optionally manage enabling/disable power to the touch
>> controller itself. If the regulators are not present then use the deep
>> sleep power mode instead.
>>
>> For a correct power on sequence, it is required that we have control over
>> the RESET line.
> 
> ...
>> +	data->reg_vdd = devm_regulator_get(dev, "vdd");
>> +	if (IS_ERR(data->reg_vdd)) {
>> +		error = PTR_ERR(data->reg_vdd);
>> +		dev_err(dev, "Error %d getting vdd regulator\n", error);
>> +		goto fail;
>> +	}
>> +
>> +	data->reg_avdd = devm_regulator_get(dev, "avdd");
>> +	if (IS_ERR(data->reg_avdd)) {
>> +		error = PTR_ERR(data->reg_avdd);
>> +		dev_err(dev, "Error %d getting avdd regulator\n", error);
>> +		goto fail_release;
>> +	}
> 
> Hello Jiada,
> 
> The new regulator properties should be documented in the device-tree
> binding.
>
I will document new regulator properties in a separate commit in
v10 patch-set

Thanks,
Jiada

