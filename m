Return-Path: <linux-input+bounces-146-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 883337F1FF7
	for <lists+linux-input@lfdr.de>; Mon, 20 Nov 2023 23:07:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4406C28232C
	for <lists+linux-input@lfdr.de>; Mon, 20 Nov 2023 22:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B173238DF5;
	Mon, 20 Nov 2023 22:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m7heoejd"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3C3DE3
	for <linux-input@vger.kernel.org>; Mon, 20 Nov 2023 14:07:34 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-50a6ff9881fso7136188e87.1
        for <linux-input@vger.kernel.org>; Mon, 20 Nov 2023 14:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700518050; x=1701122850; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yfJV4fG6AMHCYM/bwmUvxuqqQRxAS+ugbtB1ACa3Wk4=;
        b=m7heoejdLUPQ2GpeN5VrmwzI9hhcb/QF/aPGN3PDsmgN2PFMqhV5kpRYBPe2RD9oqa
         4MP19wCIMFVYH7N0nWt4oRXzn2u5L2gEjrtFMOIs+oJH7UsPjeRXVjjhh4jkn0JzyGsn
         eqXRBrlCZo9Jo4iO5AnkRrdwAreEjm79uqYNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700518050; x=1701122850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yfJV4fG6AMHCYM/bwmUvxuqqQRxAS+ugbtB1ACa3Wk4=;
        b=M7JnaJORP0aiO7QG4epiHNWMWmSV5PWbivEiS07jjRJncjiecPX+J5VRyaKy7SPXMu
         tWzl/xpZY4h0Jbi1atmuEyLV+4piB2uA4ciPLPp/OCfF6wpx2Z68OlG68zg5RyDLjzI6
         mUMjmkE8MCJztJ70SYXFURdqByC9JClcnWaETPPOyRiMnnlO4AaP/0R9lPSzPCXM6nBD
         SRFoXXBhAsgdjhOTg6STuVt2h28WteaiNGQ+DSOZvA84S1TxYn1K1M7ZTM+7vlima9zM
         ujSMCFm9ozy0+1/A5YHnRopToYid1983SzDP4UKotdO3wzsdbuN4FFwoNBaIeK34/grs
         BVLA==
X-Gm-Message-State: AOJu0Ywt+Jrrr3fVq/LlpDT5FmV/gu2KpvHca8iNXhTtfgdxW/iPdZac
	7n/E83dgPsUT2k0EfHCiAHj+qAJCyiyOrLjW911KLg==
X-Google-Smtp-Source: AGHT+IHNseK7/jq2E20wiorok2H/p9QiPDHfufdNJCxo+KIzHlJklo7Ase2HwIxZvccvMp3Y8QJm8Q==
X-Received: by 2002:ac2:5486:0:b0:507:a04c:1bcf with SMTP id t6-20020ac25486000000b00507a04c1bcfmr6359468lfk.58.1700518050637;
        Mon, 20 Nov 2023 14:07:30 -0800 (PST)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id p9-20020a056402044900b0054868b36118sm3098978edw.32.2023.11.20.14.07.29
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 14:07:29 -0800 (PST)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4078fe6a063so8055e9.1
        for <linux-input@vger.kernel.org>; Mon, 20 Nov 2023 14:07:29 -0800 (PST)
X-Received: by 2002:a1c:7504:0:b0:404:74f8:f47c with SMTP id
 o4-20020a1c7504000000b0040474f8f47cmr311388wmc.5.1700518049185; Mon, 20 Nov
 2023 14:07:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231120193313.666912-1-hdegoede@redhat.com> <20231120193313.666912-5-hdegoede@redhat.com>
In-Reply-To: <20231120193313.666912-5-hdegoede@redhat.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 20 Nov 2023 14:07:17 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U+emgVbnRT2yQonZ013CRmYXK1bxh8+xGGn5LCnOmL5Q@mail.gmail.com>
Message-ID: <CAD=FV=U+emgVbnRT2yQonZ013CRmYXK1bxh8+xGGn5LCnOmL5Q@mail.gmail.com>
Subject: Re: [RFC v2 4/7] HID: i2c-hid: Move i2c_hid_finish_hwreset() to after
 reading the report-descriptor
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
> @@ -741,12 +741,9 @@ static int i2c_hid_parse(struct hid_device *hid)
>                 return -EINVAL;
>         }
>
> +       mutex_lock(&ihid->reset_lock);
>         do {
> -               mutex_lock(&ihid->reset_lock);
>                 ret =3D i2c_hid_start_hwreset(ihid);
> -               if (ret =3D=3D 0)
> -                       ret =3D i2c_hid_finish_hwreset(ihid);
> -               mutex_unlock(&ihid->reset_lock);
>                 if (ret)
>                         msleep(1000);
>         } while (tries-- > 0 && ret);

Right after this loop, you have:

if (ret)
  return ret;

That will return with the mutex held. It needs to be a "goto
abort_reset". You'd also need to init `use_override` then, I think.

I'll also note that it seems awkward that
`clear_bit(I2C_HID_RESET_PENDING, &ihid->flags)` is scattered in so
many places for error handling, but I couldn't really find a better
way to do it. :-P

-Doug

