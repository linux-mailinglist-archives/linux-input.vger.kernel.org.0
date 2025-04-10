Return-Path: <linux-input+bounces-11713-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 386A2A846A9
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 16:45:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E54C87B0854
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 14:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 676D3293B4E;
	Thu, 10 Apr 2025 14:41:17 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E3028EA7C;
	Thu, 10 Apr 2025 14:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296077; cv=none; b=XXKuK5SFu2eqb36NP9aCTROo31GTsMKN4nBy0b/zN6vuei5A1av4ocQHExaT5xbJwF2ksTkRWq0ee6VlZd3IE+DI29Cxt3dSZG/156RuThuqVAIGI7oQGu6nnZUm83xq6UmHLqUbe8xbWEX/L56ykh3CkU+K84kYsMOlGhIqQi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296077; c=relaxed/simple;
	bh=7C0dSwhhH0Uym7Hv45NFMdC2KoQRv1e/nEQ7pjCJr7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HFTiIXeyeuiISFZahCN+BWJmTgQ4gaFaUP8DGLlk1LfNQsp7VzjkUVUD+lHj/Sag3V8A1AbUfpFppHNi3xut1DqwUqsHvA5mBGyv86e2qNpjwgc8oqyt2J7RlUz6ujXSJCnnNmo3W1/PcCQAtPzoCS3Fwc5KuTBRoMGWGEds0gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-86b9b1def28so779512241.3;
        Thu, 10 Apr 2025 07:41:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744296072; x=1744900872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qFiu9zt8X9KIFbJmQ2flKV3tGXtpJjP4Y1fqbPOxvLg=;
        b=ldHOkDOZWynG0DeC/tvm1+P8qe4T1PWrOWC7brtemy59jm82bOZatsXYNfGI6OrYo2
         30hma0i2WpMCx9iNSO+dCWMRzKPUstVaBIQr7G0WnS1LDo0hyMXul2AD13LU/En+TBV+
         vlDNaEozuodIctUMO+XseW1BqxS2x6BKAmXZ14poTSliYBwLg2Lz/00BRLztAm8DXfqZ
         ZzlA9p9QTCzPzX3hoAGUgVY4I843iNWZnZ9QuvuwOQg4abapL0BqjbZ5Mmg3rFy5Nqy2
         QH0Irgq1I/hpKuhE44hKybYUhM8PW0AI/CBxKZlhacmC2xUAWqZkcDDNV6JVnL7ZlkQK
         wG1g==
X-Forwarded-Encrypted: i=1; AJvYcCVUh1mKo13/XdMZag/lOlUtCM6TVfC+hFz8AA5gt2b7XxN36VLn6DYbauioMiz3mIv6DaxPPCbhrCnfwA==@vger.kernel.org, AJvYcCXCB/L15/1SRMXbX5OIlotkQGaj7VBZB9KMttaxgjZIYzwjc3r/Skf+HYUOuBrNODx4w3f/azQyacWJvPRg@vger.kernel.org
X-Gm-Message-State: AOJu0YynI8Pa8j66yFnX1pUw0Uege1LiHEa17T+0vfdFErojy+/msNnc
	qGfubVlo3z8BMyRi1AgbrUriXBw/DveVpRhpuqRZu8BtoNwBhXZhJdREDlO67uY=
X-Gm-Gg: ASbGncsj7JXQPh5CwAJetKbq3Wp3M+nep9iqrjAvrUuRmXV078iw+WJulCPXvFZd9Qt
	5ZmjHxRoSJvOzgMfSQcewsnRtFBoxP9rcu33eJUwc2ETof3fmnCW6We4L3B5Te2y8XynADWjYru
	3XYmEDwsyeHQTNqzRx7hpacypqQI584i3rKBTdw714+H+bpNIPRAygBq1sEtr1+7LaRzJIcQHdG
	zTbXaQWaXxgmYbmgdAJC10Dr3BiJyzm92RQKjKUhbHwV+vPa6+/NSlvja+KXpTdR17SZEY25fEb
	BI80bjmj9FYehPO055B7GoYEHhxn5MBgAuJqDr4wh9qDkuPwMAkfDCy59WhPOumHJUbj+dxp5E/
	yWo4=
X-Google-Smtp-Source: AGHT+IEZuVUC4wluVyYeodVc6nUemC/rvYgm/RU3ugH0bi5jiVeLJTL98XoJDKg6hnoEsa3VpSYSMA==
X-Received: by 2002:a05:6102:1496:b0:4c1:9b88:5c30 with SMTP id ada2fe7eead31-4c9d35ce04emr2900914137.19.1744296072340;
        Thu, 10 Apr 2025 07:41:12 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87557136a61sm669130241.8.2025.04.10.07.41.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 07:41:11 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-86b9b1def28so779475241.3;
        Thu, 10 Apr 2025 07:41:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVOYGnolFi2xl2xiqPofQjdkr310xyU/2uXaPnpT9iMG2bJid6CoK7K4gNRVgZoAUL7jodahU693CJdfw==@vger.kernel.org, AJvYcCVfrsUZz0+zvGK8CYf1txQed5wkhb5jygsMTrMfJyOOn+yAbNrRFw2tWTho5WTB3AOQc/hurNZKiwuB9Wi2@vger.kernel.org
X-Received: by 2002:a05:6102:3f48:b0:4c1:b2c2:61a with SMTP id
 ada2fe7eead31-4c9d362a2f9mr2675278137.25.1744296071578; Thu, 10 Apr 2025
 07:41:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1744273511.git.geert+renesas@glider.be> <8fb6c5995f0e72482bad6367d89d9ee5312dd409.1744273511.git.geert+renesas@glider.be>
 <PN3PR01MB9597160EE7E131BCC171FA39B8B72@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <PN3PR01MB9597160EE7E131BCC171FA39B8B72@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Apr 2025 16:40:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVYVpgS9fSMbB=S0cF=1QLyVQ993q9-JizBS2N6azSicA@mail.gmail.com>
X-Gm-Features: ATxdqUHJXc0uihZtU6vWRVhvAIyc63b2XuhYkoattHbmPcm5Q-Zm9WRSRerjQbc
Message-ID: <CAMuHMdVYVpgS9fSMbB=S0cF=1QLyVQ993q9-JizBS2N6azSicA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] HID: HID_APPLETB_KBD should depend on X86
To: Aditya Garg <gargaditya08@live.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Kerem Karabay <kekrby@gmail.com>, 
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Aditya,

On Thu, 10 Apr 2025 at 10:52, Aditya Garg <gargaditya08@live.com> wrote:
> > On 10 Apr 2025, at 2:01=E2=80=AFPM, Geert Uytterhoeven <geert+renesas@g=
lider.be> wrote:
> > =EF=BB=BFThe Apple Touch Bar is only present on x86 MacBook Pros.  Henc=
e add a
> > dependency on X86, to prevent asking the user about this driver when
> > configuring a kernel for a different architecture.
>
> There are a lot of spaces before Hence.

That is intentional: double space between sentences.

> Also, Apple Touch Bar is present on some Arm MacBooks as well, so probabl=
y mention that this driver is only for touchbars on x86 Macs and there is a=
 separate driver for the Arm Macs.

Why is there a separate driver for Arm Macs?
Which driver is that?

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

