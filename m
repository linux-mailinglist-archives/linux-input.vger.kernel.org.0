Return-Path: <linux-input+bounces-9719-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEEDA25C23
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 15:20:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E9CC163938
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 14:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 465DA204595;
	Mon,  3 Feb 2025 14:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vMqOsxB3"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E12F1EEF9;
	Mon,  3 Feb 2025 14:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738592356; cv=none; b=KGrMCYbx1x7MQ1UDpRlJi+ocAEk4qxRqqRqamwG8ttkuwkZWwFxAsvTiGRFE0kjgrIuYrok/9bwloBKGbnZY5Fu9FCyIkpijge5K8eFpfyiGSiHcZQKJFqD2ea/bNOF0uMMFsj5FQrddgbcezXSSn3Iyv5husAhpTDSV1au50hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738592356; c=relaxed/simple;
	bh=CyuPSaT6EpmILv83KdYCWP0EOLFCfthUST5njZOa9JI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=sc6mltb+ONSTpzCvOSmyWfcT7QA54KZW98z6rzOK1QZAe1vzJKAgC2BsYdMPmseEY0EJnkuAjuFf9v/+l81r7dfviH6y9YiXL7Q8Uej/zB9SWi6SB639Ar9saGP6Zvuq4H3lbtoNq5o0oE+fVtk4w+jtS01/8X8l+XiqlT8a6Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vMqOsxB3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 332F8C4CED2;
	Mon,  3 Feb 2025 14:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738592353;
	bh=CyuPSaT6EpmILv83KdYCWP0EOLFCfthUST5njZOa9JI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=vMqOsxB39uc62qXM0iziBhor0TwYTtHHBa/0QiUC4lmxFzWZnvgqut5sh+b1lAkfP
	 xE9WrYzqQY63rhFjdc6rYgplYcc2a416bopc2v17WAXHsFOf9oKaeTiQwyuP5MN4dq
	 nKUHRhoPETkQwQM26oy/r/+8V6vm3R2acjD7aa787B66gZcnxiTdr+5uwULCRTJ1Jv
	 dE1x8+w+C1/OxgBdrIHuqb6EJU1nMbzj1pZ4iu9XNXOKhdm/3w/4xbzKZn2t5izyVW
	 3Tv7rmwjgk8Lr/ch7NO/IZDKOA11H77ERIbZwQnd5SrtLPaxRmfqfVAzEEtgG9EfIp
	 wvv+OdAbCv57g==
Date: Mon, 3 Feb 2025 15:19:10 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: =?ISO-8859-2?Q?Tomasz_Paku=B3a?= <tomasz.pakula.oficjalny@gmail.com>
cc: bentiss@kernel.org, anssi.hannula@gmail.com, oleg@makarenk.ooo, 
    linux-input@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v9 00/22] HID: Upgrade the generic pidff driver and add
 hid-universal-pidff
In-Reply-To: <20250201113906.769162-1-tomasz.pakula.oficjalny@gmail.com>
Message-ID: <55p2r436-4o90-87qr-292o-on72n3pq1q9r@xreary.bet>
References: <20250201113906.769162-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sat, 1 Feb 2025, Tomasz Paku=C5=82a wrote:

> This patch series is focused on improving the compatibility and usability=
 of the
> hid-pidff force feedback driver. Last patch introduces a new, universal d=
river
> for PID devices that need some special handling like report fixups, remap=
ping the
> button range, managing new pidff quirks and setting desirable fuzz/flat v=
alues.
>=20
> This work has been done in the span of the past months with the help of t=
he great
> Linux simracing community, with a little input from sim flight fans from =
FFBeast.
>=20
> No changes interfere with compliant and currently working PID devices.
> "Generic" codepath was tested as well with Moza and Simxperience AccuForc=
e v2.
>=20
> I'm not married to the name. It's what we used previously, but if "univer=
sal" is
> confusing (pidff is already the generic driver), we can come up with some=
thing
> better like "hid-quirky-pidff" :)
>=20
> With v8 and  tiny finx in v9, all the outstanding issues were resolved,
> additional pidff issues were fixed and hid-pidff defines moved to a dedic=
ated
> header file. This patch series could be considered done bar any comments =
and
> requests from input maintainers.
>=20
> I could save more then a dozen lines of code by changing simple if statem=
ents
> to only occupy on line instead of two in there's a need for that.
>=20
> Signed-off-by: Tomasz Paku=C5=82a <tomasz.pakula.oficjalny@gmail.com>

This is now queued in hid.git#for-6.15/pidff, so please send any further=20
updates / fixups on top of that branch.

Thanks!

--=20
Jiri Kosina
SUSE Labs


