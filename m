Return-Path: <linux-input+bounces-9196-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEDBA0B867
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 14:42:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80B56164899
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 13:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF0D2233D90;
	Mon, 13 Jan 2025 13:42:32 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1227C1BEF8A;
	Mon, 13 Jan 2025 13:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736775752; cv=none; b=OF5P/bt3oiIMhMFM4ur6pcPHj1+XTlc8+RcSY6u/ypp6jRrz4y+TOMbdbfD4rKTl7X5J16X0oJ1sPXU8JyFPgjEPUJcn5q3t3tY+cGFBYmL2UqGUy589tcaFa2g4i4/QTUW0cPjo/HdgHUby0X2hRhKxTP5oTf3RNyKcM9NW+qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736775752; c=relaxed/simple;
	bh=t7385qvOXodEemDKJOYv6HYuStAtKx1VgVVQt+FX1f4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ILWfAXwv4+n1sJY+8UPKkzLqxgt+cpajseDicuV0yhxjLM19YE4VcmthsknScNm+1WzqMHvCtTacb69gkqmjNHOlNTEKmLhlcvxZMuBQvln77RdouUcPK/8RDgQJGu10Ip4EmRnjP1cVfaKcNvEX5MnfvkHIgh5lcXMjVcYusoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8186E60007;
	Mon, 13 Jan 2025 13:42:27 +0000 (UTC)
Message-ID: <ee985d9040ce54478ad3db448850ea8676fee642.camel@hadess.net>
Subject: Re: [PATCH v2 1/5] HID: steelseries: preparation for adding
 SteelSeries Arctis 9 support
From: Bastien Nocera <hadess@hadess.net>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Christian Mayer
	 <git@mayer-bgk.de>, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>, Benjamin
 Tissoires <benjamin.tissoires@redhat.com>
Date: Mon, 13 Jan 2025 14:42:21 +0100
In-Reply-To: <d31906c2-a9d4-4907-ae1b-bea0520adbe2@wanadoo.fr>
References: <20250112114438.2196-1-git@mayer-bgk.de>
	 <20250112114438.2196-2-git@mayer-bgk.de>
	 <d31906c2-a9d4-4907-ae1b-bea0520adbe2@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-GND-Sasl: hadess@hadess.net

On Sun, 2025-01-12 at 13:02 +0100, Christophe JAILLET wrote:
> Le 12/01/2025 =C3=A0 12:44, Christian Mayer a =C3=A9crit=C2=A0:
> > Refactor code and add calls to hid_hw_open/hid_hw_closed in
> > preparation
> > for adding support for the SteelSeries Arctis 9 headset.
> >=20
> > Signed-off-by: Christian Mayer <git@mayer-bgk.de>

Feel free to add my:
Reviewed-by: Bastien Nocera <hadess@hadess.net>
Tested-by: Bastien Nocera <hadess@hadess.net>

once you've made the change Christophe mentions.

> > ---
> > =C2=A0 drivers/hid/hid-steelseries.c | 19 +++++++++++++------
> > =C2=A0 1 file changed, 13 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/drivers/hid/hid-steelseries.c b/drivers/hid/hid-
> > steelseries.c
> > index f9ff5be94309..dc4ab55d7c22 100644
> > --- a/drivers/hid/hid-steelseries.c
> > +++ b/drivers/hid/hid-steelseries.c
> > @@ -377,20 +377,21 @@ static void steelseries_srws1_remove(struct
> > hid_device *hdev)
> > =C2=A0 #define ARCTIS_1_BATTERY_RESPONSE_LEN		8
> > =C2=A0 static const char arctis_1_battery_request[] =3D { 0x06, 0x12 };
> > =C2=A0=20
> > -static int steelseries_headset_arctis_1_fetch_battery(struct
> > hid_device *hdev)
> > +static int steelseries_headset_request_battery(struct hid_device
> > *hdev,
> > +	const char *request, size_t len)
> > =C2=A0 {
> > =C2=A0=C2=A0	u8 *write_buf;
> > =C2=A0=C2=A0	int ret;
> > =C2=A0=20
> > =C2=A0=C2=A0	/* Request battery information */
> > -	write_buf =3D kmemdup(arctis_1_battery_request,
> > sizeof(arctis_1_battery_request), GFP_KERNEL);
> > +	write_buf =3D kmemdup(request, len, GFP_KERNEL);
> > =C2=A0=C2=A0	if (!write_buf)
> > =C2=A0=C2=A0		return -ENOMEM;
> > =C2=A0=20
> > -	ret =3D hid_hw_raw_request(hdev,
> > arctis_1_battery_request[0],
> > -				 write_buf,
> > sizeof(arctis_1_battery_request),
> > +	hid_dbg(hdev, "Sending battery request report");
> > +	ret =3D hid_hw_raw_request(hdev, request[0], write_buf, len,
> > =C2=A0=C2=A0				 HID_OUTPUT_REPORT,
> > HID_REQ_SET_REPORT);
> > -	if (ret < (int)sizeof(arctis_1_battery_request)) {
> > +	if (ret < (int)len) {
> > =C2=A0=C2=A0		hid_err(hdev, "hid_hw_raw_request() failed with
> > %d\n", ret);
> > =C2=A0=C2=A0		ret =3D -ENODATA;
> > =C2=A0=C2=A0	}
> > @@ -404,7 +405,8 @@ static void
> > steelseries_headset_fetch_battery(struct hid_device *hdev)
> > =C2=A0=C2=A0	int ret =3D 0;
> > =C2=A0=20
> > =C2=A0=C2=A0	if (sd->quirks & STEELSERIES_ARCTIS_1)
> > -		ret =3D
> > steelseries_headset_arctis_1_fetch_battery(hdev);
> > +		ret =3D steelseries_headset_request_battery(hdev,
> > +			arctis_1_battery_request,
> > sizeof(arctis_1_battery_request));
> > =C2=A0=20
> > =C2=A0=C2=A0	if (ret < 0)
> > =C2=A0=C2=A0		hid_dbg(hdev,
> > @@ -554,6 +556,10 @@ static int steelseries_probe(struct hid_device
> > *hdev, const struct hid_device_id
> > =C2=A0=C2=A0	if (ret)
> > =C2=A0=C2=A0		return ret;
> > =C2=A0=20
> > +	ret =3D hid_hw_open(hdev);
> > +	if (ret)
> > +		return ret;
>=20
> Should we call hid_hw_stop() if
> steelseries_headset_battery_register()=20
> below fails, as done in the remove funcion?
>=20
> > +
> > =C2=A0=C2=A0	if (steelseries_headset_battery_register(sd) < 0)
> > =C2=A0=C2=A0		hid_err(sd->hdev,
> > =C2=A0=C2=A0			"Failed to register battery for
> > headset\n");
> > @@ -580,6 +586,7 @@ static void steelseries_remove(struct
> > hid_device *hdev)
> > =C2=A0=20
> > =C2=A0=C2=A0	cancel_delayed_work_sync(&sd->battery_work);
> > =C2=A0=20
> > +	hid_hw_close(hdev);
> > =C2=A0=C2=A0	hid_hw_stop(hdev);
> > =C2=A0 }
> > =C2=A0=20
>=20


