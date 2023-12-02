Return-Path: <linux-input+bounces-388-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C63D801944
	for <lists+linux-input@lfdr.de>; Sat,  2 Dec 2023 02:04:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83D4A281BD7
	for <lists+linux-input@lfdr.de>; Sat,  2 Dec 2023 01:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84251EC3;
	Sat,  2 Dec 2023 01:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PaDdeNJP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC274D54
	for <linux-input@vger.kernel.org>; Fri,  1 Dec 2023 17:04:38 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c9afe6e21fso37777481fa.0
        for <linux-input@vger.kernel.org>; Fri, 01 Dec 2023 17:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701479076; x=1702083876; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2AjpI9QlzX4/sI/azrgjTOEsQmOURin+5qeGoAR1AD0=;
        b=PaDdeNJPDNh0ignJrHhV4gQubECEuPhUO+RjRF/bS3ZqFXouS0qk0Kxe0GAYTSDb9k
         3K9xXAYY261e1JSO85i/I0X98hTER5Fjww1YJzci9GAKKaY63TC1Qq9CjiE4sud/og8I
         HipnDHH8KmTLgXfQ90phQHR1rUP5p94qdjguA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701479076; x=1702083876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2AjpI9QlzX4/sI/azrgjTOEsQmOURin+5qeGoAR1AD0=;
        b=dov6lzpDOcq1HOpHYzS1/GY9Vg+apxQXyoUMHNYGmEorAYVs+INMT3/s2T531R/7hn
         zhv4dcv87WyJ1GjQDWHnLmkQNjaIUdntcXI/w4L3ZF+pC67rrgOh1IIQ3DwXCtLaTMPB
         7/ss/L0BXZ/zAwtesXIy5puyE0xgrUd6fGfOhMu/NkkvlHGjUg3cCZaDjEQdW+STd0Wv
         dRKdmWOcQ8NGj2E1j7Hby4l0xjbvyUIvrard817JdtqPN/4MEUoJS7y/76jSP5RzDXm9
         maDnPg82SeF4pq6b/BJRArlJpb5UeKVk24/ZM1Dq54ZFs1XbzOGcj0tHOQ/vNxJs+x5U
         80Ow==
X-Gm-Message-State: AOJu0Yz82tNoB5qg2wTFGV/NPEgd+G5olcfPcK0tRMXg7SoB0ubnOj2x
	SaOf4cPqQTLlfHXCWoKvzIOnrRA/IAnUAYgkayMFK9aU
X-Google-Smtp-Source: AGHT+IEori+mry4QqLMql1xKo0sf0I3Ek3Am52ZtsQAantRsGW6zVbInI44+0ALojDc++T9Y6gA2xA==
X-Received: by 2002:a2e:97c8:0:b0:2c9:c00d:9527 with SMTP id m8-20020a2e97c8000000b002c9c00d9527mr1301089ljj.6.1701479076472;
        Fri, 01 Dec 2023 17:04:36 -0800 (PST)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id i23-20020a170906115700b00a18ed83ce42sm2230988eja.15.2023.12.01.17.04.35
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 17:04:35 -0800 (PST)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-548ae9a5eeaso2194a12.1
        for <linux-input@vger.kernel.org>; Fri, 01 Dec 2023 17:04:35 -0800 (PST)
X-Received: by 2002:a7b:c4c6:0:b0:40b:3d89:ba70 with SMTP id
 g6-20020a7bc4c6000000b0040b3d89ba70mr237236wmk.7.1701478730440; Fri, 01 Dec
 2023 16:58:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128084236.157152-1-wenst@chromium.org> <20231128084236.157152-5-wenst@chromium.org>
In-Reply-To: <20231128084236.157152-5-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 1 Dec 2023 16:58:34 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W01gfxV6RN2o6CVS7jjf8qgKP-jUy9Bp94d2hWzVC48A@mail.gmail.com>
Message-ID: <CAD=FV=W01gfxV6RN2o6CVS7jjf8qgKP-jUy9Bp94d2hWzVC48A@mail.gmail.com>
Subject: Re: [RFC PATCH v3 4/5] arm64: dts: mediatek: mt8173-elm-hana: Mark
 touchscreens and trackpads as fail
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	andriy.shevchenko@linux.intel.com, Jiri Kosina <jikos@kernel.org>, 
	linus.walleij@linaro.org, broonie@kernel.org, gregkh@linuxfoundation.org, 
	hdegoede@redhat.com, james.clark@arm.com, james@equiv.tech, 
	keescook@chromium.org, rafael@kernel.org, tglx@linutronix.de, 
	Jeff LaBundy <jeff@labundy.com>, linux-input@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 28, 2023 at 12:45=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> @@ -44,6 +46,7 @@ trackpad2: trackpad@2c {
>                 reg =3D <0x2c>;
>                 hid-descr-addr =3D <0x0020>;
>                 wakeup-source;
> +               status =3D "fail-needs-probe";

While doing this, you could also remove the hack where the trackpad
IRQ pinctrl is listed under i2c4.

