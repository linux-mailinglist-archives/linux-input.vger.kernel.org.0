Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D2FA27EAD2
	for <lists+linux-input@lfdr.de>; Wed, 30 Sep 2020 16:22:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730195AbgI3OWa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Sep 2020 10:22:30 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:31144 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726680AbgI3OW2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Sep 2020 10:22:28 -0400
IronPort-SDR: Afrq/gzrfOjT+dMh3NfKC6+dYWsC1Fb2ocxiGTquYDdlTVp70yH8b2f+NALq9oE4CMUBhSDLvN
 YPewrZoX1tYb7S2uAnnjaD8+m2ijhxIWZchwTzEA1h/gZ34z0heoNee0feKyG/HGKHjzOouI3p
 fpADusCMZkeFKYq4g10099bltWyZEfp6FIUEcjimvQG2JGqWxFV8Kw/kMeMnevEOs6nFaczbcQ
 wrPhlA3k1s0sVwNh/TtYirqT7aN0wCo0LEyuqXv8V09NBXfqrtfd4y4OHwSxDeRn7wliY+eGY3
 zOc=
X-IronPort-AV: E=Sophos;i="5.77,322,1596528000"; 
   d="scan'208";a="53417079"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 30 Sep 2020 06:22:27 -0800
IronPort-SDR: y9+A998YjR6q49z2cDHsIN872VKx6hZNMQKQ6zyksUxgYG4UVvDDEnwiLr+SVwNP0biouD9Nj1
 b8ufBFqM08oBmnYSzD4cT93yVWxPe+RTSGeUyDrfO9V5kqKdjzTueFwLCRF9slUJ/x7cKxup/d
 T23Ha1pnuc2ZA1PNRlqzyo4Gv7jMkKx4yiQuI70+SPhzXoXQSY9zrAqA6KvLXyI+schb+hOKZO
 D6c67r4quUt6oXpmzAnLeMx44vrPB3EbyXPM83aIblDexJZHGRNs8azTi0if80FNE84/vF9pwR
 V5s=
Subject: Re: [PATCH v2 1/3] dt-bindings: input: atmel: add compatible for
 mXT1386
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <digetx@gmail.com>, <jonathanh@nvidia.com>, <nick@shmanahar.org>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <erosca@de.adit-jv.com>,
        <andrew_gabbasov@mentor.com>
References: <20200925135257.21138-1-jiada_wang@mentor.com>
 <20200925135257.21138-2-jiada_wang@mentor.com>
 <20200928065909.GC2837573@ulmo>
From:   "Wang, Jiada" <jiada_wang@mentor.com>
Message-ID: <81e78fe0-7f9a-e477-fcd0-db05b27dccbf@mentor.com>
Date:   Wed, 30 Sep 2020 23:22:22 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200928065909.GC2837573@ulmo>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SVR-ORW-MBX-09.mgc.mentorg.com (147.34.90.209) To
 svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Thierry

Thanks for your comment

On 2020/09/28 15:59, Thierry Reding wrote:
> On Fri, Sep 25, 2020 at 10:52:55PM +0900, Jiada Wang wrote:
>> Document the mXT1386 compatible string.
>>
>> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
>> ---
>>   Documentation/devicetree/bindings/input/atmel,maxtouch.txt | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
>> index c88919480d37..c13fc0f3f00b 100644
>> --- a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
>> +++ b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
>> @@ -3,6 +3,7 @@ Atmel maXTouch touchscreen/touchpad
>>   Required properties:
>>   - compatible:
>>       atmel,maxtouch
>> +    atmel,mXT1386
> 
> Compatible strings are preferred to be all lowercase.

I will update to use lowercase

Thanks,
Jiada
> 
> Thierry
> 
