Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C42C46825
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2019 21:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726052AbfFNTcc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jun 2019 15:32:32 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41935 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725837AbfFNTcc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jun 2019 15:32:32 -0400
Received: by mail-pg1-f194.google.com with SMTP id 83so2077310pgg.8
        for <linux-input@vger.kernel.org>; Fri, 14 Jun 2019 12:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2p/J8D6UQCR9c3zc0tZ7DZzGjM02P6xbDQIuC9tcvpE=;
        b=dC+uQanizraiv2B7LahvpG2MQKLej4bYWrZRbODV60n3KpYsPOS+zIaMR/7BncBX6g
         2wwxcJ0Q2zp6BpZxUaSn1o+pdy/i/Mk9+l6Sm452ukbIWBBezz9mT+NSvNJ5recL9E0G
         ch3ZwvLlP6proKDaGqqJHFaKmhdPezTXNZlKS6UaWYhiMOWQqw3ocPPG7xEaVxPv5GA+
         WxH5IFLDTXmJmRye7d4mdEvKT10SOPDxgpRrJtWuxxHT2HgOqdjpwEC4eG0ACZYeJ0a5
         lbZpeeoSM/5k8TzchKeBB/6JtcIeqnfukpFaqBp+6Xd/SSU1NCXwQ9BqGkAoA4e3SyC/
         ShjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2p/J8D6UQCR9c3zc0tZ7DZzGjM02P6xbDQIuC9tcvpE=;
        b=qSAIUa5VOgqRjEi305kK28kE7sHX/mm+3VRyk7OSD/JX2QvBzmX4c7pUdggINIZd5u
         lszaH/8+Sn/3vMwftvRdfrxqK93VpGGtOJC5Hmw8ssCW2jN1kQZHH9bndak2Fhq63aeX
         ehUYv3JtDQePBiokD1VGyjYql+ub1Nur1iXYhaA1TO+rllSyTvPI5ZPyJeLQlctC+PxI
         dH/zdX6PgnWE9GuiLqW0VFJ7eRAQrPhRX1lBchsfLvhecYYOucZ0Y/5YfgajXIi291R7
         k1J2JZr56fOljF9ob5ZhCHRa+KrbBw5xO4lvs9AtRrvSZO6LRv1QiDwDXlbJS80YNHDj
         g7kA==
X-Gm-Message-State: APjAAAWwC/9GIHfFStDL62Yb3Y6/kuenTvEfwSe+OPppcpHLVcBUEPa4
        zh2emi2uVSWad8BOMBUZafFVHw==
X-Google-Smtp-Source: APXvYqyxiX9qQ5OaOATxPUhJmRs1Ef3sUPN5eSkhTNmFmpnJrTFLrKqUQgBoL0I6wSUckCoHXuDAtw==
X-Received: by 2002:a17:90a:b903:: with SMTP id p3mr12488516pjr.79.1560540750572;
        Fri, 14 Jun 2019 12:32:30 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:bc61:d85d:eb16:9036])
        by smtp.gmail.com with ESMTPSA id j2sm4288459pfn.135.2019.06.14.12.32.28
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 12:32:29 -0700 (PDT)
Date:   Fri, 14 Jun 2019 12:32:24 -0700
From:   Benson Leung <bleung@google.com>
To:     Ting Shen <phoenixshen@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Pi-Hsun Shih <pihsun@chromium.org>,
        Enrico Granata <egranata@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Guenter Roeck <groeck@chromium.org>,
        Brian Norris <briannorris@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org,
        Colin Ian King <colin.king@canonical.com>
Subject: Re: [PATCH] Input: cros_ec_keyb: mask out extra flags in event_type
Message-ID: <20190614193224.GA249765@google.com>
References: <20190614065438.142867-1-phoenixshen@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0OAP2g/MAC+5xKAE"
Content-Disposition: inline
In-Reply-To: <20190614065438.142867-1-phoenixshen@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ting,
On Fri, Jun 14, 2019 at 02:54:38PM +0800, Ting Shen wrote:
> http://crosreview.com/1341159 added a EC_MKBP_HAS_MORE_EVENTS flag to
> the event_type field, the receiver side should mask out this extra bit wh=
en
> processing the event.
>=20
> Signed-off-by: Ting Shen <phoenixshen@chromium.org>
>=20
Reviewed-by: Benson Leung <bleung@chromium.org>

Looks good for chrome-platform, once ib-mfd-cros-v5.3 is merged.

Thanks,
Benson

--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--0OAP2g/MAC+5xKAE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCXQP2SAAKCRBzbaomhzOw
wlZ9AP9f/12U97R86IgIU/pxp4H8GaL/1ZIlTb9bghg1G5lMhQD+MMfQiwPJrvNG
rwYrT8FRMWDZdTSXj6n4hOunOz6Ruw8=
=EtK3
-----END PGP SIGNATURE-----

--0OAP2g/MAC+5xKAE--
