Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A53592A6B7A
	for <lists+linux-input@lfdr.de>; Wed,  4 Nov 2020 18:14:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730362AbgKDROa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Nov 2020 12:14:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726737AbgKDROa (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Nov 2020 12:14:30 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 849C9C0613D3
        for <linux-input@vger.kernel.org>; Wed,  4 Nov 2020 09:14:30 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id 1so10602061ple.2
        for <linux-input@vger.kernel.org>; Wed, 04 Nov 2020 09:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bVG0yljf/chzBochzgYUSJjwoIrF6dv343NWdoTR8Qo=;
        b=IT/T/dUA2bTkYbyFwjcO57C2YR6mlNuCX3hIk9Zm3RWG75WqBSlUWzpRgo3kbbuCmv
         ARxHh/cG5qxIyyIacYXGhdnOA2T7l+T/aODopBLsNVPtIwMnnAel/h++6EwzGtNOQAQH
         3AL3CyCHAhQ3+d8tIqAb37+n7wZfpv7Jp+NjbMd6iAK1nf/nHZZLeJ5AHajuLI5WXtZT
         LPKkobvod9qCn6HP4zqYaNxbSdy1dLGRr0Tv7VdjGxhMqf/Xs9HdEvobx9Y6DCh5Cvnl
         OxRr6ZNNI/0hKwbaHpFN6BBD863BeKOPzfwJua4A8LY8ndVFmxzhYIKd3wOF/LdZVMyJ
         WsWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bVG0yljf/chzBochzgYUSJjwoIrF6dv343NWdoTR8Qo=;
        b=CZcjIJbuqZYezxDfvs+iwt2zn/1SLeSI5mxAg4BbPiOVdwVTixsMhCW6fGp4eY0VTY
         VCQnHuDbox84+P0tq/nxaH6fSl0se0MI03w28Dpg7lL6fX+ClxP3jalndYuhuEnha9bi
         6ecF3f3RNlxgRY0D8mr8AxS2rlKcAd2nfeaBvFIceO5RgN4YhtC0WleP4PymJlXFc7Ua
         3q5hscbrY281j/h6QXFztbaVRocUFEBoQvA0pnwmzNKRq/26/hQCs0l+g09HDxLmDpqs
         iUnhsEicyEEYITtb8z198FoHUrDeykUZVD+PgYU1jUuLT7YHlGKfkplXTzUvbpHxCvPp
         z6Lw==
X-Gm-Message-State: AOAM530Qw+m3ItYAGM+MlIagmJaHPjY/z4MqNAUOxIJUVMR1B9qUptt+
        qlLXSCSM50aLCBDLjLB4V0Px/Q==
X-Google-Smtp-Source: ABdhPJwp4bI5UQJT0/KcSw3fGejauKPDDdtwEQ9CaGRD6h48NaxpCzBgmcFRDfRpiq4DROaDi40VEw==
X-Received: by 2002:a17:902:d351:b029:d6:e3d1:6482 with SMTP id l17-20020a170902d351b02900d6e3d16482mr6930375plk.75.1604510069697;
        Wed, 04 Nov 2020 09:14:29 -0800 (PST)
Received: from google.com ([2620:15c:202:201:4a0f:cfff:fe66:e92e])
        by smtp.gmail.com with ESMTPSA id w19sm3115447pff.76.2020.11.04.09.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 09:14:28 -0800 (PST)
Date:   Wed, 4 Nov 2020 09:14:23 -0800
From:   Benson Leung <bleung@google.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Dudley Du <dudl@cypress.com>,
        Daniel Kurtz <djkurtz@chromium.org>,
        Benson Leung <bleung@chromium.org>, linux-input@vger.kernel.org
Subject: Re: [PATCH 02/20] input: mouse: cyapa: Fix misnaming of
 'cyapa_i2c_write's 'reg' param
Message-ID: <20201104171423.GA2322691@google.com>
References: <20201104162427.2984742-1-lee.jones@linaro.org>
 <20201104162427.2984742-3-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline
In-Reply-To: <20201104162427.2984742-3-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Lee,

On Wed, Nov 04, 2020 at 04:24:09PM +0000, Lee Jones wrote:
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/input/mouse/cyapa.c:130: warning: Function parameter or member '=
reg' not described in 'cyapa_i2c_write'
>  drivers/input/mouse/cyapa.c:130: warning: Excess function parameter 'ret=
' description in 'cyapa_i2c_write'
>=20
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Henrik Rydberg <rydberg@bitmath.org>
> Cc: Dudley Du <dudl@cypress.com>
> Cc: Daniel Kurtz <djkurtz@chromium.org>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/input/mouse/cyapa.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/input/mouse/cyapa.c b/drivers/input/mouse/cyapa.c
> index c675f156948b5..dacf7c0e43f98 100644
> --- a/drivers/input/mouse/cyapa.c
> +++ b/drivers/input/mouse/cyapa.c
> @@ -119,7 +119,7 @@ static ssize_t cyapa_i2c_read(struct cyapa *cyapa, u8=
 reg, size_t len,
>  /**
>   * cyapa_i2c_write - Execute i2c block data write operation
>   * @cyapa: Handle to this driver
> - * @ret: Offset of the data to written in the register map
> + * @reg: Offset of the data to written in the register map
>   * @len: number of bytes to write
>   * @values: Data to be written
>   *
> --=20
> 2.25.1
>=20

--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCX6LhbwAKCRBzbaomhzOw
wj89AP9UcAA8Xj1aru5r9YX2Jh5jtaCCaqOgFhXhZbY/Ua7RpAD/fJNQClHztXHt
E1zFPsHeKZ8/zKCF8EeSF4FEYXBwcAQ=
=UTaY
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--
