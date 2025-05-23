Return-Path: <linux-input+bounces-12535-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1F6AC2474
	for <lists+linux-input@lfdr.de>; Fri, 23 May 2025 15:48:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E4ED1889CE7
	for <lists+linux-input@lfdr.de>; Fri, 23 May 2025 13:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D386629346E;
	Fri, 23 May 2025 13:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=criticallink.com header.i=@criticallink.com header.b="H/stWopO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB137292917
	for <linux-input@vger.kernel.org>; Fri, 23 May 2025 13:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748008024; cv=none; b=LkOOQs6WvaNwMEPsFzEzW84yC9iY0v2DRqFssI4axumQJ4/50NB/jq9KyxuStgZPajIV03S2BztvPlpMpHK67juRBrJe7RQRIqV4PTaSBF8lSM5mlO/YWXzDSj9MX9huYkdUZnt9YgBCJ7j9v6dFUMdfAc+YVYxEcH73sHrAU/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748008024; c=relaxed/simple;
	bh=FSHA508Zx5w9S90Tq/UMLHgC/yMWJlhl8nvRknZHglE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eUA/nD4facJbMtTIglInFLrtodvryyMpZrMfN8TOt0lGzPu/ppxoayrhOEpoDFD+bcWsr5pEcBt5NBsEVL35t1zDE4I74SsFOy/SpuZk6RBDmPZB7AqEQo9BJRcrVPQSyZooNLY365rmi2ZgtLgPLqK/3zPtq8XmJxuqPNz1jgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=criticallink.com; spf=pass smtp.mailfrom=criticallink.com; dkim=pass (2048-bit key) header.d=criticallink.com header.i=@criticallink.com header.b=H/stWopO; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=criticallink.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=criticallink.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54998f865b8so10037637e87.3
        for <linux-input@vger.kernel.org>; Fri, 23 May 2025 06:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1748008021; x=1748612821; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YrwzOFaibSBgKTcouMrps7MGiltC3v5UujrMARI4LdU=;
        b=H/stWopOKv5SwodVqM1EiqfS+Y8453pHr1pfizTDP+Fp6TDrBF+/XS7qCUKa2Fly5s
         +FqhDxMA8RXqW4M1qVhak9BWhdEjIPPpPiIiYtTPk6tqONckmn/85iumanH+10dlWrB5
         52AApetRvtw1ZonLT3/Bz2cZ6MQcgRhMqB6Bic6rieqrohVqjt8ODOAGlRScY4aOejBl
         7R5gg66ozf4+mzHO/tLPHnOij2v+cYom2FpVZNsdO/Dh6/YoN0pDFXlKfsfCfXGsCvMu
         xbcMojycW/kpJDlOoNFsj2Nl7Mp5BEmBVlHaI2MzEO+MThqLXafv7L9aVtaRbyli+JZx
         ldWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748008021; x=1748612821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YrwzOFaibSBgKTcouMrps7MGiltC3v5UujrMARI4LdU=;
        b=Uus3Bi0hDOro/cPOlgwQjepWVtfaQXumQmySX6QiwiFsgEY2vYlDzVMdspiLWzYx1x
         3q6CqPGgYwR8UO8DbuEPJZwos7xMBvSY8jCU5WFbcWxDcbZEBzZal2s2k6/UuUtZ8WDp
         FKM0yxGHBiIaXA+vzVkz32Ys8fGAdQmgrPzcz9XJ9sRsJdqDs5tQmqg35Xt/g7A77NkP
         dRFI1gaYa0OaHRaHYyvW0mL0BK+TFVANreVU9rIeg64Co0Ygd1sqXvyPw39wojz5qjt3
         sklvdFYfFRbRoHJarmk7F5+hmoA6eGpX5NkA7/cgyZfuNVKTj1VcJ1ksrgHPBM/lp7MS
         XqMA==
X-Forwarded-Encrypted: i=1; AJvYcCVL0LFy8jeKkj/7ARDORYYs4f/5rI6jCJTelztqemePCt7qikX5dI0W4fNXpXrFI1bTHeF9ess7rhOCCg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvpf4k/OvyfgBu3V0zRNs3fGEQY9qdlz9/h2wiQWrUeaiLxncR
	cABd3lIbTbVTim5y+QkvUPBFW7vDvOin2CtCUP2PaQ2Q0/J1hMG0v15gbw3dbjbMjPUo0cWvV1+
	mHzYx7sv0f3nvTzPOH5aKkrvsjS7r17JMrmawpRtC
X-Gm-Gg: ASbGnctgU+RZtluV1HxkloYpN9ZefhiUDjaDnauoC6rh09fxoQW4kfNwUV3Pjg9MJIz
	9k6JndfA1IWvCrpKPXo/SbDTsNIKF4xRnzsy8rrq8s1t9gB9JdS26i3jRnM3ZqLQHF5vEfhu/BE
	CAKtb54hvK4FOvCAWJx0OUe4X8ox6yBsrnOQFKjcykmQ==
X-Google-Smtp-Source: AGHT+IHHm5TV9B7gRZ73qTKxIDPzBYU2sS4bwb2E7QFuk/XcQGzY8R2IXWtOb2EGzREWXaTS8diqJSkCr1nZgIDzuw0=
X-Received: by 2002:a05:6512:b28:b0:54b:117b:dc9f with SMTP id
 2adb3069b0e04-550e726d3d7mr10504874e87.57.1748008020530; Fri, 23 May 2025
 06:47:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520-linux-stable-tps6594-pwrbutton-v1-0-0cc5c6e0415c@criticallink.com>
 <20250520-linux-stable-tps6594-pwrbutton-v1-1-0cc5c6e0415c@criticallink.com> <20250521-wandering-tested-porpoise-acbef7@kuoka>
In-Reply-To: <20250521-wandering-tested-porpoise-acbef7@kuoka>
From: Job Sava <jsava@criticallink.com>
Date: Fri, 23 May 2025 09:46:49 -0400
X-Gm-Features: AX0GCFssHvJPaC3DL1SsRw4B3Jo2LlFlcoIxMZjMh-TU0awo5CV7joxbaoy4nEk
Message-ID: <CAKMwjwTP=xSsX3UuK02sKbXWaU7y-ErytNYCL_P0UveDytQW2A@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: mfd: Add power-button option for TI
 TPS6594 PMIC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Julien Panis <jpanis@baylibre.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, jcormier@criticallink.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 6:01=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, May 20, 2025 at 01:43:36PM GMT, Job Sava wrote:
> > The TPS6594 power-button option permits users to enter STANDBY or
> > ACTIVE state by a push, release, or short push button request.
> >
> > Signed-off-by: Job Sava <jsava@criticallink.com>
> > ---
> >  Documentation/devicetree/bindings/mfd/ti,tps6594.yaml | 15 +++++++++++=
++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml b/Do=
cumentation/devicetree/bindings/mfd/ti,tps6594.yaml
> > index 6341b6070366..a40808fd2747 100644
> > --- a/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
> > @@ -37,6 +37,21 @@ properties:
> >        device on the SPMI bus, and the secondary PMICs are the target d=
evices
> >        on the SPMI bus.
> >
> > +  ti,power-button:
> > +    type: boolean
> > +    description: |
> > +      Optional property that sets the EN/PB/VSENSE pin to be a
> > +      power-button.
> > +      TPS6594 has a multipurpose pin called EN/PB/VSENSE that can be e=
ither
> > +      1. EN in which case it functions as an enable pin.
> > +      2. VSENSE which compares the voltages and triggers an automatic
> > +      on/off request.
> > +      3. PB in which case it can be configured to trigger an interrupt
> > +      to the SoC.
> > +      ti,power-button reflects the last one of those options
> > +      where the board has a button wired to the pin and triggers
> > +      an interrupt on pressing it.
>
> Don't you need to handle two other cases as well? I assume you copied
> this from the other binding, but all three options are valid?
>
> Best regards,
> Krzysztof
>
Hello Krzysztof,

Thank you for your response!

I agree that the other two cases are valid options. However, for this
particular patch series, they may be out of scope. The primary goal of
this patch is to enable push-button functionality, rather than
addressing the VSENSE or EN modes.

Thanks again for the feedback.

Best regards,
Job

