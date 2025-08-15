Return-Path: <linux-input+bounces-14044-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A58B2826B
	for <lists+linux-input@lfdr.de>; Fri, 15 Aug 2025 16:50:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E68B41698CB
	for <lists+linux-input@lfdr.de>; Fri, 15 Aug 2025 14:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D71F22A1E1;
	Fri, 15 Aug 2025 14:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="lXxMKZMH";
	dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b="GjX9UrVO"
X-Original-To: linux-input@vger.kernel.org
Received: from e3i331.smtp2go.com (e3i331.smtp2go.com [158.120.85.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FF2319854
	for <linux-input@vger.kernel.org>; Fri, 15 Aug 2025 14:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.85.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755269412; cv=none; b=jdxrci54c6gUtquZyDTLgXZ1Onp6sqq5s4dFT+os3pIxE2enszjIf3X72r4DJwnl8kGcW7rH2KdVPgPWvzOzkahBzNAzxPCcjQkJTpgXpUUZgifQV+O+GdOclHwU0Bfub6e6QwBnGs/2QfJ7MxDvyBse0KcNH0cPY20/wZlWiV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755269412; c=relaxed/simple;
	bh=vBbph5dHkhutdCTVkxJyDj2PavT5WvspsYrnw8x0n+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QjXTsKJOq5CRF0847U6W7VKDwHwC/2uoKN18zyUqFuhYGZjcb+6hAcSfxXTiRT0dKIwKIcw7Pa4+BM3yNBqJvbWUUP4OhJoVqeLyUJrp0hpblBlPWH9nLshqAB2NeiIckkGkr2jn2cB5jJPYfspFhnmTV5X6c6UMfBL7pnm82kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev; spf=pass smtp.mailfrom=em1255854.medip.dev; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=lXxMKZMH; dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b=GjX9UrVO; arc=none smtp.client-ip=158.120.85.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1255854.medip.dev
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpservice.net;
 i=@smtpservice.net; q=dns/txt; s=a1-4; t=1755269406; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe : list-unsubscribe-post;
 bh=wULHCv+96eZLnevpHZpeudlEQ8kLugY9ap1N6Mw6mS8=;
 b=lXxMKZMH3zcGm5YHy7Lq9lOsRNkEzA4xAvQSf90p/hze6H2DsEcruT4AIbKQgEpcyIb9D
 2UgxUuq5M6COEIhkj/rlDqHR2B3enbBmYrD7KyePzVx/SmlEpEw8VDxzwtWBJFRyDrwmxZ0
 KywXIh8qDAZpV5kwJS3IJeHiJWCqjOhN7LqpkMwb3bLbxv1AZDdeADPSqhF9d3HtWeHxeY/
 JZ4ejEm7tSo9fp8Y6pUpCVfMrXhSoCoY3cg8Vz4zK0cxrTKIrvcWRuufRFfYJ78Lz/PTZ/B
 wZQ/sTGd1ERcI0ypFrRy533gkR8qUgfgQz8JedH15YEl0YvidWXKunmQw1Zg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=medip.dev;
 i=@medip.dev; q=dns/txt; s=s1255854; t=1755269406; h=from : subject :
 to : message-id : date;
 bh=wULHCv+96eZLnevpHZpeudlEQ8kLugY9ap1N6Mw6mS8=;
 b=GjX9UrVOyAPjj5TogiGA3teg2HR9ecjlo3QfBVSgs3CWswFDNNnQZQTE/SdBQTSkFtE56
 4cZMY6U8vI+GgFiOhd663/PIwklbN1W0p1aCVQwzkhgOsWLumLsaZCcNZNJZ0EgukaoNXtB
 vcrlxqzl+dWDGeAEjFmVJopvKiR9+ouaW+FLDK+8Eqias5pJkqJOJgxE5odDLvIvO8Z/eCh
 vM5VdzAsS4WzVwn747ZKEKIq+nzuFm7bqxsNIOADAn0mtMG9UsnPc/ylj+jQqt8JXcPC30W
 AWKQQ1Xexm9dWkZARGAwHQpK5S1fcJ3yzWzCexO3PMtwk/tUxSP6zoBYvmPA==
Received: from [10.152.250.198] (helo=vilez.localnet)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.1-S2G)
	(envelope-from <edip@medip.dev>)
	id 1umvkm-4o5NDgrs3MH-eLYV;
	Fri, 15 Aug 2025 14:50:00 +0000
From: Edip Hazuri <edip@medip.dev>
To: dmitry.torokhov@gmail.com, jikos@kernel.org
Reply-To: 20250802212149.16707-2-edip@medip.dev
Cc: bentiss@kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, Edip Hazuri <edip@medip.dev>
Subject: Re: [PATCH 1/2] Input: Add key event code for Fn + P
Date: Fri, 15 Aug 2025 17:49:55 +0300
Message-ID: <1965589.tdWV9SEqCh@vilez>
In-Reply-To: <20250802212149.16707-2-edip@medip.dev>
References: <20250802212149.16707-2-edip@medip.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 1255854m:1255854ay30w_v:1255854sNJGsZfqxx
X-smtpcorp-track: gN-0eJJsAXyq.6r5K-nOkNnkQ.04hJOA5y_Nj

On Sunday, August 3, 2025 12:21:50=E2=80=AFAM GMT+03:00 edip@medip.dev wrot=
e:
> From: Edip Hazuri <edip@medip.dev>
>=20
> Newer Victus (and probably newer omen) laptops contains a "Fn + P"
> Shortcut. This is intended to use with Omen Gaming Hub, Which is
> changing the performance profile when this shortcut triggered. This
> shortcut is shown on performance control page, see [1]
>=20
> Currently there is no key definition to handle this. So add a KEY_FN_P
> keycode define to be able to use this shortcut.
>=20
> [1]: https://jpcdn.it/img/adadf6c927ffeb75afd8038f95db400a.png
>=20
> Signed-off-by: Edip Hazuri <edip@medip.dev>
> ---
>  drivers/hid/hid-debug.c                | 2 +-
>  include/uapi/linux/input-event-codes.h | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
> index 4424c0512ba..2bcf7b24801 100644
> --- a/drivers/hid/hid-debug.c
> +++ b/drivers/hid/hid-debug.c
> @@ -3342,7 +3342,7 @@ static const char *keys[KEY_MAX + 1] =3D {
>  	[KEY_FN_1] =3D "Fn+1",			[KEY_FN_2] =3D=20
"Fn+2",
>  	[KEY_FN_B] =3D "Fn+B",			[KEY_FN_D] =3D "Fn+D",
>  	[KEY_FN_E] =3D "Fn+E",			[KEY_FN_F] =3D=20
"Fn+F",
> -	[KEY_FN_S] =3D "Fn+S",
> +	[KEY_FN_S] =3D "Fn+S",			[KEY_FN_P] =3D "Fn+P",
>  	[KEY_FN_F1] =3D "Fn+F1",			[KEY_FN_F2] =3D=20
"Fn+F2",
>  	[KEY_FN_F3] =3D "Fn+F3",			[KEY_FN_F4] =3D=20
"Fn+F4",
>  	[KEY_FN_F5] =3D "Fn+F5",			[KEY_FN_F6] =3D=20
"Fn+F6",
> diff --git a/include/uapi/linux/input-event-codes.h
> b/include/uapi/linux/input-event-codes.h index 3b2524e4b66..2fc79b32425
> 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -548,6 +548,7 @@
>  #define KEY_FN_S		0x1e3
>  #define KEY_FN_B		0x1e4
>  #define KEY_FN_RIGHT_SHIFT	0x1e5
> +#define KEY_FN_P		0x1e6
>=20
>  #define KEY_BRL_DOT1		0x1f1
>  #define KEY_BRL_DOT2		0x1f2

Hello,

Please don't merge this. I made a v2 of this patch and this is no longer=20
needed.=20

Thanks!




