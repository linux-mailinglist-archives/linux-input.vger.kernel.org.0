Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 581EBC47A8
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2019 08:18:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727476AbfJBGSA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 2 Oct 2019 02:18:00 -0400
Received: from uho.ysoft.cz ([81.19.3.130]:39966 "EHLO uho.ysoft.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726965AbfJBGSA (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 2 Oct 2019 02:18:00 -0400
Received: from [10.1.8.111] (unknown [10.1.8.111])
        by uho.ysoft.cz (Postfix) with ESMTP id D9D20A223B;
        Wed,  2 Oct 2019 08:17:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
        s=20160406-ysoft-com; t=1569997078;
        bh=FIMBiKZZmVBEVNXnumjyj1AH0rUHMveRkxF4bvtUU+E=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=XpcQGD81w/toVWTeJ6RCe0JzxMNXCSn8+WssrgnbRGhjO8ab6TLIrwSU9ik33sY/6
         Ag8LLUSwY3M9GjXjsrqDoiEzZv4UXcHUlCzESSPNnQyhkVodU8bSz0NdOTzUYGLZzz
         k4kDI5KU4hrA35MEcZQrFLHtsACBSUVadd1xzOac=
Subject: Re: [PATCH v2 1/5] dt-bindings: input: Add common input binding in
 json-schema
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Linux Input <linux-input@vger.kernel.org>,
        devicetree@vger.kernel.org
References: <1569940180-11417-1-git-send-email-michal.vokac@ysoft.com>
 <1569940180-11417-2-git-send-email-michal.vokac@ysoft.com>
 <CAL_JsqJHexWRNPPP-+Vv43CYOJmD0X9aqEtn2djMgfqzyBVy5w@mail.gmail.com>
From:   =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
Message-ID: <d4c3dd53-0b61-c647-ee57-9b3252561711@ysoft.com>
Date:   Wed, 2 Oct 2019 08:17:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJHexWRNPPP-+Vv43CYOJmD0X9aqEtn2djMgfqzyBVy5w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 01. 10. 19 17:03, Rob Herring wrote:
> On Tue, Oct 1, 2019 at 9:29 AM Michal Vokáč <michal.vokac@ysoft.com> wrote:
>>
>> Create schema for the common input properties.
>>
>> Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
>> ---
>> Changes since v1:
>>   - New patch in the series.
>>
>> Rob, you suggested to extract the common properties from
>> fsl,mpr121-touchkey.yaml into this file. In the meantime I realized that
>> the linux,keycodes property is already documented in keys.txt.
>>
>> What do you suggest to do? Some possible options:
>>   - Just remove the linux,keycodes propery from keys.txt.
>>   - Merge this input.yaml with all content of keys.txt. How to name the result?
> 
> Yes. input.yaml is fine. Looks like there's only 3 references to
> keys.txt to update.

OK.
Thanks for mentioning the references, I would surely forget to update those.

>>   - Something else?
>>
>>   Documentation/devicetree/bindings/input/input.yaml | 25 ++++++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/input/input.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/input/input.yaml b/Documentation/devicetree/bindings/input/input.yaml
>> new file mode 100644
>> index 000000000000..494e7d031ea3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/input/input.yaml
>> @@ -0,0 +1,25 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/input/input.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Common input schema binding
>> +
>> +maintainers:
>> +  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
>> +
>> +properties:
>> +  linux,keycodes:
>> +    description:
>> +      Specifies an array of numeric keycode values to be used for reporting
>> +      button presses. The array can contain up to 12 entries.
> 
> 12 is specific to your device.

Sure, I will remove this.
I also had question in patch 2/5 regarding the additional minItems and
maxItems constrains. I tried various methods to add the constrains but
all fail to pass the validation with the same error message.

Thanks a lot,
Michal

>> +    allOf:
>> +      - $ref: /schemas/types.yaml#/definitions/uint32-array
>> +      - items:
>> +          minimum: 0
>> +          maximum: 0xff
>> +
>> +  autorepeat:
>> +    description: Enable autorepeat when key is pressed and held down.
>> +    type: boolean
>> --
>> 2.1.4
>>

