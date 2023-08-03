Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA5EE76ECDF
	for <lists+linux-input@lfdr.de>; Thu,  3 Aug 2023 16:41:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235526AbjHCOlK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Aug 2023 10:41:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235286AbjHCOky (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 3 Aug 2023 10:40:54 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3296B4227
        for <linux-input@vger.kernel.org>; Thu,  3 Aug 2023 07:39:58 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-99bdeae1d0aso148983066b.1
        for <linux-input@vger.kernel.org>; Thu, 03 Aug 2023 07:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691073596; x=1691678396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q4VEn/Qj6DZvyXoC2OX+B5FMkh7YXzHCah+yE83TVaQ=;
        b=nk14RLzMmv8XbKhQsOFIQD8Rt+OHA35WxL8YUniWZm7lMX/GBGb608+9ysan9+g7K9
         A/EE1/Z2A5ad5Nqe/PJydhDPyQo40TFAnN3bfjmlfy3Y4l77O5OFcowOs+oOFKOWce3A
         E1N4MY2RzOLgiftjVpmWl0eTYeCeuc+SB4hX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691073596; x=1691678396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q4VEn/Qj6DZvyXoC2OX+B5FMkh7YXzHCah+yE83TVaQ=;
        b=i4BjVlhgvdqjBeLFkOdn41Zu9yarsPYuDUEDUdWqNtDDzeG1HLF0DPaE+dRPg0VAs9
         eLluDFNBzrQ7HyAWVJoK1pWrhqqlTYbbHB8P8EBCzYDgPVaWX9fcntiUYMV5P4waj4vR
         nIdOZQyFHGq0nQ5XJHbH/G+tvBIT/c4cTWMELJPLafrjkE5Migf1oY/oN/oo5KIL8tlQ
         r8560esD2ngm4Nsk+k6zUwhyrOXWWBiHWuN2UDibpcBgDEPrqGk+FWFCAPfvotktWZQe
         7WvrDRYsmFp/tCyveg15a/02CJI7ElkE/8rGOYOrW8eZQBDmfa7uhYsA7SgjetvQXp3P
         YsXg==
X-Gm-Message-State: ABy/qLaad5sRAr3k3JqTuxe3JcFM58djpmYxlCB/QI83m65t2SYeMLOX
        NC132v1cJDAIEr+PUqc6itzaW8+CyrJ/yzUkqOddmrtA
X-Google-Smtp-Source: APBJJlEiwaDYypVh67xNq9zk3BWDSURwnHOn/E8HJTCq/5ArSJMV3jIC1ZYmaW+d/Lyq9sGtfirrkg==
X-Received: by 2002:a17:907:1dca:b0:961:be96:b0e7 with SMTP id og10-20020a1709071dca00b00961be96b0e7mr8117921ejc.48.1691073596005;
        Thu, 03 Aug 2023 07:39:56 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id m15-20020a17090607cf00b00993159ce075sm10480575ejc.210.2023.08.03.07.39.55
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Aug 2023 07:39:55 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5229e0603edso10820a12.1
        for <linux-input@vger.kernel.org>; Thu, 03 Aug 2023 07:39:55 -0700 (PDT)
X-Received: by 2002:a50:9ea5:0:b0:522:28a1:2095 with SMTP id
 a34-20020a509ea5000000b0052228a12095mr66436edf.3.1691073595009; Thu, 03 Aug
 2023 07:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230802124947.1355415-1-arnd@kernel.org> <CAD=FV=Um=OsKA8LaHeOx0n=-1PJAdc6DJsWX9zmQZ+syFEa6vg@mail.gmail.com>
In-Reply-To: <CAD=FV=Um=OsKA8LaHeOx0n=-1PJAdc6DJsWX9zmQZ+syFEa6vg@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 3 Aug 2023 07:39:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U7txm2iVYisUWC_gqQ_z3664eFj5mG2ygXiVvn0=pFgw@mail.gmail.com>
Message-ID: <CAD=FV=U7txm2iVYisUWC_gqQ_z3664eFj5mG2ygXiVvn0=pFgw@mail.gmail.com>
Subject: Re: [PATCH] HID: i2c-hid: add more DRM dependencies
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Maxime Ripard <mripard@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Wed, Aug 2, 2023 at 7:16=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Wed, Aug 2, 2023 at 5:49=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wr=
ote:
> >
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > When a symbol is selected that has extra dependencies,
> > anything that selects it must have the same dependencies.
> > With the added CONFIG_DRM reference from I2C_HID_CORE,
> > this broke a couple of drivers that now also depend
> > on DRM:
> >
> > WARNING: unmet direct dependencies detected for I2C_HID_CORE
> >   Depends on [m]: HID_SUPPORT [=3Dy] && I2C_HID [=3Dy] && (DRM [=3Dm] |=
| !DRM [=3Dm])
> >   Selected by [y]:
> >   - I2C_HID_OF [=3Dy] && HID_SUPPORT [=3Dy] && I2C_HID [=3Dy]
> >   - I2C_HID_ACPI [=3Dy] && HID_SUPPORT [=3Dy] && I2C_HID [=3Dy] && ACPI=
 [=3Dy]
> >   - I2C_HID_OF_GOODIX [=3Dy] && HID_SUPPORT [=3Dy] && I2C_HID [=3Dy] &&=
 OF [=3Dy]
> > x86_64-linux-ld: vmlinux.o: in function `i2c_hid_core_remove':
> > (.text+0xfc8826): undefined reference to `drm_panel_remove_follower'
> > x86_64-linux-ld: vmlinux.o: in function `i2c_hid_core_probe':
> > (.text+0xfc8da0): undefined reference to `drm_is_panel_follower'
> >
> > Add the corresponding DRM||!DRM dependencies on each one that
> > is affected.
> >
> > Fixes: 96a37bfd232ae ("HID: i2c-hid: Support being a panel follower")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  drivers/hid/i2c-hid/Kconfig | 4 ++++
> >  1 file changed, 4 insertions(+)
>
> This makes sense. Thanks for the fix!
>
> I'm happy to land this in drm-misc-next (where the original patch
> landed), but I'd prefer an Ack from Benjamin first, if possible. If
> this is still outstanding tomorrow I'll land it anyway since it's a
> small fix and he Acked the commit that this is fixing.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

It's tomorrow, so I've landed this in drm-misc-next.

a0769f25a3a6 HID: i2c-hid: add more DRM dependencies


-Doug
