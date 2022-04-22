Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BEC450B359
	for <lists+linux-input@lfdr.de>; Fri, 22 Apr 2022 10:56:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233715AbiDVI7J (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Apr 2022 04:59:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229975AbiDVI7H (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Apr 2022 04:59:07 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B3EB0532CE
        for <linux-input@vger.kernel.org>; Fri, 22 Apr 2022 01:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1650617773;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=A6k9hGu63wdlE43MD/fd+j5vrk15TW0FffRj5uqhSjY=;
        b=f4kxjPCcIRbUcKbjGvoGWkA4bgbRLEZ1AJhJXzjhTR6LnCYohBgu3teveHStrPz4NihMaI
        fgYOa6G/Ek37uGtJOVBJ+t1cLL8QijNyvF+hnwhrygO/VakCofxxhbohc90yMLds/uDu/Q
        JaTRuWsRshR/1Dy8l5k2Hm3ScACF3vc=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511-SKFnjMmfMdWf9mOlp3iC8Q-1; Fri, 22 Apr 2022 04:56:12 -0400
X-MC-Unique: SKFnjMmfMdWf9mOlp3iC8Q-1
Received: by mail-pg1-f197.google.com with SMTP id bj12-20020a056a02018c00b003a9eebaad34so4514921pgb.10
        for <linux-input@vger.kernel.org>; Fri, 22 Apr 2022 01:56:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A6k9hGu63wdlE43MD/fd+j5vrk15TW0FffRj5uqhSjY=;
        b=lFpyGK7hIjdWHKbuMn/DlLizBzbROLufK3Tm2Zlt0kS0XhP7ByxOonl2UXo61sLapd
         eiYWg7oxshbqzgzTmyXGPF3YiSjBZSD6sZsaZ3D5HGPLIRTV7CblxZAuA1HpU9Ir2mPq
         3oiih1vdLgrBE4UQK018eSogN9dMSHNJAxuwAaoT8o35nOpr+c9u+tHr7cz8zxMIijnr
         vUly/XE25/Ww9LzmVrUK93ZVBzSIarY9Hc6/rmdwZZpIVFBL6fiB6OawunkO8al+ylEI
         Ns7/BffkvNwZ0B0anyO7TcvX1qD06Dk/777v/jx1cAMdY9aOIWj3oZI/bcD6hgPj3f90
         QxWg==
X-Gm-Message-State: AOAM531AQcNcGdSsbDp9+Sm+wuk0XNwlAzr2O1x6WnnKzSynzdoc0Kp8
        9MP8EhbJG5ZApZQHSEORtnGfZqdgEqUutZgH/e82vP6TI1/U63RwfsDLhYvLEAuAMwX1uKomfX6
        X3bEQcDKxiKkiCKV+ATe8I+BuyZAXzgWydzwUwjo=
X-Received: by 2002:a63:6c0a:0:b0:398:6bd2:a16a with SMTP id h10-20020a636c0a000000b003986bd2a16amr3065469pgc.191.1650617771033;
        Fri, 22 Apr 2022 01:56:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0zkvcoyjXhebmHRvznh3BMlfJ78ghBMzo+XmFxLu/Jvi5Fui9jm/KLCmVQumRK6PCWlfTwhE0lie1XShK3jw=
X-Received: by 2002:a63:6c0a:0:b0:398:6bd2:a16a with SMTP id
 h10-20020a636c0a000000b003986bd2a16amr3065460pgc.191.1650617770811; Fri, 22
 Apr 2022 01:56:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220331144500.2340714-1-acz@semihalf.com> <CAB4aORW_1ScMDBcvn8WU+2m6_xmv-nkjQuPHfwTD9vnWMNQhiA@mail.gmail.com>
 <CAO-hwJLDADovq-pu9ovcqYBi8DRLJE1xsNOzwtnypethcGYOtw@mail.gmail.com>
 <CAB4aORWCL3+ZDibdpR5svSoWev48c30ZUAaHmQRKuKoGemt65g@mail.gmail.com>
 <21703d7a-2b28-3708-7462-96190d0130c8@redhat.com> <CAB4aORU3_MCiL5JJTzpCVaBYGrNPucoC7NmXqf9dzK4Yo_A7sg@mail.gmail.com>
 <CAO-hwJ+ZehAGxTP=D3AuQrBjykkgRkGC7uh8zo9v_bkLpZJ0Rg@mail.gmail.com> <CAB4aORW0aY_dxGNTBKyVz4h5wNPcPv65_BXfs6uj2rBMWxMu7Q@mail.gmail.com>
In-Reply-To: <CAB4aORW0aY_dxGNTBKyVz4h5wNPcPv65_BXfs6uj2rBMWxMu7Q@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 22 Apr 2022 10:55:59 +0200
Message-ID: <CAO-hwJK7qwLHK4kxCwSDLeRC0QwwaTJMqsmBsRyW0z2Bdj4GUA@mail.gmail.com>
Subject: Re: [PATCH] HID: multitouch: Implement MT_QUIRK_DROP_REPEATED_SLOT
To:     Angela Czubak <acz@semihalf.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>, upstream@semihalf.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Apr 21, 2022 at 1:31 PM Angela Czubak <acz@semihalf.com> wrote:
[...]
> Thanks for the response. Fortunately the vendor was able to resolve the
> issue in the new FW, so I believe that no kernel patch will be necessary :)
> In case it is not enough I will try and apply fixes in the user space.
>

Great! Glad to see that this is resolved.

Cheers,
Benjamin

