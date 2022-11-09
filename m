Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 542DE623051
	for <lists+linux-input@lfdr.de>; Wed,  9 Nov 2022 17:40:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbiKIQjj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Nov 2022 11:39:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229914AbiKIQjI (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 9 Nov 2022 11:39:08 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 495F320BD3
        for <linux-input@vger.kernel.org>; Wed,  9 Nov 2022 08:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668011891;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RakO7xvoptPhAzAI7Z/09/yTP105OR0vezqrM2s9nU0=;
        b=IUarMSbns2SXPaw4nANME3SepWHnKImt3W537SHMuM1x624L+BPVYAk8GZ8VOQTbzrQkjJ
        SwXxsHu14CzEV6OFdzFAQdNIYpxabDZdSMV/A5qVInADnvlTX2Ev+dU71wqg3e8ChoC0RH
        JQitLJ0H8FOVVkcqGSZCAL4M2B/J20Q=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-456-fovjlLfgOlW7PYWfJG_ZMA-1; Wed, 09 Nov 2022 11:38:10 -0500
X-MC-Unique: fovjlLfgOlW7PYWfJG_ZMA-1
Received: by mail-ej1-f72.google.com with SMTP id qk31-20020a1709077f9f00b00791a3e02c80so10794478ejc.21
        for <linux-input@vger.kernel.org>; Wed, 09 Nov 2022 08:38:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RakO7xvoptPhAzAI7Z/09/yTP105OR0vezqrM2s9nU0=;
        b=gnzGaIZhMYLRq0UHM9I2tM71kdNJTNIERhkhIUvr3NnaYfTOqE+HhmP0/KMKpkNo1D
         nFhgURzoHN6jeqF8jL33EBJseURHHcgFJB0+EssPYaQCQA3pkywS6iPtxKHs7fITidGK
         xa114RcDnVNbWj3mr2NVFpLX+ZiljbL0K/yL09M3HtucXTqnEU9T904GLR3SxGLnbjaY
         GmUESOhaqseUbCPoH2NDhVfiEW7wDnjk06HtOKjgq7Q9d7lpY2mk/PE+DfW9+zN0AFOy
         GZHeOVV5dLlYMTLW62l5fGgHxGZsNGP+nbqRir0o40CbVrN2b4dZx4/wdmwrYz2Jug29
         igPQ==
X-Gm-Message-State: ACrzQf0NitALexHXFD04/DRiCxq9P7/Uv9NHLmJcjsXUGYoDerqUKFKf
        2QYUVdW/Dfw5UNZNbk9n6H4elS9P3XFeyXn7MAJYVobfEen//cXQAlHG6mkyd2Qa6ecbYMgsKxP
        3LPXQUeJ3UHkMyVvV4SK/2go=
X-Received: by 2002:a17:907:847:b0:77f:f489:cc25 with SMTP id ww7-20020a170907084700b0077ff489cc25mr56622685ejb.80.1668011888936;
        Wed, 09 Nov 2022 08:38:08 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5rUJmp94nC0ehd7im5gWVdfQAMxqQOJAJcn4XoG/vccxBnrjXGntMKIwJdt4xIFC1qQg+Ngw==
X-Received: by 2002:a17:907:847:b0:77f:f489:cc25 with SMTP id ww7-20020a170907084700b0077ff489cc25mr56622677ejb.80.1668011888742;
        Wed, 09 Nov 2022 08:38:08 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id a16-20020a170906369000b0078d9c2c8250sm6012273ejc.84.2022.11.09.08.38.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Nov 2022 08:38:08 -0800 (PST)
Message-ID: <9e0074f8-4cbf-e390-6680-39fe3649bbc4@redhat.com>
Date:   Wed, 9 Nov 2022 17:38:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 0/7] Add camera access keys, IdeaPad driver
 improvements
Content-Language: en-US, nl
To:     =?UTF-8?Q?Eray_Or=c3=a7unus?= <erayorcunus@gmail.com>,
        ike.pan@canonical.com
Cc:     benjamin.tissoires@redhat.com, dmitry.torokhov@gmail.com,
        jikos@kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, mgross@linux.intel.com,
        platform-driver-x86@vger.kernel.org, pobrn@protonmail.com
References: <20221029120311.11152-1-erayorcunus@gmail.com>
 <0b298830-47cc-bb94-0e73-493e4e9244f7@canonical.com>
 <20221109125820.14879-1-erayorcunus@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221109125820.14879-1-erayorcunus@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Eray,

Sorry for the long silence, I have not done any pdx86 patch review
the last 2 weeks due to personal circumstances.

On 11/9/22 13:58, Eray Orçunus wrote:
> On 11/08/22 06:56, Ike Panhc wrote:
>> On 10/29/22 20:03, Eray Orçunus wrote:
>>> Nowadays many laptops have camera access keys, yet there is no usage codes
>>> mapped to them, even though it's introduced in HUTRR72. Start point of
>>> this patch series was adding it and making IdeaPads send it to userspace.
>>> But later I discovered that camera_power attribute of ideapad-laptop
>>> driver on my IdeaPad 520-15IKB doesn't work, so I can't toggle it with
>>> that. I managed to find a way to check whether an IdeaPad supports
>>> camera_power attribute (which sends VPCCMD_W_CAMERA to EC), don't expose
>>> it to sysfs so userspace will know that it can't toggle camera access via
>>> camera_power, in my case, after receiving KEY_CAMERA_ACCESS_TOGGLE.
>>>
>>> Along the way I discovered that old IdeaPads, like S10-3, may not be able
>>> to toggle their touchpad as a regression of a commit aimed for newer
>>> IdeaPads, so I reverted it.
>>>
>>> Also I noticed that I can get/set the state of my keyboard light,
>>> so one of the patches also adds supports for this kind of keyboard lights,
>>> which I call "partially supported keyboard lights". I expect that commit
>>> to add keyboard light support for 520-15IKB, 330-17ICH, 5 (15) and more.
>>> Currently only tested on 520-15IKB.
>>
>> Thanks. Also test on my ideapad s410 and it looks good.
>>
>> Acked-by: Ike Panhc <ike.pan@canonical.com>
> 
> 
> Thank you :)
> 
> I need some advice since I'm new in here, sadly another patch has been
> merged to ideapad-laptop along the way and currently it's not possible to
> merge patch #7, does that mean I should send v3 of my patch series?

No that is not necessary, I can rework it to apply on top of the other
patch.

But TBH I think we really need to work on a different solution for
the problem with the touchpad issues with ideapad-laptop we cannot
just keep adding touchpad and/or DMI ids because the driver is
breaking touchpad functionality left and right.

I will send out an email after this one to all authors of recent
patches which all do "priv->features.touchpad_ctrl_via_ec = 0"
in some way.

With a request to gather some more info of why exactly this is
necessary and to see if we cannot come up with a more generic fix.

> And whom should I wait for merge, x86 platform drivers maintainers?

I'm the x86 platform drivers maintainer.

I believe it makes sense to merge this series through the
x86 platform drivers git tree.

I need to coordinate the merging of patch 2/7 with wDmitry
(the input subsystem maintainer) I'll send him an email
about this. After that I can likely merge patches 2-6.

For the touchpad patches I would first like to get
a better handle on how to fix things more generic.

Specifically patch 1/7 will cause priv->features.touchpad_ctrl_via_ec
to get set to 1 on more models and since that is causing issues
I don't think that is a good idea (even though the patch does
make sense) and for 7/7 I hope to come up with something
more generic.

If you can run the tests from the touchpad mail soon that
would really help!

Note I do plan to send 7/7 out as a fix for 6.1 if we
run out of time wrt coming up with a recent fix. Getting
at least some fix out the door is also why I already
merged the other patch using the DMI ids.

> I think that is the only subsystem whose maintainers haven't replied yet.

Correct, but I have replied now :)

Regards,

Hans



