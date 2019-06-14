Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FCD246807
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2019 21:10:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725889AbfFNTKE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jun 2019 15:10:04 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46812 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725802AbfFNTKE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jun 2019 15:10:04 -0400
Received: by mail-pg1-f194.google.com with SMTP id v9so2036720pgr.13
        for <linux-input@vger.kernel.org>; Fri, 14 Jun 2019 12:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6lqY9qj3FXvhL7X9FVCyVKf2cgudUiUC+bfdYqXqJGI=;
        b=nGWAB+COOBn9dBGJOKudwxLl47G+Wjd0XYP9j9MypIG0IlGsdC4zR8kCZ968KGFC8d
         wsmF1jw3sTo3pvrUBj/IQ1XBBaYfM7v9lmx9IMFHVBBDbChmr6hBF/Abb3pr9gafYlEZ
         J6D1ZtmOxqPiE2VHTueKPcHzaa9cMzBfzVSAruOrGOaKHCEcNsn8A0SYL9kvHBpTKtrH
         x7AJ49cWSSGmfh1zXp/QIaFLSwJwQfh+zUZsz15UeX/9EW6Rzrcc+5PgNxlLd1nXQE3+
         zW4Keh32+wFPOXQ9Vd54TtLxOYz4Rsw9CqSGZT3pIqblUd4hHICBp/ErvzQ0ei+u3nUg
         dSxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6lqY9qj3FXvhL7X9FVCyVKf2cgudUiUC+bfdYqXqJGI=;
        b=UbOOojRy1CSOjtMsWj4NzWEvBCFtan7643WbQjsOSAkfjle4ZoiVWDr/+sOv1RG6bc
         6RowuxQIxAXIUmMxi10QMHdg9rGTM1McJWGmsraPKBEmkefDQV2nT6jnxhgsof96gjqp
         edyCtfXeqjxP0WdEFhVNHVdy+DVRWHwjzr2/kr2wgOBDhaE/FZdwAh/L54tL6hzFTCuL
         apDBksh3nCITTmbPT5b08n5N4qlneXnJdrtgwqV8rxWt0y52Kr5rClfNuTuZIc0iaGEG
         sZymqLv4JmEL6sB0qkpPWz9G4HwWylQmAaXHHeqQbwr0kGa/T7Q932faWmDosGuO2Dq2
         GT0A==
X-Gm-Message-State: APjAAAWIvK2DQRtYIYiOa9LS2FuK250M8LeaY5S6g19Nbmltw05yclY0
        KTlzd3xwE/TI4Tw8um/xxajLvg==
X-Google-Smtp-Source: APXvYqzhOnQwTfs+iDSGdltJmmDXV4ZTX5Vx1XafZKS1r8efkdns+RLWJpHjxTOHA4rF+IUpqUyLdQ==
X-Received: by 2002:a63:c10d:: with SMTP id w13mr1699713pgf.28.1560539402988;
        Fri, 14 Jun 2019 12:10:02 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:bc61:d85d:eb16:9036])
        by smtp.gmail.com with ESMTPSA id w132sm3479366pfd.78.2019.06.14.12.10.01
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 12:10:02 -0700 (PDT)
Date:   Fri, 14 Jun 2019 12:09:57 -0700
From:   Benson Leung <bleung@google.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Enrico Granata <egranata@google.com>,
        Ting Shen <phoenixshen@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Pi-Hsun Shih <pihsun@chromium.org>,
        Enrico Granata <egranata@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Guenter Roeck <groeck@chromium.org>,
        Brian Norris <briannorris@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        linux-input@vger.kernel.org,
        Colin Ian King <colin.king@canonical.com>,
        gwendal@chromium.org, Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] Input: cros_ec_keyb: mask out extra flags in event_type
Message-ID: <20190614190957.GA243443@google.com>
References: <20190614065438.142867-1-phoenixshen@chromium.org>
 <CAPR809sASD=MrQkJULVBgc_iqiPKE2xr8eUR0d4qymQkLUYRaw@mail.gmail.com>
 <20190614185533.GA142889@dtor-ws>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline
In-Reply-To: <20190614185533.GA142889@dtor-ws>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

On Fri, Jun 14, 2019 at 11:55:33AM -0700, Dmitry Torokhov wrote:
> On Fri, Jun 14, 2019 at 11:27:03AM -0700, Enrico Granata wrote:
> > On Thu, Jun 13, 2019 at 11:54 PM Ting Shen <phoenixshen@chromium.org> w=
rote:
> > >
> > > http://crosreview.com/1341159 added a EC_MKBP_HAS_MORE_EVENTS flag to
> > > the event_type field, the receiver side should mask out this extra bi=
t when
> > > processing the event.
> > >
> > > Signed-off-by: Ting Shen <phoenixshen@chromium.org>
> >=20
> > Reviewed-by: Enrico Granata <egranata@google.com>
>=20
> EC_MKBP_EVENT_TYPE_MASK is not in Linus' tree. It would be better to
> merge this path through whatever tree that is bringing in that
> definition.
>=20
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Yup, this looks like it's coming in through Lee's MFD tree, a series from
Gwendal to update cros_ec_commands.h.

784dd15c930f mfd: cros_ec: Fix event processing API

That commit is in the immutable branch for v5.3 here:
 git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-cros-v5.3

I'd recommend the chrome-platform tree since we'll be pulling in that IB too
for some other refactoring Enric is working on.

Thanks,
Benson

>=20
> Thanks.
>=20
> --=20
> Dmitry

--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCXQPxBQAKCRBzbaomhzOw
wjbnAP9f8fuB3qp/BLcnKIDCaVJuUkXv7kRFVev0gUsyOwWh+gD9GYkTyM0et9Iq
t823F3GYAzo2PQLkdpuRbESWLoCW1wU=
=Lfmp
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--
