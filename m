Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCAC3729FD6
	for <lists+linux-input@lfdr.de>; Fri,  9 Jun 2023 18:15:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239657AbjFIQPE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Jun 2023 12:15:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242160AbjFIQO6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Jun 2023 12:14:58 -0400
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C39E535B5
        for <linux-input@vger.kernel.org>; Fri,  9 Jun 2023 09:14:56 -0700 (PDT)
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-33dae9244a1so12208575ab.0
        for <linux-input@vger.kernel.org>; Fri, 09 Jun 2023 09:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686327295; x=1688919295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rk3RV3sQ8umXpReTsBFbhMYf09xiUdeQTMhyG8kXHGw=;
        b=hUwmjhJalw1N4qUdjXTEI5oLZy8QVbwUvRKhQpqUj5h2TduRVP9jkAM0lpLrCz72sm
         zejIBJAQftH5sTqBzJEjAXpnYsorCPH28zBQa7iCBQ1FlgGbW7/IhMrvQ11uMiZoI7zH
         wtOBvlLKj8oTjUQwn3n6gytrcHcNi/gGpzVuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686327295; x=1688919295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rk3RV3sQ8umXpReTsBFbhMYf09xiUdeQTMhyG8kXHGw=;
        b=ZnWyDBSRbCYcyAD4ou1iOJWkoKvrFTTJ27zAoaxn758454oYb8kNFDRRQh03xzCG5s
         LZs71bmyefelrylA7ZN5a+3/uQgaENXrLEOlFZAX2wE0jLIoD+Bdbt+12NRU51xnO+ul
         mo95JB40pa6A50BtY4mXlYmgL93mZnyc5g4+NwsrYNUdSU+KgPbWCQnjB2Or39AwxZUc
         c4ah2MxDFxtkhDr9M54KXC/IijgRIZCKeekBxtRtkT+HvUIo3QbwaHd989dBTQzfgpZZ
         fg+7ejclrnY5hg2vofQdExftRv4z6LpaGmoSYksKhuoHY4b8ULJaWIvuHAERQrWy69+B
         2HMg==
X-Gm-Message-State: AC+VfDz2H4ZvpjOca6KBr1YIujcspfQjifZ6oU0ueGQeRp9TJYum78ok
        apXCTnQsolrGHqCU166XVZm06xOB4/kIsRs2LF8=
X-Google-Smtp-Source: ACHHUZ4ieAdkWi4emMPl/YSflEzW9+CJE8eONjENxVPucq559LdWHsT1bPI82wB0cb+xKeuFZll1PQ==
X-Received: by 2002:a92:d6ce:0:b0:33e:6d37:ce76 with SMTP id z14-20020a92d6ce000000b0033e6d37ce76mr1490158ilp.12.1686327295449;
        Fri, 09 Jun 2023 09:14:55 -0700 (PDT)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com. [209.85.166.181])
        by smtp.gmail.com with ESMTPSA id r4-20020a92d984000000b0033079f435f7sm1178756iln.65.2023.06.09.09.14.50
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 09:14:51 -0700 (PDT)
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-33bf12b5fb5so259935ab.1
        for <linux-input@vger.kernel.org>; Fri, 09 Jun 2023 09:14:50 -0700 (PDT)
X-Received: by 2002:a05:6e02:b44:b0:33d:5d63:57b6 with SMTP id
 f4-20020a056e020b4400b0033d5d6357b6mr402827ilu.13.1686327290072; Fri, 09 Jun
 2023 09:14:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230609063615.758676-1-yangcong5@huaqin.corp-partner.google.com>
 <20230609063615.758676-3-yangcong5@huaqin.corp-partner.google.com> <CAD=FV=UPSwWpkGN3UyFm1c84gj7iDC7dYrT9CCqWnqkTun-4cg@mail.gmail.com>
In-Reply-To: <CAD=FV=UPSwWpkGN3UyFm1c84gj7iDC7dYrT9CCqWnqkTun-4cg@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 9 Jun 2023 09:14:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Upq2t_+HtrX91etVhTQAK83khEX7MB-DzZuBpE5J3gJQ@mail.gmail.com>
Message-ID: <CAD=FV=Upq2t_+HtrX91etVhTQAK83khEX7MB-DzZuBpE5J3gJQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] HID: i2c-hid: elan: Add ili9882t timing
To:     Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, dmitry.torokhov@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, hsinyi@google.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Fri, Jun 9, 2023 at 9:14=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Thu, Jun 8, 2023 at 11:36=E2=80=AFPM Cong Yang
> <yangcong5@huaqin.corp-partner.google.com> wrote:
> >
> > The ili9882t is a TDDI IC (Touch with Display Driver). The
> > datasheet specifies there should be 60ms between touch SDA
> > sleep and panel RESX. Doug's series[1] allows panels and
> > touchscreens to power on/off together, so we can add the 65 ms
> > delay in i2c_hid_core_suspend before panel_unprepare.
> >
> > Because ili9882t touchscrgeen is a panel follower, and
> > needs to use vccio-supply instead of vcc33-supply, so set
> > it NULL to ili9882t_chip_data, then not use vcc33 regulator.
> >
> > [1]: https://lore.kernel.org/r/20230607215224.2067679-1-dianders@chromi=
um.org
> >
> > Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> > ---
> >  drivers/hid/i2c-hid/i2c-hid-of-elan.c | 50 ++++++++++++++++++++-------
> >  1 file changed, 38 insertions(+), 12 deletions(-)
>
> This seems reasonable to me now, but only makes sense to land if the
> panel follower patch series [1] lands. That series is currently at v2
> and will at least need a v3.
>
> [1] https://lore.kernel.org/r/20230607215224.2067679-1-dianders@chromium.=
org

Oh, but I should have added:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
