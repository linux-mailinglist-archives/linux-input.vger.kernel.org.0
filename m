Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 903E930980B
	for <lists+linux-input@lfdr.de>; Sat, 30 Jan 2021 20:30:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231565AbhA3TaN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 30 Jan 2021 14:30:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230045AbhA3TaM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 30 Jan 2021 14:30:12 -0500
Received: from mail.archlinux.org (mail.archlinux.org [IPv6:2a01:4f9:c010:3052::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F1EFC061573;
        Sat, 30 Jan 2021 11:29:32 -0800 (PST)
Received: from [192.168.1.78] (unknown [188.251.63.183])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ffy00)
        by mail.archlinux.org (Postfix) with ESMTPSA id CC5733AEE7E;
        Sat, 30 Jan 2021 19:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=archlinux.org;
        s=dkim-rsa; t=1612034967;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=rgtMcl4g911L4pabMbU1+Jnsn1FDEpLs70dWxqJd6HE=;
        b=ry8IuGY2KIzhzeSP0td91quthi0Avs6NKDDTw2OdsDi6UKtQCIVV0VaKqDkCcq/BzbU8mm
        WAg+Ig0GmtbL09xhWqp6alayH1LtrLHB0A2+a7y17o0VV6ohSSyHu5bUsxtNrXjViVu/AF
        JVMVQII+XIS5Z6i93P9PCKUxmtb4MPfb++BkFSuCYOVjBE+qmqgmBVLWpp5ruYrrlOQzDf
        w+hUps5SZpRLxBbu+8TqrRiuJvPNE/HLrxw/6JVXPAcbQqqs6BIaEF5jqWh1kPoWu4bUrj
        VLE0JaL1lnWu1QLyf7LmNjrumAM0DcEypPxAfMpNcHiIv4FsSDJSD7YdAabpSd2d6X6F/K
        /3vzdEKW2G3RuTjcs93YCVRiJHwPr3HUJRz8f0q73I9gLA81X4CprYXYJZ75lC0yg88JuE
        CinEsaqs2Qldvh/b/ZyUt9/VFjCWo0Qg4un2yl8a3yemQ6QuN3FkyP2dlyroiXPbWj902v
        QvWVSbeY3odd4JsA8VkSK4EBbZJA7TAkWQtlWAKLtFLdEBffgP6pz+z0uU3+lHBwxDb3o5
        jp1JWOhLcJKdUjcq/YNK+D3Lqor3IklCb0+3b8Yo3VQlswliEOF6igK3p4DKi2FYLVUrSz
        gI2fOcL3RZPF3FEKUGPgOVV8YdUPYd3G7tHxufN+Tt8qGqNy8hMYs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=archlinux.org;
        s=dkim-ed25519; t=1612034967;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=rgtMcl4g911L4pabMbU1+Jnsn1FDEpLs70dWxqJd6HE=;
        b=EstAYw0hDOS+E72nxvM8X3Bcj21DeNgehQ6geSelckuqqzrrF/BbyQeLoyi1Ji5OiRh6lt
        nfg4kZEGefLPHjAQ==
Message-ID: <583a536324302898643e67d65ad971828f1af3e3.camel@archlinux.org>
Subject: Re: [PATCH] HID: logitech-dj: add support for keyboard events in
 eQUAD step 4 Gaming
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        linux-kernel@vger.kernel.org
In-Reply-To: <265604c19e2e875ca17e4cf713000492b9ffd8d8.camel@riseup.net>
References: <20210130191027.1225465-1-lains@archlinux.org>
         <265604c19e2e875ca17e4cf713000492b9ffd8d8.camel@riseup.net>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-u6SIpyX6zQ4buAf+w/pc"
Date:   Sat, 30 Jan 2021 19:29:21 +0000
MIME-Version: 1.0
User-Agent: Evolution 3.38.3 
Authentication-Results: mail.archlinux.org;
        auth=pass smtp.auth=ffy00 smtp.mailfrom=lains@archlinux.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-u6SIpyX6zQ4buAf+w/pc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Oops

On Sat, 2021-01-30 at 19:14 +0000, Filipe La=C3=ADns wrote:
> this cause any breakage with your devices?

this *doesn't* cause

--=20
Filipe La=C3=ADns

--=-u6SIpyX6zQ4buAf+w/pc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAmAVs4cACgkQ+JPGdIFq
qV3Row//Vc9VvaM2jcgKi8X+R9KTYu0mZXuiIGrcyeYqKvcf6rb89+pNjLUK+QG+
qRimM3LoOS5s1kcDoi/IQksfgWlSfqVDe6fVCOSG+oSsa8AMfNbpKFKiR11kVgQL
X43PzwxbSDl1vHntmTi1b6eF/ER21QHk9btAlWxUs7VxkRUOvfLnxF41lxTkYuxH
f43LPF/F1gMRCSn6R4SQ5J4mB1Vpsgh+Bhhq2uYELSlJj89mhJGj9PsbTRvpGliQ
b1N72xHrOB/gKF+WXjpmV3XYUAITbDm0LDYCw2I9aVqYQENeEO2jazdnWSSzxGSL
pjQ2wzD0wiCpPlxTaYw2XRsB6Z9LEmuGdpZeobDGFAEuj7Eaz7rlZWkDPcZGz0fg
DcvJqgABWxx0Orke3wtih1wRA7UVK33OHb2+nh7n9GeU0ja0zU7l9tXxmcNMbwod
4nvYeOH3phcATiJT0QJCMGPvT5hWjlR3hXQEtNiS0QSyIT5KhG2DJce2Nq2S50dl
w2ZoxAa6TYqpdqoAtYQPYo7C2EEOeC7+azBfBOEbITKtTgrjdC4ayf2aPhh9lFij
rWmUNW4nS2drX0w3+m8fFa/B/MFQY0GleyE03c1XBZqr/IK5wY29PrE2Z5B53UCo
Wh7KzZi8gUuFDH4YcW37unfMzW9uIxvGcEjD+qw9BuRliOy4McM=
=pSX/
-----END PGP SIGNATURE-----

--=-u6SIpyX6zQ4buAf+w/pc--

