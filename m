Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B687298B58
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2019 08:25:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731307AbfHVGZK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Aug 2019 02:25:10 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:1589 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731207AbfHVGZK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Aug 2019 02:25:10 -0400
IronPort-SDR: TGKdgOxBsUdqfC9rwbY+8tp1qCxvPZewjXJTNNl0+k28R5SIEptml7RGqD3vai/Ij1QEz4Zdye
 areO5hTMBQqxr0Ed4M4uyV3d5M+2qQnifjzHuKpwO/ErJhaElddjig8Dg7xz3Y7pYaPt7ejGxo
 2ibzWytEja7pdi6w6EIxEuIwnJDCxf1pC7QU6oK1aqli54NNjJS29d+KCnBdI+Jo+GWzYzZUx4
 +eJ5oJaeFwcBzdkPlL5+ahqOa6vcHJ6n9f0Xup/V8rxywv2dFpnMz/zfDesdafm6US7l+iY1fd
 Xng=
X-IronPort-AV: E=Sophos;i="5.64,415,1559548800"; 
   d="scan'208";a="40635811"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 21 Aug 2019 22:25:09 -0800
IronPort-SDR: v0CzMTbbBoGL4OTJN3qsIqkQxhM69euwIsQ8Ps1PRYARSfL3gKyJNMUqi9ypXepFXZUVXu8bZe
 ezta3FO60VPwdZTRvZnJkqqPkCCi3UVgQjon0A71Y5L3u1CYYwS5o0nsKDMViYra94Lh1YjE/x
 7uCa+69KPpEtNCiAVlrQYGdCmcJ30Edl4abi6zR7f1x6lAYM6EawHKqQ7WTYq89rkwvRJMzC1P
 VrTjmvSYkA5Ph6BcnfNai6QMSo931on2xsnl/2/UT/q4KzI+DKuMpieQE1UduVFKicFudwUJ8q
 56k=
Subject: Re: [PATCH v1 41/63] Input: touchscreen: Atmel: Enable
 IRQ_DISABLE_UNLAZY flag for interrupt
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     <nick@shmanahar.org>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <george_davis@mentor.com>
References: <20190816083558.19189-1-jiada_wang@mentor.com>
 <20190816083558.19189-2-jiada_wang@mentor.com>
 <20190816172615.GJ121898@dtor-ws>
From:   Jiada Wang <jiada_wang@mentor.com>
Message-ID: <0c4edce0-1295-e36b-e658-c109dfca867e@mentor.com>
Date:   Thu, 22 Aug 2019 15:25:05 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190816172615.GJ121898@dtor-ws>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry

On 2019/08/17 2:26, Dmitry Torokhov wrote:
> On Fri, Aug 16, 2019 at 05:35:36PM +0900, Jiada Wang wrote:
>> From: Bhuvanesh Surachari <bhuvanesh_surachari@mentor.com>
>>
>> The de-/serializer driver has defined only irq_mask "ds90ub927_irq_mask" and
>> irq_unmask "ds90ub927_irq_unmask" callback functions. And de-/serializer
>> driver doesn't implement the irq_disable and irq_enable callback functions.
>> Hence inorder to invoke irq_mask callback function when disable_irq_nosync is
>> called the IRQ_DISABLE_UNLAZY interrupt flag should be set. If not the
>> disable_irq_nosync will just increment the depth field in the irq
>> descriptor only once as shown below.
>>
>> disable_irq_nosync
>>   __disable_irq_nosync
>>    __disable_irq (desc->depth++)
>>     irq_disable
>>      if irq_disable present -----------> if IRQ_DISABLE_UNLAZYflag set
>>               |                  no                  |
>>           yes |                                  yes |
>>               |                                      |
>>       desc->irq_data.chip->irq_disable   desc->irq_data.chip->irq_unmask
>>                                           (ds90ub927_irq_mask)
>>                                            disable_irq
>>                                             __disable_irq_nosync
>>                                              __disable_irq
>> (desc->depth++)
>> But the enable_irq will try to decrement the depth field twice which generates
>> the backtrace stating "Unbalanced enable for irq 293". This is because there is
>> no IRQ_DISABLE_UNLAZY flag check while calling irq_unmask callback function
>> of the "ds90ub927_irq_unmask" de-/serializer via enable_irq.
>>
>> enable_irq
>>   __enable_irq (desc->depth--)
>>    irq_enable
>>     if irq_enable present -------------> desc->irq_data.chip->irq_unmask
>>                |                no        (ds90ub927_irq_unmask)
>>            yes |                            enable_irq
>>                |                             __enable_irq (desc->depth--)
>>      (desc->irq_data.chip->irq_enable)
> 
> I'd prefer if we instead did not use the disable_irq_nosync() in the
> driver.
>
sorry for the mistake, during forward port,
I have already eliminated disable_irq_nosync(),
so this patch is no longer needed,
will drop it in v2 patch-set

Thanks，
Jiada

> Thanks.
> 
