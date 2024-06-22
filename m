Return-Path: <linux-input+bounces-4558-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E36691328C
	for <lists+linux-input@lfdr.de>; Sat, 22 Jun 2024 09:21:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24C99285537
	for <lists+linux-input@lfdr.de>; Sat, 22 Jun 2024 07:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F58714B07C;
	Sat, 22 Jun 2024 07:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="Y09ult06"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DCC2B2CC;
	Sat, 22 Jun 2024 07:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719040902; cv=none; b=lsmFR8q2HGpNw6zdIWsOCbKxTBi4vrBFtvzSRit7ScN8igHkIch6Ic4wFF0p0QwD0koETmpQZ7In+B0WWpNzUOub5LGlzNVPReAvRKQM2zVZWGmIZRWanpmFWc0SRQtJLC4EqHFP9/fYKa8KzvGXOfK2doS7wjL+0CpC2jJfc94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719040902; c=relaxed/simple;
	bh=BRgmF1SuWGxaSlfe9UasHg3POB9fYog1Hz1JNFO0V7s=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r/wc5rg9qOwCcuOp0YmE67pYhJ38Fgrw+M8fugfBi4/spSaySaPeUV8IsAL1vVYR9r7yNVTAFcscLn6qUELnnLALpb9ATuRz9x+Ne1VVq7T7Ns79588S8wv4ak5FAAVW1VeeQ1Y04kyCqREIyTntJkmBZ47tNCyQmZJxlVJIYHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=Y09ult06; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:Date:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0b04sSHMbcUZr86ZF4qTwtY++eMAXQb1yCBpSHbrK+k=; b=Y09ult06y0LucRVOeMjzyooo+G
	DHp6/RaN/0A2yQi4DrNCpnCwDO1jPi1m06pJOeLa1dIC0sWFjGIntkThC4KQkcquwMzV3mS1DMBpL
	FDy3x3LrYQnGPvsAHXPigubmezaijWRZ6eaKE3sdMnx28s4DwSt1v++zXlGeoXnDuSENdNNBOeqKE
	lSDcuvSHEJabE6bEA7f6g30E+xkC+bx1uw3W4YK2vvtmdyKaZVCjpvu6QcCaH8l51UstNvIGUBlPa
	2pSCAlUlhZtHAbA2jth+0PO7SY8uM+wv4gNLsXK68f2bO0YbztR9mGp9ZMBTMrvJJGx5BKmjGpRqD
	OLvxz6vw==;
Received: from p200300c20737c2001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:c2:737:c200:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1sKuau-003Qf9-2d;
	Sat, 22 Jun 2024 08:51:30 +0200
Date: Sat, 22 Jun 2024 08:51:28 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: dmitry.torokhov@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, o.rempel@pengutronix.de, andreas@kemnade.info,
 u.kleine-koenig@pengutronix.de, hdegoede@redhat.com,
 oliver.graute@kococonnector.com, ye.xingchen@zte.com.cn,
 p.puschmann@pironex.com, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 andy.shevchenko@gmail.com, felix@kaechele.ca
Subject: Re: [PATCH v3 0/2] Input: add ft5426
Message-ID: <20240622085128.38a6feb1@aktux>
In-Reply-To: <20240501204758.758537-1-andreas@kemnade.info>
References: <20240501204758.758537-1-andreas@kemnade.info>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

ping

On Wed,  1 May 2024 22:47:56 +0200
Andreas Kemnade <andreas@kemnade.info> wrote:

> Changes in v3:
> - reorder compatible also in driver
> 
> Changes in v2:
> - reorder compatible
> 
> Andreas Kemnade (2):
>   dt-bindings: input: touchscreen: edt-ft5x06: Add ft5426
>   Input: edt-ft5x06 - add ft5426
> 
>  .../devicetree/bindings/input/touchscreen/edt-ft5x06.yaml        | 1 +
>  drivers/input/touchscreen/edt-ft5x06.c                           | 1 +
>  2 files changed, 2 insertions(+)
> 


