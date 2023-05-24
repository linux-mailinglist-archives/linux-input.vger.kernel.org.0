Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3245F70EC37
	for <lists+linux-input@lfdr.de>; Wed, 24 May 2023 05:58:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239169AbjEXD62 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 May 2023 23:58:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239427AbjEXD60 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 May 2023 23:58:26 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DD63E6;
        Tue, 23 May 2023 20:58:25 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-51b33c72686so321073a12.1;
        Tue, 23 May 2023 20:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684900704; x=1687492704;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eoFUq15BfcYMvDYkbbe5qe+ZjxrdZ/BZL1FuqpuGwYI=;
        b=NPPQHhxaY0hpKceunhe5E93G5vLNcXTCZl0myVLNJpzoM5OOYU2rLMn0jk2PhAJJhE
         YePOJZUxLRhZixUMSjoPqLYNt2uSMkAPGnXWbG0EF8hplN9DGzVObkBxrvHOwduGtT2R
         /qqYApyVQKHeCTzI1sMmDKFgOGB80MybLgWMTccZVvJUIA5qpO72g/PfY52YEVn+ANnc
         N+9nWkoPAivd68El2FLGAYA0ZLNKdkcUS5mjtfz2EW6GAQYkMbXa18aZFvJT8N1uobCe
         oFqgvDX6kLnPNwwW1qRBi/Qmi0mWMWZRzc2o/D0xbFFz2w+LTDPvu2QEjh8ly2b5BD/e
         rGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684900704; x=1687492704;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eoFUq15BfcYMvDYkbbe5qe+ZjxrdZ/BZL1FuqpuGwYI=;
        b=S3LzdIOxQutcr6DzIcJnTL3YOicOOnD/OQiuPnofyCalmr83Gj+bsjC5XipxdPeK0C
         Rn/Lzes3diA3T7fKSyrzt+MjfeUxjRUDkI5GfeTX70im0fm0hqFJchadG+5JpjXCDS39
         +ZhsycsgoxkcocBCiQw1tn1H+9E3oL/yVoHoRpjfDPMmDcBaZOX9ohDuAHCJDmQsIQ+r
         ArEBlxxIR7cJaezZPgrvRF+yimC84l/vab0CI+9TYNLPR0XKcSUzpcvoJas5FwD3O428
         eAnEF/KjUlVJgYdx4S6QDdk8WnpWdBWM3uk5mMRV8Oj6znsY936vb1r+Wiz5kNL1/GxQ
         7zwQ==
X-Gm-Message-State: AC+VfDy9aBoGQG6P9YaB0fxkJ9gsAqocaFrJ1le4t4Tj47nduoJ9xoz4
        plsq/UGWv5TCw5t8QCfshw+5NVKH234=
X-Google-Smtp-Source: ACHHUZ74R9rTWqtJ3JwYDu9EiI/76WjbYN939ePLnJ/gNaNyOyE6aZuV+jiidKERNWRW6RKgOQEi+g==
X-Received: by 2002:a17:902:ea0f:b0:1ad:fa2e:17fc with SMTP id s15-20020a170902ea0f00b001adfa2e17fcmr18549234plg.2.1684900704188;
        Tue, 23 May 2023 20:58:24 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-68.three.co.id. [180.214.232.68])
        by smtp.gmail.com with ESMTPSA id jc1-20020a17090325c100b001a1b66af22fsm7582775plb.62.2023.05.23.20.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 20:58:23 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
        id 2981B1069C0; Wed, 24 May 2023 10:58:21 +0700 (WIB)
Date:   Wed, 24 May 2023 10:58:20 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Haochen Tong <linux@hexchain.org>, stable@vger.kernel.org
Cc:     regressions@lists.linux.dev, linux-input@vger.kernel.org,
        Basavaraj Natikar <basavaraj.natikar@amd.com>
Subject: Re: amd_sfh driver causes kernel oops during boot
Message-ID: <ZG2LXN2+Sa2PWJqz@debian.me>
References: <f40e3897-76f1-2cd0-2d83-e48d87130eab@hexchain.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="YBhjpwkXDbp8U+2d"
Content-Disposition: inline
In-Reply-To: <f40e3897-76f1-2cd0-2d83-e48d87130eab@hexchain.org>
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--YBhjpwkXDbp8U+2d
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 24, 2023 at 01:27:57AM +0800, Haochen Tong wrote:
> Hi,
>=20
> Since kernel 6.3.0 (and also 6.4rc3), on a ThinkPad Z13 system with Arch
> Linux, I've noticed that the amd_sfh driver spews a lot of stack traces
> during boot. Sometimes it is an oops:

What last kernel version before this regression occurs? Do you mean
v6.2?

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--YBhjpwkXDbp8U+2d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZG2LWAAKCRD2uYlJVVFO
o7V9AQC0xTz1VBHy4yB1nKdpCOLGimzuKpfUKeRBzGsZaiiIAAD+MGxV4LLpO9Wb
cbsOdM8WB+gLP+Nu/W/lvhtvcoyJDQo=
=B11Z
-----END PGP SIGNATURE-----

--YBhjpwkXDbp8U+2d--
