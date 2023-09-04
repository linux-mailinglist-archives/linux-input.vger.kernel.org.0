Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEA14791819
	for <lists+linux-input@lfdr.de>; Mon,  4 Sep 2023 15:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240627AbjIDN3o (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Sep 2023 09:29:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237498AbjIDN3o (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 Sep 2023 09:29:44 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 891E1CD7
        for <linux-input@vger.kernel.org>; Mon,  4 Sep 2023 06:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693834136;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Ogc35j5wnFZjYknca/Dmxrctu7aJYOr7uX6tINC9GWs=;
        b=MT9rONXWmKqayuinndSRntId4rEkoxltvjHGZXZbHstvHH9dU8T3N5/NPkj3TvUTdeoVeA
        6JQn9J2QTGT8i4e+l+1g0hxMXj57MjylYSmxx7FE+oAxn9Y344kweJ2GshmN0yCJlytZ/m
        Y2cn/viTK2Cot/qw8XfO00pOEHwOnME=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-283-tcuhC53zOcKHhDugZrIuDA-1; Mon, 04 Sep 2023 09:28:55 -0400
X-MC-Unique: tcuhC53zOcKHhDugZrIuDA-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-30932d15a30so820038f8f.1
        for <linux-input@vger.kernel.org>; Mon, 04 Sep 2023 06:28:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693834134; x=1694438934;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ogc35j5wnFZjYknca/Dmxrctu7aJYOr7uX6tINC9GWs=;
        b=b7bpuSgu7xnJha1xEA1D/sVitioBRpfuoj9HmSOTg311rPL+ZjmvURSo97cvoofSiF
         2KfwqVibdXdJ1QVGqg/zbHyWCPh4mhITzrtaNHgWT4AmBzUn68rb42dnzLcuv5qztVPP
         mEs6O9xsBeCc+9t2cfVPxBoN1OnpBZY1A5hTazQ9Sot/N+L/h1zVaHvN1JBs2t++LV1i
         PpocbGzksRvxtQ7E4i4s3BoVevQhFrn3aikAPYTP4vnCzlhhqY62U+gPPO7o62lWyboY
         cI7hysqW9hIEHjQ2FTnkyY9vS7YIYEVxpwEEspyXER2iHM5apd1Q6K38w+PpLgMQYE3A
         EDFA==
X-Gm-Message-State: AOJu0YxxRZIxhc3XMrVpDSWUxF2K4tGYnpkmmkoX/xXCD/KvcVgquZBE
        9iSkZYdGgAKA7BvyCKKGL5JDdmwTNHTpY6ksRP0WK081R32eBeTYZNFvOl2REFzHJlv1hLZM4cW
        comq4W7xN5uH8B/DroEvppwg=
X-Received: by 2002:a5d:43c3:0:b0:317:3d36:b2cd with SMTP id v3-20020a5d43c3000000b003173d36b2cdmr6107639wrr.71.1693834134386;
        Mon, 04 Sep 2023 06:28:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3pL/7M37MZ8DDYOtxB0J933cOF0hsfKFCSqFaXm8ULHyrObL/1Lf5LyHUOXJD35lTdHtBaw==
X-Received: by 2002:a5d:43c3:0:b0:317:3d36:b2cd with SMTP id v3-20020a5d43c3000000b003173d36b2cdmr6107629wrr.71.1693834134083;
        Mon, 04 Sep 2023 06:28:54 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id p3-20020a05600c1d8300b00401e32b25adsm14407260wms.4.2023.09.04.06.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 06:28:53 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
        daniel@ffwll.ch, sam@ravnborg.org
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-staging@lists.linux.dev, linux-hyperv@vger.kernel.org,
        linux-input@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 8/8] staging/fbtft: Use fb_ops helpers for deferred I/O
In-Reply-To: <20230828132131.29295-9-tzimmermann@suse.de>
References: <20230828132131.29295-1-tzimmermann@suse.de>
 <20230828132131.29295-9-tzimmermann@suse.de>
Date:   Mon, 04 Sep 2023 15:28:53 +0200
Message-ID: <874jkacbje.fsf@minerva.mail-host-address-is-not-set>
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
> FB_GEN_DEFAULT_DEFERRED_SYSMEM_OPS(). Initialize struct fb_ops to
> the generated functions with an fbdev initializer macro.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

