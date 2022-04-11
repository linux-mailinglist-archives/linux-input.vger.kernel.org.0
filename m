Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 184D04FBDBE
	for <lists+linux-input@lfdr.de>; Mon, 11 Apr 2022 15:48:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238863AbiDKNvJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 Apr 2022 09:51:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234271AbiDKNvI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 Apr 2022 09:51:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 04899237E7
        for <linux-input@vger.kernel.org>; Mon, 11 Apr 2022 06:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649684934;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XwXgcei9SbdqAK1dbUbQrW+TYjFRKZ4TDkuvHnbp5AI=;
        b=SwuuvZ+yMfqjAMZvOskzSIzCN4wur48JM7I/CzwbQuyKIGGhAjhmcJuB7EnAorNF8B/W1T
        klKcZmclaLKXk34uNXUgE5VaU9SBEydrasE+QhNzAA3dzAaAnlIQVGDlK3pXZeBc/M8DPY
        r3h3oIyOZVO6BGpVhNwdV1pjrYlwAy8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-oxqRr2FnN_iVpex1NFSgSQ-1; Mon, 11 Apr 2022 09:48:51 -0400
X-MC-Unique: oxqRr2FnN_iVpex1NFSgSQ-1
Received: by mail-ej1-f71.google.com with SMTP id hs13-20020a1709073e8d00b006e892eb3e79so1007255ejc.11
        for <linux-input@vger.kernel.org>; Mon, 11 Apr 2022 06:48:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XwXgcei9SbdqAK1dbUbQrW+TYjFRKZ4TDkuvHnbp5AI=;
        b=Zm0t1nA8wC/Yf0VU8MZkyRRZ8OnwMEVfhX/gqCD4JKxJIlxjhPo7tXfo6jojIS2uK0
         07xaDKwUquSrSlQlcg91IU/A4gE8zWy1peH9BlBx7yXwNq8KfRqH0TO4NctSltCWQv7V
         IiLAiORBEm7lJm20DoH+VHN/sIzdAkrXiDgEEBxozMISZ5iQbrj49HMhbi+nZDluKFVO
         rILn7NyW0yt1La96TRcW2Q6Si9bmbxZuZjCVyK72G7CFco6ndRu1X80MnVZZEvkDMtS2
         WZjRMe5Rdt3gxEDAA2xCW6VwNLMXmlcxjswiNsmG6LQ45U4VJNKDJevo3IRjH+ZwPQ0O
         lBig==
X-Gm-Message-State: AOAM532/k3H1RFo6tqin3qqWNtAoi2+bUO+oqPaaCjPovpXG+w/4kaqH
        KUoN5Yc6wNrAIlWt/C2xX5fEDw4LC/TsEtlKrK35STKYTJk3Ff3gl3rok/H77ZfsyPDup1MM5Ep
        cxrTYVkNXQr51N3mBPRP+oWg=
X-Received: by 2002:a17:906:58ce:b0:6e7:f925:fc5c with SMTP id e14-20020a17090658ce00b006e7f925fc5cmr29642775ejs.674.1649684929859;
        Mon, 11 Apr 2022 06:48:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWVMFikn0DsIQxRluVQYBpJednk+TaobeFhn4YZEg8e/fO5DYAs9ZOgztGoA1ouS8tMaeNpA==
X-Received: by 2002:a17:906:58ce:b0:6e7:f925:fc5c with SMTP id e14-20020a17090658ce00b006e7f925fc5cmr29642754ejs.674.1649684929654;
        Mon, 11 Apr 2022 06:48:49 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id z5-20020a1709063a0500b006da8fa9526esm12088339eje.178.2022.04.11.06.48.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 06:48:49 -0700 (PDT)
Message-ID: <efb7e4bd-a758-3d70-6967-78fa176055e5@redhat.com>
Date:   Mon, 11 Apr 2022 15:48:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [External] Re: Dell laptop touchpad disabling?
Content-Language: en-US
To:     Mark Pearson <markpearson@lenovo.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Dell.Client.Kernel@dell.com
Cc:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
        Stuart Hayes <stuart.w.hayes@gmail.com>,
        Divya Bharathi <divya.bharathi@dell.com>,
        Prasanth Ksr <prasanth.ksr@dell.com>,
        Perry Yuan <Perry.Yuan@dell.com>
References: <b9d9171d-1287-e5aa-46d2-2475817074ba@infradead.org>
 <d1192588-8993-5052-6018-7a2f8393cff9@redhat.com>
 <225c5a10-59a8-d33e-abac-5fbb4341a6eb@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <225c5a10-59a8-d33e-abac-5fbb4341a6eb@lenovo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Mark,

On 3/21/22 23:18, Mark Pearson wrote:
> 
> Apologies if this is thread hijacking...but I've got a similarish
> problem on Lenovo laptops that we have on the todo list to investigate
> so wanted to jump in with a somewhat related question...

No problem.

> On 3/18/22 04:54, Hans de Goede wrote:
>>
>> Regardless of the method, the kernel's responsibility here is
>> to make sure the touchpad gets seen as a touchpad and after that
>> "disabling" it is a userspace problem.
>>
> 
> The issue on our platforms is that if you disable the touchpad in the
> BIOS it doesn't actually disable the touchpad. It sets a flag in the EC
> registers to let the OS know the touchpad is not supposed to be enabled
> (I only just found out this is how it is supposed to work).

Interesting.

> I'm not 100% sure the reasons for this - I think it's to do with keeping
> the trackpoint usable (maybe).

Yes that makes sense the trackpoint often sends its data to the touchpad
which then muxes the trackpoint data into its own datastream as special
trackpoint packets. So disabling the touchpad at the hw level would also
disable the trackpoint in these kinda setups.

> So just curious on the comment above - is there a standard way to let
> user space know to ignore the touchpad or disable it by default?

Not yet, but we could define one. Or we could even try to see if
a patch to drop all non trackpoint data inside the kernel when the
flag is set would be accepted.

Someone needs to write the code for this though and if we want to let
userspace know also define a userspace API. I think the all kernel
solution might be the easiest to implement, but I'm not sure if this
will be accepted by the input subsystem maintainer.

> I'm obviously being lazy here as I've been meaning to go and read code
> but I was flicking thru the mailing list and this caught my eye....and
> if there's a shortcut to the answer that would be awesome.
> 
> I've no idea if this is a Lenovo specific issue or more generic - but
> this thread made me wonder if it's actually a common/standard problem?

This is the first time I have heard about this.

Regards,

Hans

