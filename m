Return-Path: <linux-input+bounces-7716-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BA07F9B1E06
	for <lists+linux-input@lfdr.de>; Sun, 27 Oct 2024 15:07:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71E041F21730
	for <lists+linux-input@lfdr.de>; Sun, 27 Oct 2024 14:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87F3016B3B7;
	Sun, 27 Oct 2024 14:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="AsyQpyZw"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992CF16F8EF;
	Sun, 27 Oct 2024 14:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730037995; cv=none; b=oJziin6/c7utTW+d4aQqn7zlxmGx+/z29NoSiyox6MrFfw1GZIvyaXpUVyLcR2CtqtdBa4gwUAl35nxn0ib58wmJZaMV/HMU9mN21B0T6h7YzpDK3bgrEmHVZBpmtTtrI7o5jlanGOAAFq+MWA5tm1Eq/lZFq261eNwR1XXaFjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730037995; c=relaxed/simple;
	bh=shzMhA1ShIAzT/nl39/7faxKV6dT0AWJD5xF0gYTwuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C+pTFRjcuZ0K6iPulQnF2KmVr4Nu15Oktg1SiAhkq6AEnI87duYVOtZ9XlLz1E2tpre3bhg7gYuoTENRZwRC5uHnzNlCioApvK2LoGfSibP+nqR6o5o9xqJC6sQuh652BZMTYHN8Rw1bLT7hFyi+RDm7IInW2cP5cEGltU4yJ+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=AsyQpyZw; arc=none smtp.client-ip=212.227.17.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1730037971; x=1730642771; i=christian@heusel.eu;
	bh=jClmXAlUGXYrZ7D0GspMoXRQShIjacF/nvZ/v7Jg9oA=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=AsyQpyZwUbrIy+LY5pWQZH7Qyzc48geigQrSR2a0ZbvnnvcEME2RxK4VP/+lW2SH
	 gkQTwBqitfK4pjUlXwFikk3hgBY9+pHMwzsxBiP97Ks0hjZ8kdzK9QYusO+pK3Ki2
	 SlnXedkDhBVjW+Rq/CPC2pGhbg9XEfzPfAlLzHdzslxhqoK/7GrQSMuuxaskE1VPM
	 oemlH4iASedrrX7YH8DKgHqphRrY01Sqq70IPuBbFrmH3mS+OCNjOlNHshmEb0Lj1
	 BqAiVUh2e2IY3gmccJq4R22bGdkOj0GMsAFaDLHgG5xXSxdvkVdUVGjRnkwzF/+KC
	 HVtzAgbSdb5cslSk9A==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([141.70.80.5]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MKc0o-1tJHuI3ZWO-00NhJl; Sun, 27
 Oct 2024 15:06:10 +0100
Date: Sun, 27 Oct 2024 15:06:09 +0100
From: Christian Heusel <christian@heusel.eu>
To: "Ned T. Crigler" <crigler@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	Jeff LaBundy <jeff@labundy.com>, Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [REGRESSION] disabling and re-enabling magic sysrq fails after
 kernel 6.11
Message-ID: <69b6119c-3c3a-406f-9375-3e55fba9b732@heusel.eu>
References: <Zx2iQp6csn42PJA7@xavtug>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6ltj3y347njtiyc7"
Content-Disposition: inline
In-Reply-To: <Zx2iQp6csn42PJA7@xavtug>
X-Provags-ID: V03:K1:bcEW9OKSDcBN6iBJVT1IxSn0dhS4niUXkbBATWCvAS/NBbUxjJY
 Z3U3r2AUtpIW8o+uKSENCloX8B1NS9WxK0ftmtonYDROog7N386GJWdcnEl7nGCf+9u1deT
 ffHvWqhKOxr3tqN76jso3hbaAF3JWWTn87il7JwSjd6fxVQ+l4/TPNbgwHR7bLj/QMTqQ36
 2fT8BkhgXis4YLwPCe+iA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:caUVJ2Omcak=;WNv1/VZRLTlqtc4h3php6RNqUdS
 r8poFdSan4gIt2JasRh72OQEoN9MmrvV6wJIDseSAWDPEMgGPDk9cVSeCzgefNxRz5laGerXY
 Rp29Q0XCrE0m48Lt1+O+kDC4K7/AAQd4BDB60l4HnoF88uVVfBPylIDzuHzTm42nYW2D9WcYa
 yfAU/zhfiM45rMrV7vU2U3GnfMlVXvtkq3f+pHk+iiCwyd4R7ptOizEn5ZPnulbGC0LGZdo8X
 6HFWfXf4EKOO6bdAkwVwL/rGCqY8uGyhhVFp0YzA33lahwWHIiFG9zahdpfTOEZzDFExCrd0T
 SX4PtH72kCG2d31w0VB3+AKO3iVhCumaTJ4nGLZ9B8Jv5i+GFudJDOlS1b8bkT8UC8vRfYtTc
 iuwizEccItXSBSqtwuWZN1oNzmhpsyRb7BWInCPct2NHE46Bw3VnU1kZ9cvI0z15uw/1wrAOD
 MN4z+vBWQPe74Im8vnevUDl9KONWWVr0c9R0vLCh/kzu/31vpgZ+lqrLRpmnZqrelk0Y2F6j2
 O04oCD5YZxcdxPnc1UcAL3e9DOoJSQdkOewlXbRLERVi3Qe+kmkLThXRxdMi96JnUl8IIpBsj
 cwG/AHu95n9p1/BZtPwNQFE2ic0QZFw1jKg7TMLd/5x1OuFkKJOCZY9olGB6s9UvDDWkzTxTY
 0P702eTc2wgTGkQQS9IQNcu+AGoFQoTFIHfGOyEEEOHgSdDY0aIHu1vnRvTnXJwogmf3cqagr
 Pp+kw/fZ9f6+ZxueYRvtfmY0EaLqIpjnA==


--6ltj3y347njtiyc7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [REGRESSION] disabling and re-enabling magic sysrq fails after
 kernel 6.11
MIME-Version: 1.0

On 24/10/26 07:15PM, Ned T. Crigler wrote:
> Hi,

Hey Ned,

> It looks like starting with kernel 6.11, disabling and re-enabling
> magic
> sysrq fails with these errors in dmesg:
>=20
> kernel: input: input_handler_check_methods: only one event processing
> method can be defined (sysrq)
> kernel: sysrq: Failed to register input handler, error -22
>=20
> after doing:
>=20
> # echo 0 > /proc/sys/kernel/sysrq
> # echo 438 > /proc/sys/kernel/sysrq
> # echo 0 > /proc/sys/kernel/sysrq
> # echo 438 > /proc/sys/kernel/sysrq
> # echo 0 > /proc/sys/kernel/sysrq
> # echo 438 > /proc/sys/kernel/sysrq

I have found that this issue is also present in the latest mainline
release and bisected it to the following commit:

    d469647bafd9 ("Input: simplify event handling logic")

The additional authors / maintainers have been added to the recipients
lists.

I hope I didn't overlook any pending fixes.

> --=20
> Ned T. Crigler

Cheers,
Chris

--6ltj3y347njtiyc7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmceSNEACgkQwEfU8yi1
JYXzXA/9GvWBON+9+wLDs4ZyBFbK2Vj514B0nAODEVNVS4+DlS9eg8/IKst/iybB
YfEy/8NF6uRcyk74E36HOWQVe2BkG6bDK0ZzudNkLJy6ej3r1Z6ivAyJs8tLRGrV
IoUBY0W4HzVo3cUb/tMoRkVTo/8XAroaB2iE/Znkq2VKe2ma6NEvnjuJgFbIE6aq
NP8LXOH1XYnzrJLB/O2n5ejs+4vOO+AdKiQ/pptf9F1uWA3QLscLGY+BhLpyVPG8
CxttSjehC/oyV0PcCXfDLvRaNPlbY3LyLmCYMqfFDVWK7kUVqZ5cnlOW78kmIOro
gyi9EdP7jqu1HGsSU9xc6YXUe3ZEcrT2M3TRrbNn6C5rGOoIK1KXQy0+h8ru0cEq
TgxixZDfuljKoGkDeMUZP+htIw3mLbkQK2CcHOoFxBZx49UaC3wR5cF7NPR4FeM/
fSQNwmcsGnXBdENcjTWOcZIoujKA/AK1j4mPYAgseJC4CheUfQqFViApE1m2tehC
/LN3c3VYxq4HcQYCIHOCyCPreQQgPCZ5P0n+xNTikklaJiR2m+zFddVTPBcyx86q
MaRC6cWxDUnipA/T5qzVkpSIwlzuBQ7mAYa5F7Xo7wnRfV3RAcBV10M6zY3wjsiG
UNy/Lo68/HiwHoa9JeJ2clU+DzB8IPgD0D4WkcyRVx9r02TvS/4=
=+itq
-----END PGP SIGNATURE-----

--6ltj3y347njtiyc7--

