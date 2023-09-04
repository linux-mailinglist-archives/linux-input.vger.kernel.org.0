Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87F9D791803
	for <lists+linux-input@lfdr.de>; Mon,  4 Sep 2023 15:25:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231216AbjIDNZu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Sep 2023 09:25:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231185AbjIDNZt (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 Sep 2023 09:25:49 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2A02CE5
        for <linux-input@vger.kernel.org>; Mon,  4 Sep 2023 06:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693833896;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xPaq3CuDZRpQmuDqucr0HZhD9ZzK56uaUpku88i4nOk=;
        b=OQVg5s8TUYNUhczp7b+AX7o0osHbI7hvP83FPdfMdrUXxScedWqOVc5gYQVi9SM7Fi1syp
        JY32+6CzutwCS7qtkpupDrRs2FPj9ODHEKnIsw40+GC415HbEPP51bR1+B1wmtVfTmK1rH
        v5uOgJV7kXqewAW3Luk+DKeit2e0M4k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-6FD2BhD2NHyjEXOEYyFMIw-1; Mon, 04 Sep 2023 09:24:54 -0400
X-MC-Unique: 6FD2BhD2NHyjEXOEYyFMIw-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3fbdf341934so8923455e9.3
        for <linux-input@vger.kernel.org>; Mon, 04 Sep 2023 06:24:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693833893; x=1694438693;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xPaq3CuDZRpQmuDqucr0HZhD9ZzK56uaUpku88i4nOk=;
        b=ES2+Ni4UOVXQni2hgaZHT8NtApJCOjy/F72Q0TJ8Byu2M6Ks1bzHNmmuLoUIEgHE0w
         5Nnludq/NB1yhcNp12eyjCMKQhm+jvHuhYbXboZPiNFoRn10Er5T0HTWqgZlhiPfsaO/
         kkF8rhQnmVA40hJgsmKAtrKWDUenJwT8/hTqXDcPf/1xr/TK3IsabYVT3clQd/zikSna
         FBpH9ghl9fvKEuRqap/LRRGMgDZ9T6beQ1/vCT6kWHrKK30NXtfF94a8LrR24WiRTAy0
         phHT7IgZ7D/6AGv40p5iQy2TpWwdXNDyd0el0S73e171kwjy0870TNYh4O7/+Iz8Xzr9
         A+xQ==
X-Gm-Message-State: AOJu0Yy9fxTIvSnARK1Ea3ygbmgKa1ub4TX1r8bWZvN84AM0+OUMrzIq
        mWWVZjwvHe/8NC+uF9NpEo4CsjrcK/nuMgUGxnh+XoCQTsYevFgcFOxxQBaY1l3ig10DZEjbzLs
        gHlWwUpmAE3fgexKvmvq4nto=
X-Received: by 2002:a7b:ce18:0:b0:3fb:f0ef:4669 with SMTP id m24-20020a7bce18000000b003fbf0ef4669mr7620183wmc.17.1693833893703;
        Mon, 04 Sep 2023 06:24:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVceTFRRCJx3QEHC1v0Fwwk5gpR/JTxujmvjvpSbrcXuud5RQf6XSV8UmJ3S8NFK1PJ6NVpQ==
X-Received: by 2002:a7b:ce18:0:b0:3fb:f0ef:4669 with SMTP id m24-20020a7bce18000000b003fbf0ef4669mr7620172wmc.17.1693833893448;
        Mon, 04 Sep 2023 06:24:53 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id m13-20020a7bce0d000000b003fed630f560sm14111682wmc.36.2023.09.04.06.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 06:24:53 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
        daniel@ffwll.ch, sam@ravnborg.org
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-staging@lists.linux.dev, linux-hyperv@vger.kernel.org,
        linux-input@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH 5/8] hid: Remove trailing whitespace
In-Reply-To: <20230828132131.29295-6-tzimmermann@suse.de>
References: <20230828132131.29295-1-tzimmermann@suse.de>
 <20230828132131.29295-6-tzimmermann@suse.de>
Date:   Mon, 04 Sep 2023 15:24:52 +0200
Message-ID: <87cyyycbq3.fsf@minerva.mail-host-address-is-not-set>
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

> Fix coding style in Kconfig. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jiri Kosina <jikos@kernel.org>
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> ---

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

