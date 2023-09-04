Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 614407917B1
	for <lists+linux-input@lfdr.de>; Mon,  4 Sep 2023 15:00:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244342AbjIDNAT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Sep 2023 09:00:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234451AbjIDNAS (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 Sep 2023 09:00:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 667EF133
        for <linux-input@vger.kernel.org>; Mon,  4 Sep 2023 05:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693832370;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=zEV+8LVB0e1YVGA/3PaV1RliEe0ZafqnElnGxMEFxlo=;
        b=AYJDEEcc+Ui+3vgPX45vT/4XC4eP1Tb6WEVrknTTafPsCQUNyjYD6UOB6PjMIn2SIE3hIO
        NwGnNWr3O9YsJAASHU7aupR3okRGYZo0lCFenPysYxORsjYQpz/2/mh9jCALEUWNJXWRQN
        FH54GScAa+++RhlqG9XKwtnnTahZsgs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-1tG6aksLM2-wQonYypULlg-1; Mon, 04 Sep 2023 08:59:29 -0400
X-MC-Unique: 1tG6aksLM2-wQonYypULlg-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3172a94b274so810363f8f.0
        for <linux-input@vger.kernel.org>; Mon, 04 Sep 2023 05:59:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693832368; x=1694437168;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zEV+8LVB0e1YVGA/3PaV1RliEe0ZafqnElnGxMEFxlo=;
        b=Cj8I5MxoQd5Wi/bpsO3Y6u5o1B+00qK2pg0VfCWtlF5cqnbZS3Za1mlzNG3aKX/TA7
         /8ypGqO5loxIzASqGBU+YPoJxhaK/LZwTy13QKYLubUW0ep0D6Wueh8Fid6DKFrehAlM
         p5D6EyilbfiUJRh98iEa/UJYUoyUd27Sy+7uLR0+JcQ53CHDNf8q2lUWoaw1lSK+P0dZ
         kXaDjYU3w1l9dS1RrgSIyXg+sTeMxkKMAyuDi/TtOF1fak+OX/ZB9dkQm7RVz8FCcf3c
         4dLeHGDceyTyk1blKbssP6bn6VbWAB3fcTXJXKmvB9ytNGyCYXpJjO/4p9pqfcQ/UGx2
         9vWA==
X-Gm-Message-State: AOJu0YxwmasuTrEGm2i9Wb1A2yr0gIXatGpSrQdYHjgiLG4X7yYkSIeb
        0acKW2/AFYVy1PBhKzpR3yr19Ni2g1nSnXamK4nwR/3zOddIAtlhz+2P53ZhmIH+LR3qr2kOWoo
        /k9TL5mTAlmVlVIzA26KamYc=
X-Received: by 2002:a5d:4591:0:b0:31d:d977:4e3d with SMTP id p17-20020a5d4591000000b0031dd9774e3dmr7801074wrq.19.1693832368176;
        Mon, 04 Sep 2023 05:59:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKikRn5bbMbcnbDDAwQ42B3JKHCa5zsGawpabxpCAhlcfEHQ3tfQsF2MOZFWXS2OqG+gZYTw==
X-Received: by 2002:a5d:4591:0:b0:31d:d977:4e3d with SMTP id p17-20020a5d4591000000b0031dd9774e3dmr7801053wrq.19.1693832367823;
        Mon, 04 Sep 2023 05:59:27 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id c7-20020a5d4147000000b0031de43fe9bfsm14636476wrq.0.2023.09.04.05.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 05:59:27 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
        daniel@ffwll.ch, sam@ravnborg.org
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-staging@lists.linux.dev, linux-hyperv@vger.kernel.org,
        linux-input@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Steve Glendinning <steve.glendinning@shawell.net>
Subject: Re: [PATCH 1/8] fbdev/smscufx: Use fb_ops helpers for deferred I/O
In-Reply-To: <20230828132131.29295-2-tzimmermann@suse.de>
References: <20230828132131.29295-1-tzimmermann@suse.de>
 <20230828132131.29295-2-tzimmermann@suse.de>
Date:   Mon, 04 Sep 2023 14:59:26 +0200
Message-ID: <877cp66qmp.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Generate callback functions for struct fb_ops with the fbdev macro
> FB_GEN_DEFAULT_DEFERRED_SYSMEM_OPS(). Initialize struct fb_ops to
> the generated functions with fbdev initializer macros.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Steve Glendinning <steve.glendinning@shawell.net>
> ---

The patch looks good to me, but I've a question below.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

>  drivers/video/fbdev/smscufx.c | 85 +++++++++--------------------------
>  1 file changed, 22 insertions(+), 63 deletions(-)
>
> diff --git a/drivers/video/fbdev/smscufx.c b/drivers/video/fbdev/smscufx.c

[...]

>  static const struct fb_ops ufx_ops = {
>  	.owner = THIS_MODULE,
> -	.fb_read = fb_sys_read,
> -	.fb_write = ufx_ops_write,
> +	__FB_DEFAULT_DEFERRED_OPS_RDWR(ufx_ops),
>  	.fb_setcolreg = ufx_ops_setcolreg,
> -	.fb_fillrect = ufx_ops_fillrect,
> -	.fb_copyarea = ufx_ops_copyarea,
> -	.fb_imageblit = ufx_ops_imageblit,
> +	__FB_DEFAULT_DEFERRED_OPS_DRAW(ufx_ops),
>  	.fb_mmap = ufx_ops_mmap,

There are no generated functions for .fb_mmap, I wonder what's the value
of __FB_DEFAULT_DEFERRED_OPS_MMAP() ? Maybe just removing that macro and
setting .fb_mmap = fb_deferred_io_mmap instead if there's no custom mmap
handler would be easier to read ?

Alternatively, __FB_DEFAULT_DEFERRED_OPS_MMAP() could still be left but
not taking a __prefix argument since that is not used anyways ?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

