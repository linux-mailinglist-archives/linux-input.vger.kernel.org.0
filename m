Return-Path: <linux-input+bounces-4063-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A189F8FAD4C
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 10:16:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA55F1C21D40
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 08:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 113CF1422C9;
	Tue,  4 Jun 2024 08:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UAktyIqR"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFA41422C3;
	Tue,  4 Jun 2024 08:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717489005; cv=none; b=Vv34v+p9BBBBbN8pPX6VAtLJMrny4MdCV0hjUhzlfnEwspxHnT9u82OKGdim/vWVAlB1KnNv3BkKmYBk0h9uCOZTBeUVnBSxiBmIRHcNo6JWaGw3VptELLWzJ+18cgbqVIchRcygB5GxDqnsLurBWOseAjwHxCm6RW7JKrg0/+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717489005; c=relaxed/simple;
	bh=QRDptqhaSwETZW7uxIK6SnCSrnR4GLC6n4dC/c0IQRQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fn9G6C8895zy3xqmiQ85nbbfwjekuBmGdua29UuBajSxHTOkRXuNfV1Nc5lcOWbKMMyRjL76p+J5dfv+2jPm7u9sFAJ+WPkJ22q8c/iEoP0mTT8iGtZdbxHVPsVKjNnf/BxIhogJWL5Zfrj8p8mR0Evjc+b6tejD1AEB/dYXOwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UAktyIqR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B23CC4AF08;
	Tue,  4 Jun 2024 08:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717489004;
	bh=QRDptqhaSwETZW7uxIK6SnCSrnR4GLC6n4dC/c0IQRQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UAktyIqRyzVhjUB1Fc96zI49R2HbzAELzvvUejOV86cAZe8PEMbHoCjZSsRcIazMN
	 wKlJ650lfAGidt2GykibTLy11RE69tp3qOS3CCbHPpaQVHdIsjvDFzwmOptcCC+XcC
	 iQPM0Fdp4rX60Ul4JKTJa5Qr4F6vqzu3iYqfjWK57wrKj+gu+yLSH52LQ2QELlOzbt
	 MKzFrnNAKl0Ef5saW6t2IVXI7rOG0fBKdr8f9hCfhnY1RgR9qmqfAnkAMsGceSKixp
	 WTBmcEJugbTs8SJDgtZVxsmBIO+lolm5CYcWxvsqcNXo4mZaxTGdXqFhrP85nFauW1
	 IJwGjssTjcz6Q==
Date: Tue, 4 Jun 2024 10:16:41 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: =?ISO-8859-15?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
cc: bentiss@kernel.org, lains@riseup.net, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: logitech-dj: Fix memory leak in
 logi_dj_recv_switch_to_dj_mode()
In-Reply-To: <20240524130600.275577-1-jose.exposito89@gmail.com>
Message-ID: <nycvar.YFH.7.76.2406041016330.16865@cbobk.fhfr.pm>
References: <20240524130600.275577-1-jose.exposito89@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 24 May 2024, Jos=C3=A9 Exp=C3=B3sito wrote:

> Fix a memory leak on logi_dj_recv_send_report() error path.
>=20
> Fixes: 6f20d3261265 ("HID: logitech-dj: Fix error handling in logi_dj_rec=
v_switch_to_dj_mode()")
> Signed-off-by: Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com>
> ---
>  drivers/hid/hid-logitech-dj.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.=
c
> index 3c3c497b6b91..37958edec55f 100644
> --- a/drivers/hid/hid-logitech-dj.c
> +++ b/drivers/hid/hid-logitech-dj.c
> @@ -1284,8 +1284,10 @@ static int logi_dj_recv_switch_to_dj_mode(struct d=
j_receiver_dev *djrcv_dev,
>  =09=09 */
>  =09=09msleep(50);
> =20
> -=09=09if (retval)
> +=09=09if (retval) {
> +=09=09=09kfree(dj_report);
>  =09=09=09return retval;
> +=09=09}
>  =09}

Applied, thanks.

--=20
Jiri Kosina
SUSE Labs


