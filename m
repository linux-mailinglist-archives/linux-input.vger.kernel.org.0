Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C3BECBC40
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2019 15:51:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388555AbfJDNvw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Oct 2019 09:51:52 -0400
Received: from uho.ysoft.cz ([81.19.3.130]:58924 "EHLO uho.ysoft.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388527AbfJDNvv (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 4 Oct 2019 09:51:51 -0400
Received: from [10.1.8.111] (unknown [10.1.8.111])
        by uho.ysoft.cz (Postfix) with ESMTP id 1F775A02FD;
        Fri,  4 Oct 2019 15:51:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
        s=20160406-ysoft-com; t=1570197110;
        bh=v+Skf2DapS8gY8qosfuN3o9WJU5shyGrXrBCKaDK0vY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=E4sF5Yvq/VmzPE14VqwshCH3XEKCjgeSRwwX/EJDSASA6cd8JOCJD8GlsALVf0o5M
         eNpWwJxdqYkol/5I75a/EBthQGPpJTc8DtII4uAdjXFdxuJNjOlsmKhYDjoYlyEVlt
         EgHf/3V9fKKSNKc2baD/zfwJzp4B88/p9fGKj5GM=
Subject: Re: [PATCH v2 2/5] dt-bindings: input: Convert mpr121 binding to
 json-schema
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Linux Input <linux-input@vger.kernel.org>,
        devicetree@vger.kernel.org
References: <1569940180-11417-1-git-send-email-michal.vokac@ysoft.com>
 <1569940180-11417-3-git-send-email-michal.vokac@ysoft.com>
 <CAL_Jsq+DTyVKn4je=_kARoo43wr_fhyxXUEZWEDhHDZ2pDiqPQ@mail.gmail.com>
 <44000610-75bb-7243-8ca3-411832745817@ysoft.com>
 <CAL_JsqLAYpRvXLYaMonr=jVkX2-Lq9fWzJQrzFfn6q4MO8M8dA@mail.gmail.com>
From:   =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
Message-ID: <5de4cdb9-7d05-4d3e-ab0f-51e1a16f91e9@ysoft.com>
Date:   Fri, 4 Oct 2019 15:51:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLAYpRvXLYaMonr=jVkX2-Lq9fWzJQrzFfn6q4MO8M8dA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 04. 10. 19 15:32, Rob Herring wrote:
> On Fri, Oct 4, 2019 at 2:40 AM Michal Vokáč <michal.vokac@ysoft.com> wrote:
>>
>> On 03. 10. 19 21:09, Rob Herring wrote:
>>> On Tue, Oct 1, 2019 at 9:29 AM Michal Vokáč <michal.vokac@ysoft.com> wrote:
>>>>
>>>> Convert the mpr121 binding to DT schema format using json-schema.
>>>>
>>>> Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
>>>> ---
>>>> Changes since v1:
>>>>    - Extract the common input properties into the input.yaml schema.
>>>>    - Fix the wakeup-source description.
>>>>    - Fix the example to pass validation. Put the mpr121 device sub-node
>>>>      into a i2c {} node.
>>>>
>>>> Rob, the linux,keycodes property is not valid as it is.
>>>> If I put the minItems and maxItems into the common schema, it is valid
>>>> and the min/max length check works fine. What could be wrong?
>>>>
>>>> The error is not very specific..
>>>
>>> That's a side effect of an 'allOf' somewhere in the meta-schema.
>>>
>>>> $ make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
>>>>     SCHEMA  Documentation/devicetree/bindings/processed-schema.yaml
>>>> /home/vokac/development/sources/linux-fslc/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml: ignoring, error in schema 'linux,keycodes'
>>>> warning: no schema found in file: /home/vokac/development/sources/linux-fslc/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
>>>> /home/vokac/development/sources/linux-fslc/Documentation/devicetree/bindings/Makefile:33: recipe for target 'Documentation/devicetree/bindings/processed-schema.yaml' failed
>>>> make[3]: *** [Documentation/devicetree/bindings/processed-schema.yaml] Error 255
>>>> /home/vokac/development/sources/linux-fslc/Makefile:1264: recipe for target 'dt_binding_check' failed
>>>
>>> I'm working on a fix for this. It's a problem in the meta-schema.
>>
>> OK, thanks a lot!
> 
> I've committed an update to the meta-schema. Please update dtschema
> and it should work for you.

Works fine now, thank you!
Michal
