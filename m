Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5C60B502D
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 16:17:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726308AbfIQORF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 10:17:05 -0400
Received: from uho.ysoft.cz ([81.19.3.130]:39762 "EHLO uho.ysoft.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726439AbfIQORD (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 10:17:03 -0400
Received: from [10.1.8.111] (unknown [10.1.8.111])
        by uho.ysoft.cz (Postfix) with ESMTP id EF81EA0782;
        Tue, 17 Sep 2019 16:17:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
        s=20160406-ysoft-com; t=1568729822;
        bh=c9mbWedV/usEjSrrvP1MD/ArbLL9o/obpMinlNbkgJs=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=F0qtEjn7pofb3hIFoE2OyGkVJD8Tq8Hx43eVBkgOxf/BMzoDi0tcISekGXmhOK80T
         jVSRYnMDElKQx+mcU8Vd/lelZXkJuiUk7QUY6+kb1bn10gvTciRZHWM7NE5FqngB7U
         PKnf9+DqyiNsmgCUhG0thaZWf47IJ8QKbmQXNxl0=
Subject: Re: [PATCH input-next 2/4] dt-bindings: input: mpr121: Add
 poll-interval property
To:     Rob Herring <robh@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
References: <1567424417-3914-1-git-send-email-michal.vokac@ysoft.com>
 <1567424417-3914-3-git-send-email-michal.vokac@ysoft.com>
 <20190903070123.GA15981@bogus>
From:   =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
Message-ID: <c8c909e5-1e1f-23a7-dc22-f112fcaeab4c@ysoft.com>
Date:   Tue, 17 Sep 2019 16:17:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190903070123.GA15981@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 03. 09. 19 9:01, Rob Herring wrote:
> On Mon, Sep 02, 2019 at 01:40:15PM +0200, Michal Vokáč wrote:
>> Add an option to periodicaly poll the device to get the buttons states
>> as the interrupt line may not be used on some platforms.
>>
>> Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
>> ---
>> I am not sure how to propperly handle this.
>> Either interrupt or linux,poll-interval is required, but not both.
> 
> Add this at the top level:
> 
> oneOf:
>    - required: [ interrupts ]
>    - required: [ linux,poll-interval ]
>

Nice, works as expected.
  
>>
>>   .../bindings/input/fsl,mpr121-touchkey.yaml          | 20 +++++++++++++++++++-
>>   1 file changed, 19 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml b/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
>> index c463c1c81755..2b3073a3c9f4 100644
>> --- a/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
>> +++ b/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
>> @@ -34,6 +34,10 @@ properties:
>>       minItems: 1
>>       maxItems: 12
>>   
>> +  linux,poll-interval:
>> +    description: Poll interval time in milliseconds.
>> +    maxItems: 1
> 
> We already have 'poll-interval' in several bindings. Use that.

OK, will do.
linux,poll-intervall was initially suggested by Dmitry but AFAICT he is OK
with this.

> This should have a type definition and you don't need maxItems:
> 
> $ref: /schemas/types.yaml#/definitions/uint32

OK.

> Really this should go in a common input schema doc.

I am not sure how to deal with this. Do you suggest to create

  Documentation/devicetree/bindings/input/input.yaml

and put all the common input properties there? Something like:

diff --git a/Documentation/devicetree/bindings/input/input.yaml b/Documentation/devicetree/bindings/input/input.yaml
new file mode 100644
index 000000000000..5dc10ebdfdf0
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/input.yaml
@@ -0,0 +1,24 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/input.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common input schema binding
+
+maintainers:
+  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
+
+properties:
+  linux,keycodes:
+    description:
+      Specifies an array of numeric keycode values to be used for reporting
+      button presses. The array can contain up to 12 entries.
+    minItems: 1
+    maxItems: 12
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+  poll-interval:
+    description: Poll interval time in milliseconds.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
---

Or something else?
And what is the impact on the fsl,mpr121-touchkey.yaml content/format?
I could not find any example in any subsystem of such approach.

Thank you,
Michal

>> +
>>     wakeup-source: Use any event on keypad as wakeup event.
>>       type: boolean
>>   
>> @@ -44,12 +48,12 @@ properties:
>>   required:
>>     - compatible
>>     - reg
>> -  - interrupts
>>     - vdd-supply
>>     - linux,keycodes
>>   
>>   examples:
>>     - |
>> +    // Example with interrupts
>>       #include "dt-bindings/input/input.h"
>>       touchkey: mpr121@5a {
>>           compatible = "fsl,mpr121-touchkey";
>> @@ -62,3 +66,17 @@ examples:
>>                            <KEY_4> <KEY_5>, <KEY_6>, <KEY_7>,
>>                            <KEY_8>, <KEY_9>, <KEY_A>, <KEY_B>;
>>       };
>> +
>> +  - |
>> +    // Example with polling
>> +    #include "dt-bindings/input/input.h"
>> +    touchkey: mpr121@5a {
>> +        compatible = "fsl,mpr121-touchkey";
>> +        reg = <0x5a>;
>> +        linux,poll-interval = <20>;
>> +        autorepeat;
>> +        vdd-supply = <&ldo4_reg>;
>> +        linux,keycodes = <KEY_0>, <KEY_1>, <KEY_2>, <KEY_3>,
>> +                         <KEY_4> <KEY_5>, <KEY_6>, <KEY_7>,
>> +                         <KEY_8>, <KEY_9>, <KEY_A>, <KEY_B>;
>> +    );
>> -- 
>> 2.1.4
>>

