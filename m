Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4EE8505B02
	for <lists+linux-input@lfdr.de>; Mon, 18 Apr 2022 17:28:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244983AbiDRPay (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Apr 2022 11:30:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245435AbiDRPai (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Apr 2022 11:30:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 994B856C28
        for <linux-input@vger.kernel.org>; Mon, 18 Apr 2022 07:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1650292743;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6eFN80GX/pK4ealfWSRxLS53tOefGMWydgMQThLixgU=;
        b=RDjRsQ14CdCVB9f/wrNvTzracxO43Pv3CchIEJgymncAa7VzEXpl20xaoa2rVVDHvnSCSp
        KF+etcLEanlObHNlXxnhzVfVOt/9EF7rHCskMMzFq7Ac9WEbb7gtR7IpW40Yvvqu4Q8tjE
        O3aAIVVBo2xFxeDC9ULz+472PluUjuM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-SB7_gU8-NX2pO8RB5rrlPQ-1; Mon, 18 Apr 2022 10:39:02 -0400
X-MC-Unique: SB7_gU8-NX2pO8RB5rrlPQ-1
Received: by mail-ed1-f71.google.com with SMTP id d13-20020a50fb0d000000b00422ef4a8679so4704005edq.17
        for <linux-input@vger.kernel.org>; Mon, 18 Apr 2022 07:39:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6eFN80GX/pK4ealfWSRxLS53tOefGMWydgMQThLixgU=;
        b=Y0MVA6kXjU1PqSQLbYn8+t2rATyHyoh52REBLc3nXofV27NKwy/u4EkxCvoM9k2dAj
         7xI7Vrft1m3SBiZW5E86uNZBBWEUIrBs86VVDy6GXYQ66XRF4uEDv4+quPcqPbXBH97r
         0WMasTVwtPq4F+53xJf/JMAJWLD3Ii1UpnfgY7TQOhaKkL4Z0aLUMvu0ktNRy/x60oRU
         mGCjVh+r1kyNYT6ZCFfeKgOLWfIZlCD1Kxrt8rBZT67gGsl+SVCLW1dAURDmaN906UgB
         CDIONOnCLcH79hNl9neLVzUjwvY6SFlmMr71vtmSTjLg0Cz8yeNxylp4O49ExYKp58K1
         AStQ==
X-Gm-Message-State: AOAM532Tpto6gQnrZ+/ksZHVOgHiBoJcD8wV2nx6dUa9ma7LVrNXGSfV
        imhqBVrtb8XL8UGHztPby+klu+fbszvOK5ttWrzXCZLR83I3aQ5mSQdcT/STuKQqUDkU/7hcFyV
        dX+8myMF/khRwfYIKk7yNeQQ=
X-Received: by 2002:a17:906:7751:b0:6ce:e3c:81a6 with SMTP id o17-20020a170906775100b006ce0e3c81a6mr8888178ejn.278.1650292740665;
        Mon, 18 Apr 2022 07:39:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeqSU/SP+la46mB3kMrIRFOElUVCRZRFHFfBw0ppp9kwuO9yg2b2SQbbcjdJFIit+C7p/ENw==
X-Received: by 2002:a17:906:7751:b0:6ce:e3c:81a6 with SMTP id o17-20020a170906775100b006ce0e3c81a6mr8888167ejn.278.1650292740508;
        Mon, 18 Apr 2022 07:39:00 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id y13-20020a50eb8d000000b0041f112a63c4sm7152871edr.52.2022.04.18.07.38.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Apr 2022 07:38:59 -0700 (PDT)
Message-ID: <35f5a3cf-879a-e5e3-437c-acb17ecdc68f@redhat.com>
Date:   Mon, 18 Apr 2022 16:38:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] fix Touchscreen X Axis inversion on Trekstor Surftab W1
Content-Language: en-US
To:     Julian Schulte <schu.ju@gmx.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210626065417.8818-1-schu.ju@gmx.net>
 <Ylx3vduFGFlCEY0F@google.com> <Ylx4n/hqBhD+PAxX@google.com>
 <CAABSQwE-NJwGrKw-6K3TYRKCZ8vgjGink-8OghCxEgQoRAbXOw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAABSQwE-NJwGrKw-6K3TYRKCZ8vgjGink-8OghCxEgQoRAbXOw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry, Julian,

On 4/18/22 11:41, Julian Schulte wrote:
> Hi, 
> I think this is already solved by another patch. At least I tested in the meantime and the bug was not present anymore. 

Correct, this was fixed by this patch:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a274cd66bc6461b45a450cd3f5653473a9aaea75

Regards,

Hans


> Dmitry Torokhov <dmitry.torokhov@gmail.com <mailto:dmitry.torokhov@gmail.com>> schrieb am So., 17. Apr. 2022, 22:29:
> 
>     On Sun, Apr 17, 2022 at 01:25:33PM -0700, Dmitry Torokhov wrote:
>     > On Sat, Jun 26, 2021 at 08:54:17AM +0200, Julian Schulte wrote:
>     >
>     > Just found it in my inbox. Adding Hans...
> 
>     For real this time...
> 
>     >
>     > > Signed-off-by: Julian Schulte <schu.ju@gmx.net <mailto:schu.ju@gmx.net>>
>     > > ---
>     > >  drivers/input/touchscreen/goodix.c | 7 +++++++
>     > >  1 file changed, 7 insertions(+)
>     > >
>     > > diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
>     > > index c682b028f..cec5f7bdc 100644
>     > > --- a/drivers/input/touchscreen/goodix.c
>     > > +++ b/drivers/input/touchscreen/goodix.c
>     > > @@ -248,6 +248,13 @@ static const struct dmi_system_id inverted_x_screen[] = {
>     > >                     DMI_MATCH(DMI_PRODUCT_NAME, "I15-TC")
>     > >             },
>     > >     },
>     > > +   {
>     > > +           .ident = "TrekStor SurfTab duo W1 10.1 (VT4)",
>     > > +           .matches = {
>     > > +                   DMI_MATCH(DMI_SYS_VENDOR, "TrekStor"),
>     > > +                   DMI_MATCH(DMI_PRODUCT_NAME, "SurfTab duo W1 10.1 (VT4)")
>     > > +           },
>     > > +   },
>     > >  #endif
>     > >     {}
>     > >  };
>     > > --
>     > > 2.30.2
>     > >
>     >
>     > --
>     > Dmitry
> 
>     -- 
>     Dmitry
> 

