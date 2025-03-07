Return-Path: <linux-input+bounces-10631-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F48DA56FBF
	for <lists+linux-input@lfdr.de>; Fri,  7 Mar 2025 18:55:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79FD43B8681
	for <lists+linux-input@lfdr.de>; Fri,  7 Mar 2025 17:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC52C21D5A0;
	Fri,  7 Mar 2025 17:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="fDJmHGyP"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2380421C180;
	Fri,  7 Mar 2025 17:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741370120; cv=none; b=G+D86X+kXGp1PenOCRz/HKIo4t16Dga7uIi30cfbDiTmXS7ShuYJAHf1goooByzfGaKhMmlG9/5cjD0nbGVwuCJQ/4OmLYsVLsJhJohDt2pcWJzOa5IUmcMwOHnWAexyj4hrWUDbbEka4uSiCgbsc5uhZsAlIG13S6/7Z12EUp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741370120; c=relaxed/simple;
	bh=KVxY2J9DrBZ39YBPI3U2LoJTkdvkmOOB7/uOGPNlBiQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=NLxKhRokJF/DnoLkeBJPgsrX/zepjWPcvjOBrrLHs+UttQAcJ3jXWlMf6dAVMu8AVrtD8R+A0mQ5QTs3x+/B90NXCL4a3Tt+XER+FraKK+rlM9zDQR+/76BaM8esaYbczGX859opNugVYq3b5o9wmwk9OtWCL7nD1kL2qcGMumY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=fDJmHGyP; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1741370098; x=1741974898; i=markus.elfring@web.de;
	bh=KVxY2J9DrBZ39YBPI3U2LoJTkdvkmOOB7/uOGPNlBiQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=fDJmHGyPQ1gBd3ofT2cgD1f4WlTF1BfgWaQgsasgKw8dMEKjc1XNREuvY4rKJ/Y6
	 GtGq7plq12Uf2Y34X52CS64U2/8zBxPBrWyr/69SmKHSMKeIDwMv8JFcXqMKE59BU
	 G0nX7AyAUvSHKq66qILD9doT0Sw3v0Vs52iQZvTocBlbGq6baGrr2IseqvT8Dg5xF
	 84ft86H70y2b670ITAwZASGhoc1eB/gSORGnjuM+xEOlZOqoQXKA3TetGDSp4vSme
	 yKIdK2ctpu6yXQ85KthkwzGDyRuqonWp7KdO8gz612NvSGBkh1VYISVDcOIHgQRDI
	 yrvs9eL4Xg0N+ODHxg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.70]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mt8kX-1sxYPw40C1-00yChM; Fri, 07
 Mar 2025 18:54:57 +0100
Message-ID: <4abdf297-ccd0-479f-89dc-4c57390c074f@web.de>
Date: Fri, 7 Mar 2025 18:54:56 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: vulab@iscas.ac.cn, linux-input@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Erick Archer <erick.archer@outlook.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>
References: <20250303110731.1491-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] Input: alps - Propagate alps_passthrough_mode_v2() errors
 in alps_poll()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250303110731.1491-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KMBon/1UoHpbgTZClg6pG395xJyt963mU+R7+tl8fNsiC/CYW+h
 6yyLVUoTNgCM4/8GkdCxjSEsduB6f8P5ao1EID1MwGff43e/OEHgUYtoYVDSuObCMvGmiyJ
 5+8nT3dbjV9D0+sw+0g7qnDOUbrW5nMeLDR+E7o/0Nf7Nmujs3s99ElJEMN518WuKno+Gwl
 XDZ1lbmU9Y+/+zJdNqlPA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7C1m0zeEvEk=;gaE78KsF7QS1EyCYBhDt3cHIw4w
 Qyw280St71q9iMZ2VdJCpEaZhtNTFc6stuZKPPRsd2W6yBQdcB0nDeWQBbzUkVRGs+9YaC0IR
 k/3JkHU8FDYGD8FNSlr9hPxLlcRUKxxWd2ZJE0kkZRKB2q+VjjtQtLPBIjCcnB3l18QQ6RlPl
 jSdcz9sfGSOUjhwf/UMC8PJoi0xu0krVIBEjZjLXfPZCwPPvKNsKPqqa1ucYVIxnk6mCeuq+I
 Pbzdh6DNs2+lRJi36HKIzHRN+Dc07Delva6k9dWvVIKlyswTik+8Mb5Zr0G4YE3Wo++F9l3K7
 fSAWUPEp12CDOwPeQZy8f3f9Bh5/f4fGjJDaw9F/g0F7NKQj1gHOeSiMVdOxpFK3244QQTvW+
 kZGaW6LboW0UXrDwxB1p1ma5T+q8ZZuQnF9R4UMsiEFeD68ar0PbMCXeW1qPQf5FjHoQiuFkG
 CKEoGmXROLMMzgpQ8CQr0DZZw1ZFhVpTn2i6/gjfj3+obOp9C0WjXJvSvPhZBToi78Kiapdk7
 Xs1Ttv5x37e7APDsvgT/UuCF6iju1leYKKz4vR7OiuR7uOlJgYW8l3StM9g3yK8slh2dy4xHg
 h3HOjObZARtOPK/2ywC5BU1nbDcga8lnylK4jhERfoS3ybgPwcU6l8pDBc6CPOYth/e3qiOy4
 ato8PoT4NHB3kbMYhvAZD8W2HwV7+X4lViUJWtnCOMaPeBqt2aTXlHzLw0Qr1P8CkGCOUJvZL
 1u1gdJq0/jsXFhaBePloZrKZSKC8dQDNHVWVAFXbiBmV2APbgtKemezr0pdYz6fr2hUqkkCXe
 n/JdQcWEUrMt8hoWxrFh6EpdCxTjI0fPyQiAENo0qk7AOz9OYOaEqlSfNAQkaUMJn2YUbuYvT
 25jQw/ZWMCD0GWwO60gQIdD2+Lj7mPScMgRyG7NPTEaDGDnw6IqXixSf4xD4iE4cFfUbE54Ap
 RO6EIUNhyKQkn+dwtkJtf5lC0GMB3fTRrqXCuGu7eKqY8W/iCJrzLnxRI/BcpFvmM/NHyxujy
 /l5ATPG0xmczVCAsAKUB6KkeBSA+p/J9Ng1CQjSoxp0ZbsrYMxZCxttbQyJV6qOzsApbS8kZM
 DITE/N6gKFG9Q9DWJsAaq2Amfz6J9mik/5J/zxJNAP3fe5J4dn+FVFvtxJfYcmwJjYnsNVK+f
 GPH7pbgOfxk/pksSKmcS6lZeEmhGFt0j+XbjfPz4k11bZ9lE0llStoNsL3lCo1/vfEJrrGqRn
 n5V7cTrNQqaFWc9W6EMejymofUFgYqA9Z2zzjqSKgwUhge/EGr6N0NrDKj6Fi5s3QP8zNxc1Q
 u7zpO1AtIOxkFqwDccW/0KpUUGE/R7IBUriTrCLD4jlWOWs8lT8LWh/UBcvxSjHkz4bXTA0ng
 mhm+9Ld23SuzkUVFjpjwmKYhrbZvKVwGDRDY04MCyAZHzCoEh7DxDfguD2fOJ7HEff2q0KM9i
 WOKEL3CwURgLIxOkgsFqLdQM5NYE=

> Add error handling to propagate alps_passthrough_mode_v2() failures
> to the caller. When alps_passthrough_mode_v2() fails, immediately
> return -1 to stop further processing and maintain consistent error
> reporting.

How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/Documentation/process/submitting-patches.rst?h=3Dv6.14-rc5#n145

Regards,
Markus

