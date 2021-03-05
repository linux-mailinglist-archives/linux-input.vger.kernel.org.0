Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CFC732ED4E
	for <lists+linux-input@lfdr.de>; Fri,  5 Mar 2021 15:41:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbhCEOki (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Mar 2021 09:40:38 -0500
Received: from mail-oi1-f169.google.com ([209.85.167.169]:46131 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbhCEOka (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 5 Mar 2021 09:40:30 -0500
Received: by mail-oi1-f169.google.com with SMTP id f3so2684461oiw.13;
        Fri, 05 Mar 2021 06:40:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=F7pcDGDzzy4uB4kOInfe2IvWqljeZ9azt0OyEx63dvk=;
        b=rfEwz3dIDilS3QEmm0fVy/vKpUWKLTpYZ8l/p7bSUGBt4k3T2iYT5WfkDwhro3CcYm
         ltZWMNEVCmCDW8Cgn0l8pkpJbxbz9lSAbpf/oGIup77tHYcRcOyD8OU3swa+cgD6bp7X
         9H6y1uz0LehX+XQNSwX+Y5Iei4IVNbkYUa3tggA1/R41wIdaBZOrXtFOcuo0Ly2wITYY
         oZ2atr7kmMM1c962X2K+ogTPPKbXt7w4SFHphPL23gsYtS4EkgUNIbxPUJy7e+kqCE8a
         /bvwBi9CCejvxSz4s3gPEIFM6EXrVEa8Gb9t/+sQUBqNKvp0Fa6JfJu38Kd7aRof23jN
         iFjg==
X-Gm-Message-State: AOAM533EgbH83/VN6hpR/LNoPw6uWm4NB3a0/uF+VDpE/CAXxS3W+f3g
        Zb7cTByc8Hto/+5hnhTqRQ==
X-Google-Smtp-Source: ABdhPJyXlvARpPGlGFjDnceD5mU6p9mFQaDzgkfGeRTwxU0dtnrEa1S+QUMIGFtPSJLHGunq0GU43w==
X-Received: by 2002:a05:6808:128e:: with SMTP id a14mr7516967oiw.71.1614955229223;
        Fri, 05 Mar 2021 06:40:29 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r3sm541146oif.5.2021.03.05.06.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 06:40:28 -0800 (PST)
Received: (nullmailer pid 121339 invoked by uid 1000);
        Fri, 05 Mar 2021 14:40:27 -0000
Date:   Fri, 5 Mar 2021 08:40:27 -0600
From:   Rob Herring <robh@kernel.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Collins <collinsd@codeaurora.org>, kgunda@codeaurora.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: input: pm8941-pwrkey: Convert power key
 bindings to yaml
Message-ID: <20210305144027.GA115719@robh.at.kernel.org>
References: <1614922721-1390-1-git-send-email-skakit@codeaurora.org>
 <1614922721-1390-3-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614922721-1390-3-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Mar 05, 2021 at 11:08:40AM +0530, satya priya wrote:
> Convert power key bindings from .txt to .yaml format.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
>  .../bindings/input/qcom,pm8941-pwrkey.txt          | 53 ---------------
>  .../bindings/input/qcom,pm8941-pwrkey.yaml         | 76 ++++++++++++++++++++++
>  2 files changed, 76 insertions(+), 53 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.txt
>  create mode 100644 Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.yaml

You need to convert the main pm8941 binding first if not done already 
and then reference this binding from it.

And let's have 1 complete example instead of fragments.

> 
> diff --git a/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.txt b/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.txt
> deleted file mode 100644
> index 34ab576..0000000
> --- a/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.txt
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -Qualcomm PM8941 PMIC Power Key
> -
> -PROPERTIES
> -
> -- compatible:
> -	Usage: required
> -	Value type: <string>
> -	Definition: must be one of:
> -		    "qcom,pm8941-pwrkey"
> -		    "qcom,pm8941-resin"
> -
> -- reg:
> -	Usage: required
> -	Value type: <prop-encoded-array>
> -	Definition: base address of registers for block
> -
> -- interrupts:
> -	Usage: required
> -	Value type: <prop-encoded-array>
> -	Definition: key change interrupt; The format of the specifier is
> -		    defined by the binding document describing the node's
> -		    interrupt parent.
> -
> -- debounce:
> -	Usage: optional
> -	Value type: <u32>
> -	Definition: time in microseconds that key must be pressed or released
> -		    for state change interrupt to trigger.
> -
> -- bias-pull-up:
> -	Usage: optional
> -	Value type: <empty>
> -	Definition: presence of this property indicates that the KPDPWR_N pin
> -		    should be configured for pull up.
> -
> -- linux,code:
> -	Usage: optional
> -	Value type: <u32>
> -	Definition: The input key-code associated with the power key.
> -		    Use the linux event codes defined in
> -		    include/dt-bindings/input/linux-event-codes.h
> -		    When property is omitted KEY_POWER is assumed.
> -
> -EXAMPLE
> -
> -	pwrkey@800 {
> -		compatible = "qcom,pm8941-pwrkey";
> -		reg = <0x800>;
> -		interrupts = <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
> -		debounce = <15625>;
> -		bias-pull-up;
> -		linux,code = <KEY_POWER>;
> -	};
> diff --git a/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.yaml b/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.yaml
> new file mode 100644
> index 0000000..302866d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/qcom,pm8941-pwrkey.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm PM8941 PMIC Power Key
> +
> +maintainers:
> + - Courtney Cavin <courtney.cavin@sonymobile.com>
> + - Vinod Koul <vkoul@kernel.org>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,pm8941-pwrkey
> +      - qcom,pm8941-resin
> +
> +  interrupts:
> +    description: |
> +          Key change interrupt; The format of the specifier is
> +          defined by the binding document describing the node's
> +          interrupt parent.
> +
> +  debounce:
> +    description: |
> +          Time in microseconds that key must be pressed or
> +          released for state change interrupt to trigger.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  bias-pull-up:
> +    description: |
> +           Presence of this property indicates that the KPDPWR_N
> +           pin should be configured for pull up.
> +    $ref: /schemas/types.yaml#/definitions/flag
> +
> +  linux,code:
> +    description: |
> +           The input key-code associated with the power key.
> +           Use the linux event codes defined in
> +           include/dt-bindings/input/linux-event-codes.h
> +           When property is omitted KEY_POWER is assumed.
> +    $ref: /schemas/types.yaml#/definitions/uint32

Already has a type definition. Need to reference input.yaml.

> +
> +required:
> + - compatible
> + - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> + - |
> +   #include <dt-bindings/interrupt-controller/irq.h>
> +   #include <dt-bindings/input/linux-event-codes.h>
> +   #include <dt-bindings/spmi/spmi.h>
> +   spmi_bus: spmi@c440000 {
> +     reg = <0x0c440000 0x1100>;
> +     #address-cells = <2>;
> +     #size-cells = <0>;
> +     pmk8350: pmic@0 {
> +       reg = <0x0 SPMI_USID>;
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       pmk8350_pon: pon_hlos@1300 {
> +         reg = <0x1300>;
> +         pwrkey {
> +            compatible = "qcom,pm8941-pwrkey";
> +            interrupts = < 0x0 0x8 0 IRQ_TYPE_EDGE_BOTH >;
> +            debounce = <15625>;
> +            bias-pull-up;
> +            linux,code = <KEY_POWER>;
> +         };
> +       };
> +     };
> +   };
> +...
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
> of Code Aurora Forum, hosted by The Linux Foundation
> 
