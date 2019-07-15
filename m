Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A38246999A
	for <lists+linux-input@lfdr.de>; Mon, 15 Jul 2019 19:16:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731464AbfGORP7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Jul 2019 13:15:59 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39388 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731244AbfGORP7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Jul 2019 13:15:59 -0400
Received: by mail-wm1-f68.google.com with SMTP id u25so5628772wmc.4
        for <linux-input@vger.kernel.org>; Mon, 15 Jul 2019 10:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=FNxPnNjrhaymf1XAHtIGv/gQ9vQ6MLl4cIB5EWdtR/A=;
        b=djPROzqJKvIgOniZdoaEq8YRE8C+2Xyzt/0cbOAcQh9EFMyA3BGBvO5zbo/zvNWPVx
         RwXQS5uQTPoGntFDiPuSWJFxFvCrTtf9mVWaJaR9dw2lRY1WR0f1UqbiTOSSHksbHvt5
         B86+QX+TJRX17tIwC3ZV8WnoZGyd4JIvLKxfcIywErrHFRU9uqBLOtH+X+GdYBH3bmBo
         sNgkWQKSfQOL/7wu9ZCa6aONkXoEirFIsIwDnTpcfl6AgP4Sl22qyROOiMraea7oAgJV
         CgezribgDXhmmAPj/7BjSkP7r5a7ibSRFqK/m6YT0VeWkzATZZqPczFP6ssFJMFakpNK
         Gh8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FNxPnNjrhaymf1XAHtIGv/gQ9vQ6MLl4cIB5EWdtR/A=;
        b=NhSv6/rNHb6KbQWLniE23JTGYWnO0dYxcIRrnlewPZNyJqEsOtMCct4dRcKBRqHM/B
         SXVlveEc6Ad76kbSCc2GONNl6p/LUT7McWu2CFtIOu366BqUmCxO9yUssGakqpVACUQ0
         HfUlVJ03V/BkOojAOppRgTAYaosX8UQQRwDdk79GMZGNbn9fxx+GkRZqegOyqZpsN4K4
         9iUDSUrU57A6fxKPsgLDROtAj5yRhIujjD3TbWyzw0vsFZWNH+VY+7ahICT5X87g8Xt3
         bKHWshTF4p6z4xqTUVxN3XpvT60qbTWP8EzbXhA97jBX38hy2BWjgAdlIdiV80UekrEU
         o7RQ==
X-Gm-Message-State: APjAAAV3QOAwbd6E4K1oDl4moftpve0yQhZygGRS2sBNRqnq8BAxJiGo
        uUnzVmnK+jfglap/iHgTpZY=
X-Google-Smtp-Source: APXvYqxyPNBFZfJrBOFIpI20blQ8HqVXrsAmhxhRw75fSnbqgIiQAOijfrwl2aN1a6jgWNaFyqeD4A==
X-Received: by 2002:a1c:9a4b:: with SMTP id c72mr467874wme.102.1563210957336;
        Mon, 15 Jul 2019 10:15:57 -0700 (PDT)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id z1sm19386992wrv.90.2019.07.15.10.15.56
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jul 2019 10:15:56 -0700 (PDT)
Date:   Mon, 15 Jul 2019 19:15:55 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hui Wang <hui.wang@canonical.com>, linux-input@vger.kernel.org,
        xiaoxiao.liu-1@cn.alps.com, sliuuxiaonxiao@gmail.com,
        zhangfp1@lenovo.com
Subject: Re: [PATCH v5 RESEND] Input: alps - Don't handle ALPS cs19
 trackpoint-only device
Message-ID: <20190715171555.ujep6ku3564cf3vj@pali>
References: <20190708022458.2585-1-hui.wang@canonical.com>
 <20190715171042.GA131063@dtor-ws>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ijrrg2vyhypxf7dp"
Content-Disposition: inline
In-Reply-To: <20190715171042.GA131063@dtor-ws>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--ijrrg2vyhypxf7dp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Monday 15 July 2019 10:10:42 Dmitry Torokhov wrote:
> Hi Hui,
>=20
> On Mon, Jul 08, 2019 at 10:24:58AM +0800, Hui Wang wrote:
> > +	if ((param[0] =3D=3D TP_VARIANT_ALPS) && (param[1] & 0x20)) {
> > +		if (IS_ENABLED(MOUSE_PS2_TRACKPOINT))
> > +			psmouse_dbg(psmouse,
> > +				    "ALPS CS19 trackpoint-only device detected, not using ALPS tou=
chpad driver\n");
> > +		else
> > +			psmouse_warn(psmouse,
> > +				     "ALPS CS19 trackpoint-only device detected but MOUSE_PS2_TRAC=
KPOINT not enabled, fallback to bare PS/2 mouse\n");
>=20
> I do not think that trackpoint driver not being enabled deserves a
> warning, especially coming from unrelated driver. As far as I understand
> the device still works reasonably well when handled as generic mouse.
>=20
> I condensed both messages down to "ALPS CS19 trackpoint-only device
> detected, ignoring", moved it down to alps_is_cs19_trackpoint() call
> site, and applied the patch.
>=20
> Keeping Pali's reviewed-by as the core idea of the patch has not
> changed.
>=20
> Thanks.
>=20

Ok, I'm fine with it. Debug message is still a good idea for debugging
purposes, why alps.c decided to not handle particular ALPS device.

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--ijrrg2vyhypxf7dp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQS4VrIQdKium2krgIWL8Mk9A+RDUgUCXSy0yQAKCRCL8Mk9A+RD
UmnQAJ9Oaq/6BZXKbS8o4oczTpNf+ZZCGgCeL3dt1f/vh2bEmk+j+9Yf9SScWfQ=
=0unl
-----END PGP SIGNATURE-----

--ijrrg2vyhypxf7dp--
