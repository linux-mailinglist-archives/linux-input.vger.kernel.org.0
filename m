Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95190CBC68
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2019 15:58:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388727AbfJDN6b (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Oct 2019 09:58:31 -0400
Received: from uho.ysoft.cz ([81.19.3.130]:59932 "EHLO uho.ysoft.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387917AbfJDN6b (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 4 Oct 2019 09:58:31 -0400
Received: from [10.1.8.111] (unknown [10.1.8.111])
        by uho.ysoft.cz (Postfix) with ESMTP id 63D45A0686;
        Fri,  4 Oct 2019 15:58:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
        s=20160406-ysoft-com; t=1570197509;
        bh=NSu3S7p7MTW9O2H76RCxpJdcvr7LUAIJMkQnS5/xml4=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=fti2dKfYTbuOBXHfAzKAgnKunm/Wuw3HU4I2SukF9H0pYYUxCAl/EjO5hi9eNu566
         XNyiYoO5ZO4eL4MG2wXnilnD0TVRSk2S1YIvhXDsQXUJC9rZZorof+rDEc2oT5K8jz
         FU0M9ayJMIlMzwG52g5PdTnGok8BCQ4jfyRbNVnk=
Subject: Re: [PATCH v3 2/5] dt-bindings: input: Convert mpr121 binding to
 json-schema
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
References: <1570083176-8231-1-git-send-email-michal.vokac@ysoft.com>
 <1570083176-8231-3-git-send-email-michal.vokac@ysoft.com>
From:   =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
Message-ID: <290d4ca9-5e56-5a2b-56d2-15b8ee7f4831@ysoft.com>
Date:   Fri, 4 Oct 2019 15:58:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1570083176-8231-3-git-send-email-michal.vokac@ysoft.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 03. 10. 19 8:12, Michal Vokáč wrote:
> Convert the mpr121 binding to DT schema format using json-schema.
> 
> Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
> ---
> Changes since v2:
>   - None
> 
> Changes since v1:
>   - Extract the common input properties into the input.yaml schema.
>   - Fix the wakeup-source description.
>   - Fix the example to pass validation. Put the mpr121 device sub-node
>     into a i2c {} node.
> 
> The linux,keycodes property is not valid as it is. If I put the minItems
> and maxItems into the common schema, it is valid and the min/max length
> check works fine. Rob, could you advice how to fix this please?

This error is no longer present - it is fixed in the latest version of
meta-schema. Thank you, Rob!

> The error is not very specific..
> 
> $ make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
>    SCHEMA  Documentation/devicetree/bindings/processed-schema.yaml
> /home/vokac/development/sources/linux-fslc/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml: ignoring, error in schema 'linux,ke
> warning: no schema found in file: /home/vokac/development/sources/linux-fslc/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
> /home/vokac/development/sources/linux-fslc/Documentation/devicetree/bindings/Makefile:33: recipe for target 'Documentation/devicetree/bindings/p
> make[3]: *** [Documentation/devicetree/bindings/processed-schema.yaml] Error 255
> /home/vokac/development/sources/linux-fslc/Makefile:1264: recipe for target 'dt_binding_check' failed

