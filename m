Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12A547CD904
	for <lists+linux-input@lfdr.de>; Wed, 18 Oct 2023 12:19:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbjJRKT5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Oct 2023 06:19:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230431AbjJRKT4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Oct 2023 06:19:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C9C7B0
        for <linux-input@vger.kernel.org>; Wed, 18 Oct 2023 03:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697624352;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kfpQdjH9sMarO2JewHOoNX3NAWXiYLoPZiJ8dkipcwE=;
        b=fZPUm3VCRQFn+rEV1Q223GqVTacnmWqWTjx6DrPDjfM5sqlfoudopdfouxQJ8lkMYt+LCP
        LOMrsUPRTX5f2b8so8ZuRPpAJi6+GUfZsCHKth+Za5Lr2apWNywBDxH9jqfJCifowsihwX
        2JOJfKX9P1/D3TPE1FVQ4otMKp2EA8I=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-572-URwu5nybMwyLayQDPkOGcg-1; Wed, 18 Oct 2023 06:19:06 -0400
X-MC-Unique: URwu5nybMwyLayQDPkOGcg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9b2e030e4caso827143366b.1
        for <linux-input@vger.kernel.org>; Wed, 18 Oct 2023 03:19:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697624345; x=1698229145;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kfpQdjH9sMarO2JewHOoNX3NAWXiYLoPZiJ8dkipcwE=;
        b=sFR4MPDTsRglLRwgcfSSJwn8r+cIUfIf/zIFSZKj/BZCvzJBfe1eE0HuvVDw5EEzQz
         uJNghUan7lNRbrkJTo3trAL3kn/uDXQU6jzocwf2BZ7a/Ij4Kl5Pn+sE+0FuRdTb2XgN
         to2lqnBUEIEGcCqwYwvbCuQcKphgxWzWAtedu7Bf1HQzqZ9cTZU61GPui7Z/7sZlBA1I
         rP/VCAjn95H1D7MNvU/tdjl7dEP2y/0NGr4Js9s3SNKdn6RHsYmkyu1Px1ue+qh/D5+M
         JbD+pWJON63tvbbMNb5uiKA21vErBpmkUFvTqkgqaThDJeI9/jb1PAre7tEWh+u53dyH
         BirQ==
X-Gm-Message-State: AOJu0Yx2qaLqGPhtlROjwtQo9waMJLE44nf34FwJz0+gPOaJrtPYrxap
        M4NCp1XQDl1B6a1u34UuQznp+BOvz/T5TnTk7OQZ5E/jsDtclKFVJxxNEKplTDmMuiMYdfBEh5g
        d+w+GcqN2MwRUrcgqflEMJK8=
X-Received: by 2002:a17:907:9348:b0:9a5:7d34:e68a with SMTP id bv8-20020a170907934800b009a57d34e68amr3860497ejc.28.1697624345177;
        Wed, 18 Oct 2023 03:19:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGB+vsCI0deDC22JBvgJKqiP2/dZ+YMKgznZX7ISB2jmNI+NMSa3ZjKEZZ0OTnNC/5zm+9SA==
X-Received: by 2002:a17:907:9348:b0:9a5:7d34:e68a with SMTP id bv8-20020a170907934800b009a57d34e68amr3860485ejc.28.1697624344792;
        Wed, 18 Oct 2023 03:19:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id e10-20020a1709062d4a00b009944e955e19sm1405007eji.30.2023.10.18.03.19.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Oct 2023 03:19:04 -0700 (PDT)
Message-ID: <1d1fcde5-6a0d-d91c-1bab-b2bbd1bfd7ea@redhat.com>
Date:   Wed, 18 Oct 2023 12:19:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/3] Input: atkbd - add skip_commands module parameter
Content-Language: en-US, nl
To:     Shang Ye <yesh25@mail2.sysu.edu.cn>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
References: <886D6167733841AE+20231017135318.11142-1-yesh25@mail2.sysu.edu.cn>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <886D6167733841AE+20231017135318.11142-1-yesh25@mail2.sysu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Shang,

On 10/17/23 15:53, Shang Ye wrote:
> Hi Hans,
> 
> I very much support the inclusion of this patch, because there has been
> a similar keyboard issue on at least 3 (presumably 9) types of Lenovo
> laptops, which may also be avoided by simply skipping the GETID command.
> My patch and a list of the affected laptop types may be found at:
> https://github.com/yescallop/atkbd-nogetid
> 
> In my last patch submission, I have included the issue details:
> https://lore.kernel.org/linux-input/20230530131340.39961-1-yesh25@mail2.sysu.edu.cn/
> 
> There were also two other patch submissions aimed at enabling
> `i8042.dumbkbd` on some HP laptops in order to avoid sending the GETID
> command, which isn't very desirable because it breaks the Caps Lock LED:
> https://lore.kernel.org/linux-input/2iAJTwqZV6lQs26cTb38RNYqxvsink6SRmrZ5h0cBUSuf9NT0tZTsf9fEAbbto2maavHJEOP8GA1evlKa6xjKOsaskDhtJWxjcnrgPigzVo=@gurevit.ch/
> https://lore.kernel.org/linux-input/20210609073333.8425-1-egori@altlinux.org/
> 
> And another patch submisson aimed at fixing the issue generically,
> which, sadly, did not work on my laptop because the GETID command would
> trigger more errornous behaviours on it:
> https://lore.kernel.org/linux-input/20210201160336.16008-1-anton@cpp.in/

Interesting, that might be the issue which is hitting the HP models
which I wrote this series for too.

> I hope that these materials will help people better understand the
> nature of the issue and the urgency to address it.
> 
> Below are some comments on the patch:
> 
>> +MODULE_PARM_DESC(skip_commands, "Bitfield where each bits skips a specific keyboard cmd (0 - 0x3f)");
> 
> "bits" -> "bit"?

Indeed, if we go with this patch-series this should be fixed.

> I think we may also need to document the new module parameter at
> Documentation/admin-guide/kernel-parameters.txt and clarify which bit
> skips which keyboard command.
> 
> Lastly, would you think it is appropriate to include in this patch
> series the quirks for Lenovo laptops on which my patch was tested to
> work? If so, the quirk table entries would be:
> 
> System vendor: "LENOVO"
> Product names: "82G2", "82NC", "82TK"
> Driver data  : ATKBD_SKIP_GETID

Looking at your github and seeing how many models are affected,
I'm thinking that we should maybe just skip the entire keyboard
atkbd_probe() when atkbd->translated is set.

The probe is really only necessary in the untranslated case
to check if there is a mouse there or if there is one of the
(quite old) special ps/2 keyboards there which have some
special handling (search for "id == 0x" to find the special
cases) these special cases are all only hit/valid when
(atkbd->translated == 0) is true, so when atkbd->translated
is true we can just skip the probe and use an assumed id of 0xab00
(already used when i8042.dumbkbd is set) and then immediately bail
from atkbd_probe(). I think this generic solution is a better
approach then any of the previous approaches since it is nice
and KISS and does not rely on any DMI quirks.

Regards,

Hans





> On 2023/10/06 04:15, Hans de Goede wrote:
>> Hi all,
>>
>> While debugging a keyboard issue on some HP laptops adding i8042.dumbkbd
>> helped to avoid the issue. So one of the commands send by atkbd.c seemed
>> to be the culprit.
>>
>> This series a skip_commands option to help debug cases like this by adding
>> a bit-field which allows disabling a subset of the ps2_command()
>> calls the atkbd driver makes.
>>
>> It also replaces the existing atkbd_skip_deactivate flag
>> with the new parameter and adds a DMI quirk for the HP laptops
>> to avoid the keyboard issue there.
>>
>> Regards,
>>
>> Hans
>>
>>
>> Hans de Goede (3):
>>   Input: atkbd - add skip_commands module parameter
>>   Input: atkbd - drop atkbd_skip_deactivate flag
>>   Input: atkbd - set skip_commands = ATKBD_SKIP_GETID for HP laptop
>>     15s-fq* laptops
>>
>>  drivers/input/keyboard/atkbd.c | 88 ++++++++++++++++++++++++++--------
>>  1 file changed, 69 insertions(+), 19 deletions(-)
>>
>> -- 
>> 2.41.0
>>
> 

