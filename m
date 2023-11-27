Return-Path: <linux-input+bounces-264-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D3D7FA6A1
	for <lists+linux-input@lfdr.de>; Mon, 27 Nov 2023 17:39:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C94A2818EB
	for <lists+linux-input@lfdr.de>; Mon, 27 Nov 2023 16:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1D7135888;
	Mon, 27 Nov 2023 16:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iP02GF5e"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22349CE
	for <linux-input@vger.kernel.org>; Mon, 27 Nov 2023 08:39:10 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-507be298d2aso6044834e87.1
        for <linux-input@vger.kernel.org>; Mon, 27 Nov 2023 08:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701103148; x=1701707948; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mbaBvVs4jJomuZqndjy6yrs8VhBzsYpU6MK+yNn7wYo=;
        b=iP02GF5eKWdrEOLl75L3zMir44AgVKPu0jJSymY7S8h/X3xWdYWBxC3Ruxe8kReObY
         M1IpKQY5RmJ6RFVWA+tLJ9D87irdYaxGvBB0xBuAMQz4ctwDHMR3d3+Ts00OnXdzvwiV
         M7zdfOh5EK50IQ9ExTsD25xwxwssHKUOPcNT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701103148; x=1701707948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mbaBvVs4jJomuZqndjy6yrs8VhBzsYpU6MK+yNn7wYo=;
        b=C29isPVAujecwacWzuCMZCE9GzVE1RPLDPOly5b6yHKmqOd40OKGJXe8yL1g05GYt9
         cfscYGRbjf5vyme/kQ23+zJ6Yi+qQaxvGeQk8joy6Cd1kLaWEG27qFeHvVpZoHPWEYDb
         wZdfBV4w4A4O2jxWBx927YJ2RdMiB5ozMqvJ/402BbnGrXxQ5bO8l5kmqZDBz5ZSYdnx
         KmCU+rLc7l+PbLTt58v7F39MSj+z0vDiOapnrUfbaT0Zwcs+Nx7gDBiMqIozyLQWRQbR
         AW7YinGX9acZmgGnzwwYjO6y2/uG0pjlJNtWZOa8ajtiMO06zLHvoiBszgK1VVCEWzZv
         hwMQ==
X-Gm-Message-State: AOJu0YwIGkNt63X5iTVhqa9bvuvxRLD5RKtK/+N/KV93nFVAwbOS0FJx
	Ffi7oUkA6KhFLq6wYqVMtcnnr9YKQLtvAM/P0KO9XA==
X-Google-Smtp-Source: AGHT+IG1KaGzzgqkd/bVl0htNdKZU5Bn8cbei0/SCcALuzYLvd3G7A/NDsEbwNme3869KE8Y7hH9x4OGUsfYwhzFnkY=
X-Received: by 2002:a05:6512:3190:b0:50a:68f4:6361 with SMTP id
 i16-20020a056512319000b0050a68f46361mr9952921lfe.17.1701103148299; Mon, 27
 Nov 2023 08:39:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230925163313.1.I55bfb5880d6755094a995d3ae44c13810ae98be4@changeid>
 <ZWF76ALANQwP_9b1@google.com>
In-Reply-To: <ZWF76ALANQwP_9b1@google.com>
From: Jonathan Denose <jdenose@chromium.org>
Date: Mon, 27 Nov 2023 10:38:57 -0600
Message-ID: <CALNJtpUHHaq6g0wSuyaNBxtOE9kt6vDzdAGGu6j=JJdJmerDWQ@mail.gmail.com>
Subject: Re: [PATCH] Input: i8042 - add quirk for Lenovo ThinkPad T14 Gen 1
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Jonathan Denose <jdenose@google.com>, 
	Hans de Goede <hdegoede@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Mattijs Korpershoek <mkorpershoek@baylibre.com>, Takashi Iwai <tiwai@suse.de>, 
	Werner Sembach <wse@tuxedocomputers.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry

On Fri, Nov 24, 2023 at 10:45=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Jonathan,
>
> On Mon, Sep 25, 2023 at 04:33:20PM -0500, Jonathan Denose wrote:
> > The ThinkPad T14 Gen 1 touchpad works fine except that clicking
> > and dragging by tapping the touchpad or depressing the touchpad
> > do not work. Disabling PNP for controller setting discovery enables
> > click and drag without negatively impacting other touchpad features.
>
> I would like to understand more on how enabling PnP discovery for i8042
> affects the touchpad. Do you see it using different interrupt or IO
> ports? What protocol does the touchpad use with/without PnP? If the
> protocol is the same, do you see difference in the ranges (pressure,
> etc) reported by the device?
>
> Thanks.
>
> --
> Dmitry

Without PnP discovery the touchpad is using the SynPS/2 protocol, with
PnP discovery, the touchpad is using the rmi4 protocol. Since the
protocols are different, so are the ranges but let me know if you
still want to see them.

Can you tell me how to check the interrupt/IO ports? I'm not sure how
to do that.

Thanks,
Jonathan

