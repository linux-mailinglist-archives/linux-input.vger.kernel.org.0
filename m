Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3688723559
	for <lists+linux-input@lfdr.de>; Tue,  6 Jun 2023 04:36:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234148AbjFFCgr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 5 Jun 2023 22:36:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230491AbjFFCgq (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 5 Jun 2023 22:36:46 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECA1910F;
        Mon,  5 Jun 2023 19:36:45 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2566ed9328eso4766770a91.2;
        Mon, 05 Jun 2023 19:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686019005; x=1688611005;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=forzF7x9ap1s3sdBeXdIPn+wCjalJOzafD/pj6NI2Fw=;
        b=kOMx0UElNi84z3O0qQZ2mHwe8w7eb7/owU5M5V5n0lu66ExmjY8u66ku+lSaux59Mq
         wXP9OxaAFfdD5tPl544z6U+7FL+nWwHmE0jdYSI9JngVF3P4fqCGrJB//zE43cfLAhNt
         e9WQJkxjuw+ip5g54xJLKNdzi7TtjD7zOu2p+73t7JcphCUTxB3rmRk9BNVj1KGcTnvy
         60tYRexKPckhPU0gWkk91jw9yOQpQkDG3ItR+mvEdCcBdiiQLle4BLW5vKApXl6Qd0U1
         gdruDyKsVvgNRPQiDsZoN8x/WXz/gpdLMaYtQMgvzMUkvKXmr1986FbOV02ysJmElWzz
         skJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686019005; x=1688611005;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=forzF7x9ap1s3sdBeXdIPn+wCjalJOzafD/pj6NI2Fw=;
        b=VklIWjSp4FELwcriO0JUZxJinziclVf7A8enH+otUIL5iMvxdjmxol8exZy78jQ7a7
         YrFQ39hNA2XwIVFMkehTQyC5HbfmdgY6bB5nAE5t3/D2d8ljyp9e0dbJYZDrxffZBo8r
         cPoj4hujuT4puQ46/XO6EmAsbwSLseAxp8da2bUhs/TjEWSEhdx8KxnpyeXuwoRztHBW
         rN//KWBV7tZ6ICHNbq7RAqDFVUoifbIRTVXF2OiCBcb1Yc7CDJyRR9yK44uZBDCW+Zoe
         7c19yFPk0ZYvTLa6IHIFvthwUtbhfKtHX4mJPrd7LEJK2MjtjiHzdDXdP2ZQcn/Ga7OK
         uS5Q==
X-Gm-Message-State: AC+VfDz56t7m6Kc2Af8xmtgbvZCB/P2XQGvLtmWd0BuPCkp8/4WG+311
        llKXtabfw3RWeLwsntfeOGHM7I8wreI=
X-Google-Smtp-Source: ACHHUZ4SZCnx+FzAyFclv7fZhrBmmdhun7a2MFnH6JMBAalLr543sknoipxj2SMTfTz/A8xx6IW17A==
X-Received: by 2002:a17:90b:788:b0:256:544a:74c9 with SMTP id l8-20020a17090b078800b00256544a74c9mr535481pjz.25.1686019005262;
        Mon, 05 Jun 2023 19:36:45 -0700 (PDT)
Received: from debian.me (subs32-116-206-28-36.three.co.id. [116.206.28.36])
        by smtp.gmail.com with ESMTPSA id m6-20020a17090a34c600b00256471db12bsm6893567pjf.8.2023.06.05.19.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 19:36:44 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
        id 101AB1069FD; Tue,  6 Jun 2023 09:36:40 +0700 (WIB)
Date:   Tue, 6 Jun 2023 09:36:40 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Malte Starostik <malte@starostik.de>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     basavaraj.natikar@amd.com, linux-input@vger.kernel.org,
        linux@hexchain.org, regressions@lists.linux.dev,
        stable@vger.kernel.org
Subject: Re: amd_sfh driver causes kernel oops during boot
Message-ID: <ZH6buB8TcMd5aT_1@debian.me>
References: <ZG3ipauL9FTnQJiC@debian.me>
 <3250319.ancTxkQ2z5@zen>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="CUrTcfzVaW+dVdl5"
Content-Disposition: inline
In-Reply-To: <3250319.ancTxkQ2z5@zen>
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--CUrTcfzVaW+dVdl5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 05, 2023 at 01:24:25PM +0200, Malte Starostik wrote:
> Hello,
>=20
> chiming in here as I'm experiencing what looks like the exact same issue,=
 also=20
> on a Lenovo Z13 notebook, also on Arch:
> Oops during startup in task udev-worker followed by udev-worker blocking =
all=20
> attempts to suspend or cleanly shutdown/reboot the machine - in fact I fi=
rst=20
> noticed because the machine surprised with repeatedly running out of batt=
ery=20
> after it had supposedly been in standby but couldn't. Only then I noticed=
 the=20
> error on boot.
>=20
> bisect result:
> 904e28c6de083fa4834cdbd0026470ddc30676fc is the first bad commit
> commit 904e28c6de083fa4834cdbd0026470ddc30676fc
> Merge: a738688177dc 2f7f4efb9411
> Author: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Date:   Wed Feb 22 10:44:31 2023 +0100
>=20
>     Merge branch 'for-6.3/hid-bpf' into for-linus

Hmm, seems like bad bisect (bisected to HID-BPF which IMO isn't related
to amd_sfh). Can you repeat the bisection?

Anyway, tl;dr:

> A: http://en.wikipedia.org/wiki/Top_post
> Q: Were do I find info about this thing called top-posting?
> A: Because it messes up the order in which people normally read text.
> Q: Why is top-posting such a bad thing?
> A: Top-posting.
> Q: What is the most annoying thing in e-mail?
>=20
> A: No.
> Q: Should I include quotations after my reply?
>=20
> http://daringfireball.net/2007/07/on_top

And telling regzbot:

#regzbot introduced: 904e28c6de083f
#regzbot title: HID-BPF feature causes amd_sfh kernel oops during boot and =
suspend/reboot

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--CUrTcfzVaW+dVdl5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZH6bswAKCRD2uYlJVVFO
o2xDAP9An3ggMkqbJ3oROKgX0EvakxIZ71rfdE5jiwCJL0qbkQD/UOdP+fyrj4hL
jjftmyl+chnthfoPbYDIWG8939UFqgc=
=3GF2
-----END PGP SIGNATURE-----

--CUrTcfzVaW+dVdl5--
