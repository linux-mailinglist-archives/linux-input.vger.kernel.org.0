Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFB03728191
	for <lists+linux-input@lfdr.de>; Thu,  8 Jun 2023 15:39:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235583AbjFHNjV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Jun 2023 09:39:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236178AbjFHNi5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Jun 2023 09:38:57 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 178FF26BA
        for <linux-input@vger.kernel.org>; Thu,  8 Jun 2023 06:38:56 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-777a2ef8d45so19145139f.2
        for <linux-input@vger.kernel.org>; Thu, 08 Jun 2023 06:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686231534; x=1688823534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XO1CigyiND3L02YzTiuKf1ibThwImhtncqElbj41kYc=;
        b=mnHhy4uzqnlQiGkCkIdasUBEdOiJcb/6vH26Sw+GbrtHdDdEIS3hHONhkFrxIORY2m
         Ll1kWdqdxYs9gpF2pnw2lK0/wN7SBRS+zVN3lJzyE378w7ylgNFjHQC3feoiVh8gset5
         FtK/0uQSGf93L3qLkCnQeWnkKn5jBFSWa7h+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686231534; x=1688823534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XO1CigyiND3L02YzTiuKf1ibThwImhtncqElbj41kYc=;
        b=Yy5Yy3VRkC/Gleujgotgk9vooKxULY1EqVWpmmc848c1sPgtfPIEpKrOpbCCbqXgRf
         PwQxsAUk0H4kgsZlCECP8U6OQ5ixKsXuTkztCUgNSfqSONwjUsYtf+QBkUCboZ+CWC4K
         D3KGFchtFc50Jx9u62V9BqELKXhNoYoN9NI63XormMUXnKcKxJOAnVPMsUH2FzqxBbnW
         SR+Ch2Uac3xQGZdHD2GdiIab2PHdhS9psCWL4ODKKEgSeRf2UJ/ziAvtlUMwfq6xM3qH
         T2yqCeFSHt8Qp8kEdUzt6UJLDC5bcIMNtkLJ9QXSjKLbuBuy2mfLcGeIz3eK1CWwP8LZ
         6www==
X-Gm-Message-State: AC+VfDzijrZakmCiJoV6BUxMQNdKOYYA5+VuqI6pwZdW4+oNwuvzPVUb
        HUYHbeEF7PLp5PNkrllmFkEKSx9cbrTrxG7v5BU=
X-Google-Smtp-Source: ACHHUZ5cn9+oCti+FZ8/bNBZvyFRJHBQW8BeoI+lnoqg3CjSS5sYZC69d7b/NY62z1uYfvKS26PCaQ==
X-Received: by 2002:a6b:4f19:0:b0:779:1e26:2fef with SMTP id d25-20020a6b4f19000000b007791e262fefmr8839468iob.0.1686231534245;
        Thu, 08 Jun 2023 06:38:54 -0700 (PDT)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com. [209.85.166.178])
        by smtp.gmail.com with ESMTPSA id f12-20020a02cacc000000b0041ac54cbc60sm281485jap.56.2023.06.08.06.38.53
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 06:38:53 -0700 (PDT)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-33b7f217dd0so136695ab.0
        for <linux-input@vger.kernel.org>; Thu, 08 Jun 2023 06:38:53 -0700 (PDT)
X-Received: by 2002:a05:6e02:12cb:b0:33d:8444:c071 with SMTP id
 i11-20020a056e0212cb00b0033d8444c071mr221148ilm.5.1686231532849; Thu, 08 Jun
 2023 06:38:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230608130147.2835818-1-yangcong5@huaqin.corp-partner.google.com>
 <20230608130147.2835818-3-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20230608130147.2835818-3-yangcong5@huaqin.corp-partner.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 8 Jun 2023 06:38:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VsmAzxSx9LN5pe6DjMF9C6AJHX5kwZyNG=deUpW1jyRg@mail.gmail.com>
Message-ID: <CAD=FV=VsmAzxSx9LN5pe6DjMF9C6AJHX5kwZyNG=deUpW1jyRg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] HID: i2c-hid: elan: Add ili9882t timing
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Thu, Jun 8, 2023 at 6:02=E2=80=AFAM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> +static const struct elan_i2c_hid_chip_data ilitek_ili9882t_chip_data =3D=
 {
> +       .post_power_delay_ms =3D 1,
> +       .post_gpio_reset_on_delay_ms =3D 200,
> +       .post_gpio_reset_off_delay_ms =3D 65,
>         .hid_descriptor_address =3D 0x0001,
> +       /* this touchscreen is tightly integrated with the panel and assu=
mes
> +        * that the relevant power rails (other than the IO rail) have al=
ready
> +        * been turned on by the panel driver because we're a panel follo=
wer.
> +        */

I don't think the above is the right block comment style for this
file. The first "/*" should be on a line on its own.


> +       .main_supply_name =3D "null",

This should actually be NULL without the quotes. ...then you should
change the code not to try to grab the regulator in that case.
