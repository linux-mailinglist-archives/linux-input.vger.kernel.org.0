Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45203629E23
	for <lists+linux-input@lfdr.de>; Tue, 15 Nov 2022 16:54:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231713AbiKOPyd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Nov 2022 10:54:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231680AbiKOPyc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Nov 2022 10:54:32 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 300742CE0A
        for <linux-input@vger.kernel.org>; Tue, 15 Nov 2022 07:54:30 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id u24so22439420edd.13
        for <linux-input@vger.kernel.org>; Tue, 15 Nov 2022 07:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MXw2DcIrd4sYwZp2Qf6GO0lRe5Jh56EBfVUnFYKu6RE=;
        b=VdrMWd2C0zRlIU+FT+lgMorBgLSdXIaGdRiqQEjfe8ICZQFWZbSQJdhtD35B6a6TBT
         esMxNNkTUrQltwheZBCw0jpTcMirEaF3UBLCAQJNGSC5SvqsykCjHUMWADXOU4zkzN3N
         zRcvodFQ2fJTRSA/8SKxycjIaZ3P/YHyvJCNDYCbN9ow9C19ZSnTmkk8bvOL0M3lRLf8
         gtDCM0hKPwxajoUeptIpXUgt8dlhddD74sFXXX+qYapzoehSlThwIpxBYUp3g2URDHqf
         VdCp91/IM06Ap6P8h7XkNAyZa/Qo7AIm/hG/vv/5oRLcpePO4Rzhv5JYp3oS756qwqg/
         M58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MXw2DcIrd4sYwZp2Qf6GO0lRe5Jh56EBfVUnFYKu6RE=;
        b=nXLYf9jLWu/9Tl8HLwii9z7lcEwPIbZASFkgrgz5dyNeWy6A10ThxOodYAuKQakYyA
         7s5iRe51HvUN1prCu2STBP9x6uw/CtfPbpoqS/ekF2+iSpWVnQQkGXcdptrUx0a2ma36
         xk6qV5QsNhdWAUloo+82v8+s9jMhIoLRaLsp1B6aqxjwsZyCFPv/fXEBZU0LItS6aDFE
         vADOjmAVKjjjWJoNyETYqbv66F2+sZrtfJqQNsgFCinnHcsu2nvdsFcQ+0W+wswtnu22
         af8nKUKXV4rEA8i4mJ2LUlCbtWK4a7p356V6w3Hk2vbu52NSlJCTUssei0RD9Bp5YXkf
         WTZA==
X-Gm-Message-State: ANoB5pnDhfqSJYR4LQwXfKkTJxK/uggbhVL7ZasLKTwNNs17aZBF/TL6
        44QWN7Pe2IlaWS3LUP+g5CzJPeiy68l1Km+YCRlV+A==
X-Google-Smtp-Source: AA0mqf5TE5bV3zOgHOtylol+IUxKYYKrgvfQtjxF4BS+55SiwwnZkcIcQo0LiUhdzLshA1UMU7fopza3TqY0XOlXoGY=
X-Received: by 2002:a50:fd9a:0:b0:461:b279:1175 with SMTP id
 o26-20020a50fd9a000000b00461b2791175mr15686083edt.124.1668527668323; Tue, 15
 Nov 2022 07:54:28 -0800 (PST)
MIME-Version: 1.0
References: <20221005-mt6357-support-v4-0-5d2bb58e6087@baylibre.com>
 <20221005-mt6357-support-v4-5-5d2bb58e6087@baylibre.com> <fe898d24-54fa-56bb-8067-b422a3a52ff5@collabora.com>
 <CAFGrd9r70XRd=4Ogei+U2QXQny7LhWr9bDCRNYco+Bsy+2XqrA@mail.gmail.com> <c426918a-8d63-5c40-4340-6c918296814f@linaro.org>
In-Reply-To: <c426918a-8d63-5c40-4340-6c918296814f@linaro.org>
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Tue, 15 Nov 2022 16:54:17 +0100
Message-ID: <CAFGrd9o5GmqMS=MRq+EM+_T5kcHS2qftP0g0smu2W4QXBLozLA@mail.gmail.com>
Subject: Re: [PATCH v4 5/9] dt-bindings: soc: mediatek: convert pwrap documentation
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Fabien Parent <fabien.parent@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Mark Brown <broonie@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Lee Jones <lee@kernel.org>,
        Chen Zhong <chen.zhong@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        Fabien Parent <fparent@baylibre.com>,
        linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Le mar. 15 nov. 2022 =C3=A0 15:18, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> a =C3=A9crit :
> >>> +maintainers:
> >>> +  - Alexandre Mergnat <amergnat@baylibre.com>
> >>
> >> I say that the maintainer for pwrap is Flora Fu <flora.fu@mediatek.com=
>....
> >
> > Flora Fu is the driver maintainer. As described in
> > Documentation/devicetree/bindings/writing-schema.rst:
> > maintainers
> >   A DT specific property. Contains a list of email address(es)
> >   for maintainers of this binding.
> >
> > My  understanding is this field is only for binding maintainers, but
> > not related driver maintainers. Are we aligned ?
>
> Usually driver maintainer should be also binding maintainer. You can
> have more binding maintainers than drivers (and vice versa), but it's
> less usual to maintain driver and do not care about its Devicetree
> binding (unless driver is also for ACPI etc. but that's not the case here=
?).

Ok, thanks for the explanations

Regards,
Alex
