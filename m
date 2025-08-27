Return-Path: <linux-input+bounces-14353-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65800B38694
	for <lists+linux-input@lfdr.de>; Wed, 27 Aug 2025 17:27:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6655680B1A
	for <lists+linux-input@lfdr.de>; Wed, 27 Aug 2025 15:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 773AF2248B0;
	Wed, 27 Aug 2025 15:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FABCc6u8"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65BD2773E6
	for <linux-input@vger.kernel.org>; Wed, 27 Aug 2025 15:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756308399; cv=none; b=o4ilDZrsYrmBJDQ+FXSdMjbsJEpGZMK5/eZQohlQ2mfV6rhrl55SdvAVCD9QFIk+uS0gejilf4i9BC+nubIA9Ta236HWYmlM+O749V3tsd1/gmuKI8H9KnrknLnrZMdoqAPX8MDw4ndzeNoXvyRg9xF0+3vNtqlGCcTrk4SxDMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756308399; c=relaxed/simple;
	bh=VKuuQQCW9goFCxDxyheaqk7T10+zbATvmX6hEvwyK0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MOILV8JFQCSS5vxi2bdjpPZMTxsU+X2eB/+v8064+zjdd9+TfW91Po8DcG9vNATMQ2GppNBHd9dYWPQnbV6S0b/SFuCMhrDvslEPc/2lMHYFae0wXHwwPUK5JOtE2Z+4Z5pegvoD7blgwx3g5LpZI04SxwFZOSHn8X7mGo+AGN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FABCc6u8; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7718408baf7so3850295b3a.3
        for <linux-input@vger.kernel.org>; Wed, 27 Aug 2025 08:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756308396; x=1756913196; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DLrh1j2iqdsWB2lnt1a0koxPADVPet1wRoykvV46kQs=;
        b=FABCc6u8vLT+l5P5SUBtihxdKvzvQ/9vc9kHdoWDfVrlRtYOeIOTTbuOvW2VUnftVo
         L7KLYE7DfFHuBKw2cxyVHtffGWr3Ls34jjWKRuiGbsM+oPkdwR2NlYg+w6SZ7lEclbpB
         rvovb3W1qD1i3DRXlSzX5QOLFtkV4AYt4sAbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756308396; x=1756913196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DLrh1j2iqdsWB2lnt1a0koxPADVPet1wRoykvV46kQs=;
        b=IPFLIPkaPh6ldKbqNkTE/DuLs77CqRNyGvuhlK7+8+a7XSCLwNARs6zmZEcv8wf4bi
         atDfwOjThvs0+7XLLE7grqUB/lwG7o5SxzLCRpYHojQLdkGlQm0MGUYex5MiHuA80xLR
         69Q54Ac7ZyA4rVEaoJ7TnroeyzyTxrUTqJV92Xxu9G7+qx/kqF1ucBs7wykyKM69XSmd
         SHwq6smL2gCnThz8bZLNXun2dXvst2saq4Cg2otTI+JudzoYr+XofWbc4TNao+GkWRaP
         dEtxf0TsIELfKCsJXvJanpPpd9kb7tVSmPm/AByzpjrEbtzfGYFi9DOP+wICLMN+T5F7
         jZlA==
X-Forwarded-Encrypted: i=1; AJvYcCXj4JmXyOLz3Z/r+lTGsJ50y09YySDq28tR8CU/AQHYQq/rFT5/JUC/k0dl8wS50ctglBx1Zcxirv5mDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjcu9wDh8iAhKJwUk7ZugK33jyApBFiDUrucclmicqh0QrlE8p
	rUNj1ql1bG3wZB6GDgUFlpXB9XqmrTPphOjIjLay5rjNLidZHbO/4SLaW5noCIemnlZg6UF2Czj
	e5Yc=
X-Gm-Gg: ASbGncvg00UWVSsoqO8HJQHjTFZ17viYzlNabF6XGT3R045oC5Lb/pSpGQjv7/U4uvg
	q0t4nK/dkCIHvluxnoTQwOGNvjC5TQ2GizJsIsN3rw38emLFb6gGvHvNOgb6lYsyGI22kyrB3zU
	TRpu3NZhk7I8hXBtq0dBOImlxkxGlHvekKMkFcGjmtg0tQj+Os3Sgs6nRGQttrrIBj+BC6Ixztc
	IABtcGDFOuh80SXE8e6AjEt1sC4fc3z+iwvb5Pi/xsSv9YS7z107JoxWTrqsJP5P4FfX2xBWM/F
	3+w/SXqO6nVdibt023FLK9tYmSUrRIqAUH8vYIPn9KZMQtA00M1pGjZNRM66QWJfTKqZdlV8AEc
	SXaYkxNtjK1gY/yPAIVU3nKNBW44JvTbTlxk1qNQX7YBrSLzUxAoclLrktO9R2ZNP7ltCxovm0/
	HC
X-Google-Smtp-Source: AGHT+IFosZrQKRi9eToSsXK0UFKeC5jOsPar6zXJTqLls50dC+znGhMggflZpGKrzRMWwfGyl639jQ==
X-Received: by 2002:a05:6a20:244e:b0:233:f0c6:a8a4 with SMTP id adf61e73a8af0-24340cd2b35mr27621791637.31.1756308396119;
        Wed, 27 Aug 2025 08:26:36 -0700 (PDT)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com. [209.85.215.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b49cb8918e7sm11794796a12.6.2025.08.27.08.26.34
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 08:26:34 -0700 (PDT)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b482fd89b0eso29740a12.2
        for <linux-input@vger.kernel.org>; Wed, 27 Aug 2025 08:26:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUjXbNc76Z4ANjbXwC/e9OJjYrs6hn3tmwdXma05veWVoLvq+QqbTYrb0A/sbPeKVGLu5/XSJvn49wXlQ==@vger.kernel.org
X-Received: by 2002:a17:903:22c3:b0:246:61c:a67b with SMTP id
 d9443c01a7336-2462efc84a4mr257613985ad.58.1756308393826; Wed, 27 Aug 2025
 08:26:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aK8Au3CgZSTvfEJ6@stanley.mountain>
In-Reply-To: <aK8Au3CgZSTvfEJ6@stanley.mountain>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 27 Aug 2025 08:26:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WEQf=PX52Uv_bjzhnUipKwcNY+BBTOfDHucv=EkBTzgg@mail.gmail.com>
X-Gm-Features: Ac12FXyOqAsTB-Ef0CSpdX5fkDPZp5ZPV2zuiCMnpU52NE9UK-HvdLXDXVbdv14
Message-ID: <CAD=FV=WEQf=PX52Uv_bjzhnUipKwcNY+BBTOfDHucv=EkBTzgg@mail.gmail.com>
Subject: Re: [PATCH next] HID: i2c-hid: Fix test in i2c_hid_core_register_panel_follower()
To: Dan Carpenter <dan.carpenter@linaro.org>, Jiri Kosina <jikos@kernel.org>
Cc: Pin-yen Lin <treapking@chromium.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, Wentao Guan <guanwentao@uniontech.com>, 
	=?UTF-8?Q?Bart=C5=82omiej_Mary=C5=84czak?= <marynczakbartlomiej@gmail.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kenny Levinsen <kl@kl.wtf>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 27, 2025 at 5:57=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> Bitwise AND was intended instead of OR.  With the current code the
> condition is always true.
>
> Fixes: cbdd16b818ee ("HID: i2c-hid: Make elan touch controllers power on =
after panel is enabled")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/hid/i2c-hid/i2c-hid-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org

Jiri / Benjamin: if one of you can give this a quick Ack then I'll
throw it into drm-misc-next with the patch it's fixing.

-Doug

