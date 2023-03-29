Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94D846CD649
	for <lists+linux-input@lfdr.de>; Wed, 29 Mar 2023 11:23:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbjC2JXO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 29 Mar 2023 05:23:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbjC2JXL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 29 Mar 2023 05:23:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7411A2D41
        for <linux-input@vger.kernel.org>; Wed, 29 Mar 2023 02:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680081744;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lnQgiE2seslOmri+mINL03bE7wmcbXexDhZ7sWwtei8=;
        b=M5X7ocgARlx2Ytiqukww8l0of6zWNVHLFWhU6+lTuCjxCL2w1a3UOUEFyTDBFdxUO6KVBC
        6G7Fy7zjudapcE1dLE7gMFn086eQeTl1/WIM2YzZAY2NftbIJ/rMFjgpO9nb7IRoko8g/Q
        dfU28p3WVR96bJ2i3etSUQQwUm+jbCw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-VogXiDCQP_26diF-g2hNNA-1; Wed, 29 Mar 2023 05:22:21 -0400
X-MC-Unique: VogXiDCQP_26diF-g2hNNA-1
Received: by mail-ed1-f71.google.com with SMTP id k30-20020a50ce5e000000b00500544ebfb1so21322573edj.7
        for <linux-input@vger.kernel.org>; Wed, 29 Mar 2023 02:22:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680081740;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lnQgiE2seslOmri+mINL03bE7wmcbXexDhZ7sWwtei8=;
        b=1Y88bvTB3QXyGFsNy2S+TI6xnZE2hV4MKDt6Vi1LMRNLjUnyVKWiZYOJrBGFvhT5oS
         Y0yAyxFJ586l3EPgx9IKI+whZCZlVjfpUKEfz+k4P5QCYXFAJHbEMdunQPCGeFF9c8S/
         7x8IezdDRRvJSv674cTtc4aqhSibZFfTeDmZfz9tM6PzG6kRRSX79jX31WUnnb/HS3+H
         5gkIPzdIvkT51yj23SrZUbptV6uCr1jnA9aW5j0dt5EIZVKTPAYoIe0G+u7UnzddBAiq
         1rU9yKhC1T3EXBBXJfQdioYNkZPNTLJS6EftaqhuTAwRP9r/QktsFiJpwG/xWGgAJsjI
         mLvQ==
X-Gm-Message-State: AAQBX9enqhvSeMDg5Orf7rekpY1iwfyVHIxlMJAYAiz5QsPyhJLeUvX9
        pP0Ch95cj/vLingIxHvd4Zasll2k6sSL8Z2JJOSNK9WiUsthdvTqYb2yFNI3rLW+C6s0yfq9p1d
        s7VvrcbLtqE1Umqn6vE+ZZFw=
X-Received: by 2002:a17:906:4a55:b0:92f:a0d5:211c with SMTP id a21-20020a1709064a5500b0092fa0d5211cmr16224791ejv.35.1680081740366;
        Wed, 29 Mar 2023 02:22:20 -0700 (PDT)
X-Google-Smtp-Source: AKy350YCg597ErLnj2rX3slo8f8H8UafW8Jx4GKqVYjjTtDQJ7gKBV0XWnScXpjtKQmI/aWyDjN7jA==
X-Received: by 2002:a17:906:4a55:b0:92f:a0d5:211c with SMTP id a21-20020a1709064a5500b0092fa0d5211cmr16224776ejv.35.1680081740129;
        Wed, 29 Mar 2023 02:22:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id c25-20020a50f619000000b004bd6e3ed196sm16970687edn.86.2023.03.29.02.22.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 02:22:19 -0700 (PDT)
Message-ID: <3dec29bf-b772-d82d-fff9-6c8bcca5f464@redhat.com>
Date:   Wed, 29 Mar 2023 11:22:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [REGRESSION] wrong coord from Thinkpad TrackPoint since 6.2
 kernel
To:     Takashi Iwai <tiwai@suse.de>,
        =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     regressions@lists.linux.dev, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <87h6u4otuc.wl-tiwai@suse.de>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <87h6u4otuc.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Takashi,

On 3/29/23 10:16, Takashi Iwai wrote:
> Hi,
> 
> we've received a bug report about Thinkpad TrackPoint (ALPS DualPoint
> Stick) on 6.2 kernel:
>   https://bugzilla.opensuse.org/show_bug.cgi?id=1209805
> 
> The device reports the wrong values as the movements, e.g. sometimes a
> value such as 255, 254 or -255 is returned while usually it should be
> a smaller value like -1 or 2.
> 
> The evtest on 6.2.x kernel shows the wrong values like:
> 
> Event: time 1680037542.898747, type 2 (EV_REL), code 0 (REL_X), value 255
> Event: time 1680037542.898747, -------------- SYN_REPORT ------------
> Event: time 1680037543.145196, type 2 (EV_REL), code 0 (REL_X), value 1
> Event: time 1680037543.145196, -------------- SYN_REPORT ------------
> Event: time 1680037543.175087, type 2 (EV_REL), code 1 (REL_Y), value -255
> Event: time 1680037543.175087, -------------- SYN_REPORT ------------
> Event: time 1680037543.185421, type 2 (EV_REL), code 0 (REL_X), value 1
> Event: time 1680037543.185421, type 2 (EV_REL), code 1 (REL_Y), value -255
> Event: time 1680037543.185421, -------------- SYN_REPORT ------------
> 
> while 6.1.x kernel shows the correct values like:
> 
> Event: time 1680037386.318058, type 2 (EV_REL), code 0 (REL_X), value -1
> Event: time 1680037386.318058, type 2 (EV_REL), code 1 (REL_Y), value -1
> Event: time 1680037386.318058, -------------- SYN_REPORT ------------
> Event: time 1680037386.328087, type 2 (EV_REL), code 0 (REL_X), value -1
> Event: time 1680037386.328087, type 2 (EV_REL), code 1 (REL_Y), value -1
> Event: time 1680037386.328087, -------------- SYN_REPORT ------------
> Event: time 1680037386.338046, type 2 (EV_REL), code 0 (REL_X), value -1
> Event: time 1680037386.338046, type 2 (EV_REL), code 1 (REL_Y), value -2
> Event: time 1680037386.338046, -------------- SYN_REPORT ------------
>   
> I couldn't see any relevant changes in alps.c between those versions,
> so this is likely a breakage in a lower layer.
> 
> Could you guys take a look?

I believe this is caused by the kernel now using -funsigned-char
everywhere and this should be fixed by this commit:

https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/commit/?h=for-linus&id=754ff5060daf5a1cf4474eff9b4edeb6c17ef7ab

And there is a similar issue in the focaltech touchpad driver:

https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/commit/?h=for-linus&id=8980f190947ba29f23110408e712444884b74251

Dmitry, since this is hitting 6.2 users, perhaps you can send
a pull-req for your current for-linus branch to get the fix
on its way to stable ?

Regards,

Hans




