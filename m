Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 476FB5BB47F
	for <lists+linux-input@lfdr.de>; Sat, 17 Sep 2022 00:51:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbiIPWv5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Sep 2022 18:51:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbiIPWvz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Sep 2022 18:51:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A78B1BC10D
        for <linux-input@vger.kernel.org>; Fri, 16 Sep 2022 15:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663368713;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pjRlA0RY+t+BjRtrMPnyV7oK33culdAZroSIg+6DGuo=;
        b=Iu2MPSMDtT9ysMa8Xx0ou2vZEA8zs6DbJKgM8olb9oPCKgcPzr8jnT4mCf/7n4pHbpd8mF
        PoTPrtxj8J4h1VXd974krgLU7ZoCSJhQaZF3jGrDGQmfkMtzXpgtC6dsodOv+5Wonq9ngu
        wgIZA/19KcGQAQlktWO78eRGRkMDM2o=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-615-u-oFAwnIPUmpA3p4uPtnVA-1; Fri, 16 Sep 2022 18:51:51 -0400
X-MC-Unique: u-oFAwnIPUmpA3p4uPtnVA-1
Received: by mail-qt1-f199.google.com with SMTP id h7-20020ac85047000000b0035a6794699bso18161765qtm.3
        for <linux-input@vger.kernel.org>; Fri, 16 Sep 2022 15:51:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=pjRlA0RY+t+BjRtrMPnyV7oK33culdAZroSIg+6DGuo=;
        b=KS6zGW5JUk79EjOX+yOZSdpXsw3X8l9Iaj0OUDLCw/C9lR9yilHwqhfb+ofO/brSiW
         AbHlmctl7R80JZvEUjlNhl9PG2D37fKkwVzPwo0Hn7tSNSvt3NGzqvljdO7JGwor+F/1
         QC3rBa0cXKWk8/K6lRweVbZBgx3gnBMx0z3kgOkcKtu+/zRZWWRO9f5dPYOvDbemg/OL
         sCmeoc62A5OrU6ICWnNOgq+84p4WCxHz9Mq1HSAytpNJimBmVbH3MO98sC3w8bQgTZ51
         aDEHRxrF4hM4vrEuev2O472der2fE+pwVEbxtpXmCqbrBo8V++gJHeD27IRD8JOPF7L+
         fLZA==
X-Gm-Message-State: ACrzQf31NfRq5hrSysLdU3hNgfVIe9zv3Nm3uXF4D72Kjv2NT7/X5WNY
        TtLIBsvdndiLQP5mk0irauBfJtI2uzFWKesRCzHpGUTXsNifHwwTuEp15FRZLuw+ePet6b6B7QP
        V7rk6Y63ht0GokfVg8UmkRxE=
X-Received: by 2002:a05:622a:1ba7:b0:35c:b9f1:e1eb with SMTP id bp39-20020a05622a1ba700b0035cb9f1e1ebmr6386242qtb.323.1663368710880;
        Fri, 16 Sep 2022 15:51:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5ZIE5CGN/wozN3NkecdxG6632/8GbZYKJKWtN0pDzveB8P7MsjbCm03j2Qoe043eCXA8tiGw==
X-Received: by 2002:a05:622a:1ba7:b0:35c:b9f1:e1eb with SMTP id bp39-20020a05622a1ba700b0035cb9f1e1ebmr6386234qtb.323.1663368710695;
        Fri, 16 Sep 2022 15:51:50 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c48:e00::feb? ([2600:4040:5c48:e00::feb])
        by smtp.gmail.com with ESMTPSA id bq10-20020a05620a468a00b006ce51b541dfsm7353834qkb.36.2022.09.16.15.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 15:51:49 -0700 (PDT)
Message-ID: <9e374f8091b9d0a225137eee15349e22bff15110.camel@redhat.com>
Subject: Re: [PATCH 0/9] Input: synaptics-rmi4 - Bootloader v7/v8 firmware
 update improvements
From:   Lyude Paul <lyude@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Fri, 16 Sep 2022 18:51:48 -0400
In-Reply-To: <YyT9p9Gf/sTgSW1I@google.com>
References: <20220608124808.51402-1-matthias.schiffer@ew.tq-group.com>
         <26790cfecb827245187233bc81f9fb89553bb4a7.camel@ew.tq-group.com>
         <c434ba87606d3d7696ae076684ceea67bfe662e3.camel@ew.tq-group.com>
         <a959cfe90356b702727413e7c14b246875eb88b6.camel@ew.tq-group.com>
         <4b0d603814c8740b125cc6130b67c79e37405d69.camel@redhat.com>
         <YyT9p9Gf/sTgSW1I@google.com>
Organization: Red Hat Inc.
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

sgtm then :), will try to look at this early next week

On Fri, 2022-09-16 at 15:50 -0700, Dmitry Torokhov wrote:
> On Fri, Sep 16, 2022 at 06:39:18PM -0400, Lyude Paul wrote:
> > Would my review count at all here? I hadn't reviewed until now because I
> > wasn't sure it would, but I'm happy to take a look if you think that'd help.
> 
> Absolutely. All reviews count, and they also show that there is interest
> in the patches/new functionality.
> 
> Thanks.
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

