Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64A8F361E12
	for <lists+linux-input@lfdr.de>; Fri, 16 Apr 2021 12:38:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240881AbhDPKip (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Apr 2021 06:38:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:33786 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240513AbhDPKin (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Apr 2021 06:38:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E2190610CD;
        Fri, 16 Apr 2021 10:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618569499;
        bh=IwthkpghUgaJJRlf4fBazKvw5wFO1M0ZTtJe9yFo0YA=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=RAeFqmjk9tfJt62NfPMGJnali8yVh9D8pOU+pNHzN8XUuEKvChiVw08eex8FxsnAG
         YjM/c/ziz5nyM2EajyWtLMUWywlz+Ntl/UbJBZUMNEQHWf4t+A8QJPmiJ+5y99+WPh
         mO4v6NqfNRTUruhc1L22ER20DHpCl1SeC6jI3RGs1VQ9S1cJ3s0I/skm41p86Im1H0
         xPFxHn4r2epHDuM7uMJaEk+2zlnz+qDCBbwt5cwcpCmnF/rem2cKCrZLbU8p8XrU5A
         poMxYyG0LpOja86q/ndyng9KhDvMjEr50n5q//TWJoy8fQYV4AseC37ueqxrPRuG7u
         44CkXt2uwV+yA==
From:   Felipe Balbi <balbi@kernel.org>
To:     zhuguangqing83@gmail.com,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guangqing Zhu <zhuguangqing83@gmail.com>
Subject: Re: [PATCH] Input: twl4030_keypad - Fix missing IRQF_ONESHOT as
 only threaded handler
In-Reply-To: <20210416025706.11214-1-zhuguangqing83@gmail.com>
References: <20210416025706.11214-1-zhuguangqing83@gmail.com>
Date:   Fri, 16 Apr 2021 13:38:12 +0300
Message-ID: <8735vqo6p7.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

zhuguangqing83@gmail.com writes:

> From: Guangqing Zhu <zhuguangqing83@gmail.com>
>
> Coccinelle noticed:
> drivers/input/keyboard/twl4030_keypad.c:413:9-34: ERROR: Threaded IRQ with
> no primary handler requested without IRQF_ONESHOT
>
> Signed-off-by: Guangqing Zhu <zhuguangqing83@gmail.com>

Reviewed-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmB5aRQRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQawLg//bnXV+MhAYjVymdFOcBk5tGG+lzgqcxjE
Hh5n5iPt//21d7bQ79f5pHgQ/XuDREwLkdiisYp1xwan5ABUqfXh7PaZOGiyysdZ
yKQ5SbwGUgfKpXmp74//+Vuz/AhfK8p8EFKim2aOFP+g6FFZ1CmB+b+rRRmLmG7Z
cxxxdbsFIKzQi979wVqKAfVHtQgAbUlUM2l4OPFoYdrLErO3l2F597BUBS3oyGbZ
lHtg6vsympXXJbrMwRKBcy9tUCsEbhbpkmSQNCwx+n6ajG97w9rduzU3tUHbK/oP
kLc5nZr7720wFaHiXpKlLhAZB8pDAwwmC2K7lh4k7eZQT/Uf0nSaniOaEJfRW4CM
9IjjwyInEYaSvhyQugREWxoxRt69/v5n2hlCBh3I+YowapeV6boReRdyLbCI/TmI
+P6tZeOJFhDCa/mTs8svKYe+4ay6j6fUMmVSV3UpaqtHGzvg6h9SLvWAwhJwspPB
GVv4AQjX8TwFzj1M8XAHEn1/WBjU+1wGs6KBYUEjE0uOtk3lHfNuJZ6kJwXBqBs5
LimPM8/nB6inoE005qnekI/LE4KAUHdWvK27TqgdI4rtar/8qJjjepe+6BjRgn+N
Ss72LPncIJekNSBzQhE4s/7ctMEG///twnr8Ut5YW5NkYJKW6Eube65pCw/Tk0l7
SzrBrud0dlM=
=AUSC
-----END PGP SIGNATURE-----
--=-=-=--
