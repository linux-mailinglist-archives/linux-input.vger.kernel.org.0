Return-Path: <linux-input+bounces-6803-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8559498811B
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 11:09:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42F62286F62
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 09:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17346183CB6;
	Fri, 27 Sep 2024 09:09:23 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0D5157490;
	Fri, 27 Sep 2024 09:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727428163; cv=none; b=nphy7B6PXbhEpuP9NOzMsSn4jHsxwY903hSdyCijmJjv0aNFgIqLuHenqrlD688Tqr2x858wKRiB9VTch/QTzYl4iTJXl0UMPfSYEosgwMwf2fuiJwUabc5/rZflGixCfeMqRvhUkbImnPVr7HBwM/CMGUALfoqMJDHp2FKn7+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727428163; c=relaxed/simple;
	bh=cQpDxDvyACMdOMajscbHWwweOtpsS7MCHWX4VJUvtGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k1XzLHllDMDuJ12BeBdjAmOONhxHKqzR6V8gWlB7HsyHIYM38p2InIoXRQ9isBzWLaY93+7X45fzpykoMKwZYdkvGTZa0dcVh+BtKJQkr3hD625MWcT1WiqLi8ZsANKrr1tYttIfJluHwoURQEbaom3trPaGPCWU2sL21aSxT0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e22531db3baso1819335276.3;
        Fri, 27 Sep 2024 02:09:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727428160; x=1728032960;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gD7HYc2ykFp2Z6YaTnlKUeCem16iQ9uMqHuzQPPeNLs=;
        b=Eha4z30mtdqRAw27cNKLp4RwF7F705ORVGjH2Ffo5oLpwN5m8OqOSsb/PcjmdqGjI8
         bvkWKEvjxXf+QfnzDvBDlsUzvlevS8bfWBk9RxHnNikBMFnvVOG5wapmZ8CnJ+dTPhmv
         lnZhPtkzbTwwK9Px29bLOpnTp6IamFGb/I9nQzkBi6RwXppJ0wmkKZgzmrg8qluh5wUL
         YDUcFpp/xyc19W4FHi7a4wwf1W24iIPEIubRzVyL930xkcBJVI1JN6vt4kopOlwijzdg
         95xoCdsdt/Xtr5HpaCGUHj4m2KkPa5ivDsNkrb1qNbNqEPKCeo9LuZWedkTNPWSXxex4
         O/PQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0aSJzcIK6jvEGZ7qmviEt1w3JxOODWOVb63TZqDjr5Cz40Fa1T4KFgaTzImA+JM/jmq0Tw+85NqBvpQwKyQZ7lUM=@vger.kernel.org, AJvYcCWwAdNpgp10um8L1YI25h8ESjJVGCBd2wxw7DR2dLjqX5UzpVSro78BO3QjWeXGz99/DApsDEQ6BhOt@vger.kernel.org, AJvYcCXrpUNJ+bezt/BnHwiaUuDDEPzOKanMgHs2TzA2FvBV+bzc/yTEDuUmKG8JVcHZTH2ZR9+KLKcYJ027qQM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTQ61zaZa6QoCAkH0TER3hw98vXQpQmJDQt7PAIA/GyBcSQLcJ
	tR/+oXECMo9xe1FuLMOZn5alnQvmdX67jmmWt6h4yDRoOWox1/9nQ+BRu0I0
X-Google-Smtp-Source: AGHT+IGJc8Hc1dlXUBSMOW+FUdvs5BRg4q6W6ebmJMSFcku96A8+wvXceNj08Z2J2oYM9VlN4lY0WA==
X-Received: by 2002:a05:6902:2084:b0:e20:2876:8b6a with SMTP id 3f1490d57ef6-e2604d0cd30mr1450198276.48.1727428159872;
        Fri, 27 Sep 2024 02:09:19 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e25e3ef9b70sm366809276.3.2024.09.27.02.09.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Sep 2024 02:09:19 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6dbc9a60480so16577897b3.0;
        Fri, 27 Sep 2024 02:09:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVGDKUmRJ+3Mt5z9HrNrTEyOfUcpCvoCbN6kNcsLND+0tRgP6t4xM0X0clh44BY54cTbBM9RAOrBszNrfSAOMqZH+4=@vger.kernel.org, AJvYcCWa+wgLslXxGay0kj4RgrgL7aeVZFKKkLf1CXkW9JBESktwyWv5DfNB2Gpg/cqdTSgk9icgo30c63UH@vger.kernel.org, AJvYcCXCseGCVlTfC4feS03bMMYLCewwPXATejhhRt9RmpskyvBh+cfKCR1qlLjcQmCXn5+lqDZRXjAVzHvfBCs=@vger.kernel.org
X-Received: by 2002:a05:690c:2901:b0:6e2:50a:f43b with SMTP id
 00721157ae682-6e2475e667dmr15059647b3.35.1727428159382; Fri, 27 Sep 2024
 02:09:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927081757.7022-2-wsa+renesas@sang-engineering.com> <1762ec04-4dba-4de1-b380-73bf391462e5@kernel.org>
In-Reply-To: <1762ec04-4dba-4de1-b380-73bf391462e5@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Sep 2024 11:09:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUQdTL+hP2fuDxzsuF0wRzAh-uuGQExNqkwsUZZWJ6OMg@mail.gmail.com>
Message-ID: <CAMuHMdUQdTL+hP2fuDxzsuF0wRzAh-uuGQExNqkwsUZZWJ6OMg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: input: gpio-keys: allow generic
 'interrupt-parent' for subnodes
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Fri, Sep 27, 2024 at 10:32=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> If you want less lines in DTS, just switch to interrupts-extended.

Oh cool!

Documentation/devicetree/bindings/interrupt-controller/interrupts.txt used =
to
explicitly prohibit this use case, but I seem to have missed
commit 6df58e485fd002f6 ("dt-bindings: Clarify interrupts-extended
usage") lifting that restriction.

/me thawes his old patches to make better use of interrupts-extended
in Renesas DTS files...

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

