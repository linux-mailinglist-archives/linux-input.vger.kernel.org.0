Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 833A14340EB
	for <lists+linux-input@lfdr.de>; Tue, 19 Oct 2021 23:56:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbhJSV7F (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Oct 2021 17:59:05 -0400
Received: from ixit.cz ([94.230.151.217]:53922 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229533AbhJSV7F (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Oct 2021 17:59:05 -0400
Received: from [192.168.1.138] (ip-89-176-96-70.net.upcbroadband.cz [89.176.96.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id ED36120064;
        Tue, 19 Oct 2021 23:56:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1634680609;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=8lgaP/2ATFYQDlin31nRcPdjbmSoyrqFu6rAKvUIvhc=;
        b=jcAsRx8W2uWaRB6tRkAVtfkXCSBiDjl/b5vOEWYrA1welst6/mjCh1xUjlbZXePuYLl4G3
        uQoLt0QY1ZWx48SR0s75wcZnDuuUXk+3MkO4PEhX1OtVcCwatlkz0xq/8Pvf1ZbJltsU39
        8++Vgwqv7wLy1naDzNKF4QCURX0X638=
Date:   Tue, 19 Oct 2021 23:55:15 +0200
From:   David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH] dt-bindings: input: mcs-touchkey: Convert txt bindings to
 yaml
To:     Rob Herring <robh@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~okias/devicetree@lists.sr.ht
Message-Id: <3KV81R.UYQXZR91DTP82@ixit.cz>
In-Reply-To: <YW89FX52NQNBzQ/2@robh.at.kernel.org>
References: <20211009104837.46626-1-david@ixit.cz>
        <YW89FX52NQNBzQ/2@robh.at.kernel.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Oh, this one is still in grate tree (extra besides extra Tegra 
patches). Please ignore, mcs will be send already converted to yaml.
Best regards
David Heidelberg

On Tue, Oct 19 2021 at 16:48:05 -0500, Rob Herring <robh@kernel.org> 
wrote:
> On Sat, Oct 09, 2021 at 12:48:37PM +0200, David Heidelberg wrote:
>>  Convert MELFAS MCS-5000 touchscreen controller chip documentation 
>> to the YAML format.
>> 
>>  Signed-off-by: David Heidelberg <david@ixit.cz>
>>  ---
>>   .../bindings/input/mcs-touchkey.txt           | 26 ---------
>>   .../bindings/input/mcs-touchkey.yaml          | 53 
>> +++++++++++++++++++
>>   2 files changed, 53 insertions(+), 26 deletions(-)
>>   delete mode 100644 
>> Documentation/devicetree/bindings/input/mcs-touchkey.txt
> 
> I don't have this file in my tree.
> 
>>   create mode 100644 
>> Documentation/devicetree/bindings/input/mcs-touchkey.yaml
>> 
>>  diff --git 
>> a/Documentation/devicetree/bindings/input/mcs-touchkey.txt 
>> b/Documentation/devicetree/bindings/input/mcs-touchkey.txt
>>  deleted file mode 100644
>>  index 545454112a43..000000000000
>>  --- a/Documentation/devicetree/bindings/input/mcs-touchkey.txt
>>  +++ /dev/null
>>  @@ -1,26 +0,0 @@
>>  -* mcs_touchkey MELFAS MCS5000/5080 controller
>>  -
>>  -Required properties:
>>  -- compatible: must be "mcs5000_touchkey" or "mcs5080_touchkey"
>>  -- reg : I2C address of the chip
>>  -- interrupts: interrupt to which the chop is connected
>>  -- key_maxval: size of keycode table
>>  -- interrupts: interrupt to which the chip is connected
>>  -- code: key code for this device
>>  -
>>  -Example:
>>  -
>>  -	i2c_touch_key: i2c-gpio-0 {
>>  -	       /* ... */
>>  -
>>  -	       touch_key@20 {
>>  -		       compatible = "mcs5080_touchkey";
>>  -		       reg = <0x20>;
>>  -		       interrupt-patrent = <gpj0>;
>>  -		       key_maxval = <2>;
>>  -		       linux, code = <0x0000009e
>>  -			              0x000000a9>;
>>  -	       };
>>  -
>>  -	       /* ... */
>>  -	};
>>  diff --git 
>> a/Documentation/devicetree/bindings/input/mcs-touchkey.yaml 
>> b/Documentation/devicetree/bindings/input/mcs-touchkey.yaml
>>  new file mode 100644
>>  index 000000000000..b56de0361ff8
>>  --- /dev/null
>>  +++ b/Documentation/devicetree/bindings/input/mcs-touchkey.yaml
>>  @@ -0,0 +1,53 @@
>>  +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>  +%YAML 1.2
>>  +---
>>  +$id: http://devicetree.org/schemas/input/mcs-touchkey.yaml#
>>  +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>  +
>>  +title: MELFAS MCS5000/5080 controller
>>  +
>>  +maintainers:
>>  +  - Rob Herring <robh+dt@kernel.org>
>>  +
>>  +properties:
>>  +  compatible:
>>  +    enum:
>>  +      - mcs5000_touchkey
>>  +      - mcs5080_touchkey
>>  +
>>  +  reg: true
>>  +  interrupts: true
>>  +  key_maxval:
>>  +    $ref: /schemas/types.yaml#/definitions/uint32
>>  +    description: size of keycode table
>>  +
>>  +  linux,code:
>>  +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>  +    description: key code for this device
>>  +
>>  +required:
>>  +  - compatible
>>  +  - reg
>>  +  - interrupts
>>  +  - linux,code
>>  +
>>  +additionalProperties: false
>>  +
>>  +examples:
>>  +  - |
>>  +    #include <dt-bindings/gpio/tegra-gpio.h>
>>  +    #include <dt-bindings/interrupt-controller/irq.h>
>>  +
>>  +    i2c_touch_key: i2c-gpio-0 {
>>  +      #address-cells = <1>;
>>  +      #size-cells = <0>;
>>  +
>>  +      melfas-touchkey@20 {
>>  +        compatible = "mcs5080_touchkey";
>>  +        reg = <0x20>;
>>  +        interrupt-parent = <&gpio>;
>>  +        interrupts = <TEGRA_GPIO(Q, 4) IRQ_TYPE_EDGE_FALLING>;
>>  +        key_maxval = <4>;
>>  +        linux,code = <139 102 158 217>;
>>  +      };
>>  +    };
>>  --
>>  2.33.0
>> 
>> 


