Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8EDD791814
	for <lists+linux-input@lfdr.de>; Mon,  4 Sep 2023 15:28:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232632AbjIDN2z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Sep 2023 09:28:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230413AbjIDN2z (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 Sep 2023 09:28:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9C6ECD0
        for <linux-input@vger.kernel.org>; Mon,  4 Sep 2023 06:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693834098;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=z8BbS0VR+viLE45lChE7wLN6LwznzmsTUr7hWT6afTU=;
        b=ZiAZFSGOxYgxpFBYbTMXDXXXhXWGWdpyuSB/p7MK4lE9bcU45hBJFEO5k0zohlJSXT+TZx
        JMPWokm687TDw79vaWBM7OfVdJl/MyOvKyp39MgOoImVH7de2rMQ2FW44OV+e8A4aldo45
        FsQ7DI5fhBpOSL6bA9zRFWenDE+M2Z8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-jToHTxMHORKVd213PorUtA-1; Mon, 04 Sep 2023 09:28:17 -0400
X-MC-Unique: jToHTxMHORKVd213PorUtA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-3fefea09bd0so9562595e9.0
        for <linux-input@vger.kernel.org>; Mon, 04 Sep 2023 06:28:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693834096; x=1694438896;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z8BbS0VR+viLE45lChE7wLN6LwznzmsTUr7hWT6afTU=;
        b=MV2n915fMmzx3ThvOUIUxsVFK+Q7oqj/Ia0ctYjBORAOqaRthEbs4+QCO0LanjvOjr
         1VPhnabaos6Hdau8x+IuX2s06i3l3uy4xtOxut42vLingiC3e8cJUwHnfVJsTyYx+1Pw
         GFptKZywbpMKK2o5PfCbqa/URDESFOAZ7QYSl2oLHZYTzgvbXx8hFrn/Tmm86xEmKDxu
         5kF/unP9wG3ljW4KGawesK7JMbiXqK4CVzXnnIB1CCdw93xitroGdeR5IzhYihRgbyRW
         DNDx052VMu4S9nJBmEROMTlPJUkeqsZb6qfdW8+HQYBb2ItUKPIPD2QMYecHfwm8HwFi
         zQ1A==
X-Gm-Message-State: AOJu0Yw8kWjoH1kJiIcbvfNpU75S4Phyxalx5NID0UVwTDNcQJI0yxyg
        4HeFZvVJ0kiKWGoqDis9sKQ14+Qy4Sz3HBGsy6By7vopOgHC7sF8IXXwCvd2IDG9h/ehLEXAx+P
        PzwIE2e2zk/bpSPHzZ7oHpTE=
X-Received: by 2002:a05:600c:2945:b0:3fe:89be:cd3 with SMTP id n5-20020a05600c294500b003fe89be0cd3mr7455259wmd.22.1693834095942;
        Mon, 04 Sep 2023 06:28:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHl7VfR/OsiuaD0NLKpcBP58yIezvg5tTwL4OjRo81CSensP8glNKF1MPDnFaTMcS52nY0Kpw==
X-Received: by 2002:a05:600c:2945:b0:3fe:89be:cd3 with SMTP id n5-20020a05600c294500b003fe89be0cd3mr7455246wmd.22.1693834095589;
        Mon, 04 Sep 2023 06:28:15 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id p9-20020a1c7409000000b003fee53feab5sm14253513wmc.10.2023.09.04.06.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 06:28:15 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
        daniel@ffwll.ch, sam@ravnborg.org
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-staging@lists.linux.dev, linux-hyperv@vger.kernel.org,
        linux-input@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 7/8] staging/fbtft: Initialize fb_op struct as static const
In-Reply-To: <20230828132131.29295-8-tzimmermann@suse.de>
References: <20230828132131.29295-1-tzimmermann@suse.de>
 <20230828132131.29295-8-tzimmermann@suse.de>
Date:   Mon, 04 Sep 2023 15:28:14 +0200
Message-ID: <877cp6cbkh.fsf@minerva.mail-host-address-is-not-set>
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

> Replace dynamic allocation of the fb_ops instance with static
> allocation. Initialize the fields at module-load time. The owner
> field changes to THIS_MODULE, as in all other fbdev drivers.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

