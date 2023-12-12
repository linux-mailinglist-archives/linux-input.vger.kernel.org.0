Return-Path: <linux-input+bounces-715-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 130F780E797
	for <lists+linux-input@lfdr.de>; Tue, 12 Dec 2023 10:29:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFF68282B2C
	for <lists+linux-input@lfdr.de>; Tue, 12 Dec 2023 09:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E17C584E1;
	Tue, 12 Dec 2023 09:29:05 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26F2AD2;
	Tue, 12 Dec 2023 01:28:58 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5d226f51f71so53119427b3.3;
        Tue, 12 Dec 2023 01:28:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702373337; x=1702978137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nNrspwMDd1TXigjJjtTO1FoVer0cHjsrMBMc4i4JSHM=;
        b=lRXzwWz/+fyeiiEEW2i5j7/cOy4HHtkuKhw9OFvX7TIMashiL0Gcd57d+Sm7gs58Cc
         tqo8IwqctWVyFAfBlbIhzizzksSanOhPiUmmKnrADa6FXxIRWxBul2HfZ1Ir/OypEkPF
         5xTlon4A9MzI4lEG4k1O1a2qlk6oX0uGUb6h5wjcne5g/B/7VpsDJPnsj1dQqrbRacJQ
         uhCD1/cDNPk+GCMX8U8dQM7CjQx6V49UuHlzpNXi0SSUsg0p4n2TM3tfAV1xZEPpZBg2
         RorVWGlncsb92BbVCmGH2loUf/vX+0rboxhKPrEca9O8dpaBEohrXi3W4ruE2+dXyLca
         oBVA==
X-Gm-Message-State: AOJu0YwYnhnEqx9ogimH4fTAXY1ZL+heeEsSa5KWYe3q7vSqSThNjgaY
	I67wQpqsWoIf35mqv2TNlJrsbH8QrJV0PQ==
X-Google-Smtp-Source: AGHT+IFyXnwrDgP+TDpGYrKYHPQMGL+H6908tj9tJvjPh9dGVk4D346n7h4oekkh3EatoAE/+iAZTg==
X-Received: by 2002:a81:6003:0:b0:5d7:1940:dd73 with SMTP id u3-20020a816003000000b005d71940dd73mr4779042ywb.73.1702373337243;
        Tue, 12 Dec 2023 01:28:57 -0800 (PST)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id v7-20020a81a547000000b005869ca8da8esm3550765ywg.146.2023.12.12.01.28.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 01:28:56 -0800 (PST)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dbcb353eb1dso976894276.3;
        Tue, 12 Dec 2023 01:28:56 -0800 (PST)
X-Received: by 2002:a25:fc26:0:b0:dbc:bbc2:3cd with SMTP id
 v38-20020a25fc26000000b00dbcbbc203cdmr197591ybd.82.1702373336593; Tue, 12 Dec
 2023 01:28:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231211165708.161808-1-biju.das.jz@bp.renesas.com>
 <20231211165708.161808-3-biju.das.jz@bp.renesas.com> <CAMuHMdWEH274CJTpMVY1c7rL0BrpHcjWDp0Acb5evDHotBEzTg@mail.gmail.com>
 <TYCPR01MB112699325FAC71E81546D258B868EA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB112699325FAC71E81546D258B868EA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Dec 2023 10:28:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV6sPuRp3=5T43Ruu2P3mMB5C5w4=QS_GVVxT8GuwRDpA@mail.gmail.com>
Message-ID: <CAMuHMdV6sPuRp3=5T43Ruu2P3mMB5C5w4=QS_GVVxT8GuwRDpA@mail.gmail.com>
Subject: Re: [PATCH 2/3] Input: da9063 - Use dev_err_probe()
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Support Opensource <support.opensource@diasemi.com>, 
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Tue, Dec 12, 2023 at 10:03=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Mon, Dec 11, 2023 at 5:57=E2=80=AFPM Biju Das <biju.das.jz@bp.renesa=
s.com>
> > wrote:
> > > Replace dev_err()->dev_err_probe() to simpilfy probe().
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> OK, I will send
>
> 1) separate patch for dropping unneeded prints related to OOM
> 2) A patch for replacing dev_err()->dev_err_probe() + Update error messag=
e for devm_request_threaded_irq()
> 3) separate patch for dropping print message for input_register_device();
>
> Is it ok?

Personally, I'd be fine with just a single "cleanup error printing" patch.
But Dmitry has the final say.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

