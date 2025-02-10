Return-Path: <linux-input+bounces-9898-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE45EA2E6FF
	for <lists+linux-input@lfdr.de>; Mon, 10 Feb 2025 09:52:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F0CE1885C79
	for <lists+linux-input@lfdr.de>; Mon, 10 Feb 2025 08:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3EC11C245C;
	Mon, 10 Feb 2025 08:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="emVDhELb"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB2E1C2443;
	Mon, 10 Feb 2025 08:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739177545; cv=none; b=fhueQ+hJ9sP1gvjo5aG1YWVqecHQZdNcOMoDq6oJKoWttPRVNkTL+6XvyeMAdRatUPp8L9wuflF5hceVMEtfgh6/2nE7YTgMx3xX08oABOpqwj3qip4b/XIPwtoJqKGtv8kbBEGKwMDrPLmn/iwN/l20SQmkMtA3zZXy7dmdQ10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739177545; c=relaxed/simple;
	bh=OUW5o0ZxRXp1nt8z8CDqk8nVhLnXLkppJNMJdYF4YYE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=qUS4nVaNQuqsJ55xYpvWgu25DblQgkXcxsBOTZ94V+hFI9HI/5E67NX5nFzNWZj8UznG/6tD1gv7p2V1vcceOZg6M0kpMqJGlJ3KKcxRiMHErJL5vSdabEefEmIel+Ei8btqf7+7fNJrX5MgsnnlSMBVl+00mrMGvaN5Z3YyVxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=emVDhELb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8755C4CED1;
	Mon, 10 Feb 2025 08:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739177545;
	bh=OUW5o0ZxRXp1nt8z8CDqk8nVhLnXLkppJNMJdYF4YYE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=emVDhELb87QyoDCX0oxB+yFm+0Br87yoQoVDLlHBckvUsrEUtmADG/Ox14X45jD4u
	 EToUs+cZvpzpikskni2p/s8zT+zEsePvXQehjCHwTX3zIPV9KsisyT28cB4RHM5ix1
	 bOYCSPh5klZMvMWdoRdTePUAK6b/0uD42zhT16udncSLXlkY+Y/024DXKsY5yZ4x4T
	 3MWNrtMMNxwzRR/nNMUnzyKo2jNxH+HuSp9s5Cmz621UIq2NRX/2sWee+h2Ue+/L5Z
	 PMn9hTD/362OhBnAHc9yHBx+uU49sM8IZQb593FmjzU3pjAsnI88QxnvFtygxwmzKw
	 TXNL6qxD6Xssw==
Date: Mon, 10 Feb 2025 09:52:22 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: =?ISO-8859-2?Q?Tomasz_Paku=B3a?= <tomasz.pakula.oficjalny@gmail.com>
cc: bentiss@kernel.org, anssi.hannula@gmail.com, oleg@makarenk.ooo, 
    linux-input@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/3] HID: pidff: Make sure to fetch pool before checking
 SIMULTANEOUS_MAX
In-Reply-To: <20250208173628.5734-3-tomasz.pakula.oficjalny@gmail.com>
Message-ID: <773ns28r-189s-9s5o-71q3-3286s376866r@xreary.bet>
References: <20250208173628.5734-1-tomasz.pakula.oficjalny@gmail.com> <20250208173628.5734-3-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sat, 8 Feb 2025, Tomasz Paku=C5=82a wrote:

> As noted by Anssi some 20 years ago, pool report is sometimes messed up.
> This worked fine on many devices but casued oops on VRS DirectForce PRO.
>=20
> Here, we're making sure pool report is refetched before trying to access
> any of it's fields. While loop was replaced with a for loop + exit
> conditions were moved aroud to decrease the possibility of creating an
> infinite loop scenario.
>=20
> Signed-off-by: Tomasz Paku=C5=82a <tomasz.pakula.oficjalny@gmail.com>
> ---
>  drivers/hid/usbhid/hid-pidff.c | 34 ++++++++++++++++------------------
>  1 file changed, 16 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidf=
f.c
> index f23381b6e344..acdcc0af86ba 100644
> --- a/drivers/hid/usbhid/hid-pidff.c
> +++ b/drivers/hid/usbhid/hid-pidff.c
> @@ -604,28 +604,26 @@ static void pidff_reset(struct pidff_device *pidff)
>  }
> =20
>  /*
> - * Refetch pool report
> + * Fetch pool report
>   */
>  static void pidff_fetch_pool(struct pidff_device *pidff)
>  {
> -=09if (!pidff->pool[PID_SIMULTANEOUS_MAX].value)
> -=09=09return;
> -
> -=09int i =3D 0;
> -=09while (pidff->pool[PID_SIMULTANEOUS_MAX].value[0] < 2) {
> -=09=09hid_dbg(pidff->hid, "pid_pool requested again\n");
> -=09=09hid_hw_request(pidff->hid, pidff->reports[PID_POOL],
> -=09=09=09=09HID_REQ_GET_REPORT);
> -=09=09hid_hw_wait(pidff->hid);
> -
> -=09=09/* break after 20 tries with SIMULTANEOUS_MAX < 2 */
> -=09=09if (i++ > 20) {
> -=09=09=09hid_warn(pidff->hid,
> -=09=09=09=09 "device reports %d simultaneous effects\n",
> -=09=09=09=09 pidff->pool[PID_SIMULTANEOUS_MAX].value[0]);
> -=09=09=09break;
> -=09=09}
> +=09int i;
> +=09struct hid_device *hid =3D pidff->hid;
> +
> +=09/* Try 20 times if PID_SIMULTANEOUS_MAX < 2.
> +=09   We must make sure this isn't just an error */

Sorry for annoying nit: this is not really consistent with Kernel / HID=20
comment style :)

--=20
Jiri Kosina
SUSE Labs


