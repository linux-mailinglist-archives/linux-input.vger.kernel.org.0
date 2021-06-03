Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C0E4399B59
	for <lists+linux-input@lfdr.de>; Thu,  3 Jun 2021 09:16:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbhFCHSd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Jun 2021 03:18:33 -0400
Received: from smtp.220.in.ua ([89.184.67.205]:50905 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229567AbhFCHSd (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 3 Jun 2021 03:18:33 -0400
Received: from [192.168.202.100] (unknown [95.67.115.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp.220.in.ua (Postfix) with ESMTPSA id 55B991A207C9;
        Thu,  3 Jun 2021 10:16:47 +0300 (EEST)
To:     Rob Herring <robh@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jeff LaBundy <jeff@labundy.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org,
        Device Tree mailing list <devicetree@vger.kernel.org>,
        Jiri Kosina <jikos@jikos.cz>,
        Patchwork Bot <patchwork-bot@kernel.org>
References: <20210602190504.23076-1-oleg@kaa.org.ua>
 <20210602190504.23076-2-oleg@kaa.org.ua>
From:   Oleh Kravchenko <oleg@kaa.org.ua>
Subject: Re: [PATCH 2/2 v2] dt-bindings: Add vendor prefix and bindings for
 Qwiic Joystick
Message-ID: <ce085b5f-3831-60e1-4859-205ecaf081c1@kaa.org.ua>
Date:   Thu, 3 Jun 2021 10:16:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210602190504.23076-2-oleg@kaa.org.ua>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Dmitry, Jeff, Rob,

Thank you for reviewing the previous patch.
I've fixed all your comments and split the patch into two.

Could you please review these too?

02.06.21 22:05, Oleh Kravchenko пише:
> Add vendor prefix for SparkFun Electronics.
> Update trivial-devices.yaml with SparkFun Qwiic Joystick description.
> 
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Cc: Device Tree mailing list <devicetree@vger.kernel.org>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Jiri Kosina <jikos@jikos.cz>
> Cc: Patchwork Bot <patchwork-bot@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
> ---
> 
> Changes:
> - Separate patch for device tree bindings.
> 
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index a327130d1faa..706aa102d96d 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -261,6 +261,8 @@ properties:
>              # Socionext SynQuacer TPM MMIO module
>            - socionext,synquacer-tpm-mmio
>              # i2c serial eeprom  (24cxx)
> +          - sparkfun,qwiic-joystick
> +            # SparkFun Qwiic Joystick (COM-15168) with i2c interface
>            - st,24c256
>              # Ambient Light Sensor with SMBUS/Two Wire Serial Interface
>            - taos,tsl2550
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 944b02bb96d7..a5631e68f5d1 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1060,6 +1060,8 @@ patternProperties:
>      description: Sony Corporation
>    "^spansion,.*":
>      description: Spansion Inc.
> +  "^sparkfun,.*":
> +    description: SparkFun Electronics
>    "^sprd,.*":
>      description: Spreadtrum Communications Inc.
>    "^sst,.*":
> 

-- 
Best regards,
Oleh Kravchenko

