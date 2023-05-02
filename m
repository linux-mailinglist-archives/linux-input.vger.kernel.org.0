Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8122A6F428B
	for <lists+linux-input@lfdr.de>; Tue,  2 May 2023 13:20:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233906AbjEBLUN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 May 2023 07:20:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233871AbjEBLUN (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 May 2023 07:20:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 509FF1996
        for <linux-input@vger.kernel.org>; Tue,  2 May 2023 04:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683026360;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ZGX3oXDmepVSSgXg/ywOi6E6HyMIWMvPLV7WEL89H4A=;
        b=Z4tI/d+YJuUicCSiAJxRZk+M6Pvyp7Vw+nn3322oLVQzOblWeKEaRKy4kaSqBiFvpw+ltq
        uWR1upyfW4vOgMlR0YNmWNQPREXynNM1YgS1SSNhvH2RorqOpteahPHzpkD2yVqofqSiRe
        nPMnYaeQP/UlQBFE4yoHC2Hxvy7kqTg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-353-y1ZwUojgP76x-Fl8B5o3BA-1; Tue, 02 May 2023 07:19:19 -0400
X-MC-Unique: y1ZwUojgP76x-Fl8B5o3BA-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3f16ef3be6eso22026935e9.3
        for <linux-input@vger.kernel.org>; Tue, 02 May 2023 04:19:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683026358; x=1685618358;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZGX3oXDmepVSSgXg/ywOi6E6HyMIWMvPLV7WEL89H4A=;
        b=egmQfayE4y4FkCOsjez5Zbl+GEPyUVhg0KWrYTz/sm731ayxtMaMZyMnwQkxhg+Eew
         STaADruM3e8ywl4IqIqLKjC0+wHe957YmZyK1LZpi1DBg87vTzllHO3EatF7DfufV2eB
         9u1oH8t4kzX1rgFWoMgLqcnuVW+7Dvsd5InyJ58vqlKsudz11cmH1yuD1zXA0h/fT5T/
         fZT6uhMEU7Lo7CCLtlASG1qua3nXwIhomdd7lpoOShT/hfPr3IncJhDAdSLG9fOdeZRH
         h35avxOGoKIyCyZUnsaOmABTt58ggVMMdqbpXqPcmy3i7MVNxSvdVVr9JAgFq0TSoKVC
         hCBA==
X-Gm-Message-State: AC+VfDziRYkknzHZP8Us+gLhGMpUGpY5jPR1jpe7cFxAGQwnUMKVjrLf
        pfA500kym4uB7jTnLbelPxYGz6vfwEpZhHO6PnWeQSYYR4oTZYEM6/nOwyk6ndh4jYXmiFwcSuf
        aivHKja1mO17i0D05V+NUX+o=
X-Received: by 2002:a05:600c:364f:b0:3f3:1cb7:b2a6 with SMTP id y15-20020a05600c364f00b003f31cb7b2a6mr11124412wmq.6.1683026358450;
        Tue, 02 May 2023 04:19:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4tPcGFK34P936+hkNtJFObgUIXbAcsn7dPF/bQ8zykBW5U1fcHtQfnTagWvTYqne2fpRN3+g==
X-Received: by 2002:a05:600c:364f:b0:3f3:1cb7:b2a6 with SMTP id y15-20020a05600c364f00b003f31cb7b2a6mr11124394wmq.6.1683026358161;
        Tue, 02 May 2023 04:19:18 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id 25-20020a05600c025900b003ed2c0a0f37sm35039778wmj.35.2023.05.02.04.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 04:19:17 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <davidgow@google.com>
Cc:     linux-input@vger.kernel.org, linux-kselftest@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 2/2] Input: tests - modular KUnit tests should not
 depend on KUNIT=y
In-Reply-To: <483c4f520e4acc6357ebba3e605977b4c56374df.1683022164.git.geert+renesas@glider.be>
References: <cover.1683022164.git.geert+renesas@glider.be>
 <483c4f520e4acc6357ebba3e605977b4c56374df.1683022164.git.geert+renesas@glider.be>
Date:   Tue, 02 May 2023 13:19:16 +0200
Message-ID: <87ildbx9or.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


Hello Geert,

I've only been Cc'ed in patch #2.

Geert Uytterhoeven <geert+renesas@glider.be> writes:

> While KUnit tests that cannot be built as a loadable module must depend
> on "KUNIT=y", this is not true for modular tests, where it adds an
> unnecessary limitation.
>
> Fix this by relaxing the dependency to "KUNIT".
>
> Fixes: fdefcbdd6f361841 ("Input: Add KUnit tests for some of the input core helper functions")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

