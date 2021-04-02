Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F6C7352C2E
	for <lists+linux-input@lfdr.de>; Fri,  2 Apr 2021 18:09:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234832AbhDBPRT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 2 Apr 2021 11:17:19 -0400
Received: from smtpcmd15176.aruba.it ([62.149.156.176]:49198 "EHLO
        smtpcmd15176.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234723AbhDBPRT (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 2 Apr 2021 11:17:19 -0400
Received: from [192.168.126.129] ([146.241.148.6])
        by Aruba Outgoing Smtp  with ESMTPSA
        id SLXslmHsBLwkNSLXtlemkt; Fri, 02 Apr 2021 17:17:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1617376636; bh=QXjVoBN8xuD0GsrqaCY0J1uEV+wIo47vaW7KNjjoM5U=;
        h=From:Subject:To:Date:MIME-Version:Content-Type;
        b=VqHYXF1eJH6RekIFrlzigQ1LTgNpJaWZHWw6K29yrKQ4hJTqZF67AS33OZY9g5fuE
         O4uABUWjlaHOf2F2/aT3II/UHzY3YGEDpXVV0lBmGkar0M+cgxQ0BfphBDH5yqMkiR
         POyThk/ryInN78CNc/W0w76nxgUku9p+jVeZx+jlcOYGFpGGsU3dzBb1VJj9joOilr
         tvzCL4fS87tetgfxhPHgyqWYPDs7+eDpfL1mYsRaevxmOXwNTBh5wMLI1BwddKVDKo
         DXPrKLQWPdQ0CSeymzIZCYwNGLST450tOWaypCSx8USElc43YPASb3yoJtGcT93E//
         yrePLebUCIY4A==
From:   Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: touchscreen: Add HY46XX bindings
To:     =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.ne@posteo.net>
References: <20210306194120.GA1075725@robh.at.kernel.org>
 <20210401230358.2468618-1-giulio.benetti@benettiengineering.com>
 <20210401230358.2468618-3-giulio.benetti@benettiengineering.com>
 <YGbXnGTpx1WTPpz0@latitude>
Message-ID: <c7650856-aebc-72c6-7597-5f8dce4f347f@benettiengineering.com>
Date:   Fri, 2 Apr 2021 17:17:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YGbXnGTpx1WTPpz0@latitude>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfKUS9KgPuepvoi7+mnQUXkXCmPfFjCvW+tchLsuQfyRikf/wL/0YqJ2WLDYt1uxEL0pDVQF/ky5IrjdGYfYjQYud2HpsLf7P06RjafqeMaXMJZGVjv19
 MgJdSOmA8bp0Sb7TUgKU3XN8IZDeGgeqy9tdVjCbEg3Bpdmy/o8Y+njDxMDcSDYiUUdrX9mTc+b5ibH9EflXgQ42usfhMeAkc5NygQUWFiBa/LJ7x9jme4kA
 sBvLQz91hJm9wzbfyM8CE7QWrDoGud8NynsEsvflUiuDhWYtFGsocm4l1NPShsGNnZ3GJff8ac+RDV2MuSxGg5xbA/qJA2sD2cODrrNU9GZCN5QvSJRE+3f3
 spbymWSF0J4VWmaBjIQkfpF8c+OQhPEn3nM1YlCtv3og3Onyrf0W7D8hb8++MoApUHEbGas1cxvz9S0KabRF8SG2x/LC2xbuG9UdDEVqs/w8Wg657MU=
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jonathan,

thank you for reviewing,

On 4/2/21 10:36 AM, Jonathan Neuschäfer wrote:
> On Fri, Apr 02, 2021 at 01:03:57AM +0200, Giulio Benetti wrote:
>> This adds device tree bindings for the Hycon HY46XX touchscreen series.
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>> V1->V2:
>> As suggested by Rob Herring:
>> * fixed $id: address
>> * added "hycon," in front of every custom property
>> * changed all possible property to boolean type
>> * removed proximity-sensor-switch property since it's not handled in driver
>> ---
>>   .../input/touchscreen/hycon,hy46xx.yaml       | 120 ++++++++++++++++++
>>   MAINTAINERS                                   |   6 +
>>   2 files changed, 126 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml b/Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml
>> new file mode 100644
>> index 000000000000..71a1dbabcd4f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml
>> @@ -0,0 +1,120 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/input/touchscreen/hycon,hy46xx.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: hycon HY46XX series touchscreen controller Bindings
> 
> hycon -> Hycon        (because it's a name)
> Bindings -> bindings  (because it's just a regular word)

ok

>> +
>> +description: |
>> +             There are 6 variants of the chip for various touch panel sizes and coverl len material
> 
> "coverl len material" looks like a typo. What does it mean?

yes

>> +              Glass: 0.3mm--4.0mm
>> +              PET/PMMA: 0.2mm--2.0mm
>> +               HY4613(B)-N048  < 6"
>> +               HY4614(B)-N068  7" .. 10.1"
> 
> According to the datasheet I was able to find[1], HY4613-N048 supports
> touch panel sizes smaller than 5.3". Did this change in newer
> datasheets?

Yes, there is a newer document called "HY46XX Application Notes
V4.0", here is the screenshot of models:
https://pasteboard.co/JVtOMcO.png

> What does the (B) part of the part number mean?

It's an upgraded version even if hardware is fully compatible, so (B) 
means with and without "B".

> 
> [1]: https://datasheetspdf.com/pdf/1297773/HYCON/HY4613-N048/1 >> +               HY4621-NS32  < 5"
>> +               HY4623-NS48  5.1" .. 7"
>> +              Glass: 0.3mm--8.0mm
>> +              PET/PMMA: 0.2mm--4.0mm
>> +               HY4633(B)-N048  < 6"
>> +               HY4635(B)-N048  < 7" .. 10.1"
> 
> The description block seems unusually far indented. I'm not a YAML
> expert, but according to the yamllint tool, it would work with much less
> indentation:
> 
> description: |
>    There are 6 variants of the chip for various touch panel sizes and coverl len material
>     Glass: 0.3mm--4.0mm
> [...]

Ah yes, I've started from edt,ft5x06.yaml and there it was indented that 
way. Anyway I've changed it.

> 
>> +  hycon,glove-enable:
>> +    type: boolean
>> +    description: Allows enabling or disabling glove setting.
> 
> Small nit: Due to the way boolean properties work in DT, you can't
> really use the property to disable the glove setting (in order to
> disable the setting, you would explicitly not use the property).
> Perhaps:
> 
> +    description: Allows enabling the glove setting.
> 
> I don't really know :)

Ah yes, it's true. If not specified it's simply not enabled, so I use 
your suggested form.

> 
>> +
>> +  hycon,report-speed:
>> +    description: Allows setting the report speed(i.e 0x64 => 100Hz).
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    minimum: 0
>> +    maximum: 255
> 
> Please add a space before the opening parenthesis:
> 
> +    description: Allows setting the report speed (i.e 0x64 => 100Hz).
> 
> Or perhaps like this:
> 
> +    description: Allows setting the report speed in Hertz.
> 

Oh yes! I didn't realize it was exactly in Hertz, 0x64 is 100, not only 
equivalent to 100Hz, so every step is 1 Hz

> 
> Thanks,
> Jonathan Neuschäfer
> 

Thanks again!
Best regards
-- 
Giulio Benetti
Benetti Engineering sas
