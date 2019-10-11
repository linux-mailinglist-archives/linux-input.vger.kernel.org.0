Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F6BCD3A81
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2019 10:03:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726755AbfJKID3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Oct 2019 04:03:29 -0400
Received: from uho.ysoft.cz ([81.19.3.130]:42846 "EHLO uho.ysoft.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726461AbfJKID2 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Oct 2019 04:03:28 -0400
Received: from [10.1.8.111] (unknown [10.1.8.111])
        by uho.ysoft.cz (Postfix) with ESMTP id EC452A3018;
        Fri, 11 Oct 2019 10:03:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
        s=20160406-ysoft-com; t=1570781006;
        bh=QwO2HYC6Vj1PCO/BQ6duScvgaUs/Wm9m6ufvGOY3feE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=CPt4xlCXTnQS3wlg071emOH6M+h32x1pIEi9p4TLCdRJ2psr7EDJ6GGav8jBgeIVX
         9szZ4meflhmTl/MspnO4o6wUAJPiVuDsNcwVxGvbSoogiobIVn/Q/7c77rH8dDqXGo
         ZrrBfqLaghkS/fUc1THn7qjldKh8V4V84YwNXCLo=
Subject: Re: [PATCH v3 3/5] dt-bindings: input: Add poll-interval property
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
References: <1570083176-8231-1-git-send-email-michal.vokac@ysoft.com>
 <1570083176-8231-4-git-send-email-michal.vokac@ysoft.com>
 <20191010194036.GA16869@bogus> <20191010200136.GA229325@dtor-ws>
From:   =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
Message-ID: <1616be35-c06a-db84-bc6e-045195f163d7@ysoft.com>
Date:   Fri, 11 Oct 2019 10:03:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191010200136.GA229325@dtor-ws>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 10. 10. 19 22:01, Dmitry Torokhov wrote:
> On Thu, Oct 10, 2019 at 02:40:36PM -0500, Rob Herring wrote:
>> On Thu, Oct 03, 2019 at 08:12:54AM +0200, Michal Vokáč wrote:
>>> Add an option to periodicaly poll the device to get state of the inputs
>>> as the interrupt line may not be used on some platforms.
>>>
>>> Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
>>> ---
>>> Changes since v2:
>>>   - None
>>>
>>> Changes since v1:
>>>   - Use poll-interval instead of linux,poll-interval.
>>>   - Place the poll-interval binding into the common schema.
>>>   - Properly describe that either interrupts or poll-interval property is
>>>     required.
>>>   - Fix the example to pass validation.
>>>
>>>   .../bindings/input/fsl,mpr121-touchkey.yaml        | 25 +++++++++++++++++++++-
>>>   Documentation/devicetree/bindings/input/input.yaml |  4 ++++
>>>   2 files changed, 28 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml b/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
>>> index c6fbcdf78556..035b2fee4491 100644
>>> --- a/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
>>> +++ b/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
>>> @@ -17,6 +17,10 @@ description: |
>>>   allOf:
>>>     - $ref: input.yaml#
>>>   
>>> +oneOf:
>>
>> It should be valid to have both properties present, right?
> 
> The poll does not really sense and does not have any effect when
> interrupt is supplied.

 From technical point of view, yes it is possible to have both
properties. But I agree that it does not really make sense to
use both at the same time.

>> The h/w description can't know what the OS supports.
> 
> It also has no idea what OS does at all and whether it even pays
> attention to any of these properties. We are just trying to say here "I
> do not have an interrupt wired, so for this device's primary use case
> (that is coupled with a certain $PRIMARY OS) we need to poll the
> controller ever so often to handle our use case".

If I understand correctly the relationship between Linux and DT
binding, in Linux we are free to implement just part of all the
possible configuration options described by the binding.

In this case if somebody would enable both interrupt and polling,
we will happily use the interrupt mode only. Maybe it would be nice
to at least print a message that the poll-intervall is ignored?

>> In that case, we should use 'anyOf' here instead.

What I am afraid of is that some DT writers may really use both
properties and expect that Linux will actually do something useful
in this case. Anyway, I am OK with that.

Michal

>> With that,
>>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>>
>>> +  - required: [ interrupts ]
>>> +  - required: [ poll-interval ]
>>> +
>>>   properties:
>>>     compatible:
>>>       const: fsl,mpr121-touchkey
>>> @@ -41,12 +45,12 @@ properties:
>>>   required:
>>>     - compatible
>>>     - reg
>>> -  - interrupts
>>>     - vdd-supply
>>>     - linux,keycodes
>>>   
>>>   examples:
>>>     - |
>>> +    // Example with interrupts
>>>       #include "dt-bindings/input/input.h"
>>>       i2c {
>>>           #address-cells = <1>;
>>> @@ -64,3 +68,22 @@ examples:
>>>                                <KEY_8>, <KEY_9>, <KEY_A>, <KEY_B>;
>>>           };
>>>       };
>>> +
>>> +  - |
>>> +    // Example with polling
>>> +    #include "dt-bindings/input/input.h"
>>> +    i2c {
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +
>>> +        mpr121@5a {
>>> +            compatible = "fsl,mpr121-touchkey";
>>> +            reg = <0x5a>;
>>> +            poll-interval = <20>;
>>> +            autorepeat;
>>> +            vdd-supply = <&ldo4_reg>;
>>> +            linux,keycodes = <KEY_0>, <KEY_1>, <KEY_2>, <KEY_3>,
>>> +                             <KEY_4>, <KEY_5>, <KEY_6>, <KEY_7>,
>>> +                             <KEY_8>, <KEY_9>, <KEY_A>, <KEY_B>;
>>> +        };
>>> +    };
>>> diff --git a/Documentation/devicetree/bindings/input/input.yaml b/Documentation/devicetree/bindings/input/input.yaml
>>> index ca8fe84a2e62..6d519046b3af 100644
>>> --- a/Documentation/devicetree/bindings/input/input.yaml
>>> +++ b/Documentation/devicetree/bindings/input/input.yaml
>>> @@ -24,6 +24,10 @@ properties:
>>>             minimum: 0
>>>             maximum: 0xff
>>>   
>>> +  poll-interval:
>>> +    description: Poll interval time in milliseconds.
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +
>>>     power-off-time-sec:
>>>       description:
>>>         Duration in seconds which the key should be kept pressed for device to
>>> -- 
>>> 2.1.4
>>>
> 

