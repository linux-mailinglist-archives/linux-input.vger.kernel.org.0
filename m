Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB99D7917E4
	for <lists+linux-input@lfdr.de>; Mon,  4 Sep 2023 15:18:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240134AbjIDNTB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Sep 2023 09:19:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243320AbjIDNTA (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 Sep 2023 09:19:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A71CB6
        for <linux-input@vger.kernel.org>; Mon,  4 Sep 2023 06:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693833490;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=rBLzSQTLv+8pipDzuuK9IQr80p06o9JPiTCzfewmJxw=;
        b=JSaCtwUapIaYsR7l6FcK6XEyuFHlAlzDnqiO4Eek9d4+nHsEvbWuDhAWkA/iuV3ED49Zpv
        +4Zyi1mp9cFMyBoDFHPfGUByd0ZA9lNlRafBtPhCgxUYviZv5A/7FXQyKJh/DmbXX1uOim
        ecO3+3TaxDJiwLl+2kpBg0nQbbzMgT4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-113-7WIgu_I-NVy3oUcYO3WQAw-1; Mon, 04 Sep 2023 09:18:09 -0400
X-MC-Unique: 7WIgu_I-NVy3oUcYO3WQAw-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-3f5df65f9f4so9332095e9.2
        for <linux-input@vger.kernel.org>; Mon, 04 Sep 2023 06:18:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693833488; x=1694438288;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rBLzSQTLv+8pipDzuuK9IQr80p06o9JPiTCzfewmJxw=;
        b=OsMuUHx83DrqhOJdJkcLLPF6rWrbx0PCmIugk2VcS4YT/IxIBuuUg2JOhfq2jU6DCA
         b4bOSRdlEWIxcuWdRlXK7CHXeZbx7NJKbVxDSmbbKuaPVCgd+MRJt8VUmjlaKTt9z8OQ
         aNvhwiISostJsM53xylmwIoaT51woNxEqDMP+PCxnqVWjzkdCtdBy8/QHQiHLGmdg2pP
         +K36CwJOdyU8QDNYLv16b37QuTKvw7f6zFhkHqeoY7yvtpM0fPdWBH/jSzSCOe2x3T/i
         ZRpYKoPICIUbk0l+OjmaSfEa7q8KgKNYTMs47P1XTtIsUQSe1fXLNSGDpI3YpgGVeoRq
         CWlw==
X-Gm-Message-State: AOJu0YwJ8lEk70/D2vY+jbUrhWIQH1sdjhw3cW3UFy7lCtynMkjBXy6N
        o3T32pHWV3uKbGt9+we1+G2LBsM1LteYln7kQYgg9KeFvIqzxkR62sNp+9flr/zmxo6cFCobBNz
        v6T0iDnCb3IGhBou7vcztXto=
X-Received: by 2002:a05:6000:82:b0:31d:cd2f:4a4b with SMTP id m2-20020a056000008200b0031dcd2f4a4bmr6453152wrx.50.1693833488025;
        Mon, 04 Sep 2023 06:18:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMneOVTl+tO7EjPHxWk7aAIbA+6YIUPO8GkkaydyT763T9pc7YLR5Hmg/1C6iUl0u80TgQ3Q==
X-Received: by 2002:a05:6000:82:b0:31d:cd2f:4a4b with SMTP id m2-20020a056000008200b0031dcd2f4a4bmr6453136wrx.50.1693833487752;
        Mon, 04 Sep 2023 06:18:07 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id f3-20020a5d6643000000b00318147fd2d3sm14498682wrw.41.2023.09.04.06.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 06:18:07 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
        daniel@ffwll.ch, sam@ravnborg.org
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-staging@lists.linux.dev, linux-hyperv@vger.kernel.org,
        linux-input@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>
Subject: Re: [PATCH 4/8] fbdev/hyperv_fb: Use fb_ops helpers for deferred I/O
In-Reply-To: <20230828132131.29295-5-tzimmermann@suse.de>
References: <20230828132131.29295-1-tzimmermann@suse.de>
 <20230828132131.29295-5-tzimmermann@suse.de>
Date:   Mon, 04 Sep 2023 15:18:06 +0200
Message-ID: <87fs3ucc1d.fsf@minerva.mail-host-address-is-not-set>
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

> Generate callback functions for struct fb_ops with the fbdev macro
> FB_GEN_DEFAULT_DEFERRED_IOMEM_OPS(). Initialize struct fb_ops to
> the generated functions with fbdev initializer macros.
>
> The hyperv_fb driver is incomplete in its handling of deferred I/O
> and damage framebuffers. Write operations do no trigger damage handling.
> Fixing this is beyond the scope of this patch.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

