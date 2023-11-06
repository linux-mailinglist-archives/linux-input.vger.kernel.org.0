Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 206777E2C74
	for <lists+linux-input@lfdr.de>; Mon,  6 Nov 2023 19:55:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232329AbjKFSz2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Nov 2023 13:55:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232542AbjKFSz2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Nov 2023 13:55:28 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 772D7EA
        for <linux-input@vger.kernel.org>; Mon,  6 Nov 2023 10:55:25 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9d2e7726d5bso715615066b.0
        for <linux-input@vger.kernel.org>; Mon, 06 Nov 2023 10:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699296923; x=1699901723; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hq98Gg4NJjOvWLJEpkFCz5lW1CjebvluI31GxJZEO/s=;
        b=oEYm9fTx85RCy7qkcbPpZfM/WEc2kfZ43s7DsD7Ztti9OxRPMzLd1ZQNWTNT48ug6T
         UjW9Jdk5WSWdi3TL0apIHEcYgIGU4FZmzGfHZndglC0vktLfxzGS/K47hzdHXWkjIkev
         l3/iQ6ewqOpqnrLSgle/kv0iZtV8vX6D3Og5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699296923; x=1699901723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hq98Gg4NJjOvWLJEpkFCz5lW1CjebvluI31GxJZEO/s=;
        b=ulehF938cC67LQBfLKo2v9y1UJcM9CDiPkrUGDdjKjb3kykd+Ofz0zAwOK7s4IZPEt
         jpzE+bEnblENgaa8HtpDr5+6LJCw6dYbIlaXsVNunZzG14vYSkIiTTs/PnHZsOHLDjg8
         4CQkqjDQ+3JK1Ak37Z9WOrY0z8PqEXkw0Yo8Kx2lB65xmmEpc7LHin3hXcJNkAkaf0Do
         g5xOlQL+n+GFF4U6YCFkDEXcNjVQfnkHhfuX0yT2u3gYPlNh2kjfdLCKqUp3FVEv5t90
         kpUPF2Fjw5s4nek0B2p64APcSt9YT8PPXCnrnLWLaJvNGzuPSuPXO7o21ZtUuVT1ltfO
         4fsw==
X-Gm-Message-State: AOJu0YyQTLtMHNFLZIfYr2CC5beGbPOfHW1Vk+PoqxDRgFh00m1pyl3p
        rlYL/rzAO1174ZO51JY6B9p0Slnko7+AjDkqfEGMaopy
X-Google-Smtp-Source: AGHT+IHNzymddfth2MfIdQtM1JFl/zK/16QzgISYIdQNV2uPU10V++jjBswEeZbyXSw3mTilSK2IRw==
X-Received: by 2002:a17:907:3ea7:b0:9d3:afe1:b3e5 with SMTP id hs39-20020a1709073ea700b009d3afe1b3e5mr14478725ejc.75.1699296922875;
        Mon, 06 Nov 2023 10:55:22 -0800 (PST)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id lc13-20020a170906f90d00b009a1c05bd672sm137008ejb.127.2023.11.06.10.55.19
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Nov 2023 10:55:19 -0800 (PST)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40837124e1cso10655e9.0
        for <linux-input@vger.kernel.org>; Mon, 06 Nov 2023 10:55:19 -0800 (PST)
X-Received: by 2002:a05:600c:3107:b0:400:c6de:6a20 with SMTP id
 g7-20020a05600c310700b00400c6de6a20mr12628wmo.3.1699296918899; Mon, 06 Nov
 2023 10:55:18 -0800 (PST)
MIME-Version: 1.0
References: <20231104111743.14668-1-hdegoede@redhat.com> <20231104111743.14668-8-hdegoede@redhat.com>
In-Reply-To: <20231104111743.14668-8-hdegoede@redhat.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 6 Nov 2023 10:55:06 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U0NhrUmxWFUGZ-ASdrFZke-f0UAbmn1GN7U9_iKYtMsA@mail.gmail.com>
Message-ID: <CAD=FV=U0NhrUmxWFUGZ-ASdrFZke-f0UAbmn1GN7U9_iKYtMsA@mail.gmail.com>
Subject: Re: [PATCH 7/7] HID: i2c-hid: Renumber I2C_HID_QUIRK_ defines
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Julian Sax <jsbc@gmx.de>, ahormann@gmx.net,
        Bruno Jesus <bruno.fl.jesus@gmail.com>,
        Dietrich <enaut.w@googlemail.com>, kloxdami@yahoo.com,
        Tim Aldridge <taldridge@mac.com>,
        Rene Wagner <redhatbugzilla@callerid.de>,
        Federico Ricchiuto <fed.ricchiuto@gmail.com>,
        linux-input@vger.kernel.org
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

On Sat, Nov 4, 2023 at 4:18=E2=80=AFAM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> The quirks variable and the I2C_HID_QUIRK_ defines are never used /
> exported outside of the i2c-hid code renumber them to start at
> BIT(0) again.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/hid/i2c-hid/i2c-hid-core.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
