Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7961ED8840
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2019 07:53:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387808AbfJPFwx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Oct 2019 01:52:53 -0400
Received: from uho.ysoft.cz ([81.19.3.130]:47780 "EHLO uho.ysoft.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387661AbfJPFwx (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Oct 2019 01:52:53 -0400
Received: from [10.1.8.111] (unknown [10.1.8.111])
        by uho.ysoft.cz (Postfix) with ESMTP id 4F297A332A;
        Wed, 16 Oct 2019 07:52:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
        s=20160406-ysoft-com; t=1571205171;
        bh=BGXrI9oHCGBnvTdNo/Ur+xdpJIItkNoUzFwqdKtrgNE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=iDZyYrpt0T+c/LqE80hTXuNl9zTQUzDkxkKoPBiYUWUBVhuubF9RosMOT1PoIJv1P
         bcIUvBFeoN14AEboqFMETHOso3k4ooTTQyIKCEpvf2OfG9Q70frzWlpVV4gvOpwyej
         sB9RN35w8GWOCa9wHU7EXLV5U417sK6jRO5sA1Ro=
Subject: Re: [PATCH v3 3/5] dt-bindings: input: Add poll-interval property
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
References: <1570083176-8231-1-git-send-email-michal.vokac@ysoft.com>
 <1570083176-8231-4-git-send-email-michal.vokac@ysoft.com>
 <20191010194036.GA16869@bogus> <20191010200136.GA229325@dtor-ws>
 <1616be35-c06a-db84-bc6e-045195f163d7@ysoft.com>
 <20191016002328.GJ105649@dtor-ws>
From:   =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
Message-ID: <f7dc4c5b-1947-0955-19c3-e96041ffaf68@ysoft.com>
Date:   Wed, 16 Oct 2019 07:52:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191016002328.GJ105649@dtor-ws>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 16. 10. 19 2:23, Dmitry Torokhov wrote:
> On Fri, Oct 11, 2019 at 10:03:25AM +0200, Michal Vokáč wrote:
>> On 10. 10. 19 22:01, Dmitry Torokhov wrote:
>>> On Thu, Oct 10, 2019 at 02:40:36PM -0500, Rob Herring wrote:
>>>> On Thu, Oct 03, 2019 at 08:12:54AM +0200, Michal Vokáč wrote:
>>>>> Add an option to periodicaly poll the device to get state of the inputs
>>>>> as the interrupt line may not be used on some platforms.
>>>>>
>>>>> Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
>>>>> ---
>>>>> Changes since v2:
>>>>>    - None
>>>>>
>>>>> Changes since v1:
>>>>>    - Use poll-interval instead of linux,poll-interval.
>>>>>    - Place the poll-interval binding into the common schema.
>>>>>    - Properly describe that either interrupts or poll-interval property is
>>>>>      required.
>>>>>    - Fix the example to pass validation.
>>>>>
>>>>>    .../bindings/input/fsl,mpr121-touchkey.yaml        | 25 +++++++++++++++++++++-
>>>>>    Documentation/devicetree/bindings/input/input.yaml |  4 ++++
>>>>>    2 files changed, 28 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml b/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
>>>>> index c6fbcdf78556..035b2fee4491 100644
>>>>> --- a/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
>>>>> +++ b/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
>>>>> @@ -17,6 +17,10 @@ description: |
>>>>>    allOf:
>>>>>      - $ref: input.yaml#
>>>>> +oneOf:
>>>>
>>>> It should be valid to have both properties present, right?
>>>
>>> The poll does not really sense and does not have any effect when
>>> interrupt is supplied.
>>
>>  From technical point of view, yes it is possible to have both
>> properties. But I agree that it does not really make sense to
>> use both at the same time.
>>
>>>> The h/w description can't know what the OS supports.
>>>
>>> It also has no idea what OS does at all and whether it even pays
>>> attention to any of these properties. We are just trying to say here "I
>>> do not have an interrupt wired, so for this device's primary use case
>>> (that is coupled with a certain $PRIMARY OS) we need to poll the
>>> controller ever so often to handle our use case".
>>
>> If I understand correctly the relationship between Linux and DT
>> binding, in Linux we are free to implement just part of all the
>> possible configuration options described by the binding.
>>
>> In this case if somebody would enable both interrupt and polling,
>> we will happily use the interrupt mode only. Maybe it would be nice
>> to at least print a message that the poll-intervall is ignored?
>>
>>>> In that case, we should use 'anyOf' here instead.
>>
>> What I am afraid of is that some DT writers may really use both
>> properties and expect that Linux will actually do something useful
>> in this case. Anyway, I am OK with that.
> 
> OK, I changed it to "anyOf", folded into driver change and applied.

AFAIK this is discouraged and DT binding changes and driver changes
should ideally be kept as separate patches. Separating the binding
from driver changes makes is easier for other projects to reuse
the binding.

The other thing is, Rob reviewed just the binding part, not the driver
change, but now his tag covers both changes.

Michal

