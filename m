Return-Path: <linux-input+bounces-144-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0357F1FF1
	for <lists+linux-input@lfdr.de>; Mon, 20 Nov 2023 23:06:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1AD3282409
	for <lists+linux-input@lfdr.de>; Mon, 20 Nov 2023 22:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD11439848;
	Mon, 20 Nov 2023 22:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gRM72vDw"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4BD4E3
	for <linux-input@vger.kernel.org>; Mon, 20 Nov 2023 14:06:03 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9fffa4c4f43so143046466b.3
        for <linux-input@vger.kernel.org>; Mon, 20 Nov 2023 14:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700517959; x=1701122759; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5xCISuJl03JzTUtNeMk98+Y5may7EpY5qxBQYc7F6M=;
        b=gRM72vDwbg9EIGwcM/nHA44cMXQuhy4tnfBSQwTlMSBNucdw0+NCwJwr/AMSVfezDd
         9ZAJrL6VeqxMkZ87lRv9cW/g3129UypCzoj5+cIigbT5hU5y3TWC6OoB6C0U9WQzYX0a
         cKk8u4fPEJoeiUB2cx8FZoj8asQKHUfHItB0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700517959; x=1701122759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F5xCISuJl03JzTUtNeMk98+Y5may7EpY5qxBQYc7F6M=;
        b=QV0342VGfdiS6goiO8KpnxQ9kWj59VTrPvVxI159Z6VDlbXybK8Cy1rcqs1JpG6ozs
         Gb/VdGcGvDSBSLPvmKl40GMbuW4vE8OxXijYMM3RwrXATzL0ecXllfbVHtlC642p3lol
         i6hM82XYEsQ8EoI1iH+2KaWmK4o1AabC8/PzHQpVlN8wzo+8xut3s+uc1lFFgBfBydGQ
         qOSkk48/P8IbL4BSlpnax3FuimSmNdvg9kwGcpnxNMtcAEoBBrpRd29OSgn22Io+ZGb0
         dO0dFJC7m98WZE1N9NkprR51vUx2aQmvlLC2TYojwzCIhk69nooC/Y/L1F4uZS1Yo1rV
         nz1A==
X-Gm-Message-State: AOJu0YyjL08A4kGkmbqLoH/wN5ZTzyRJ+DdVwbRm69anV+G93B4FwNZC
	uywFUlcbolb/kMnUHexQiMFJxt5TpaewLnA7yJMkwg==
X-Google-Smtp-Source: AGHT+IE2O29SCq23iWvbpGt3x/b1NnCCdjLX3a8NTl/AD8b0fo7DGE+jbEnJSXybSJ68w9vQ1Sfk4Q==
X-Received: by 2002:a17:906:2787:b0:9fd:1cd7:f68d with SMTP id j7-20020a170906278700b009fd1cd7f68dmr3889540ejc.67.1700517958503;
        Mon, 20 Nov 2023 14:05:58 -0800 (PST)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id e10-20020a170906314a00b009a13fdc139fsm4298118eje.183.2023.11.20.14.05.57
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 14:05:58 -0800 (PST)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-408c6ec1fd1so6705e9.1
        for <linux-input@vger.kernel.org>; Mon, 20 Nov 2023 14:05:57 -0800 (PST)
X-Received: by 2002:a05:600c:3c8b:b0:3f7:3e85:36a with SMTP id
 bg11-20020a05600c3c8b00b003f73e85036amr432589wmb.7.1700517957474; Mon, 20 Nov
 2023 14:05:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231120193313.666912-1-hdegoede@redhat.com> <20231120193313.666912-2-hdegoede@redhat.com>
In-Reply-To: <20231120193313.666912-2-hdegoede@redhat.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 20 Nov 2023 14:05:39 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W0Erw0MHB-MeSOTNYy3Nd9ea69ke742wd6_dsUtTbB8A@mail.gmail.com>
Message-ID: <CAD=FV=W0Erw0MHB-MeSOTNYy3Nd9ea69ke742wd6_dsUtTbB8A@mail.gmail.com>
Subject: Re: [RFC v2 1/7] HID: i2c-hid: Fold i2c_hid_execute_reset() into i2c_hid_hwreset()
To: Hans de Goede <hdegoede@redhat.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	Julian Sax <jsbc@gmx.de>, ahormann@gmx.net, Bruno Jesus <bruno.fl.jesus@gmail.com>, 
	Dietrich <enaut.w@googlemail.com>, kloxdami@yahoo.com, 
	Tim Aldridge <taldridge@mac.com>, Rene Wagner <redhatbugzilla@callerid.de>, 
	Federico Ricchiuto <fed.ricchiuto@gmail.com>, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 20, 2023 at 11:33=E2=80=AFAM Hans de Goede <hdegoede@redhat.com=
> wrote:
>
> @@ -482,21 +442,50 @@ static int i2c_hid_hwreset(struct i2c_hid *ihid)
>
>         ret =3D i2c_hid_set_power(ihid, I2C_HID_PWR_ON);
>         if (ret)
> -               goto out_unlock;
> +               goto err_unlock;
>
> -       ret =3D i2c_hid_execute_reset(ihid);
> +       /* Prepare reset command. Command register goes first. */
> +       *(__le16 *)ihid->cmdbuf =3D ihid->hdesc.wCommandRegister;
> +       length +=3D sizeof(__le16);
> +       /* Next is RESET command itself */
> +       length +=3D i2c_hid_encode_command(ihid->cmdbuf + length,
> +                                        I2C_HID_OPCODE_RESET, 0, 0);
> +
> +       set_bit(I2C_HID_RESET_PENDING, &ihid->flags);
> +
> +       ret =3D i2c_hid_xfer(ihid, ihid->cmdbuf, length, NULL, 0);
>         if (ret) {
>                 dev_err(&ihid->client->dev,
>                         "failed to reset device: %d\n", ret);
> -               i2c_hid_set_power(ihid, I2C_HID_PWR_SLEEP);
> -               goto out_unlock;
> +               goto err_clear_reset;
>         }
>
> +       i2c_hid_dbg(ihid, "%s: waiting...\n", __func__);
> +
> +       if (ihid->quirks & I2C_HID_QUIRK_NO_IRQ_AFTER_RESET) {
> +               msleep(100);
> +               clear_bit(I2C_HID_RESET_PENDING, &ihid->flags);
> +       }
> +
> +       if (!wait_event_timeout(ihid->wait,

optional: as mentioned in v1, I probably would have made the above an
"else if" to make it clear that it's not ever true if you ran the
"I2C_HID_QUIRK_NO_IRQ_AFTER_RESET" logic.

