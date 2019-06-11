Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A9AB3D3C2
	for <lists+linux-input@lfdr.de>; Tue, 11 Jun 2019 19:17:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405962AbfFKRRP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Jun 2019 13:17:15 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44376 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405961AbfFKRRP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Jun 2019 13:17:15 -0400
Received: by mail-wr1-f66.google.com with SMTP id b17so13907051wrq.11;
        Tue, 11 Jun 2019 10:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WaysXXkkuoEHakv+09ZE71GtoG0EGkx2i9RGt2yoHmc=;
        b=Gw/VSc3AnA7Gr+HwzDQepHUcTpPyOFmn3qNRuXg6MASXyOWVjp8iV9BCA21lQ33t8X
         GdaHNBSSlbpOKjr5Ubl4dTm3jExQaVeYlGlQSf0uJ6ksxI83vAcX2glkuZ8bQaH2HUH9
         BE1ON2NQjrOAPDvA4ZyqFVJshZKVU0SQzdKNksTkE1Iu4JMmtSlTf3Mrx9mLTWRkoNkz
         5b0Lz+lK5XmK7NZ+HKNsVvAd4fNccgYKb02gZs0Zq20TA7bR3wJxl/AywrD19AZlyDLT
         BTAmLMN/7jNP5TZLUzcLenMeQCWgroZNS+aGdoBFF5ITT56jHBG2wu1kDHonngZ/pOgb
         vGhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WaysXXkkuoEHakv+09ZE71GtoG0EGkx2i9RGt2yoHmc=;
        b=DEFiVbWtjzMk3VU0ltwz9cuNTmMI+TQx60k7YU2ZSs9YESqw1md+fBsGI2H4tx3ks9
         9eXyElKDnXBMMjbNeQaBN4tZnZM4Rfp+iIBq0nw0zC3OOLEoe7lw+6nTarstRZcuuExP
         WdnN8Y1ArNNH7v1h8HhjgcRHO8yfy+4p4ImLJiqU0k5K9+lyTUUkxrjQh4gRFzCgnZAu
         ErxwVme1ElVQKnJstoBoIu91d6GY7NP1z0LoJX8VNrQXSp5c79cWy7uhHt1oBuIfOhWt
         6M+gJh8Wnb8DPz92EUKrqb9FzT3K0OVhAeWM3GZXtFIEgymG7fFCVjtVPHAxCFX0zLV7
         0LVw==
X-Gm-Message-State: APjAAAWhlnNRkXy22RnxGaJVgoJcsccTgOlxkmBf4FDDVPfSrfSCqA3D
        51Rc6o7NgxjZAHu+WXfChSNortwI7+U=
X-Google-Smtp-Source: APXvYqzgK+PWwgzwutUSp+2qsuLb5idLiN82ARL0NpGt1eyHQ4rSs6bViF6O7gzpj+V1EempEVeoaA==
X-Received: by 2002:adf:aa09:: with SMTP id p9mr30515859wrd.59.1560273433335;
        Tue, 11 Jun 2019 10:17:13 -0700 (PDT)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id h1sm14299801wrt.20.2019.06.11.10.17.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jun 2019 10:17:12 -0700 (PDT)
Date:   Tue, 11 Jun 2019 19:17:07 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
Cc:     Hui Wang <hui.wang@canonical.com>,
        Xiaoxiao Liu <xiaoxiao.liu-1@cn.alps.com>,
        XiaoXiao Liu <sliuuxiaonxiao@gmail.com>,
        "peter.hutterer@who-t.net" <peter.hutterer@who-t.net>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Xiaojian Cao <xiaojian.cao@cn.alps.com>,
        "zhangfp1@lenovo.com" <zhangfp1@lenovo.com>,
        Naoki Saito <naoki.saito@alpsalpine.com>,
        Hideo Kawase <hideo.kawase@alpsalpine.com>
Subject: Re: =?utf-8?B?562U5aSNOiDnrZTlpI06IOetlA==?=
 =?utf-8?B?5aSNOiBbUEFUQ0g=?= =?utf-8?Q?=5D?= input: alps-fix the issue alps
 cs19 trackstick do not work.
Message-ID: <20190611171707.tydk7rsmtzmjohky@pali>
References: <20190528071824.jimhixhtsynzwixe@pali>
 <OSBPR01MB48556FD88D7F7D5F91CB5579DA1E0@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <OSBPR01MB4855707AC8ABB7CFBE5BBBD5DA130@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <OSBPR01MB4855A2A30A4F5E6BDCFE715FDA130@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <20190610104310.qa5snt7jpcljodfv@pali>
 <OSBPR01MB485504868362073ED434F82FDAED0@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <ed65f8af-fefb-3c40-e7b1-dde3605f30e3@canonical.com>
 <5587ddb9-fb5f-03db-ac11-a696c85c5f2f@canonical.com>
 <20190611072333.nd4va4q2m5epmukc@pali>
 <20190611170707.GA143729@dtor-ws>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="yk3mp3oui5gzabch"
Content-Disposition: inline
In-Reply-To: <20190611170707.GA143729@dtor-ws>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--yk3mp3oui5gzabch
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tuesday 11 June 2019 10:07:07 dmitry.torokhov@gmail.com wrote:
> On Tue, Jun 11, 2019 at 09:23:33AM +0200, Pali Roh=C3=A1r wrote:
> > On Tuesday 11 June 2019 12:32:33 Hui Wang wrote:
> > > On 2019/6/11 =E4=B8=8A=E5=8D=8811:23, Hui Wang wrote:
> > > > On 2019/6/11 =E4=B8=8A=E5=8D=8811:05, Xiaoxiao Liu wrote:
> > > > > Hi Pali,
> > > > >=20
> > > > > I discussed with our FW team about this problem.
> > > > > We think the V8 method means a touchpad feature=C2=A0 and does no=
t fit
> > > > > the CS19 trackpoint device.
> > > > > CS19 TrackPoint needn't=C2=A0 use any Absolute (Raw) mode and is =
usually
> > > > > use standard mouse data.
> > > > > CS19 TrackPoint device is a completely different device with
> > > > > DualPoint device of Dell/HP.
> > > > > CS19 TrackPoint device is independent=C2=A0 of Touchpad. (Touchpa=
d is
> > > > > connecting by I2C, TrackPoint is directly connecting with PS2 por=
t.)
> > > > > And it has completely another FW.
> > > > >=20
> > > > > So we think it is better to use the mouse mode for CS19 trackpoin=
t.
> > > >=20
> > > > Maybe here is some mis-understanding,=C2=A0 the mouse mode here doe=
sn't mean
> > > > we use psmouse-base.c for cs19 (bare ps/2 mouse), we plan to use
> > > > trackpoint.c to drive this HW, so this trackpoint has all features a
> > > > trackpoint should have.
> > > >=20
> > > And I sent a patch one month ago to let the the trackpoint.c to drive=
 this
> > > HW: https://www.spinics.net/lists/linux-input/msg61341.html, maybe th=
at
> > > patch is reference.
> >=20
> > So instead of creating blacklist, you should check for TP_VARIANT_ALPS
> > in alps.c and disallow its usage.
> >=20
> > Or maybe better, move trackpoint.c detect code before alsp.c detect code
> > in psmouse-base. And no changes in alps.c are needed.
>=20
> I'd be very cautions of moving around the protocol detection. It is very
> fragile, so if we can detect trackpoint-only case in alps.c and skip on
> to trackpoint I would prefer it.

The main problem is that proposed trackpoint-only check in alps.c is
basically what trackpoint.c is doing for checking if device is
trackpoint (via function trackpoint_start_protocol()).

So I'm not sure now what is the best solution...

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--yk3mp3oui5gzabch
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQS4VrIQdKium2krgIWL8Mk9A+RDUgUCXP/iEAAKCRCL8Mk9A+RD
Up7mAJ9bQIgZ06pMlZa1t6WOZ1oJCtYTxgCcC8h8NbVMVQgvRKYcG5H5EAHhWto=
=nHiP
-----END PGP SIGNATURE-----

--yk3mp3oui5gzabch--
