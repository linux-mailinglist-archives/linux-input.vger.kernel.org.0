Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4E9C70F3C8
	for <lists+linux-input@lfdr.de>; Wed, 24 May 2023 12:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230308AbjEXKKx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 May 2023 06:10:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbjEXKKu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 May 2023 06:10:50 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC984BF;
        Wed, 24 May 2023 03:10:49 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1ae3a5dfa42so659925ad.0;
        Wed, 24 May 2023 03:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684923049; x=1687515049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OKshTk4F9QVPSAyh2wH6wvvsO6NUvLxghil8WKBqIOI=;
        b=Rpkx8+xqTcHNWjjZa3rXg2ufm0F++oGcrSMNSLhFmzjGokRwVEbWgoaks6ClhflSce
         MkFqRow2nTjtAc0BWgEchTba40SxJSkKh+qm1lQsHQbhBUxRQN+zHGmHhAZersMasod2
         L4CsXfvmdZvDntVI54ssFriYH3LKqFcHDOvK8mBz34Gh9QtwFfoAc+LNPdSnvrfcps9/
         gYU/Tu1DoWJQZmrB6DCky6k8nP2hokYA3+ONZRjK7JYKIgGBQY/mY1Hp48GgBePuvFGQ
         bT5lZgTbjGeuYrUUDZp+ZbV2XVG86+MWZEKp9TXqkwuUDvoDWaPlxceLXzJSCx2hhxRC
         qZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684923049; x=1687515049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OKshTk4F9QVPSAyh2wH6wvvsO6NUvLxghil8WKBqIOI=;
        b=cYhGbPDvHJPw5/ByoUNn3CwpxGDev+x5kJTiQOPkuZdf6T/6cNWGDKUGzdBI7O1Ayk
         nF+KnN5kwT3AWm9/udbgnGsRYoOWhr4A3ZgddxGe8thDD9zH3HKcKemDG4m4sfHTUnjV
         Yy2o0YPGgkiNuvFDIrtzrJUf0pYDD2/Y4y6YJkdY6izrUNvM4n5r9JEZreKN82eNnFAC
         fMuwuHeW5TkXev6TLNx34OuUQrzlHEJOXpxcGWJAW0FvlgUcUMumOAd//dpqk+Zj0+rV
         NkC/+3VkV9ltIvhsr+GGl/+R2oMjXSWFCBIhGf0WztKnhcqJwvdE6pxy/4QrSE6pMDE0
         F7Ww==
X-Gm-Message-State: AC+VfDwAMNukh7qnC4FCKLOtYwvFZgDd6mVv1jbFDAIx0c8Wm4p6/dLY
        cnfLxkZmbaGarwumqMh3kWgl/Ac/gCk=
X-Google-Smtp-Source: ACHHUZ7Oy0YRt80g9VhUqsfwOARVdtsRiwEJf6XRVg3GlJESp60Uq+R5SpX+v+rp3KLZx4wa/AAFAQ==
X-Received: by 2002:a17:902:d501:b0:1ae:2e0d:b38c with SMTP id b1-20020a170902d50100b001ae2e0db38cmr19322667plg.12.1684923049138;
        Wed, 24 May 2023 03:10:49 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-28.three.co.id. [180.214.232.28])
        by smtp.gmail.com with ESMTPSA id d12-20020a170903230c00b001ac7c6fd12asm8367442plh.104.2023.05.24.03.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 03:10:48 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
        id 54270106A0A; Wed, 24 May 2023 17:10:45 +0700 (WIB)
Date:   Wed, 24 May 2023 17:10:45 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Haochen Tong <linux@hexchain.org>, stable@vger.kernel.org
Cc:     regressions@lists.linux.dev, linux-input@vger.kernel.org,
        Basavaraj Natikar <basavaraj.natikar@amd.com>
Subject: Re: amd_sfh driver causes kernel oops during boot
Message-ID: <ZG3ipauL9FTnQJiC@debian.me>
References: <f40e3897-76f1-2cd0-2d83-e48d87130eab@hexchain.org>
 <ZG2LXN2+Sa2PWJqz@debian.me>
 <ee2c30a5-3927-d892-2a66-00cd513c3899@hexchain.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Oqc3JrxTJwBoPC/u"
Content-Disposition: inline
In-Reply-To: <ee2c30a5-3927-d892-2a66-00cd513c3899@hexchain.org>
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--Oqc3JrxTJwBoPC/u
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 24, 2023 at 02:10:31PM +0800, Haochen Tong wrote:
> > What last kernel version before this regression occurs? Do you mean
> > v6.2?
> >=20
>=20
> I was using 6.2.12 (Arch Linux distro kernel) before seeing this regressi=
on.

Can you perform bisection to find the culprit that introduces the
regression? Since you're on Arch Linux, see its wiki article [1] for
instructions.

Thanks.

[1]: https://wiki.archlinux.org/title/Bisecting_bugs_with_Git

--=20
An old man doll... just what I always wanted! - Clara

--Oqc3JrxTJwBoPC/u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZG3ipQAKCRD2uYlJVVFO
oz+CAPwP430JY/PI70bKymcpuGulTPefXKmJNPRhxT8zC86X2QEApwQzWkHvgC2b
ze/+47FXy7VOT9KzVktrWCJ3QnfpOAA=
=ClE8
-----END PGP SIGNATURE-----

--Oqc3JrxTJwBoPC/u--
