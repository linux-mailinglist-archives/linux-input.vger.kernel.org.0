Return-Path: <linux-input+bounces-385-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 905EA80192D
	for <lists+linux-input@lfdr.de>; Sat,  2 Dec 2023 01:56:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1B541C209A4
	for <lists+linux-input@lfdr.de>; Sat,  2 Dec 2023 00:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E32C5EC3;
	Sat,  2 Dec 2023 00:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e+GB7yqL"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01534196
	for <linux-input@vger.kernel.org>; Fri,  1 Dec 2023 16:56:48 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2c9ccf36b25so31275611fa.3
        for <linux-input@vger.kernel.org>; Fri, 01 Dec 2023 16:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701478605; x=1702083405; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=on0eUmIVBGIZNw/lnf6eJdI5XZ4MfrBWX3aiU7eK2L8=;
        b=e+GB7yqL0GbtFkD2+hDeIovRO8jfT4nbbefbB4vpVs7J8J5dsrItdSPjumpONn4mb5
         4U+pSpLbJONl1iY9ANw5MSlEOHXBjyH8BGkIMXwMd+wDSiwy/TECPllxtEePsOZSDo/K
         1olLBDK/dzZXyIOvM173QqFN2R+/ry7IZa6No=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701478605; x=1702083405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=on0eUmIVBGIZNw/lnf6eJdI5XZ4MfrBWX3aiU7eK2L8=;
        b=KzH6Nj0m/elNtzYfIEFoXLk6gpWHS3OXYxeAGpZeAZG4haSjhGsXAif6OZxf0n81D4
         s15zfbzPuRGPiPCNsCEQkzZ5844cd/NRYMeGzNQwhWnY7XyMc9cecIbuQvSh73C/sKut
         D5D7tfpnlCHyPe22ao0nFLRiQ3Ws92BQsBtr18qapGM7NdXWYR7lRH99YrRwdsCvuAde
         KKcNGWmRxkW8WlGX/3W/TIhkWHOCpDI3gLrh0WhPIlECljiTs27O2UXjBEaRGQYFUrF5
         8+bZAK01iIrZNcCJ54ob01zLPqFKrah2avabucUISxb7OwBCZDz8T4xtxfctqT8fl5aq
         xRWQ==
X-Gm-Message-State: AOJu0YzdVXF/rRKRfV9S4Vo3V81FjLYaghxOSFyCjq5mjjJD2NjkbAVK
	Lf5kVi2MY7bgH9r99QZVbPr+zgaH9Iw1ws4bIhfoU1JF
X-Google-Smtp-Source: AGHT+IFdzgfkZ5GTJiNDmyonvaKrn3ofaSLny9u5jORzVamk1YPfDQacy8XluqT2Jb6wukqv7xk65g==
X-Received: by 2002:a2e:81c3:0:b0:2c9:d3ab:8b4b with SMTP id s3-20020a2e81c3000000b002c9d3ab8b4bmr1644002ljg.44.1701478605571;
        Fri, 01 Dec 2023 16:56:45 -0800 (PST)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id y2-20020a2e9d42000000b002c54ee0cb77sm544585ljj.127.2023.12.01.16.56.45
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 16:56:45 -0800 (PST)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50bbf7a6029so1139e87.0
        for <linux-input@vger.kernel.org>; Fri, 01 Dec 2023 16:56:45 -0800 (PST)
X-Received: by 2002:a1c:6a0c:0:b0:408:3727:92c5 with SMTP id
 f12-20020a1c6a0c000000b00408372792c5mr311701wmc.2.1701478584358; Fri, 01 Dec
 2023 16:56:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128084236.157152-1-wenst@chromium.org> <20231128084236.157152-2-wenst@chromium.org>
In-Reply-To: <20231128084236.157152-2-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 1 Dec 2023 16:56:08 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V_v11eZ6+3gUwOvdWGNM9owG7zCK5EiezTY7RJ3eaEMw@mail.gmail.com>
Message-ID: <CAD=FV=V_v11eZ6+3gUwOvdWGNM9owG7zCK5EiezTY7RJ3eaEMw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/5] of: dynamic: Add of_changeset_update_prop_string
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
> @@ -1039,3 +1039,50 @@ int of_changeset_add_prop_u32_array(struct of_chan=
geset *ocs,
>         return ret;
>  }
>  EXPORT_SYMBOL_GPL(of_changeset_add_prop_u32_array);
> +
> +static int of_changeset_update_prop_helper(struct of_changeset *ocs,
> +                                          struct device_node *np,
> +                                          const struct property *pp)
> +{
> +       struct property *new_pp;
> +       int ret;
> +
> +       new_pp =3D __of_prop_dup(pp, GFP_KERNEL);
> +       if (!new_pp)
> +               return -ENOMEM;
> +
> +       ret =3D of_changeset_update_property(ocs, np, new_pp);
> +       if (ret) {
> +               kfree(new_pp->name);
> +               kfree(new_pp->value);
> +               kfree(new_pp);

Given that this is the 3rd copy of the freeing logic, does it make
sense to make __of_prop_free() that's documented to free what was
returned by __of_prop_dupe()?

