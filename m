Return-Path: <linux-input+bounces-16298-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3B3C7D546
	for <lists+linux-input@lfdr.de>; Sat, 22 Nov 2025 19:15:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C9315351ED5
	for <lists+linux-input@lfdr.de>; Sat, 22 Nov 2025 18:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E73AF2248BD;
	Sat, 22 Nov 2025 18:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="gcy1FqIf"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D399E267AF2;
	Sat, 22 Nov 2025 18:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763835349; cv=none; b=paO/cSkkSTDS4CNqBU7W2AVB8o+oz356m0xGjPGJxrh2BBbclj1B3Q+BrCY5Rbi2Wk5Aq/cbcu0Tq2sbOBceeNIlYPDkLGmSjYlhNUr0GdY97pWWb+CQcW6+h1ofrRLjzgnh+SkIve/DsuYxZH9J6UgFq/q4V4RuI7yXJYAbMcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763835349; c=relaxed/simple;
	bh=i8iGU1pj5jUUDQkQU0tCeeS0D7LlMNR2jThuFRjLc6o=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=g/2RlMAstkVj+viYGY789kOR/NcTsfLdW5YSzx9sncERiCtzpVCyYEgtshfpC1QyIVuj8o+uc423DVgBy6/9xR4O8t8pS7EFjFiIAYfvJTsxRK7LUPebBvTKLNGuaH9RX0ej+kyva6Lnyu8imJseOTL46LHexCuATe+KbRHYNIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=gcy1FqIf; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1763835325; x=1764440125; i=markus.elfring@web.de;
	bh=qsn6r/18wcXNiOlyMQ8LaZevSgDEq0XY70xU7idbxyE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=gcy1FqIfj6boUp1DQO2x1wI7h0ZI4Imie9YjezotkgNSol+0uBh8+Rg+KDZFPERM
	 aTlOpdflmiFxzzzcqxQQTdXmB/c80RC2Q3shPhMXqwTWlfidpy2JwFKV6m4CjSf6Y
	 ew105XjjN55U+jeU7HA6HKlker3MklSFb1B6456KTDIkZUd6Aolly5QrYTBiNc9jG
	 +xwRmPyn5hIbv35ZyDzyLVNBv6iQ9Uy3QB87l82O7h11jM+/ixXOd43dr5NqEx5G/
	 HtmtpRSyLXXZpt51Tz+fBQ0kFmg29+0RAqW3u5iI98czruSCjZgSxqhk461HmM+cK
	 sXgFaZiUBbsrzPTLlQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.246]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mv3US-1wDSjF0HlQ-012yhf; Sat, 22
 Nov 2025 19:15:25 +0100
Message-ID: <3b8adba8-0cfa-4a83-8776-ba7245c58947@web.de>
Date: Sat, 22 Nov 2025 19:15:23 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Eslam Khafagy <eslam.medhat1993@gmail.com>, linux-input@vger.kernel.org,
 Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Max Staudt <max@enpas.org>,
 Roderick Colenbrander <roderick.colenbrander@sony.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 syzbot+4f5f81e1456a1f645bf8@syzkaller.appspotmail.com
References: <20251122173712.76397-1-eslam.medhat1993@gmail.com>
Subject: Re: [PATCH v3] HID: memory leak in dualshock4_get_calibration_data
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251122173712.76397-1-eslam.medhat1993@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gyO/i2pavl4DJKRXHMP57v0cguEBTfzufoggK/XleDcOu45DbuR
 i7NsOA4/08oa5GDlerQlf42PN+D5RCP85SmSM1YFf44/yytSqh2xFEcPD8G3PdnCDgVbDHk
 eSoG+icwKi6uWMbY1aUZWmBCVWWM/FxcZ2zSygtM6cRzSA/CkKwlKTFIZ8V3nP5lfeFYQmw
 GWSafl99yd5PkWO92r7wg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Ca2HO+rGDow=;lPJHaUHex0GWsPeU8UN38XeaKPk
 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
 w8S/GgU+uboV7v4bgoN8vsSSR+k84Qdci8uVbx

> Function dualshock4_get_calibration_data allocates memory to pointer
> buf .However, the function may exit prematurely due to transfer_failure

                                                         transfer failure.=
?


> in this case it does not handle freeing memory.
>=20
> This patch handles memory deallocation at exit.

Would a corresponding imperative wording become helpful for an improved ch=
ange description?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.18-rc6#n94

Would a summary phrase like =E2=80=9CPrevent memory leak in dualshock4_get=
_calibration_data()=E2=80=9D
be nicer?

Regards,
Markus

