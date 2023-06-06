Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49B2B723561
	for <lists+linux-input@lfdr.de>; Tue,  6 Jun 2023 04:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232823AbjFFCj6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 5 Jun 2023 22:39:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230499AbjFFCj5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 5 Jun 2023 22:39:57 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BD0F11A;
        Mon,  5 Jun 2023 19:39:56 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-6af6f49e41cso5217373a34.2;
        Mon, 05 Jun 2023 19:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686019195; x=1688611195;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HudLhhQw0CyzPSOXSNYv2RJ0GRqjCLaZxmXAo7zTprI=;
        b=m8tAff0s0ZmbO4sfii4uwinG6UKjvkQjWCvQPYnHsvEyZC83vYXZHJxL/+1OdEwAWu
         v/1s7Ss5GMcGhVxpxywVDWC7PnlbU4mWycvfTuB5MZxdZbPCKQAcVTQ6E9V7lFSbJ2Mm
         Dqm0aTufQ19wUhtT1PIpNyVjt2y+zkYypEJvgYoxE1uM/It018zYlANi17ufo525Hf+2
         p/KuwDru1L8sSjkmCqu8/beEZDdnAsf2XMRz2d7aGcbMjoVn7SamZ1910s2/qUP5aeIg
         pSC3MWakOSLfptilD0/aqrRn80/Oz+Wxdqs8RR3s7pa3Gf+KFobkA+Np44lmBU4t56+9
         B27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686019195; x=1688611195;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HudLhhQw0CyzPSOXSNYv2RJ0GRqjCLaZxmXAo7zTprI=;
        b=PX76MGNyVKzttGEP0YBvTmS2m+sIGya+oOfFq/H99egZEioRLDMp1udB/lshxNo7EY
         iutKj2GDTiu9m5Es2hFvrgOLVEmWgwZmZr7BWHILFdKUdgQIr4n0Op/ZNoGBhrQ+CG1S
         0mOczgTfCYuifbyEvB3WidJqsjLCmqTBXtaTvGOIXFpl//wlmbiwg8TcddxrrsGkj3Ax
         Ba3s9hq/dlhvipw3dCcAj5F2MbBLjZbDkPF2SUuvaG+gkSQXxTFwQo/qnsgJi2/XCe4I
         LQd96j7SdyvJSSY+Y3qu5CbSLTmbEVqJFm7aRC72lNjDy3SErX3S2GkhUKBDNAbgHlCw
         BwZQ==
X-Gm-Message-State: AC+VfDxoSpU6/w49BINn11xjCqHa2rCHcvSPO7J/3sh2A7uYMjnfM2Xq
        SZ+COyNFCixb1n0yrh1f3Yk=
X-Google-Smtp-Source: ACHHUZ4Ee5dxpgc/ZHDdlY8gkRF+ZkPCp3ACiuIXCw4d9/JGzqbuf/ENPB7DbeGGwbvsgvijC2NJHA==
X-Received: by 2002:a05:6830:1682:b0:6af:887d:a517 with SMTP id k2-20020a056830168200b006af887da517mr780996otr.15.1686019195368;
        Mon, 05 Jun 2023 19:39:55 -0700 (PDT)
Received: from debian.me (subs32-116-206-28-36.three.co.id. [116.206.28.36])
        by smtp.gmail.com with ESMTPSA id u4-20020aa78484000000b0064381853bfcsm5784370pfn.89.2023.06.05.19.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 19:39:54 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
        id 947721069FD; Tue,  6 Jun 2023 09:39:51 +0700 (WIB)
Date:   Tue, 6 Jun 2023 09:39:51 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Haochen Tong <linux@hexchain.org>, stable@vger.kernel.org,
        "Linux regression tracking (Thorsten Leemhuis)" 
        <regressions@leemhuis.info>
Cc:     regressions@lists.linux.dev, linux-input@vger.kernel.org,
        Basavaraj Natikar <basavaraj.natikar@amd.com>
Subject: Re: amd_sfh driver causes kernel oops during boot
Message-ID: <ZH6cd6_8EUrRY0W0@debian.me>
References: <f40e3897-76f1-2cd0-2d83-e48d87130eab@hexchain.org>
 <ZG2LXN2+Sa2PWJqz@debian.me>
 <ee2c30a5-3927-d892-2a66-00cd513c3899@hexchain.org>
 <ZG3ipauL9FTnQJiC@debian.me>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="JF2M1o8gEDukYGMt"
Content-Disposition: inline
In-Reply-To: <ZG3ipauL9FTnQJiC@debian.me>
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--JF2M1o8gEDukYGMt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 24, 2023 at 05:10:45PM +0700, Bagas Sanjaya wrote:
> On Wed, May 24, 2023 at 02:10:31PM +0800, Haochen Tong wrote:
> > > What last kernel version before this regression occurs? Do you mean
> > > v6.2?
> > >=20
> >=20
> > I was using 6.2.12 (Arch Linux distro kernel) before seeing this regres=
sion.
>=20
> Can you perform bisection to find the culprit that introduces the
> regression? Since you're on Arch Linux, see its wiki article [1] for
> instructions.
>=20

Haochen, any news on this? Has the bisection been done and any result?
Another reporter had concluded possibly bad bisect [1].

Thanks.

[1]: https://lore.kernel.org/regressions/3250319.ancTxkQ2z5@zen/

--=20
An old man doll... just what I always wanted! - Clara

--JF2M1o8gEDukYGMt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZH6cdwAKCRD2uYlJVVFO
o2rWAP98fX2zkHHntO95NM5SMK7DUevIhNi61RNbIWyXVV6w6gD/VxLe1LqAY1ON
byv2GX1uOKQPIySD3rIZcgX/LKKduwQ=
=thJx
-----END PGP SIGNATURE-----

--JF2M1o8gEDukYGMt--
