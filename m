Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C43EC70C273
	for <lists+linux-input@lfdr.de>; Mon, 22 May 2023 17:33:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233411AbjEVPdc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 May 2023 11:33:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234510AbjEVPd3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 May 2023 11:33:29 -0400
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 405B1186
        for <linux-input@vger.kernel.org>; Mon, 22 May 2023 08:33:25 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-76c8dc21998so69822539f.3
        for <linux-input@vger.kernel.org>; Mon, 22 May 2023 08:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684769603; x=1687361603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rOzOnUMPvM9TM8xcy1xez8VKe5P8M6GDNKqNZwK7fcM=;
        b=cFgJTwnDjy3OHx0NK0lMISuGVu7nGbn3DD3jAeH7gqIHm8m8p/WlvewggjxGdCNQfA
         zmOcsYuth+C34BZnIRGWosAYI0Pd7EHyDH46gv9PU9vkeRimoFrSYm+cl/6Lwr0FVtlc
         OpyM8Bp4h9uXVA3F3/qPevpEYhYAdKHm1gNnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684769603; x=1687361603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rOzOnUMPvM9TM8xcy1xez8VKe5P8M6GDNKqNZwK7fcM=;
        b=jQS4J+G6xjkm+DLP7lgxo/xXq8k+rP14xXAl57zNWJoJ6YhpCHcqJuWKJx8MhleNlF
         B9cKgarn2xaswelQouQncclwPoxhzVMeKjizJPuVN2EibmBMfI9LNfTM8UYNt5dHyqwG
         Mqk2AZFxsUjEwwIhlK8+NvVqLRG/e6Lg64k+kw058VwLrnLp7PzWJgmT23ewEUfIfCHU
         FP+a1RjIHJEzYtrFPrrvVuZfk1nqVFWEjZOUB5xeXQ9M3I3wYgQCjCT0nL/5OwadPp/o
         0dP8TxGZ3m0+gDmKxvsSFPifrVmFoglZJ3PYGkixXEhH/vTuIC2p2S+bA2yaIRDy9Nsz
         Zblg==
X-Gm-Message-State: AC+VfDxEU5rJxcx2cQSR79Bx37Fq737OY2DF6u0shFS7K1ltqQB8nAXk
        af7r1uUMd1jZvXIts6mcKghZofoevRewrQ2jEEw=
X-Google-Smtp-Source: ACHHUZ68upWxrY0yzXSpkmohfpXS8b7DJ6+cSENN0VwmUwK5r1sTF7D7qopjk2Dvw55caMAoTx5BwA==
X-Received: by 2002:a05:6e02:80e:b0:32c:dc61:8e84 with SMTP id u14-20020a056e02080e00b0032cdc618e84mr6512730ilm.4.1684769603042;
        Mon, 22 May 2023 08:33:23 -0700 (PDT)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com. [209.85.166.178])
        by smtp.gmail.com with ESMTPSA id q4-20020a02b044000000b0040fcd31af1csm1825524jah.65.2023.05.22.08.33.22
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 08:33:22 -0700 (PDT)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-33828a86ee2so337065ab.0
        for <linux-input@vger.kernel.org>; Mon, 22 May 2023 08:33:22 -0700 (PDT)
X-Received: by 2002:a05:6e02:1c2d:b0:32f:7715:4482 with SMTP id
 m13-20020a056e021c2d00b0032f77154482mr807557ilh.4.1684769601699; Mon, 22 May
 2023 08:33:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAD=FV=VYfPSwar2AXBxB3vX0dV1kjQ5bZMxsEBFhUnMNRXbBCw@mail.gmail.com>
 <20230520050649.2494497-1-yangcong5@huaqin.corp-partner.google.com> <20230520050649.2494497-3-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20230520050649.2494497-3-yangcong5@huaqin.corp-partner.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 22 May 2023 08:33:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wm_SK0V6WJUkuvu8yFfiP60JBuOdw9cy=0Ck2Jbn-X2A@mail.gmail.com>
Message-ID: <CAD=FV=Wm_SK0V6WJUkuvu8yFfiP60JBuOdw9cy=0Ck2Jbn-X2A@mail.gmail.com>
Subject: Re: [v2 2/2] dt-bindings: input: touchscreen: Add ilitek 9882T
 touchscreen chip
To:     Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc:     benjamin.tissoires@redhat.com, devicetree@vger.kernel.org,
        dmitry.torokhov@gmail.com, hsinyi@google.com, jikos@kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Fri, May 19, 2023 at 10:07=E2=80=AFPM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> Add an ilitek touch screen chip ili9882t.
>
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> ---
>  .../devicetree/bindings/input/elan,ekth6915.yaml         | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

I'm curious about the DT maintainers opinion here. Should this be a
new bindings file, or should it be together in the elan file. If
nothing else, I think the secondary voltage rail name is wrong. I took
a quick peek at a datasheet I found and I don't even see a 3.3V rail
going to the ili9882t. That makes it weird to reuse "vcc33-supply" for
a second supply...

-Doug
