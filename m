Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E9E819C079
	for <lists+linux-input@lfdr.de>; Thu,  2 Apr 2020 13:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388143AbgDBLuQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 2 Apr 2020 07:50:16 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:64559 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388083AbgDBLuQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 2 Apr 2020 07:50:16 -0400
IronPort-SDR: SbbNl2N12bSYPZWnMDk0yxWwbBZqH6aaN1I7kB4GLMt2USpxslzkrQE9ftQHDzM1oAxBrxRLLW
 jg1lXvvxvyhsWQS2vyp4RrR/BSYSsk8uIjCYOpejfB/ZS8+AfKO2scROdAmi/VQm6p44OmnTFt
 jzSZNm7/xbb4TF2hLdp7A/w0hJF5X2boA/Ae+Pw8ZnKbQmJExdfT6rNqYXtFxqmmQKuMg25UV2
 Vj4otcQeG1os9yYNRLb2dWo/8VYlXj7RIKRSIy+7lqz7hBLCV+HvlwkzwNpSESX56DA0GKRxUn
 Bs4=
X-IronPort-AV: E=Sophos;i="5.72,335,1580803200"; 
   d="scan'208";a="47374305"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 02 Apr 2020 03:50:15 -0800
IronPort-SDR: qvBE1jSXKRmivofT4+aNFf3EBsCI4gHJeLrn3ZhUVCG5wZJQv5ylbJIznpGSCfVTDb8FeY2aSx
 xh95mFBiVwftQsZG7wm1xnQ7AqGmQg4pbOAoUht+cyDl4Ffg1JhpBFdpbLYNOUpJ1K+AbfuUGp
 1QItNNX2fdusTe6+l9Z8InBRjmDTUC4kvByzNlKgRlNWF2q8+kZqoJayGOFGxrCxHSKUO6Pz4Y
 pW66TSysSlaLOr+twMp4fkEISwS2hmmGLx1zy91YHowXbfJMiUySFefycZuAEOC7K/jt0ULWYa
 ct4=
Subject: Re: [PATCH v10 54/55] Input: atmel_mxt_ts: Implement synchronization
 during various operation
To:     Dmitry Osipenko <digetx@gmail.com>, <nick@shmanahar.org>,
        <dmitry.torokhov@gmail.com>, <jikos@kernel.org>,
        <benjamin.tissoires@redhat.com>, <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>
References: <20200331105051.58896-1-jiada_wang@mentor.com>
 <20200331105051.58896-55-jiada_wang@mentor.com>
 <c53637ef-8e5d-3243-7236-5da360021f21@gmail.com>
From:   "Wang, Jiada" <jiada_wang@mentor.com>
Message-ID: <b06c7915-562f-ec68-766a-2118cfe57a0f@mentor.com>
Date:   Thu, 2 Apr 2020 20:50:09 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <c53637ef-8e5d-3243-7236-5da360021f21@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: svr-orw-mbx-08.mgc.mentorg.com (147.34.90.208) To
 svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry

On 2020/04/02 1:04, Dmitry Osipenko wrote:
> 31.03.2020 13:50, Jiada Wang пишет:
>> From: Sanjeev Chugh <sanjeev_chugh@mentor.com>
>>
>> There could be scope of race conditions when sysfs is being handled
>> and at the same time, device removal is occurring. For example,
>> we don't want the device removal to begin if the Atmel device
>> cfg update is going on or firmware update is going on. In such
>> cases, wait for device update to be completed before the removal
>> continues.
>>
>>      Thread                                          Thread 2:
>> =========================                       =========================
>> mxt_update_fw_store()                           mxt_remove()
>> mutex_lock(&data->lock)                         ...
>> mxt_initialize()                                //Tries to acquire lock
>>    request_firmware_nowait()                     mutex_lock(&data->lock)
>> ...                                             ==>waits for lock()
>> ...                                             .
>> ...                                             .
>> mutex_unlock(&data->lock)                       .
>>                                                  //Gets lock and proceeds
>>                                                  mxt_free_input_device();
>>                                                  ...
>>                                                  mutex_unlock(&data->lock)
>>                                                  //Frees atmel driver data
>>                                                  kfree(data)
>>
>> If the request_firmware_nowait() completes after the driver removal,
>> and callback is triggered. But kernel crashes since the module is
>> already removed.
>>
>> This commit adds state machine to serialize such scenarios.
> 
> Won't it be easier to bump driver's module use-count by __module_get()
> while firmware is updating? Or remove sysfs during of mxt_remove()? >

thanks for your inspiration, I will replace state machine with module 
use-count.

Thanks,
Jiada

