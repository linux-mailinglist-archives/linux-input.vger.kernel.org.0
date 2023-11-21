Return-Path: <linux-input+bounces-191-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A335F7F3739
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 21:24:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D454F1C20C75
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 20:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56C265465D;
	Tue, 21 Nov 2023 20:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZtKiBLsE"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC02419E
	for <linux-input@vger.kernel.org>; Tue, 21 Nov 2023 12:23:59 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c50906f941so80972041fa.2
        for <linux-input@vger.kernel.org>; Tue, 21 Nov 2023 12:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700598236; x=1701203036; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JDVfUt3nV/fPKQAH9Uyx3Am8VhgQpdnyu+ywO2Er6HQ=;
        b=ZtKiBLsEiq4lox67HIB3uf7cowX7Hnwd4mNNBj2hI5XfWBrFaN/dyxyIzLNKJWmIte
         qP2x4Eu39Zxw2MqA2nt4jXqYwtSvDUpRXzqsGtBeDePeCn1tTkkPlIqEKkzp0se/OWbf
         n+W9fjDra+zhUP9l9Jxzp75uKiJVUPvK4FjeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700598236; x=1701203036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JDVfUt3nV/fPKQAH9Uyx3Am8VhgQpdnyu+ywO2Er6HQ=;
        b=g4q7S+KAUghEguL30c8xRoJRbNyQac5hJIpmww9E7MGqUA57p2B9y3CHOZB/CssVVD
         6BDa+xg8uegW5V48R513/VoINVDxkHzNQE/b31xzNOXtWd3F5JiJF94TxZdb4XrZThFZ
         F0vxSKvvZTZDW05vZLGBdFZMSZFMDq1jFfUhn2oxho/tiDcTCIWr/N2t7hYSYeh/dZWX
         rcPiNgYTKbkDg9Jr6cjzKAw/XkI0SVQAfybxQjfiS01ZS9dVmVhT3r27SqDlJdiivT3A
         srxIejOCWA21wAfeyYIcPvvtRi0QnbgCxkdPFb+BluihRNVgxb/RMWFVubEy4pnXA2gA
         vRew==
X-Gm-Message-State: AOJu0Yz8h+hLbVkY3p2olDx7ER0O5aMt87FsGORoJpZZYzCZQfGCc7hB
	mUhlGU7VwgQL/kc/NrQ5gXEXwb4FchsV1ESfIa5gfW6LJ+y9k5eVwuBiOwXfko9Tkg==
X-Google-Smtp-Source: AGHT+IEuKj6w+Dv29ac2pUeeMmwlT/AZVcjYIP4S9TtytZ2s3QZt9zlGZdQBtj1+Dx6Ypvs+48t+ocDGCduXZCrXsJU=
X-Received: by 2002:a05:651c:1990:b0:2c5:1045:71cb with SMTP id
 bx16-20020a05651c199000b002c5104571cbmr201792ljb.32.1700598236283; Tue, 21
 Nov 2023 12:23:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230925163313.1.I55bfb5880d6755094a995d3ae44c13810ae98be4@changeid>
 <fbcf0fee-b97d-8f47-9df4-44bc1b475144@redhat.com>
In-Reply-To: <fbcf0fee-b97d-8f47-9df4-44bc1b475144@redhat.com>
From: Jonathan Denose <jdenose@chromium.org>
Date: Tue, 21 Nov 2023 14:23:45 -0600
Message-ID: <CALNJtpUH_0+ETa+7MfKRbpc_c1TTTasUrZ4zA4V9EHb_BtAUwg@mail.gmail.com>
Subject: Re: [PATCH] Input: i8042 - add quirk for Lenovo ThinkPad T14 Gen 1
To: Hans de Goede <hdegoede@redhat.com>
Cc: linux-input@vger.kernel.org, Jonathan Denose <jdenose@google.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Mattijs Korpershoek <mkorpershoek@baylibre.com>, Takashi Iwai <tiwai@suse.de>, 
	Werner Sembach <wse@tuxedocomputers.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Hans,

On Tue, Sep 26, 2023 at 5:37=E2=80=AFAM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Hi,
>
> On 9/25/23 23:33, Jonathan Denose wrote:
> > The ThinkPad T14 Gen 1 touchpad works fine except that clicking
> > and dragging by tapping the touchpad or depressing the touchpad
> > do not work. Disabling PNP for controller setting discovery enables
> > click and drag without negatively impacting other touchpad features.
> >
> > Signed-off-by: Jonathan Denose <jdenose@google.com>
>
> Thanks, patch looks good to me:
>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>
> Regards,
>
> Hans

I just wanted to double check that I haven't missed anything, has this
patch been applied yet?

Best,
Jonathan

