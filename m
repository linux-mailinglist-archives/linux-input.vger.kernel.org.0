Return-Path: <linux-input+bounces-9963-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDC8A31002
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 16:44:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE0621630B7
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 15:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07F18253334;
	Tue, 11 Feb 2025 15:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=makarenk.ooo header.i=@makarenk.ooo header.b="gPWAnzGD"
X-Original-To: linux-input@vger.kernel.org
Received: from hognose1.porkbun.com (hognose1.porkbun.com [35.82.102.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B99253328;
	Tue, 11 Feb 2025 15:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.82.102.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739288664; cv=none; b=POYSwAailPt9SDl1UW7oQKloQa9+3iuxUOCyLLZ2n8v2NPe0XYbHdWDJgf9R1OHdL1EMkIGiWzCVqTxRUwD0RvmWf2+jv37AXeZgMvDNDQzMOQePbePYHp2rZeIJUY942cj8D5rukWDDILzcdyz77t9xpFxMCiVtX33j+vrrPaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739288664; c=relaxed/simple;
	bh=27iXuZtORkCl42/3wADpSiLqbPXFd7mA/k0npPstID0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RVNHde60gk4QicHf6QVuWVx9Y58YWbXKKJ1txfklpTy1phpEV7fAHmnqMnPDXOck6DJKjKpd/4IiCr022YH0ptAmSwhYXuyF0HnJIteeOIiNrIOnfRM/OHdKmdvuYP3m7Rk4mLYHlZWdcvWN9W/0tevFSR0FMtgXtYEMGOltkTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=makarenk.ooo; spf=pass smtp.mailfrom=makarenk.ooo; dkim=fail (1024-bit key) header.d=makarenk.ooo header.i=@makarenk.ooo header.b=gPWAnzGD reason="signature verification failed"; arc=none smtp.client-ip=35.82.102.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=makarenk.ooo
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makarenk.ooo
Received: from home-pc.localnet (93-184-53.internethome.cytanet.com.cy [93.109.184.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	(Authenticated sender: oleg@makarenk.ooo)
	by hognose1.porkbun.com (Postfix) with ESMTPSA id 0FC1444F9E;
	Tue, 11 Feb 2025 15:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=makarenk.ooo;
	s=default; t=1739288099;
	bh=E8GAFPTzEfQUWsQcibL5ztB8N/mq7U8ysPxlk4vTHOQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gPWAnzGD9FrMIEy965tLDaHNVN6bMyTY9UvpevTpsuG7tr/td4zjzlBZZmBjlj52m
	 3SnbfFT6GRGnHeHJuYDVjRdwhIzhCn+VGcMujm4scWxT/Z/1vTdaVd/vTv7Aj927Rh
	 Tclu1ps1YozUg6Fn7NbVjAoTMclTFRLIYmDeT91M=
From: Oleg Makarenko <oleg@makarenk.ooo>
To: jikos@kernel.org, bentiss@kernel.org,
 Tomasz =?UTF-8?B?UGFrdcWCYQ==?= <tomasz.pakula.oficjalny@gmail.com>
Cc: linux-input@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v4 1/6] MAINTAINERS: Update hid-universal-pidff entry
Date: Tue, 11 Feb 2025 17:34:53 +0200
Message-ID: <8948455.lOV4Wx5bFT@home-pc>
In-Reply-To: <20250211143512.720818-2-tomasz.pakula.oficjalny@gmail.com>
References:
 <20250211143512.720818-1-tomasz.pakula.oficjalny@gmail.com>
 <20250211143512.720818-2-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Tuesday, February 11, 2025 4:35:07=E2=80=AFPM GMT+2, Tomasz Paku=C5=82a =
wrote:
> Add Oleg Makarenko as co-maintainer
>=20
> Signed-off-by: Tomasz Paku=C5=82a <tomasz.pakula.oficjalny@gmail.com>
> ---
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a7c37bb8f083..aa87d5d56ee7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10258,9 +10258,10 @@ F:	include/linux/hid-sensor-*
>=20
>  HID UNIVERSAL PIDFF DRIVER
>  M:	Tomasz Paku=C5=82a <tomasz.pakula.oficjalny@gmail.com>
> +M:	Oleg Makarenko <oleg@makarenk.ooo>
>  L:	linux-input@vger.kernel.org
>  S:	Maintained
> -B:	https://github.com/Lawstorant/hid-universal-pidff/issues
> +B:	https://github.com/JacKeTUs/universal-pidff/issues
>  F:	drivers/hid/hid-universal-pidff.c
>=20
>  HID VRC-2 CAR CONTROLLER DRIVER

Acked-by: Oleg Makarenko <oleg@makarenk.ooo>




