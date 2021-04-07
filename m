Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7EEB3574D9
	for <lists+linux-input@lfdr.de>; Wed,  7 Apr 2021 21:17:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355579AbhDGTSD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Apr 2021 15:18:03 -0400
Received: from smtpcmd03117.aruba.it ([62.149.158.117]:49509 "EHLO
        smtpcmd03117.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355580AbhDGTSD (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 7 Apr 2021 15:18:03 -0400
Received: from [192.168.126.129] ([146.241.148.6])
        by Aruba Outgoing Smtp  with ESMTPSA
        id UDgSlX9krzPKKUDgSlOEjJ; Wed, 07 Apr 2021 21:17:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1617823072; bh=g1ZU7/QfSEL7GwtNgIszBvBNRhtW8mmb/cDtmv5oxaM=;
        h=Subject:To:From:Date:MIME-Version:Content-Type;
        b=jszFCxo+55pIQWhCUL3SIDzNAn/2earTpsS7/2ImFOMkGIaod9Vw5emY15YMugtY3
         vX9HwBsDZdAO3FBqom6FsqUu9ik40bAJPRyNgus08By1uXqNslmBP97DNF6P+a7Z3v
         hK/ylGp5v1GEjLqEGwvKljKBBpVes9m1jrSJT2oF8EnctrJTLNrToI61TcPOxjyZ2w
         RDs1xaso+JRZ4vJsWO/uPhvLHp8Yr67WVx4IGkRRMJzacKMDVrtQV7vEGBIOlG3gPB
         X+JTuTAcXJLlRogkmSpzUKF4l4NsRnMz9jrEhnSjHRgqXc/mNg3gPgNtITlMLI8sug
         Qo/RmNVQAya2Q==
Subject: Re: [PATCH v3 2/3] dt-bindings: touchscreen: Add HY46XX bindings
To:     Rob Herring <robh@kernel.org>
Cc:     Linux Input <linux-input@vger.kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.ne@posteo.net>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <YGbc7Qbu6s659Mx4@latitude>
 <20210402161627.2546145-1-giulio.benetti@benettiengineering.com>
 <20210402161627.2546145-3-giulio.benetti@benettiengineering.com>
 <1617715445.154812.1674495.nullmailer@robh.at.kernel.org>
 <937f75d4-6c2e-d476-f272-39f8ed2826f2@benettiengineering.com>
 <CAL_JsqL2QdSmYbcowgsPz2XXQt1W0KfkzqkNROafAsMNXx7m4w@mail.gmail.com>
From:   Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <a19cb8f9-e339-5a82-ff80-205b272b9439@benettiengineering.com>
Date:   Wed, 7 Apr 2021 21:17:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAL_JsqL2QdSmYbcowgsPz2XXQt1W0KfkzqkNROafAsMNXx7m4w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfI3s0M2P04CCCaIod15ubYiELy1jERGqnMMvAjpZbE0F3M2V5/C+K6fEtpdL7yzjj7RRPx+2DiUtb+0y6AKzKKDpL3Br7siR7yhKQ6jkmYqnp3KJhWcd
 rhkhJ4xLHD4PdisT5KfAsm14XyiJGFtnSdzyMB6tlrEjSEOY/ERM6qhbHbWu0Mk+hvJEfvzJKH6+y47zwwdcl87+YYmts72cAG2nYBfhch1pBlDgb9PHiy53
 0+sHPUXZh3ozwCJbu1zcwHs07wLT5v/wlFAxHpws2N5ueDobWoqyousqjizPHRFaSVtM/GAo5Bm6AwL8RhPJATjO9Y5/fVRrXh85F0230bhlzpujPIiWrFU8
 8suwkhmIVk1CiwQkIPTe4Uf0GBC7uxz7wTqPthc9DoUMtR+UosYcUyz2lzsdrYh++EGVyWyz
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 4/7/21 8:56 PM, Rob Herring wrote:
> On Wed, Apr 7, 2021 at 12:57 PM Giulio Benetti
> <giulio.benetti@benettiengineering.com> wrote:
>>
>> Hello Rob, All,
>>
>> On 4/6/21 3:24 PM, Rob Herring wrote:
>>> On Fri, 02 Apr 2021 18:16:26 +0200, Giulio Benetti wrote:
>>>> This adds device tree bindings for the Hycon HY46XX touchscreen series.
>>>>
>>>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>>>> ---
>>>> V1->V2:
>>>> As suggested by Rob Herring:
>>>> * fixed $id: address
>>>> * added "hycon," in front of every custom property
>>>> * changed all possible property to boolean type
>>>> * removed proximity-sensor-switch property since it's not handled in driver
>>>> V2->V3:
>>>> As suggested by Jonathan Neuschäfer:
>>>> * fixed some typo
>>>> * fixed description indentation
>>>> * improved boolean properties descriptions
>>>> * improved hycon,report-speed description
>>>> ---
>>>>    .../input/touchscreen/hycon,hy46xx.yaml       | 120 ++++++++++++++++++
>>>>    MAINTAINERS                                   |   6 +
>>>>    2 files changed, 126 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml
>>>>
>>>
>>> My bot found errors running 'make dt_binding_check' on your patch:
>>>
>>> yamllint warnings/errors:
>>>
>>> dtschema/dtc warnings/errors:
>>> Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.example.dt.yaml:0:0: /example-0/i2c/hycon-hy4633@1c: failed to match any schema with compatible: ['hycon,hy4633']
>>>
>>> See https://patchwork.ozlabs.org/patch/1461797
>>>
>>> This check can fail if there are any dependencies. The base for a patch
>>> series is generally the most recent rc1.
>>>
>>> If you already ran 'make dt_binding_check' and didn't see the above
>>> error(s), then make sure 'yamllint' is installed and dt-schema is up to
>>> date:
>>
>> I've just send corrected patches.
>>
>> Anyway I'd like to understand how to make dt_binding_check works correctly.
>>
>> I've installed yamllint and 'make dt_binding_check' works but it still
>> doesn't show that error up on compatible string.
>>
>> yamllint I have is version 1.20.0
>>
>>> pip3 install dtschema --upgrade
>>
>> I've already tried with that too and dtschema version is:
>> 1.3.8
> 
> Huh? dtschema versions are YYYY.MM.

Sorry, it is 2021.3

>> I've read that dtc must be compiled with YAML output enabled and it
>> seems to be so, since when I issue 'make dt_binding_check' from my file:
>> hycon,hy46xx.yaml(with compatible string wrong "hycon,hy4633")
> 
> It's a new check queued for 5.13 in linux-next. See commit
> c59773d204cc ("kbuild: Enable DT undocumented compatible checks").
> 
> I've updated the bot email with this, but after I sent this one.

Ah ok, thank you, I'll apply it in my Repos.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
