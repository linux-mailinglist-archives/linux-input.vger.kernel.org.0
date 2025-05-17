Return-Path: <linux-input+bounces-12405-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7214BABA91F
	for <lists+linux-input@lfdr.de>; Sat, 17 May 2025 11:32:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EBA81B63FBE
	for <lists+linux-input@lfdr.de>; Sat, 17 May 2025 09:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07CF17263A;
	Sat, 17 May 2025 09:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mOjHORuL"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A3C1DEFDC
	for <linux-input@vger.kernel.org>; Sat, 17 May 2025 09:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747474321; cv=none; b=HQrIcDRyAfMEXugjgbYqJYWsJMQVb4vWxvBU/xg1AZlQ4nuYYt0qzfvsp+5k819sHuhjVsrXMGsuK0AwenXj/074tDobMFHROjOydHL9Tdj9vIRScMNGj2w1ig9Dkw4Y0Dg7GhJXoQyb8/pNBNHVDSgU7OlTEY4a8BOnzhzldTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747474321; c=relaxed/simple;
	bh=r1UXihZSPiITlPvoUUtgpGv76+gf6WlbFsx5EWjPuTM=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:Message-Id:
	 MIME-Version:Content-Type; b=Trvh2vf/2URW89idxqpSRiXP37Bo0YoCVg2h3a5bS1+l98jV5Ys+RVBOxmR02+OYFeiDILYyC0IJfNO3Lq9pHSO7S/KF5HYrj3VGjEliUmpiJ0FJCgg6gcbG+lf/PVzRB5TfmwXlrYyL7QrRm3ZmgTB63TFBryxyZrt5o7qCq4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mOjHORuL; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a363ccac20so833697f8f.2
        for <linux-input@vger.kernel.org>; Sat, 17 May 2025 02:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747474318; x=1748079118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:references:from:subject:cc:to:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BOfrVcIjZleVgIUw/wDKlCxLv0gkGssUeWkBlOsDj84=;
        b=mOjHORuLCWNM2lNuynvLbeM3XvMNU4r0HbwzWyEYdy5b0bLyMAhWlYdnhDYwR1Sl2M
         gDmtcRJp84xXn5UOFj78KxHz6S8aaDzN7MzHKAu6evZrH5/r3Ro/n/Kad2mB89wDbUT2
         /nmRn6XREldBY8FjtvF5Dv2BGZ9v2G96ZjnSXbOcZdIGYsWaxUBStdzpsWWVeKp31XJg
         hr9MBYYa2h3AHzM20SDd+HBiDWx0cU9tEP8Pw1jTrtH00yIF5pZfxOv/2xKDwBomBM1U
         IdIaDKPBuXB1dUnAVnOL/4HVlSBGCcz4pJNX0y/7uttiDshgCeI8pZyPX0DDgfjtgql5
         871w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747474318; x=1748079118;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:references:from:subject:cc:to:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BOfrVcIjZleVgIUw/wDKlCxLv0gkGssUeWkBlOsDj84=;
        b=ndE1jepum0NXVTpElBazWTVUl4mlN/ztixAFXfnQHeqJF8X28OGLiSTNouGw4wrVoQ
         Gy6LvEkZM6T3xvhXZee22YTEra/ygL/M8gFrjONT4BzR8mvM5icdlUyE25De1LX43NqS
         f6vqL3v+7/twIPmVk0yrdaF7DCJfHckOdJtOxno0nCMyU9qeX8fjxy9RB8i5gKQJ0yk3
         kCtyxeEEr5UU6zFKlwL8bE/O1F4ctPxGK0CM3LgCfEXqwzpGquEuWoD/qpV5BdIwQ4Ve
         /lxWKduDNIRajRbWsiJpSxkSZQc1FnaXRG+4Kgjc0g7jrm+pT+rWfdUHTbtYORRBG9+z
         DVVA==
X-Gm-Message-State: AOJu0YzPTjiADe++1xSrFMpeDgFiwcTEeDdcJHgxnxHIDBVBiC9c9q9w
	yguroZGDsxkaI7MB1LoqoMsKirMfH01g+sFlEfa5fNXkTLKZ+oEjNcJI/ueU6ZI8
X-Gm-Gg: ASbGncsFaqjs8SiqcbEjgisDO6335XOwfuX+xD9rKPwE6gD2L7L6ZGAdaUtE9N04W6T
	srnEGGFKwbmpB1vAFseE/fZIPFbVhRBJKHypnc3noGF0hM/zH2bJTfOXCfnpjFmsbotS/Rn/FYe
	u4jmbFQQcphkQ16JHqHFK/Blix1qSVD8t7WAF+0CPhQMRqQ/91NLtElRfAqU0ElR7ptptIZwMPV
	m/0vI+2UxYStEhLZYTPKxd6Aw8C5oVCK/Yb7BX2c+jQ0kRKzgItMp9ouKFviOyknddQ9CfTkunM
	qGvEbt3uDL2xVulgY9vjqXpzaM4Y0PGWMEiJpDZmSV4=
X-Google-Smtp-Source: AGHT+IEdlrDLneLbz4pl8utSBHMbh1rEizEp4hqd1Xbt7WujRD0mGaFRTZ/zZExKAEgjIE1OKy6kpA==
X-Received: by 2002:a05:6000:2ab:b0:3a0:a09d:b31e with SMTP id ffacd0b85a97d-3a35c852bb1mr5711745f8f.59.1747474318226;
        Sat, 17 May 2025 02:31:58 -0700 (PDT)
Received: from localhost ([2a02:169:1e9:0:8f4d:9ee2:cc35:c67b])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442fd59700asm66955765e9.34.2025.05.17.02.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 02:31:57 -0700 (PDT)
Date: Sat, 17 May 2025 11:31:57 +0200
To: "Daniel J. Ogorchock" <djogorchock@gmail.com>
Cc: linux-input@vger.kernel.org, thunderbird2k@gmail.com, blaws05@gmail.com,
 benjamin.tissoires@redhat.com, jikos@kernel.org,
 Roderick.Colenbrander@sony.com, svv@google.com, carmueller@gmail.com,
 pgriffais@valvesoftware.com, hadess@hadess.net, pobrn@protonmail.com,
 lee.jones@linaro.org, junwan.cho@samsung.com, tinozzo123@gmail.com,
 sandeep.cs@samsung.com
Subject: Re: [PATCH] HID: nintendo: avoid bluetooth suspend/resume stalls
From: "Silvan Jegen" <s.jegen@gmail.com>
References: <20250513074705.13637-1-djogorchock@gmail.com>
In-Reply-To: <20250513074705.13637-1-djogorchock@gmail.com>
Message-Id: <3TC80GTR3Z7Z9.3GJKHZGYOM6Z0@homearch.localdomain>
User-Agent: mblaze/1.3-7-g6b90e67 (2025-04-12)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

"Daniel J. Ogorchock" <djogorchock@gmail.com> wrote:
> Ensure we don't stall or panic the kernel when using bluetooth-connected
> controllers. This was reported as an issue on android devices using
> kernel 6.6 due to the resume hook which had been added for usb joycons.
>=20
> First, set a new state value to JOYCON_CTLR_STATE_SUSPENDED in a
> newly-added nintendo_hid_suspend. This makes sure we will not stall out
> the kernel waiting for input reports during led classdev suspend. The
> stalls could happen if connectivity is unreliable or lost to the
> controller prior to suspend.
>=20
> Second, since we lose connectivity during suspend, do not try
> joycon_init() for bluetooth controllers in the nintendo_hid_resume path.
>=20
> Tested via multiple suspend/resume flows when using the controller both
> in USB and bluetooth modes.
>=20
> Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
> ---
>  drivers/hid/hid-nintendo.c | 38 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 36 insertions(+), 2 deletions(-)

LGTM!

Reviewed-by: Silvan Jegen <s.jegen@gmail.com>

> ...=20
>
> diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
> index 839d5bcd72b1..fb4985988615 100644
> --- a/drivers/hid/hid-nintendo.c
> +++ b/drivers/hid/hid-nintendo.c
> @@ -308,6 +308,7 @@ enum joycon_ctlr_state {
>  	JOYCON_CTLR_STATE_INIT,
>  	JOYCON_CTLR_STATE_READ,
>  	JOYCON_CTLR_STATE_REMOVED,
> +	JOYCON_CTLR_STATE_SUSPENDED,
>  };
> =20
>  /* Controller type received as part of device info */
> @@ -2750,14 +2751,46 @@ static void nintendo_hid_remove(struct hid_device=
 *hdev)
> =20
>  static int nintendo_hid_resume(struct hid_device *hdev)
>  {
> -	int ret =3D joycon_init(hdev);
> +	struct joycon_ctlr *ctlr =3D hid_get_drvdata(hdev);
> +	int ret;
> +
> +	hid_dbg(hdev, "resume\n");
> +	if (!joycon_using_usb(ctlr)) {
> +		hid_dbg(hdev, "no-op resume for bt ctlr\n");
> +		ctlr->ctlr_state =3D JOYCON_CTLR_STATE_READ;
> +		return 0;
> +	}
> =20
> +	ret =3D joycon_init(hdev);
>  	if (ret)
> -		hid_err(hdev, "Failed to restore controller after resume");
> +		hid_err(hdev,
> +			"Failed to restore controller after resume: %d\n",
> +			ret);
> +	else
> +		ctlr->ctlr_state =3D JOYCON_CTLR_STATE_READ;
> =20
>  	return ret;
>  }
> =20
> +static int nintendo_hid_suspend(struct hid_device *hdev, pm_message_t me=
ssage)
> +{
> +	struct joycon_ctlr *ctlr =3D hid_get_drvdata(hdev);
> +
> +	hid_dbg(hdev, "suspend: %d\n", message.event);
> +	/*
> +	 * Avoid any blocking loops in suspend/resume transitions.
> +	 *
> +	 * joycon_enforce_subcmd_rate() can result in repeated retries if for
> +	 * whatever reason the controller stops providing input reports.
> +	 *
> +	 * This has been observed with bluetooth controllers which lose
> +	 * connectivity prior to suspend (but not long enough to result in
> +	 * complete disconnection).
> +	 */
> +	ctlr->ctlr_state =3D JOYCON_CTLR_STATE_SUSPENDED;
> +	return 0;
> +}
> +
>  #endif
> =20
>  static const struct hid_device_id nintendo_hid_devices[] =3D {
> @@ -2796,6 +2829,7 @@ static struct hid_driver nintendo_hid_driver =3D {
> =20
>  #ifdef CONFIG_PM
>  	.resume		=3D nintendo_hid_resume,
> +	.suspend	=3D nintendo_hid_suspend,
>  #endif
>  };
>  static int __init nintendo_init(void)



