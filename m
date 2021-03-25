Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 450DD3488CB
	for <lists+linux-input@lfdr.de>; Thu, 25 Mar 2021 07:13:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbhCYGMe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Mar 2021 02:12:34 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:61623 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229624AbhCYGMV (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Mar 2021 02:12:21 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1616652741; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=orQ8HjFkFqj/28v7uatxw4nTWkgct2pHiy/e+Kklocg=;
 b=qgNYMshQjOQRA9mFVBHlcgmJ3SPn5hjDd27JUsuxoUyK5MKxMoIxYhGR7Ixx/GpbyqxNHJKT
 qxPD6j1RheudqW9RSP8HKDwUHMvbkZqMoUeKOLXJKkd+g0zCCgjS4dXZTWkcsSUEE5yzNd9O
 5yzdBNWIUjh7Bf+eT4N2Z9dsHYE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyIxZDE2NCIsICJsaW51eC1pbnB1dEB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 605c29c4c32ceb3a9181ebc8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 25 Mar 2021 06:12:20
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7A3DBC43461; Thu, 25 Mar 2021 06:12:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 68568C433C6;
        Thu, 25 Mar 2021 06:12:19 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 25 Mar 2021 11:42:19 +0530
From:   skakit@codeaurora.org
To:     Rob Herring <robh@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Collins <collinsd@codeaurora.org>, kgunda@codeaurora.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: input: pm8941-pwrkey: Convert power key
 bindings to yaml
In-Reply-To: <20210305144027.GA115719@robh.at.kernel.org>
References: <1614922721-1390-1-git-send-email-skakit@codeaurora.org>
 <1614922721-1390-3-git-send-email-skakit@codeaurora.org>
 <20210305144027.GA115719@robh.at.kernel.org>
Message-ID: <22580c3c4489506640d2091b94c3b520@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Rob,

On 2021-03-05 20:10, Rob Herring wrote:
> On Fri, Mar 05, 2021 at 11:08:40AM +0530, satya priya wrote:
>> Convert power key bindings from .txt to .yaml format.
>> 
>> Signed-off-by: satya priya <skakit@codeaurora.org>
>> ---
>>  .../bindings/input/qcom,pm8941-pwrkey.txt          | 53 
>> ---------------
>>  .../bindings/input/qcom,pm8941-pwrkey.yaml         | 76 
>> ++++++++++++++++++++++
>>  2 files changed, 76 insertions(+), 53 deletions(-)
>>  delete mode 100644 
>> Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.txt
>>  create mode 100644 
>> Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.yaml
> 
> You need to convert the main pm8941 binding first if not done already
> and then reference this binding from it.
> 

Okay.

> And let's have 1 complete example instead of fragments.
> 

Sure.

>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.txt 
>> b/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.txt
>> deleted file mode 100644
>> index 34ab576..0000000
>> --- a/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.txt
>> +++ /dev/null
>> @@ -1,53 +0,0 @@
>> -Qualcomm PM8941 PMIC Power Key
>> -
>> -PROPERTIES
>> -
>> -- compatible:
>> -	Usage: required
>> -	Value type: <string>
>> -	Definition: must be one of:
>> -		    "qcom,pm8941-pwrkey"
>> -		    "qcom,pm8941-resin"
>> -
>> -- reg:
>> -	Usage: required
>> -	Value type: <prop-encoded-array>
>> -	Definition: base address of registers for block
>> -
>> -- interrupts:
>> -	Usage: required
>> -	Value type: <prop-encoded-array>
>> -	Definition: key change interrupt; The format of the specifier is
>> -		    defined by the binding document describing the node's
>> -		    interrupt parent.
>> -
>> -- debounce:
>> -	Usage: optional
>> -	Value type: <u32>
>> -	Definition: time in microseconds that key must be pressed or 
>> released
>> -		    for state change interrupt to trigger.
>> -
>> -- bias-pull-up:
>> -	Usage: optional
>> -	Value type: <empty>
>> -	Definition: presence of this property indicates that the KPDPWR_N 
>> pin
>> -		    should be configured for pull up.
>> -
>> -- linux,code:
>> -	Usage: optional
>> -	Value type: <u32>
>> -	Definition: The input key-code associated with the power key.
>> -		    Use the linux event codes defined in
>> -		    include/dt-bindings/input/linux-event-codes.h
>> -		    When property is omitted KEY_POWER is assumed.
>> -
>> -EXAMPLE
>> -
>> -	pwrkey@800 {
>> -		compatible = "qcom,pm8941-pwrkey";
>> -		reg = <0x800>;
>> -		interrupts = <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
>> -		debounce = <15625>;
>> -		bias-pull-up;
>> -		linux,code = <KEY_POWER>;
>> -	};
>> diff --git 
>> a/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.yaml 
>> b/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.yaml
>> new file mode 100644
>> index 0000000..302866d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.yaml
>> @@ -0,0 +1,76 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/input/qcom,pm8941-pwrkey.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm PM8941 PMIC Power Key
>> +
>> +maintainers:
>> + - Courtney Cavin <courtney.cavin@sonymobile.com>
>> + - Vinod Koul <vkoul@kernel.org>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,pm8941-pwrkey
>> +      - qcom,pm8941-resin
>> +
>> +  interrupts:
>> +    description: |
>> +          Key change interrupt; The format of the specifier is
>> +          defined by the binding document describing the node's
>> +          interrupt parent.
>> +
>> +  debounce:
>> +    description: |
>> +          Time in microseconds that key must be pressed or
>> +          released for state change interrupt to trigger.
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +
>> +  bias-pull-up:
>> +    description: |
>> +           Presence of this property indicates that the KPDPWR_N
>> +           pin should be configured for pull up.
>> +    $ref: /schemas/types.yaml#/definitions/flag
>> +
>> +  linux,code:
>> +    description: |
>> +           The input key-code associated with the power key.
>> +           Use the linux event codes defined in
>> +           include/dt-bindings/input/linux-event-codes.h
>> +           When property is omitted KEY_POWER is assumed.
>> +    $ref: /schemas/types.yaml#/definitions/uint32
> 
> Already has a type definition. Need to reference input.yaml.
> 

Okay.

>> +
>> +required:
>> + - compatible
>> + - interrupts
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> + - |
>> +   #include <dt-bindings/interrupt-controller/irq.h>
>> +   #include <dt-bindings/input/linux-event-codes.h>
>> +   #include <dt-bindings/spmi/spmi.h>
>> +   spmi_bus: spmi@c440000 {
>> +     reg = <0x0c440000 0x1100>;
>> +     #address-cells = <2>;
>> +     #size-cells = <0>;
>> +     pmk8350: pmic@0 {
>> +       reg = <0x0 SPMI_USID>;
>> +       #address-cells = <1>;
>> +       #size-cells = <0>;
>> +       pmk8350_pon: pon_hlos@1300 {
>> +         reg = <0x1300>;
>> +         pwrkey {
>> +            compatible = "qcom,pm8941-pwrkey";
>> +            interrupts = < 0x0 0x8 0 IRQ_TYPE_EDGE_BOTH >;
>> +            debounce = <15625>;
>> +            bias-pull-up;
>> +            linux,code = <KEY_POWER>;
>> +         };
>> +       };
>> +     };
>> +   };
>> +...
>> --
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
>> member
>> of Code Aurora Forum, hosted by The Linux Foundation
>> 
