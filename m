Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95D7836184
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2019 18:41:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728606AbfFEQlB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 Jun 2019 12:41:01 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:49007 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728263AbfFEQlB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 Jun 2019 12:41:01 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id E2765225BF;
        Wed,  5 Jun 2019 12:40:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Wed, 05 Jun 2019 12:40:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        pedrovanzella.com; h=date:from:to:cc:subject:message-id
        :references:mime-version:content-type:in-reply-to; s=fm3; bh=5yP
        HObU1x7p68WHeQkuPbjJD/zieFn48zmjQsGDnsxg=; b=NihaYQqjrCWXxo3WST7
        SMYRnp0eOAoN9XhwY6yjVHzEqediKJMmufkfpT1BBSP3h+lTgSphtsuol9ITJxEB
        jPq7iPVcV6gQax+3eoPsrgSB+w0fJYK3Ay9rgprFwGELwClXVsEQQoR9KWqpYgNm
        aiXBBwLZidpJ+s2oO0TyP3gyxWR9kXZJxTlkB05+utYEhOtP/7vhlak2c1W0H9G3
        Pk7ZJuU3xoq1CmC/LuMtJtCd6K5cSIUua2yrLQaNnihHl1WTiBsvLRYetxrnCPkE
        buS2fUzsSgk8kbux7Xfp99wW+8pd2OXrdSejZ/g0tf/GKdjgbPe77uC7My0gvfg+
        mYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=5yPHOb
        U1x7p68WHeQkuPbjJD/zieFn48zmjQsGDnsxg=; b=Tv1rhdLG3S4kHFo8FjMjPd
        oK8HEOa+MvdXGtc0t8iICQzLf7T17DfxHnl7260eqc5H3X9x3muLldcdN6GVSpIu
        ufjUm5ffk07p1mtGn9reTjlr3xeqK4DmlGF8qTU61LoJqaanr0bgyUtpyq/d602T
        l9QScmOHrExyizz7aWnO2HjOvfxi1Me3z9CsXkg/nD9EaAsjMudiQ2TXr3xQyOnx
        o8hFvrbDnCiCrwPJv27IrSqfHIdGU/TEsyJjnK8LOPfvfdvB9DSleo+coh+56rBL
        HYxgr1g9ABOgugHfNVP78O/lSe2LZWbogDVHpn8+xuf05Akt2qabwnHCXn7YZZqw
        ==
X-ME-Sender: <xms:mfD3XI1Vx-bO4skfN3-w64rRZNcvWt6kxnZA3axhlm5KalS8ktbK-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudegvddguddtjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujggfsehgtderredtredvnecuhfhrohhmpefrvggu
    rhhoucggrghniigvlhhlrgcuoehpvggurhhosehpvggurhhovhgrnhiivghllhgrrdgtoh
    hmqeenucffohhmrghinhepphgvughrohhvrghniigvlhhlrgdrtghomhenucfkphepjedt
    rddvjedrvdejrddugeelnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvggurhhosehpvg
    gurhhovhgrnhiivghllhgrrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:mfD3XH_yifrb0TLMZQwPzJORJO7CW7FmtFKuYy9-Bf3valUFN1uAOw>
    <xmx:mfD3XJei-n4cxhKtqKMSViBCGNvLNY9NA2z8i6n6Se43714YcnoVIQ>
    <xmx:mfD3XDEzAvATprnBXlKMDt4HlOIyao_BUGx9NnzFgfP0ymVmvxej6g>
    <xmx:mfD3XIiu9j4T-7Eu9ggQf2Su1nB1IDJyxDEFsaxgTRHFJXXRtUfjYQ>
Received: from localhost (toroon020aw-lp130-02-70-27-27-149.dsl.bell.ca [70.27.27.149])
        by mail.messagingengine.com (Postfix) with ESMTPA id 34256380089;
        Wed,  5 Jun 2019 12:40:57 -0400 (EDT)
Date:   Wed, 5 Jun 2019 12:40:56 -0400
From:   Pedro Vanzella <pedro@pedrovanzella.com>
To:     linux-input@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] HID: hid-logitech-hidpp: subscribe to battery
 voltage change events
Message-ID: <20190605164056.ofueguibhjknm5wm@Fenrir>
References: <20190604232827.26008-1-pedro@pedrovanzella.com>
 <20190604232827.26008-2-pedro@pedrovanzella.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lbwwonzdknit5xhi"
Content-Disposition: inline
In-Reply-To: <20190604232827.26008-2-pedro@pedrovanzella.com>
User-Agent: NeoMutt/20180716
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--lbwwonzdknit5xhi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Sorry for littering the list, but please ignore this patch set. I'll
have one that uses a quirk to detect the right devices in a little
while.

On 06/04, Pedro Vanzella wrote:
> Same as with the other ways of reporting battery status,
> fetch the battery voltage on raw hidpp events.
>=20
> Signed-off-by: Pedro Vanzella <pedro@pedrovanzella.com>
> ---
>  drivers/hid/hid-logitech-hidpp.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>=20
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-=
hidpp.c
> index e68ea44b0d24..1eee206a0aed 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -1313,6 +1313,35 @@ static int hidpp20_query_battery_voltage_info(stru=
ct hidpp_device *hidpp)
>  	return 0;
>  }
> =20
> +static int hidpp20_battery_voltage_event(struct hidpp_device *hidpp,
> +					 u8 *data, int size)
> +{
> +	struct hidpp_report *report =3D (struct hidpp_report *)data;
> +	int status, voltage;
> +	bool changed;
> +
> +	if (report->fap.feature_index !=3D hidpp->battery.voltage_feature_index=
 ||
> +	    report->fap.funcindex_clientid !=3D
> +		    EVENT_BATTERY_LEVEL_STATUS_BROADCAST)
> +		return 0;
> +
> +	status =3D hidpp20_battery_map_status_voltage(report->fap.params,
> +						    &voltage);
> +
> +	hidpp->battery.online =3D status !=3D POWER_SUPPLY_STATUS_NOT_CHARGING;
> +
> +	changed =3D voltage !=3D hidpp->battery.voltage ||
> +		  status !=3D hidpp->battery.status;
> +
> +	if (changed) {
> +		hidpp->battery.voltage =3D voltage;
> +		hidpp->battery.status =3D status;
> +		if (hidpp->battery.ps)
> +			power_supply_changed(hidpp->battery.ps);
> +	}
> +	return 0;
> +}
> +
>  static enum power_supply_property hidpp_battery_props[] =3D {
>  	POWER_SUPPLY_PROP_ONLINE,
>  	POWER_SUPPLY_PROP_STATUS,
> @@ -3181,6 +3210,9 @@ static int hidpp_raw_hidpp_event(struct hidpp_devic=
e *hidpp, u8 *data,
>  		ret =3D hidpp_solar_battery_event(hidpp, data, size);
>  		if (ret !=3D 0)
>  			return ret;
> +		ret =3D hidpp20_battery_voltage_event(hidpp, data, size);
> +		if (ret !=3D 0)
> +			return ret;
>  	}
> =20
>  	if (hidpp->capabilities & HIDPP_CAPABILITY_HIDPP10_BATTERY) {
> --=20
> 2.21.0
>=20

--=20
Pedro Vanzella
pedrovanzella.com
#include <paranoia.h>
Don't Panic

--lbwwonzdknit5xhi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEXrNKwhI/eDFBCGo3v5huqi4pBxkFAlz38JAACgkQv5huqi4p
BxnqRw/9GjTvjivcUXuKcQobp7jlpP4KnUiuNMmXPqQDi0kSADx+MCTbS/AnrXlC
NEQwWIpYOD8SqS/6JVUHvbeSWIZB2BK8DaLMqejK6FWAoPMGSDLZoxxSbcQZu9np
zExt2kiIy5+n5aHvJp4bPbELoYWVmXMKuD9sMAkmLElz4aefWF/WqJ31OfQ9re76
eMi9Cc2gQ+UCG6d0s0gLIq3POj0uWKpyXnbqrwO+T2l/8ZJrXMiBDKLMn2UW4Vgo
qrwDe+tS6GhTmLp3V+LsHF17s0CDLpHYL6LmgcNbEtw7pqsYJhyqH7y87B25Vcn8
cqv7HBst3BxaJASjb77Vr1WKObrqs23viBWBilyfyNxWpvTpZrivEjt0+ATh5TpD
DycgCeIA+HjoMLbHbYRDlwLSAiofxBkKXZ4YHs6aKRuxpiaXRE+2C8f4WuQyXrdH
R5pbcNkeSbKIeWe9wGzIJalmslRUvnBZSkNDFOTGliojTyPw0EWQf3uDgKnEBbNj
/xb4MuloTR8YX2x2K1u+8zkxghpQgkadukikMcm+WIWz8VamGevwFztwVUeVTX09
05aJT3wAM1iBdvE8pxvDNbybW4t+nz+HMdEXSlaaaLC2hJc7BYVJm2OSrjpLRYe3
J2cYYVXLvbOKyZFvszvvXbgb1NcnFYkJwDydAvl9Dz/l2Zyy3eg=
=xyZ3
-----END PGP SIGNATURE-----

--lbwwonzdknit5xhi--
