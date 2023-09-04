Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC2E27917C3
	for <lists+linux-input@lfdr.de>; Mon,  4 Sep 2023 15:05:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232919AbjIDNGA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Sep 2023 09:06:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231233AbjIDNF7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 Sep 2023 09:05:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6430CD1
        for <linux-input@vger.kernel.org>; Mon,  4 Sep 2023 06:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693832712;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=JGDuo0fidzIyb7lQTlkFMMjSr0JbZNOTrueOM/c6sEY=;
        b=T5zWLRHrBVs1USqX/tvB5tN2WMDSXsH1eXhwvC8fsQ+zR+BLJAY+ZK+8eQX7saTwKWQtjA
        4LM34LkAfFrcqjbiVQVcW8ckeNShrt27IxgXRAwe5mjqnMOdl1HwmMOcNcWf86wHbxP+xC
        eyEtsPaVLx0lEyVLKbzyky9KEXT88W0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-344-mlS9G51NPdGfrUjAOYaNNQ-1; Mon, 04 Sep 2023 09:05:11 -0400
X-MC-Unique: mlS9G51NPdGfrUjAOYaNNQ-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-30932d15a30so808629f8f.1
        for <linux-input@vger.kernel.org>; Mon, 04 Sep 2023 06:05:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693832710; x=1694437510;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JGDuo0fidzIyb7lQTlkFMMjSr0JbZNOTrueOM/c6sEY=;
        b=lJIDwxcuWyJWkf0WEK1+YMV1jJDKiK8xNK5BZIj9w2bkLNVHYofnkLFwcFMeGXPI6y
         j8ImW0qwQZHmEvQ7YSQArMQaQ/oa7wGje3ZHvFQEKwAKG2rKtU9IUCVwr3bhAQn5Lanu
         IzZzMuSfB8ReYStOj/nW6507/gQGasm8uosl6LQIVSUDXNIpU/BC5OSwR6ZwA9Qpl+ce
         MhJXcIay90kbP2pPNIAsebLoWoGVzeabGEQRzIgVxpJ+LuSpoBo3LQTeO4zJ4jyE/Tmh
         idTuasJGLRfcWMzxPAbYnth+BwWvXFVzOFW3k0Es2FCghFNM2EawdIKiPFM1anB0joih
         duKg==
X-Gm-Message-State: AOJu0YwJlIE0k410veqgWpJDIbI6JxwYRlAQq3PRDXV93baEE1xN9j4T
        w+2udxPUZjA+mfkFEq0fEddgc1Jo0WQM3Ju/SGRBUAAN0Ve+GM2K23glkra5hbbjz8zdk6FlGAo
        0q7XLvx+X5Dl2akEGQIFhIzk=
X-Received: by 2002:a05:6000:1cd:b0:317:5de3:86fb with SMTP id t13-20020a05600001cd00b003175de386fbmr7162729wrx.10.1693832709956;
        Mon, 04 Sep 2023 06:05:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXjVWzCt7e02jUxRGN8dZzdROG6Y6I7k2Dqt3rSE/+w+cQmE9Wq23/UuCwnni8eIyMrEIxCA==
X-Received: by 2002:a05:6000:1cd:b0:317:5de3:86fb with SMTP id t13-20020a05600001cd00b003175de386fbmr7162714wrx.10.1693832709657;
        Mon, 04 Sep 2023 06:05:09 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id f7-20020adffcc7000000b0031c7682607asm14485436wrs.111.2023.09.04.06.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 06:05:09 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
        daniel@ffwll.ch, sam@ravnborg.org
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-staging@lists.linux.dev, linux-hyperv@vger.kernel.org,
        linux-input@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Bernie Thompson <bernie@plugable.com>
Subject: Re: [PATCH 2/8] fbdev/udlfb: Use fb_ops helpers for deferred I/O
In-Reply-To: <20230828132131.29295-3-tzimmermann@suse.de>
References: <20230828132131.29295-1-tzimmermann@suse.de>
 <20230828132131.29295-3-tzimmermann@suse.de>
Date:   Mon, 04 Sep 2023 15:05:08 +0200
Message-ID: <874jka6qd7.fsf@minerva.mail-host-address-is-not-set>
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

> Generate callback functions for struct fb_ops with the fbdev macro
> FB_GEN_DEFAULT_DEFERRED_SYSMEM_OPS(). Initialize struct fb_ops to
> the generated functions with fbdev initializer macros.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Bernie Thompson <bernie@plugable.com>
> ---

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

[...]

> +static void dlfb_ops_damage_range(struct fb_info *info, off_t off, size_t len)
> +{
> +	struct dlfb_data *dlfb = info->par;
> +	int start = max((int)(off / info->fix.line_length), 0);
> +	int lines = min((u32)((len / info->fix.line_length) + 1), (u32)info->var.yres);
> +
> +	dlfb_handle_damage(dlfb, 0, start, info->var.xres, lines);
> +}
> +
> +static void dlfb_ops_damage_area(struct fb_info *info, u32 x, u32 y, u32 width, u32 height)
> +{
> +	struct dlfb_data *dlfb = info->par;
> +
> +	dlfb_offload_damage(dlfb, x, y, width, height);
> +}
> +

These two are very similar to the helpers you added for the smscufx driver
in patch #1. I guess there's room for further consolidation as follow-up ?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

