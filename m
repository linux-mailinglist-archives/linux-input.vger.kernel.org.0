Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05F3070C259
	for <lists+linux-input@lfdr.de>; Mon, 22 May 2023 17:28:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234499AbjEVP15 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 May 2023 11:27:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234397AbjEVP14 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 May 2023 11:27:56 -0400
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 802E9103
        for <linux-input@vger.kernel.org>; Mon, 22 May 2023 08:27:53 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-7747df5b674so5340839f.3
        for <linux-input@vger.kernel.org>; Mon, 22 May 2023 08:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684769271; x=1687361271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=STtYLVHbrxls9+TET2taw4/CcCJWytrlGIrbAGYi3j8=;
        b=nEOMLUpL3wZMWld/o04Gj+KH6QUZxbYsw3cQ5GsPg9QGbB8mLXRuwslmpRDo84OW2Q
         RbUP9FzhBCPyhTrW605ee3vYg4USmV6dEE6B9LEX27Blvf4oXwdi410AXxDXXsocZFhJ
         7TxVFazBiKMOLXMhTmWdNhBmi8AghUpmtD/IU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684769271; x=1687361271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=STtYLVHbrxls9+TET2taw4/CcCJWytrlGIrbAGYi3j8=;
        b=Fg5nZDsCozlTj9LrXa5IkBRJZsMrqfm6iYb7Oag+IlJBtynawbd3gpMA0Krpe9kDNH
         OQYpnMw2by9Cw1fX25KcOVMBcVd5ITO3uwFIvZxgj0YaPwsGZM+PUZtj1tk2gSK5UsME
         lv3E2mL9RD9baM9vH01fnij3XbYlzvZBQhHl07AqsGK7Up1OU/RLVpcyc3O2TJ2R5dl1
         LpujX9zN587oYK0zR07o6GCgjRiIECLs1fuNZ/4GdaDlhVTWnADChD7Eswflf3FwIlH2
         TBz7edvmQUTTxlSLp1GtvlOFe7LLAuTm4EDE+WXGlb2rv0h8A0AR81iAzej46wpsal/1
         yJJw==
X-Gm-Message-State: AC+VfDwc+bK+aP9RTYd4Y0BWxhZ0roGXzJgN+Y7AMMTsR828cEMlsTqc
        tWcEB5bFvV6MX0Zbp4zt9W1odquuZQl6x+KlD5Q=
X-Google-Smtp-Source: ACHHUZ6SuKQaR0osJp5KwjL9KhBm1bkOZPT7WMuTYW1AysHPVyNlj221lvwj/rBJKvOay4yRUfEClQ==
X-Received: by 2002:a92:611:0:b0:334:1d33:17 with SMTP id x17-20020a920611000000b003341d330017mr7027365ilg.14.1684769270802;
        Mon, 22 May 2023 08:27:50 -0700 (PDT)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com. [209.85.166.176])
        by smtp.gmail.com with ESMTPSA id dp40-20020a0566381ca800b0041ab222394csm1779513jab.3.2023.05.22.08.27.49
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 08:27:50 -0700 (PDT)
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-338458a9304so266775ab.1
        for <linux-input@vger.kernel.org>; Mon, 22 May 2023 08:27:49 -0700 (PDT)
X-Received: by 2002:a05:6e02:2189:b0:337:c9ec:4ca with SMTP id
 j9-20020a056e02218900b00337c9ec04camr449049ila.2.1684769269411; Mon, 22 May
 2023 08:27:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAD=FV=VYfPSwar2AXBxB3vX0dV1kjQ5bZMxsEBFhUnMNRXbBCw@mail.gmail.com>
 <20230520050649.2494497-1-yangcong5@huaqin.corp-partner.google.com> <20230520050649.2494497-2-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20230520050649.2494497-2-yangcong5@huaqin.corp-partner.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 22 May 2023 08:27:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xpe=zOeq2pG17Q0n_SZZHAFmaE+6C=SnuHqnHN6uObog@mail.gmail.com>
Message-ID: <CAD=FV=Xpe=zOeq2pG17Q0n_SZZHAFmaE+6C=SnuHqnHN6uObog@mail.gmail.com>
Subject: Re: [v2 1/2] HID: i2c-hid: elan: Add ili9882t timing
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
> The ili9882t is a TDDI IC ((Touch with Display Driver)). It requires the
> panel reset gpio to be high before i2c commands. Use a longer delay in
> post_power_delay_ms to ensure the poweron sequence.
>
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> ---
>  drivers/hid/i2c-hid/i2c-hid-of-elan.c | 7 +++++++
>  1 file changed, 7 insertions(+)

This seems OK to me. The one thing I'd also do is to update the
Kconfig description to say that this driver is also used for Ilitek. I
think it's fine to keep the symbol name as I2C_HID_OF_ELAN but just
change the description.

-Doug
