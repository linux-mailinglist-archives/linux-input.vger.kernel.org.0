Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD3459A5DD
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2019 05:00:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403921AbfHWDA6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Aug 2019 23:00:58 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:28841 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726283AbfHWDA6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Aug 2019 23:00:58 -0400
IronPort-SDR: p14kMnk0aX0YGYzg3kcVCPZw9DaYEhmvsxEP0z9bXolExNR9v9YskXn4vVFpAAjb35hjkOnkLI
 3Cr/YcaNI4eO3Auo8rikDvs/3i+hLYTt5cpnkdbpm1fH+kzqO2Pze97W49o+KkxfKO+HKhx0QW
 sgMxTlzPfdVFxnB9Hmd6Pkv9Ag4BjpbOtPRAuv6UZLWWIXTZ8sY88+GDSFhgYohOLHuDPq+nOP
 Qgl3YmHtwuAoB4hCM05XCB+gECmKE2zWkIKnb3zOZjk8rhcMbfpbAb2rSKeUHt/7IHtfjSZF/8
 JtU=
X-IronPort-AV: E=Sophos;i="5.64,419,1559548800"; 
   d="scan'208";a="40698267"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 22 Aug 2019 19:00:57 -0800
IronPort-SDR: yV9y16DZfOfxIg2BldZupgi/cOE5jHMBl0/1ufpmF4FlrC3oj8zYK03Gixy8zxKKnsihQNffg5
 xF6jxus5gc+NQlmGtI9MOJn190h7XmYtsRfhrYgxi+yOMfOiOfOILrO6oykYCsuh5iwg3VOkRR
 x7E2UeBC7kcS9EGu7duXMTd5mfbbHiKEmNUZBtIsFlRBO8znARn+dfdDBUIuVczR+EYvCUO9pr
 2NgdbV7yycWhtXYv+WJRNOAzzsJ2rEF5mLjLmiAtlVy/NyuFC3vColsdufbc/nCxkIA/nYOCzk
 gZo=
Subject: Re: [PATCH v1 31/63] Input: atmel_mxt_ts - add memory access
 interface via sysfs
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     <nick@shmanahar.org>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <george_davis@mentor.com>
References: <20190816083451.18947-1-jiada_wang@mentor.com>
 <20190816083451.18947-2-jiada_wang@mentor.com>
 <20190816172920.GK121898@dtor-ws>
From:   Jiada Wang <jiada_wang@mentor.com>
Message-ID: <94d1ef09-811b-4109-e3d4-4f4f4e9ac89c@mentor.com>
Date:   Fri, 23 Aug 2019 12:00:49 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190816172920.GK121898@dtor-ws>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry

On 2019/08/17 2:29, Dmitry Torokhov wrote:
> On Fri, Aug 16, 2019 at 05:34:19PM +0900, Jiada Wang wrote:
>> From: Nick Dyer <nick.dyer@itdev.co.uk>
>>
>> Atmel maXTouch chips can be addressed via an "Object Based Protocol" which
>> defines how i2c registers are mapped to different functions within the
>> chips. This interface exposes the register map and allows user-space
>> utilities to inspect and alter object configuration, and to view diagnostic
>> data, while the device is running.
> 
> I'd say if we want this we should look into write support in regmap and
> switching the driver over.
> 
since switch to regmap is non-trival, I will drop this patch in v2 patchset

Thanks,
Jiada
> Thanks.
> 
