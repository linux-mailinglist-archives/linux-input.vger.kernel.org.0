Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 740E2791AA4
	for <lists+linux-input@lfdr.de>; Mon,  4 Sep 2023 17:29:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241437AbjIDP3N (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Sep 2023 11:29:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236286AbjIDP3H (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 Sep 2023 11:29:07 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45A78CD4
        for <linux-input@vger.kernel.org>; Mon,  4 Sep 2023 08:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693841302;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=zrkFFETteuVae/tXCmZrIh7LT8QUm9zk2gxUS8x5iBg=;
        b=Ng4//mxVEHJNCcbGf4HvXFv841XaYXBNtfUaYYCQzpk88TihdXGvnoOzUSg+lZi/RqvD5u
        HYATYOzNiUQiXIQDFNC371m6OtAWmoZ4q3cWRGppMjjbLCj5yVvLOp0a5bPz+BQyvEQkLj
        Qg1GtzsRmnDmHZa5dZsuAHFkRkwng0Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-250-PeUPzpwGMe6ui81uHZaWNQ-1; Mon, 04 Sep 2023 11:28:21 -0400
X-MC-Unique: PeUPzpwGMe6ui81uHZaWNQ-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-401c4f03b00so11130285e9.1
        for <linux-input@vger.kernel.org>; Mon, 04 Sep 2023 08:28:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693841300; x=1694446100;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zrkFFETteuVae/tXCmZrIh7LT8QUm9zk2gxUS8x5iBg=;
        b=WgXsvhvoiQz1BwaLZTSFOyxCru4kP5I3gmSRzkiCpAkFjx5MK5UT3BFhPOfKjGavi2
         bcunrJfrM8pi6M3Beqm2hQgtARGDLhMXq0wRsaW7aE0w8Q//BBAqV5pNn0M8sgvy2non
         Uxr7qAkfAd0pvlADwH37gw4kl0MalyLVT+zE/2R4YIporBXTZj84zdAxy1MPnl3cb14/
         viQRofXZl/z2W5kjUNorRv70lW6oKCZn00KZW7hOEcFBaxv1849Q88kRucVWStPAxW/T
         bah4g0zgaC9aupsRQjGPsZO84anyUgGddpi4SS1ht4Rq7E6ki6X9wmpha0oFVNnSc//l
         lcHA==
X-Gm-Message-State: AOJu0YwFS8lSm8Sqxo0R3sibm/bvm5S/dyXFbdadkWzJjYego6+LvafI
        uf6STcFQ2tQGbwhNMThhO0ruD8OU0stVVIkdffgCJJmwmRjLARM4lHuE5X1IGCu8HuZ+FqUoSoh
        LrA+sb6HI+wA9Zv/qUuNb+OWlL4CxQl8=
X-Received: by 2002:a05:6000:151:b0:317:5d60:2fea with SMTP id r17-20020a056000015100b003175d602feamr8786754wrx.52.1693841299901;
        Mon, 04 Sep 2023 08:28:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqr9n5OuCxsaX4v3hREg3LRHhHWX1kh5NPq1tl5TVMsK10UjE7B2EYUhMfWqJeDR4jr+Z45A==
X-Received: by 2002:a05:6000:151:b0:317:5d60:2fea with SMTP id r17-20020a056000015100b003175d602feamr8786735wrx.52.1693841299613;
        Mon, 04 Sep 2023 08:28:19 -0700 (PDT)
Received: from localhost (156.pool92-189-221.dynamic.orange.es. [92.189.221.156])
        by smtp.gmail.com with ESMTPSA id e12-20020adf9bcc000000b0031759e6b43fsm11564376wrc.39.2023.09.04.08.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 08:28:19 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
        daniel@ffwll.ch, sam@ravnborg.org
Cc:     linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Bernie Thompson <bernie@plugable.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 2/8] fbdev/udlfb: Use fb_ops helpers for deferred I/O
In-Reply-To: <37906737-5ca3-7f46-af30-85a117875eea@suse.de>
References: <20230828132131.29295-1-tzimmermann@suse.de>
 <20230828132131.29295-3-tzimmermann@suse.de>
 <874jka6qd7.fsf@minerva.mail-host-address-is-not-set>
 <37906737-5ca3-7f46-af30-85a117875eea@suse.de>
Date:   Mon, 04 Sep 2023 17:28:18 +0200
Message-ID: <87y1hm5565.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Am 04.09.23 um 15:05 schrieb Javier Martinez Canillas:
>> Thomas Zimmermann <tzimmermann@suse.de> writes:
>> 
>>> Generate callback functions for struct fb_ops with the fbdev macro
>>> FB_GEN_DEFAULT_DEFERRED_SYSMEM_OPS(). Initialize struct fb_ops to
>>> the generated functions with fbdev initializer macros.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: Bernie Thompson <bernie@plugable.com>
>>> ---
>> 
>> Acked-by: Javier Martinez Canillas <javierm@redhat.com>
>> 
>> [...]
>> 
>>> +static void dlfb_ops_damage_range(struct fb_info *info, off_t off, size_t len)
>>> +{
>>> +	struct dlfb_data *dlfb = info->par;
>>> +	int start = max((int)(off / info->fix.line_length), 0);
>>> +	int lines = min((u32)((len / info->fix.line_length) + 1), (u32)info->var.yres);
>>> +
>>> +	dlfb_handle_damage(dlfb, 0, start, info->var.xres, lines);
>>> +}
>>> +
>>> +static void dlfb_ops_damage_area(struct fb_info *info, u32 x, u32 y, u32 width, u32 height)
>>> +{
>>> +	struct dlfb_data *dlfb = info->par;
>>> +
>>> +	dlfb_offload_damage(dlfb, x, y, width, height);
>>> +}
>>> +
>> 
>> These two are very similar to the helpers you added for the smscufx driver
>> in patch #1. I guess there's room for further consolidation as follow-up ?
>
> Maybe. I had patches that take the rectangle computation from [1] and 
> turn it into a helper for these USB drivers. But it's an unrelated 
> change, so I dropped them from this patchset.
>

Great and yes, I meant as separate patch-set, not as a part of this one.

> Best regards
> Thomas
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

