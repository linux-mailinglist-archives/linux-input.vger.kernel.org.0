Return-Path: <linux-input+bounces-16013-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A7EC5014A
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 00:40:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2373F1899AF1
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 23:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74D232F39A5;
	Tue, 11 Nov 2025 23:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CT3yFC3d"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C8A2F361F
	for <linux-input@vger.kernel.org>; Tue, 11 Nov 2025 23:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762904441; cv=none; b=YnEO5Q0sixsfH2N4w5UEA6DBzI/sTpZLIdq5FOFTwKuTK+jxe7/BuqtkMvahXai0fGDS7Pe0Kg24iybvS8L0wI9so3Ky2gjI696zSmYgxhLbuNug1JYhxsPT60VBtnbd7OdhDb+biqPN3YpBdqXrm5rgrT/qab6ln4e9OCbCepU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762904441; c=relaxed/simple;
	bh=9RPQUOuGiXuyRIeacRdgwahUNW5ZX4sjETV5RA9uMQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=WbwBbxWxIvZyzFeLAeQJr53H2OyEH52Vju1mvjDpfGDY5+D78GUQpRvIv+KpINR9e9inAOErtXQHD4KjXDKIyHbS+YBrsYAS4lmzjoK6FUC0VexgTWrwZO35uDw/Oc9xq4btFU+PBJZBhpdd7+Qewm0YDuOnBGq6qtDrSw67kFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CT3yFC3d; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5943d1d6442so232023e87.0
        for <linux-input@vger.kernel.org>; Tue, 11 Nov 2025 15:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762904438; x=1763509238; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1PtCNESExEoUzTotaWXK9jDj+telQPBVwoETJ1KCuJU=;
        b=CT3yFC3dArWInUXUt025Q7YvJ1PieSM9y4BPYEgfv4QBSU6NjgbNQ3VTBnkrDNhaYM
         YZiJYs0w8ClVOlR82D4jp6q1T8xlFC2+vkrCK56S87hzm7cenhwnBP6pHOjiKA7cAzYu
         4ibLAqq+M6QeIYADvxMuG2tLzSe7XZ7Zm5cnsEWMXV/dvTLouFeZ8+6Xkhg1ELr1GMex
         J1EsHjxiHsvGbcATA9kP7Qd7xT+fMaof+CLiltjo911Q6D9AN2pl3VtNLG/UGBF1SLI6
         vvrYV7Uzs6az9eDN55Fdq2BRDVN2ZhHN8dqcwDIb0ktfw4St9WNkKPHaixTTA8nsfS/s
         dAJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762904438; x=1763509238;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1PtCNESExEoUzTotaWXK9jDj+telQPBVwoETJ1KCuJU=;
        b=KANAUNsjYdOI39NyywzdjIuYCQRqrTSXF6naV3yDEwrON3XVqd8FcBaUnrSzFCcxmP
         nomHFf5n85nIQ2ILcsU54N+6YTM81s1FNvOkCrcinL9foUDrXV7GMZ/hyFlpNHqH/C80
         kSzGjyHO2V5fTg06JLFrK6yHi2RGEeBmUTbdq14frFN8EjZCee1wryjLVvTJwx1pBs4U
         CG/k/nRLqYT/BEPvRy2UEE9rgGebuQE/ko1gfkikaLDEMEIFttoMQCPciiw6ub0NW7Ws
         lwc0KekLDQEthqeAMVv7lepTl971mYJ9Kj36Zi5jMKQY8bDndNwI0UxJbvSB9JecGuJG
         4JMA==
X-Forwarded-Encrypted: i=1; AJvYcCWKPnwnMPdbs2kcImtetksAGhxPXQBxbRWUTZ/jV6NM1/uXXevjrmCHzjs87HyYmNj2J9jv/4FkCqxygw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7akJwWBHUYNNeKD8v1SRq1s2AFwy5DfK+enqaCK8jzdyPfe6A
	DI/+L4CyOfFNDpJfoQSri1gbKm9mfPuWN7Ny7KY8hq1sCtngm0AjIsZQ1dibKKi2tg4sZUch17f
	oDkGtk9GwDgnZAWw+67S52GRUYCvDpJ03gquqy4AP
X-Gm-Gg: ASbGncsQqsHU3w12bsVnY5u/AS4HQOIJQDih4i7/QRTT524mcSH+MjO5zpAuPM6mQIU
	Fjw7ZtGLruQOaFqdAgS3O7uKXbINF3pNWHMKIdgGpC6vQ+YpZnzG4JwyQrSEApNZZCZFh882+5d
	1D9FdwzeJDXJhl2Ibu01gjU2kyPaQv4RIc1TCqjJIdD9raX/sNxazSsPtsv+FHFw2s134IElEIV
	4mTFaYd2zunMvhtAsZkmRwjZXJSFSmdzfJCJZyqB3KcsE0KveiXw+x6V9A13HAeOR7s4S0ZwkC5
	JwXvX7rvrKlOlv+62aWUZP8/gEQ12JCN9FIg
X-Google-Smtp-Source: AGHT+IHGSElGGtooRC7TQ039qyogOHBfVcO7RNEgG5nKV1i25mcxyV03qZmSHjN16RhCKD3VPAEXohYD4xoh1aKyZVw=
X-Received: by 2002:a05:6512:3c96:b0:594:2cdf:1941 with SMTP id
 2adb3069b0e04-59576e17a9amr360519e87.31.1762904437532; Tue, 11 Nov 2025
 15:40:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251111233818.4155828-1-svv@google.com>
In-Reply-To: <20251111233818.4155828-1-svv@google.com>
From: Siarhei Vishniakou <svv@google.com>
Date: Tue, 11 Nov 2025 15:40:20 -0800
X-Gm-Features: AWmQ_bnPWyAAx5nFfenvDitzrBP39xPMkF6iHyk7M3zv1-8U8D6_pm8Fl4NcJO8
Message-ID: <CAKF84v3FJLaNgQDAkkwgtYCWuaN8bfSLm1OSrPrd1n3m3V+Xiw@mail.gmail.com>
Subject: Re: [PATCH] HID: playstation: Center initial joystick axes to prevent
 spurious events
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Roderick Colenbrander <roderick.colenbrander@sony.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 11 =D0=BD=D0=BE=D1=8F=D0=B1. 2025=E2=80=AF=D0=B3. =D0=B2 15:3=
8, Siarhei Vishniakou <svv@google.com>:
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
>  drivers/hid/hid-playstation.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.=
c
> index 1468fb11e39d..fd9d3c901743 100644
> --- a/drivers/hid/hid-playstation.c
> +++ b/drivers/hid/hid-playstation.c
> @@ -718,12 +718,19 @@ static struct input_dev *ps_gamepad_create(struct h=
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
> +       gamepad->absinfo[ABS_Z].value =3D 128;
>         input_set_abs_params(gamepad, ABS_RX, 0, 255, 0, 0);
> +       gamepad->absinfo[ABS_RX].value =3D 128;
>         input_set_abs_params(gamepad, ABS_RY, 0, 255, 0, 0);
> +       gamepad->absinfo[ABS_RY].value =3D 128;
>         input_set_abs_params(gamepad, ABS_RZ, 0, 255, 0, 0);
> +       gamepad->absinfo[ABS_RZ].value =3D 128;
>
>         input_set_abs_params(gamepad, ABS_HAT0X, -1, 1, 0, 0);
>         input_set_abs_params(gamepad, ABS_HAT0Y, -1, 1, 0, 0);
> --
> 2.51.0.536.g15c5d4f767-goog
>

My apologies, I sent the wrong version of this patch. The values for
Z, RZ should not have changed. I will resend.

