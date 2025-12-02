Return-Path: <linux-input+bounces-16448-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C617C9B728
	for <lists+linux-input@lfdr.de>; Tue, 02 Dec 2025 13:18:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B5833A7871
	for <lists+linux-input@lfdr.de>; Tue,  2 Dec 2025 12:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2262D311972;
	Tue,  2 Dec 2025 12:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="fQGgTFqv"
X-Original-To: linux-input@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F5B306D3F;
	Tue,  2 Dec 2025 12:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764677895; cv=none; b=LoJI/OepDWw1NmHyZ05HmjBfNIgGjqeONyKCKX+MiPomMIoIeGNHLyVlN0zxTLxNLZzl9uw5EoVR8WV8xXZ7hRYIkLxXHVbuiO9XizNmJ902zo2+/KvxcT4q2DCDJreKgUL4rYTeBoXeu+KL7xHp1Hga9IGx0mdL8GLyfn2Strc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764677895; c=relaxed/simple;
	bh=sXC5fYMIwckjs0MosF7CiJF3SOsSPFgB8RKJvnTjXDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OxjfhO1i6UGuplr4QQAPAj2kM4CdjTpWmusmgs+8fdhpV3JmFwH3ICMmN7WcdGmwNA4tpYQbjtfERoFQfwhqQIvXYjqLSLQYqhvqibdd9r6bw9sALt2gSLJ7OHlDgX7AD1ebkrlYoSKGWhJ6l0z1QFgPHVaHUeAXgCdtVDBPM3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=fQGgTFqv; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 69C9D1C01C2; Tue,  2 Dec 2025 13:18:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1764677889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pMByTJW7HuYH6h+sQHpHqZNmQLPydnIXrlhP/TtlMXQ=;
	b=fQGgTFqv6NAAFRlctGHSw27VAq2PrqQtymoAOrI7Fh4+kL41gmUrMvMFMapb/O4n4LyNwF
	OTocinhLKFr/ZJFR/xe90wpnQxAA1XJYUUUrk0M7QDKHyAMZiw0trKHKqslx1dCgbJ9Qqy
	czZsJGtSd5pvV8Fqw4anzDWkM9gF2hQ=
Date: Tue, 2 Dec 2025 13:18:08 +0100
From: Pavel Machek <pavel@ucw.cz>
To: david@ixit.cz
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Casey Connolly <casey.connolly@linaro.org>,
	Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
	linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
	Gergo Koteles <soyer@irl.hu>
Subject: Re: [PATCH v8 1/2] Input: add ABS_SND_PROFILE
Message-ID: <aS7Y5hFslQ7e2en3@duo.ucw.cz>
References: <20251113-op6-tri-state-v8-0-54073f3874bc@ixit.cz>
 <20251113-op6-tri-state-v8-1-54073f3874bc@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fpifvw8uNtkv5Wht"
Content-Disposition: inline
In-Reply-To: <20251113-op6-tri-state-v8-1-54073f3874bc@ixit.cz>


--fpifvw8uNtkv5Wht
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2025-11-13 17:02:58, David Heidelberg via B4 Relay wrote:
> From: Gergo Koteles <soyer@irl.hu>
>=20
> ABS_SND_PROFILE used to describe the state of a multi-value sound profile
> switch. This will be used for the alert-slider on OnePlus phones or other
> phones.
>=20
> Profile values added as SND_PROFLE_(SILENT|VIBRATE|RING) identifiers
> to input-event-codes.h so they can be used from DTS.
>=20
> Signed-off-by: Gergo Koteles <soyer@irl.hu>
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> Tested-by: Guido G=FCnther <agx@sigxcpu.org> # oneplus,fajita & oneplus,e=
nchilada
> Reviewed-by: Guido G=FCnther <agx@sigxcpu.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Pavel Machek <pavel@ucw.cz>

Best regards,
							Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--fpifvw8uNtkv5Wht
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaS7ZAAAKCRAw5/Bqldv6
8uM9AJ91FbCtzoPnkjXb6qTkzSFV0zSUmACeJ3kyR/GF79NwNQnczU0+lFNoGUI=
=ArNh
-----END PGP SIGNATURE-----

--fpifvw8uNtkv5Wht--

