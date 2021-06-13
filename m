Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F97D3A5733
	for <lists+linux-input@lfdr.de>; Sun, 13 Jun 2021 11:04:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231277AbhFMJGc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 13 Jun 2021 05:06:32 -0400
Received: from smtp.220.in.ua ([89.184.67.205]:34672 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231190AbhFMJGb (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 13 Jun 2021 05:06:31 -0400
Received: from [192.168.202.100] (unknown [95.67.115.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp.220.in.ua (Postfix) with ESMTPSA id 5E0BB1A20579;
        Sun, 13 Jun 2021 12:04:28 +0300 (EEST)
Subject: Re: [PATCH 1/2 v4] dt-bindings: Add vendor prefix and bindings for
 Qwiic Joystick
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Device Tree mailing list <devicetree@vger.kernel.org>,
        Jiri Kosina <jikos@jikos.cz>,
        Patchwork Bot <patchwork-bot@kernel.org>,
        Rob Herring <robh@kernel.org>, linux-input@vger.kernel.org
References: <20210608223130.16830-1-oleg@kaa.org.ua>
From:   Oleh Kravchenko <oleg@kaa.org.ua>
Message-ID: <a858b48f-10fa-93bc-8c28-ecc049da2f4a@kaa.org.ua>
Date:   Sun, 13 Jun 2021 12:04:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210608223130.16830-1-oleg@kaa.org.ua>
Content-Type: text/plain; charset=utf-8
Content-Language: uk-UA
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Dmitry,
Could you please review these patches?

09.06.21 01:31, Oleh Kravchenko пише:
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
> Changes for v4:
> - no updates.
> 
> Changes for v3:
> - update patch after code review.
> 
> Changes for v2:
> - update code after code review
> 
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
