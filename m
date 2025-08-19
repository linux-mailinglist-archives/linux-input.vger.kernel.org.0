Return-Path: <linux-input+bounces-14140-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2638B2C06F
	for <lists+linux-input@lfdr.de>; Tue, 19 Aug 2025 13:30:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC5763A51F3
	for <lists+linux-input@lfdr.de>; Tue, 19 Aug 2025 11:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6BC0326D72;
	Tue, 19 Aug 2025 11:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c73CE4ru"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA385326D5A;
	Tue, 19 Aug 2025 11:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755602827; cv=none; b=UWnTFdDwRccHgSW2d3iGXX7y4zgFteBn+EJsLEaCjIsRAWAMca6Adhf1tnEdx6od6e59teWCFnNNRTCcAkRBkWFF5/flOrHFiUhuycuQS+gk1J9jYc6chtyU0qnqLlHXlaIusFRaKa6Zekkdfav5JpYQbs1BGREebHiJ0dTUs50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755602827; c=relaxed/simple;
	bh=zV/P5YkZzkQ/o1SsOoS8wjR4Dvm021W0MjqQCKhdIrQ=;
	h=Content-Type:Date:Message-Id:Subject:Cc:From:To:References:
	 In-Reply-To; b=FKfPjRA12tj/ZcDKTnVpXw1KTixxiC2syOMojti1wGMKNX/qtQRQ6iml0ZVFwozdxVB0RZ3riKKAfnRHY8TqL4atLTYY+Nh/aXooxuWvYjC2aGkCVw7EaJdB+NXCZKFJzA5gBjSABwbTXeFILpjdiJiDsYwpOAOn/19mVMKilXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c73CE4ru; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E957AC4CEF1;
	Tue, 19 Aug 2025 11:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755602827;
	bh=zV/P5YkZzkQ/o1SsOoS8wjR4Dvm021W0MjqQCKhdIrQ=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=c73CE4ruaQyvjTE++vIlFX/0VW/OOMSKfawjdNzWUECFL8VZ5j+87hHXgaSLjfyvF
	 V1Wr00ADn/M+oefuYjh5E53ewCGEinmixxeugzuVUzl7kjqcB0bcu83xZn/s1ydsKh
	 q4VoEKd+n7Gzn6AMusn/fZiMIWa1ScCZWbmqicEWSkEgQVDp7m1ihyXrKRpS9+heQL
	 vTZOGOKNuwJt0u4Cn5MWcheGDhgYzLzbQ5aG+JNvz1mRn7z6sgsJsHw8pXAkbRMNn8
	 kZ4EKJ9TAAlvaeR5P7PsNuOBkjgWEiGoKVsiNzMz/Khw+/bkRUf26iKKzDxoQnqBJA
	 lW8s4+zQhlVnQ==
Content-Type: multipart/signed;
 boundary=c7d945508032eacf6f1d7cf7af0d4d6794903835429934688e6cf4292a34;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Tue, 19 Aug 2025 13:27:02 +0200
Message-Id: <DC6D9ESWXGKO.1NS287IU5YJSZ@kernel.org>
Subject: Re: [PATCH 0/3] Powerbutton driver and powerdown request for
 TPS65224 PMIC
Cc: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-input@vger.kernel.org>, <jcormier@criticallink.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Job Sava" <jsava@criticallink.com>, "Lee Jones" <lee@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Julien Panis" <jpanis@baylibre.com>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
X-Mailer: aerc 0.16.0
References: <20250520-linux-stable-tps6594-pwrbutton-v1-0-0cc5c6e0415c@criticallink.com>
In-Reply-To: <20250520-linux-stable-tps6594-pwrbutton-v1-0-0cc5c6e0415c@criticallink.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

--c7d945508032eacf6f1d7cf7af0d4d6794903835429934688e6cf4292a34
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Job,

> The following patches were created to get the tps65224 PMIC
> powerbutton driver and power off request working on the
> MitySOM-AM62PX. The patches are as follows:

Are there any news on this series? Do you plan to post a new
version soon, or do you want me to take over? I'd like to get
support for this into the kernel :)

-michael

--c7d945508032eacf6f1d7cf7af0d4d6794903835429934688e6cf4292a34
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaKRfhxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jXCAF/b7T+J/dOk8F0+/32IHKqoZqJ45QGrxXC
e4r+VlAHgdHgBop5Mxnd7gp8NtLip9rSAXwIhgufeV/AZCaGdhLPrTwyV6fuWQfU
YAlSRzUqcH917Hk9tiqYN22i67mBtQbt8S0=
=OPDU
-----END PGP SIGNATURE-----

--c7d945508032eacf6f1d7cf7af0d4d6794903835429934688e6cf4292a34--

