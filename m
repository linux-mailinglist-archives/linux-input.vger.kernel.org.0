Return-Path: <linux-input+bounces-4292-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5ACF901E74
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 11:40:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E498283616
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 09:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CD4C55887;
	Mon, 10 Jun 2024 09:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=valdikss.org.ru header.i=@valdikss.org.ru header.b="5eM+KJEu"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.valdk.tel (mail.valdk.tel [185.177.150.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FAB1DFD0
	for <linux-input@vger.kernel.org>; Mon, 10 Jun 2024 09:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.177.150.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718012445; cv=none; b=eBrOYFdmQMzD2STkQj1ixxjQT3UHtHwlEPtCrGvd/dVKku4VN9LUU/7grtQWBV4Gjo2RWFPCP5QGnM8R53OGDBbOVZyHLGdwQm9cK2jL/FmWyJT5nf0oqWsUfugOZxaD60JvTg255F5kPok44/RQGwlCwjkOlzqrDguumzJjgOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718012445; c=relaxed/simple;
	bh=1j5h7SZtcCpdm/PNu0Rd18xrSRdfsYA7qD09rjSNJnw=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=DNJwx4T4Ixtp6VxLzXxd6zS7NMxrn09V96NQnKo629TolJoMfbRTWXAElx6D6KVkDnO1kCVyuncWUR6KUJ+JjFmyD0qdh8Ntpw3whHzV3dlfXf/ylRm92+uvoOpYRvxXmzg3s7WGSkt0OxUqOlTNQK7QQgS9DyMvIzT7iCLRJe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=valdikss.org.ru; spf=pass smtp.mailfrom=valdikss.org.ru; dkim=pass (2048-bit key) header.d=valdikss.org.ru header.i=@valdikss.org.ru header.b=5eM+KJEu; arc=none smtp.client-ip=185.177.150.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=valdikss.org.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valdikss.org.ru
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0F2021396E25;
	Mon, 10 Jun 2024 12:31:49 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valdikss.org.ru;
	s=msrv; t=1718011912;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-language:in-reply-to:references:autocrypt;
	bh=1j5h7SZtcCpdm/PNu0Rd18xrSRdfsYA7qD09rjSNJnw=;
	b=5eM+KJEu43xZx5tQN3Q4ebOWwdZMVhIlA7qw38SPMheELPMBG6IqVk5SCENJpaerHrN2Jl
	cEMzJ5ltZeZt/cAxa32Pj/LlcxjNgOGIst8aCNbJCZBm5cEnrlc0OytTHmWh7gj2xsuzCF
	BHYQYIZnvvAmqO+vPT7NphKzKrl6re7Wr86kDvMvNTOdamLlduwyssIKhKYaAOgnhsf/Ug
	af+a/C4qxxRfKSqs2jGBCcuqESBgUSQyf0et2bR6Hb1CGfL/BrrPrt4z8xA3lOpoVJnhG4
	sNfFffKHb1wltUtAWaTmc9QooFhDaL2rLLUdVAAUGe/412ThOdoYOsmstu5J0g==
Message-ID: <33e85797-61c8-4228-9cbd-b72b06d8c94b@valdikss.org.ru>
Date: Mon, 10 Jun 2024 12:31:48 +0300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: iam@valdikss.org.ru
Cc: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org,
 rodrigoaguileraparraga@gmail.com
References: <20240520000527.203644-1-iam@valdikss.org.ru>
Subject: Re: [PATCH] HID: lenovo: fix Fn-Lock on Lenovo TrackPoint Keyboard II
 in USB mode
Content-Language: ru, en-US
From: ValdikSS <iam@valdikss.org.ru>
Autocrypt: addr=iam@valdikss.org.ru; keydata=
 xsFNBFPBBkkBEADaww9j8CxzrWLEe+Ho9ZsoTFThdb3NZA3F+vRMoMyvBuy6so9ZQZgCXoz+
 Fl8jRF6CYOxoe2iHgC3VisT6T0CivyRQexGQ8bga6vvuXHDfZKt1R6nxPoBJLeyk/dFQk0eC
 RB81SQ+KHh2AUaTHZueS4m7rWg42gGKr57s+SkyqNYQ3/8sk1pw+p+PmJ0t4B1xRsTmdJEfO
 RPq+hZp8NfAzmJ4ORWeuopDRRwNmlHrvAqQfsNPwzfKxpT1G4bab4i7JAfZku2Quiiml1cI3
 VKVf7FdR+HauuDXECEUh5vsoYR2h8DyfJQLOBi3kbAJpDlkc/C/9atEubOI/blxshxA8Cv/B
 Gkpf//aAthFEBnbQHFn40jSDIB+QY2SLcpUvSWmu5fKFICyOCDh6K/RQbaeCDQD0L2W6S/65
 28EOHALSFqkF6RkAKXBDgT9qEBcQk9CNWkA6HcpsTCcNqEdsIlsHXVaVLQggBvvvJRiWzJY0
 QFRxPePnwuHCbnFqpMFP7BQKJyw0+hSo4K3o+zm/+/UZANjHt3S126pScFocEQVIXWVhlDrH
 2WuOlRrvfh6cTiD4VKPRiii2EJxA+2tRZzmZiHAeYePq0LD8a0cDkI3/7gtPbMbtgVv2JgpR
 RZubPS3On+CWbcp9UPqsOnhp6epXPHkcHokGYkLo7xzUBsjENQARAQABzR5WYWxkaWtTUyA8
 aWFtQHZhbGRpa3NzLm9yZy5ydT7CwY4EEwEIADgWIQQyKiC9dymZLfa/vWBc1yAu74j3cgUC
 XqmcAgIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRBc1yAu74j3coeKD/9FKRS1CcO6
 54uChXmsgtoZjkexjagl2kTXtde5FFPh8Hxub+tNRYIUOYilx5R8pidmKZpVGVlPP3Rzf/Vf
 tr9YiEhSinQ1waWV5VfU43R5qTo0/I7Ni/vjbboAGULg1bPv0N3lnC5NOEq34WauuXJbfQBl
 uQpHaG6gGrJyy9hmD0LI9he3JpGItjqicJ4MS3XJO/YmC0UNsvpeuh1Fi6Y+QiJ+AgpYWCgX
 t8VaoGuinQePLu/Iy+gp5Ie+JTPWt2AKOJylCs6473VdY8m+geJD8yot1uL9mXtRdL8uKXKv
 2R4EbEaGVJ0/ls0v0TAohfeFQDdwzGQjk1aBBfdbhDcVmo8slb0ry53AbzO/nxS0pEycvPXu
 4pC3pJKCe2pPUuNrCj6Qoijtv0abLN1VocJ2dTsXNgOVHnrEvu032kjTyiGJeQVRgl90Sv/H
 S/17JHUdTGfoEkTHfivqZOYv/ccYpqh0M1TUE5xgPVnWX13uoBswVZimLKkIPfOxtmQ8Wge2
 WlDR/QLwIkGm2b9fBI68lNgBBPv7k16dQL/5ugSDvZNWSThGoYL6i8a3jUJfK8JilIJhsh+D
 90MfCAbfiECALc0HOmC4KVRY/zIVMZgwFm0PjNtID0TmWHoFb8rt5sVyLf//Xco4SVk80wPQ
 /TRnOGM2InosX3l2YoxBrT5Epc7BTQRTwQZJARAAo5h4vuxyV04K1mhVsqoY05kruPrMVptv
 +uopIlteLfn/9EM0Mn10FJA5WHLWqTT/TuFN+wxkGa1KRnziLpbc/Zq2L/AWthDEb9+pNEjr
 3HfT7H71Rjsa3GEYiFgVtPYIQZ8RwuvYv31FgXedHBEXYrhm+kKh8d0A76nHc9jUJJKZyja6
 Wtz2SP6QFYnlf9rCXMiyB5d4l0xZgbWWok8Fol9tZbRte+Lwn1QtmpNhtDbEb28I3W3VVYnk
 LYtWaTWo8udVyngjGCM3zLV4VMVDZi77Fycel1UGNQTCyjeNuhRyL6Ms9IOGVcKWURJWXbzZ
 BSBzqc/PGvRi+A1ytJtEKWyZHrx1Yf5va3vDqRKYBxhOtnf5Fh+nd0e37V8yUb3ofLXgG30A
 mR14xobjaF3ziS0D5w03611YpPlIKwWogQeOVHlinYySIlQtKEsx5pQYgdQ0PzFy53xUsx47
 EVLeRKw5PG4uyH79mgyNEFhn+tGMUlSOYDngIIiSm0k0v8+hyP+T1XLDy4Uo4IQXTdRZ5/tN
 AIlhNEftQyvI3wZC9IZoiZLOgw7qsCrBJ5VMwweZzi94PYCjQPUACr8yF5taJ1lQKuUfltR1
 iGYb6Vdf9hnNs5E0Flo2WZfaywfMjAh5I9GhUKRC6BgfpYtmgFbGzDbhr1idSH3NbMUD3wg+
 TP0AEQEAAcLBXwQYAQIACQUCU8EGSQIbDAAKCRBc1yAu74j3coMhD/wJiHIe7DuvhWr39An/
 yA9zAqNTvQEdm3vUIw5UQjqn45IOnn/R+leps31hVrROSzhpXeeGtOh17+jjt2hbw3KRrgYi
 V+qWiNBx7Ux3UOGOCqeAhnztTn0uHJUiarEYPhTm6K4tJB1Ob6RG7+ftIBrD/fUCCDWIEOT8
 7Q0xj0IH94Gxo1s+iRrRnNwyQXa821EzqqZgsv4fKvQmGtGX3sPDrXV057tNaF7jmrWBkJZt
 heU8LaH4EAmcJc1k30k1ql8T4kXO1qKlJvMdLji39fq7kWA6xdgpjwI5EHaIAj6R2T48iWVw
 Fu2vLSZPR983j+Eh7VwGnvAh9Tj19uXYPUBqgAzIYDWWOGiM2FsezzWQ8rADAcXNMyV+/a4S
 Kcur0yPLYbL5mP5TWLb4ucCF/6eDgcNG6u1U1kKslRXzVc/3l8ZoX4Djs0nIyjwsbhuwiL8x
 rvpQq1VvOlkpyypS8w5t4U12yEeO2XKiHUcnCdFCk5yd1Vg77EulqY06nCJgaVMDSxLowtqL
 6V6G7SxBEhcsR4fmpY7nj4GoymEGom3dLqe2JjTpVTJcuuFleHHI/lbcBa5hiN8a7+c8A9K2
 FzgxriVWpfwm0XovNBjugipYItle3p/18YCjVnUoXEsgrjUOgAaQ2RVHJzRz07tKX1DBhFRD
 OEcVmRU/pw5/zoQyQg==
In-Reply-To: <20240520000527.203644-1-iam@valdikss.org.ru>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------unBHJNMx4iaykPZdotDe3GvO"
X-Last-TLS-Session-Version: TLSv1.3

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------unBHJNMx4iaykPZdotDe3GvO
Content-Type: multipart/mixed; boundary="------------ST1gkEJqEFIiNL6fnkyzuKDL";
 protected-headers="v1"
From: ValdikSS <iam@valdikss.org.ru>
To: iam@valdikss.org.ru
Cc: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org,
 rodrigoaguileraparraga@gmail.com
Message-ID: <33e85797-61c8-4228-9cbd-b72b06d8c94b@valdikss.org.ru>
Subject: Re: [PATCH] HID: lenovo: fix Fn-Lock on Lenovo TrackPoint Keyboard II
 in USB mode
References: <20240520000527.203644-1-iam@valdikss.org.ru>
In-Reply-To: <20240520000527.203644-1-iam@valdikss.org.ru>

--------------ST1gkEJqEFIiNL6fnkyzuKDL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

S2luZGx5IGFza2luZyB0byByZXZpZXcgdGhlIHBhdGNoLCBpdCdzIHNtYWxsIGJ1dCBmaXhl
cyB0aGUgcmVhbCBhbmQgDQphbm5veWluZyBpc3N1ZS4NCg0K

--------------ST1gkEJqEFIiNL6fnkyzuKDL--

--------------unBHJNMx4iaykPZdotDe3GvO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEMiogvXcpmS32v71gXNcgLu+I93IFAmZmyAQFAwAAAAAACgkQXNcgLu+I93JO
qQ/+KKnYAfNrJUDixZHUELAoeX/Z6/v72JC/sRo1QdB8r+V8EzkyOTcOyi9IUGNw2fP7GVXEz2Su
W0yWyB/9XUcCbWvpkfwwBFBKFOrpgMMvEEATuF5zMVUW+k1OoMocmYGZXBerkmUnmeo6rNSvpyuW
IQOcYsZTViK4XKiWjBUZ51zxsF1GG6Fvnw4RoW3Ig+qVJ2qmBywZAZ/wBNvPVDEpWDrOdAKntgJN
qp/SEaXug7yvtjypuoUGzunHfApNpl8BKGD1u7O7LTBnnHbMQTTO6e5kR/egTolNqR0/A3KULCmn
Bsoz0b9oMKxcGRfjH/lLR22UByv79hYK2tOEAJQU6OYfJokB3LqFTGn+YqWEYe3cYzlgepPX1Dcy
apf7MoZ02Q+paDaItEtEVX9xgGF9XcHuXcxtYbrsdPJO9b5kVrBZN8wU0GD8CKXSYAs8Ac8Um/XW
nDxqpO+ygoVILxCSxCwxSUTtuS9sPO1rceQSgP22N183tXpmyMKPP7+jrT13/c8EGQtTndElEbvf
hiI1w8vqFmhdRIi1qQrDlwVoPwqWEjyeZyAHjwzqISuSpYrt+rGa0a1MD4uK8ELOeJXTTBlbIqpw
LQOHZKdXL0/IMZ3QOVHxklP+X5ShQSdVjTQcw/dSShDuioFBFt/Xbs8GVeqnmag49Eg1hHiNNU6z
4eU=
=JUuB
-----END PGP SIGNATURE-----

--------------unBHJNMx4iaykPZdotDe3GvO--

