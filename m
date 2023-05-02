Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 824326F484B
	for <lists+linux-input@lfdr.de>; Tue,  2 May 2023 18:32:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233521AbjEBQcq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 May 2023 12:32:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234042AbjEBQcp (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 May 2023 12:32:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37E97199B
        for <linux-input@vger.kernel.org>; Tue,  2 May 2023 09:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683045117;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0DdbmHAr/eARhTQm66JpoJt0fKm43fZTeq7P598vL5w=;
        b=SBQcWhqd/12h83APuxWxluExqc15R0MkvBZqBFvGkWtw9tpD/MOkJlNYYSYeKgceKfN5Q/
        Tqlf5XsM96L58le/iCSXh4LNxD8CQp1OhU+SBqqxZ1S2rIzBgLmTWXNFE1hOwVOThpGU95
        9zjTBxBStA5NrsP4t2ypyJvxkuOB044=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-198-fudEebsxPUmnmMous3sT7Q-1; Tue, 02 May 2023 12:31:54 -0400
X-MC-Unique: fudEebsxPUmnmMous3sT7Q-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-2fa5d643cd8so1123715f8f.2
        for <linux-input@vger.kernel.org>; Tue, 02 May 2023 09:31:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683045113; x=1685637113;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0DdbmHAr/eARhTQm66JpoJt0fKm43fZTeq7P598vL5w=;
        b=gmpDXuERqKLcxT6UAlFO1272kiAczRST4lXc1KVZOG0L2B8JTf48GFv4/lEjwLWhZ5
         ZfvyZnHdx0BStTf3zJB6WDXBxwQGFRYWydsGDVDDf7lu8fNPuQGFhCJw31jH49i3fBPn
         hmQcRwLgoUbe7WBY6ZCGNmLhIc63ChhvfOQ/YdAj4Qoi9Z0HNICQL83x+dNMLUcBB0Wr
         Z3TmCkJqoWzdj4ZfD9bBuYcXDpfRtpp2ngaOikGNlr2N7QOFme3X2c9KnDz5xO6OnMOV
         XKlZSmQEiiBT2zkfWY6zjXEw8Ce2erDqfbXj1tICGAeNmNDH3SceLbfJ1nZomF4CRQ6T
         6v5A==
X-Gm-Message-State: AC+VfDxwlLOrs/5/HuB7d2ub0sRgzY2uyVt/sol3Dw01ETf2IKb3dMFE
        9a30ZWJfxIKnyuDVqA6sLqTeRxwGGgZAotE+N3sn9Mqe3jZCQuUpVG6FeoU+u5R2hqKKglFEeSx
        qcjnA2wfT8IGFIDgw+I1eIvw=
X-Received: by 2002:adf:e9cd:0:b0:306:2fd1:a91f with SMTP id l13-20020adfe9cd000000b003062fd1a91fmr4147021wrn.61.1683045112927;
        Tue, 02 May 2023 09:31:52 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7EkPVTMb4YL3uV/CKjSTJe4H5ZUct+Bkd8tJ9blXCxBITCBNyVwa94yAZ3bF3D+tqITo6SDQ==
X-Received: by 2002:adf:e9cd:0:b0:306:2fd1:a91f with SMTP id l13-20020adfe9cd000000b003062fd1a91fmr4147006wrn.61.1683045112660;
        Tue, 02 May 2023 09:31:52 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id jb12-20020a05600c54ec00b003f17003e26esm39217262wmb.15.2023.05.02.09.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 09:31:52 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <davidgow@google.com>, linux-input@vger.kernel.org,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Input: tests - miscellaneous fixes
In-Reply-To: <CAMuHMdVmfj8L24QbMGn54jW96rYkvX1gizmvgvEB7T3Jwevd+g@mail.gmail.com>
References: <cover.1683022164.git.geert+renesas@glider.be>
 <CAMuHMdVmfj8L24QbMGn54jW96rYkvX1gizmvgvEB7T3Jwevd+g@mail.gmail.com>
Date:   Tue, 02 May 2023 18:31:51 +0200
Message-ID: <878re6y9s8.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Geert Uytterhoeven <geert@linux-m68k.org> writes:

Hello Geert,

> Hi Javier,
>
> On Tue, May 2, 2023 at 12:17=E2=80=AFPM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
>> This patch series fixes a crash in the new input selftest, and makes the
>> test available when the KUnit framework is modular.
>>
>> Unfortunately test 3 still fails for me (tested on Koelsch (R-Car M2-W)
>> and ARAnyM):
>>
>>         KTAP version 1
>>         # Subtest: input_core
>>         1..3
>>     input: Test input device as /devices/virtual/input/input1
>>         ok 1 input_test_polling
>>     input: Test input device as /devices/virtual/input/input2
>>         ok 2 input_test_timestamp
>>     input: Test input device as /devices/virtual/input/input3
>>         # input_test_match_device_id: ASSERTION FAILED at # drivers/inpu=
t/tests/input_test.c:99
>>         Expected input_match_device_id(input_dev, &id) to be true, but i=
s false
>>         not ok 3 input_test_match_device_id
>>     # input_core: pass:2 fail:1 skip:0 total:3
>>     # Totals: pass:2 fail:1 skip:0 total:3
>>     not ok 1 input_core
>
> Adding more debug code shows that it's the test on evbit [1] in
> input_match_device_id() that fails.
> Looking at your input_test_match_device_id(), I think you expect
> the checks for the various bitmaps to be gated by
> "if (id->flags & INPUT_DEVICE_ID_MATCH_EVBIT)", like is done for the
> other checks?
>
> [1] https://elixir.bootlin.com/linux/latest/source/drivers/input/input.c#=
L1021
>

That's correct. In input_test_init(), the input dev is marked as capable
of emitting EV_KEY BTN_LEFT and BTN_RIGHT. The goal of that test was to
check this.

That is, check if matches by the input dev capabilities in which case the
__set_bit(EV_KEY, ...) would make the match true and __set_bit(EV_ABS, ..)
would make the condition false.

But maybe I misunderstood how the input_set_capability() and __set_bit()
functions work ?

I'll take a look to this tomorrow, thanks a lot for your report!

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

