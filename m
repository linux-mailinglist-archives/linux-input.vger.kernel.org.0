Return-Path: <linux-input+bounces-16433-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6099FC98B71
	for <lists+linux-input@lfdr.de>; Mon, 01 Dec 2025 19:30:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AFCB3A2F15
	for <lists+linux-input@lfdr.de>; Mon,  1 Dec 2025 18:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C30E201033;
	Mon,  1 Dec 2025 18:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v/Q3yK+H"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AF1D27E
	for <linux-input@vger.kernel.org>; Mon,  1 Dec 2025 18:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764613852; cv=none; b=kuc3CBgDFa4v/Yu/QTU3COnFGK75I0dtHnd30BVFof59mOuB0tqMPxODIV3ZQdgBA+9Otw6s34DcYOqeotxuj/xcdGE8SpOtBtBqkkSjVO0M+ddrwnSJplnyNVh3i4w/9GvY7yHtCeNfJee2MAhmwM9RfZPAD0BF5kTswaDZYVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764613852; c=relaxed/simple;
	bh=wHh4ez4j0WRy5B86Gnr2VuteHKjrwZOmHY7Dv4NOEIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=nmGG08Qrn/HXeEl9AsWqUCJn668lj8KuX6AZqu4VsDQzBvMQEI1QDFpij+5Qwaa3cssE1Wv5rnajD2g+DV9f25pK/LsE+FulZG9+zen1z9bNtnpaZ8EiinJABmvBNiITSCt6vtxt2o3Mu0ibEaWvXZjNaYkESXSoR3B0ddfZXZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v/Q3yK+H; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-595910c9178so3537521e87.1
        for <linux-input@vger.kernel.org>; Mon, 01 Dec 2025 10:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764613848; x=1765218648; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xiCliUJke4PTSzdk5ACPgZOtBcpY6iKILv4Rw/LzbZk=;
        b=v/Q3yK+Hv6HVFHy7BxXoExVMUfHoh9zRf3pj7wS0Z/D9obM9hnkuhstbAArS5ku1q3
         UVcMXFbS1Y2RHcaxJ2uob45vala2iHw3GfJCUFa7xaePvbVi/EC7I7/PpPDgIY9BxGTm
         CgaSysn1bhAXKBpZ+Ss0QL0m08ttAk4jZCp6pfpw1alx/uE8tVVQ1wK8IhECddzQv4hy
         Uqbv0qGb/6Gw3+jdfcB3KGAeUw57Swgk79M1YgwWh9rNzq9GB7kbEKiggUmNkyN0L1TC
         7iHwxaX6MqPFGByoiweTuygRetA8FwEJ2/NLj0Y8MapxMmG+7hDsdbHy26/kBSphCjb/
         hxRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764613849; x=1765218649;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xiCliUJke4PTSzdk5ACPgZOtBcpY6iKILv4Rw/LzbZk=;
        b=Es3TWC6Q54ARzYei4bXZ25AbFNIq6QP49SlsA/xH3mXrSQW3xIu6V+ot6wtY9mBWZf
         pt3dgJRITHrYW5L7NyV/1+9PrGZPC5SOD1UdcBnPDu3vkiOTLoR64ERdpTOanEDUfamv
         p7zQGaikf8D+4Rz6YHLegWREJztysHN38OHjd2lZYthpWtwMFA7QM2cXMGSdtjohQfPg
         9IegpnXv/84E/onGQ/3WUw1prDAgCSPJTpr6Upe+eTgDkWFWsliPURQmh9Q3C45OFC5M
         La/k5vhbqRqZ7cEjB6AsJes6iME9Xzlltm+noBUE77foJEnUkucB3qQqhCaRIzmDtntX
         TFWA==
X-Forwarded-Encrypted: i=1; AJvYcCVTvWixtI3pujCAlwfCkiKb52EoYehzbEr58DsrWtGbrBBN/6sQwNLzM3/2iefRL8SW0HBcDpfyaOkXOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhKJaguZ08MN83scgop+GoZG9rp0EOYXRZBmJ5tOMa08xjE+av
	SgbUqE157ZGKMmFh07eBDC/UmLqc+YfkJbi6AR5rmCYoGBIHpt554/Jm5qZHMWUuJuarKtK2fpZ
	Khopbi1Volw1PjNpSjE2bm/28f5o3c4D6R7V8E1Ha
X-Gm-Gg: ASbGncsxqbwqgzed19ANpMplTWdu+P8cQ4nECG9vASqvBSosk2rfGLDRceS/e4pJ9vQ
	zdAaSWnaUhUBttBe+pZciczvVBEErI/pAn+43o+J63lcJx75Rmq0xO5eVuvWuas5RNs88bazODP
	z0FtFolZIQFJ5wuDZn8Z9rO4U1NseZcnygTnQ9jL/PkimiXK552CMG11WQmNerYNjhwgMh48G3r
	GUqnBG770Prx8I1WI5xm5yMniZzGTA3Y8uKUtmTM/Kn8hTWRILzBjS/voUl4i7EgUK8a2mQymtU
	i4mV5tHxAWEQP7WpaXpciIz5rFqyNKB9Ot+5
X-Google-Smtp-Source: AGHT+IHITeazHHwTTxRWixTIJLnXV/QpAABQfCatJJqzZbqRqhuh2oTKtogzT6hkK/GqH10bEqEzsg4Wx3pcMeVqKhQ=
X-Received: by 2002:a05:6512:15a4:b0:579:f0fc:429f with SMTP id
 2adb3069b0e04-596a3ee6beemr12814117e87.49.1764613848341; Mon, 01 Dec 2025
 10:30:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251111234519.369652-1-svv@google.com>
In-Reply-To: <20251111234519.369652-1-svv@google.com>
From: Siarhei Vishniakou <svv@google.com>
Date: Mon, 1 Dec 2025 10:30:31 -0800
X-Gm-Features: AWmQ_blG4JIZOah_1CsCWPyCXf8WDmvapXmn32eI_g9yvEXRr-R8FA9deAh4GMY
Message-ID: <CAKF84v2DzfOLzsZ8eMeVVTXa_uKiyj-LUjchW1StcBXVt_HXhA@mail.gmail.com>
Subject: Re: [PATCH v2] HID: playstation: Center initial joystick axes to
 prevent spurious events
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Roderick Colenbrander <roderick.colenbrander@sony.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 11 =D0=BD=D0=BE=D1=8F=D0=B1. 2025=E2=80=AF=D0=B3. =D0=B2 15:4=
5, Siarhei Vishniakou <svv@google.com>:
>
> When a new PlayStation gamepad (DualShock 4 or DualSense) is initialized,
> the input subsystem sets the default value for its absolute axes (e.g.,
> ABS_X, ABS_Y) to 0.
>
> However, the hardware's actual neutral/resting state for these joysticks
> is 128 (0x80). This creates a mismatch.
>
> When the first HID report arrives from the device, the driver sees the
> resting value of 128. The kernel compares this to its initial state of 0
> and incorrectly interprets this as a delta (0 -> 128). Consequently, it
> generates EV_ABS events for this initial, non-existent movement.
>
> This behavior can fail userspace 'sanity check' tests (e.g., in
> Android CTS) that correctly assert no motion events should be generated
> from a device that is already at rest.
>
> This patch fixes the issue by explicitly setting the initial value of the
> main joystick axes (e.g., ABS_X, ABS_Y, ABS_RX, ABS_RY) to 128 (0x80)
> in the common ps_gamepad_create() function.
>
> This aligns the kernel's initial state with the hardware's expected
> neutral state, ensuring that the first report (at 128) produces no
> delta and thus, no spurious event.
>
> Signed-off-by: Siarhei Vishniakou <svv@google.com>
> ---
>  drivers/hid/hid-playstation.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.=
c
> index 1468fb11e39d..a145b5ea4405 100644
> --- a/drivers/hid/hid-playstation.c
> +++ b/drivers/hid/hid-playstation.c
> @@ -718,11 +718,16 @@ static struct input_dev *ps_gamepad_create(struct h=
id_device *hdev,
>         if (IS_ERR(gamepad))
>                 return ERR_CAST(gamepad);
>
> +       /* Set initial resting state for joysticks to 128 (center) */
>         input_set_abs_params(gamepad, ABS_X, 0, 255, 0, 0);
> +       gamepad->absinfo[ABS_X].value =3D 128;
>         input_set_abs_params(gamepad, ABS_Y, 0, 255, 0, 0);
> +       gamepad->absinfo[ABS_Y].value =3D 128;
>         input_set_abs_params(gamepad, ABS_Z, 0, 255, 0, 0);
>         input_set_abs_params(gamepad, ABS_RX, 0, 255, 0, 0);
> +       gamepad->absinfo[ABS_RX].value =3D 128;
>         input_set_abs_params(gamepad, ABS_RY, 0, 255, 0, 0);
> +       gamepad->absinfo[ABS_RY].value =3D 128;
>         input_set_abs_params(gamepad, ABS_RZ, 0, 255, 0, 0);
>
>         input_set_abs_params(gamepad, ABS_HAT0X, -1, 1, 0, 0);
> --
> 2.51.2.1041.gc1ab5b90ca-goog
>

Hey Jiri,

Do you mind taking a look at this one?

