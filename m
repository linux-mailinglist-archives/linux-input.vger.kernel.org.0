Return-Path: <linux-input+bounces-616-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F044C80A42F
	for <lists+linux-input@lfdr.de>; Fri,  8 Dec 2023 14:11:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7FD42B20CA1
	for <lists+linux-input@lfdr.de>; Fri,  8 Dec 2023 13:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 450331C698;
	Fri,  8 Dec 2023 13:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qv4Hx1ns"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C765171F;
	Fri,  8 Dec 2023 05:11:25 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-50be4f03b06so1988890e87.0;
        Fri, 08 Dec 2023 05:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702041083; x=1702645883; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1Mc8pd+JGsMBBmrhXXZ+fBzvZKyRg4PUPNqkV09w+/0=;
        b=Qv4Hx1ns26EybK67ZRfPa9N8qPRRpgT2QA4OrXB5K3ehYXazXRTHZGa6bUP8rBMSxA
         5FJ4D6ctbJdxuc2GPy3xpde3l7OtuSfxy7md9SP9ZLjYV55udL1l9/zAl8eUjoOqEGGF
         2XuxW4aP4vDa+ttCgLk6f9n3Ht3qJFaA+VgVz9+nUoLE9Gyds2c40n31nR+AdQ3AwoCw
         aQfJawTC5c7pTwLmOly++2BlCk4WvCKxJh9mZN1voxgYSPhaZiwju2D/w3H3dDqlgjwF
         ljJdk9mp7WNfjODINETQeuJM1AfH/TAIGNQWxaX/au8NtVTK8aX/3KE2w2dXYSYgEQcL
         eF9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702041083; x=1702645883;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Mc8pd+JGsMBBmrhXXZ+fBzvZKyRg4PUPNqkV09w+/0=;
        b=AnCbMJr6UqVgsGaw0jV36RUAjfwHOHNFTiNh3Zj7WSmT/6hzty75faHFQLb3jTIEYh
         J/+u3VXWxEoFW/CB/p8Gghiw2rb28oISLWIHnnLyiUuL0C/qXQbMds+3Wsqd/3oDFllr
         Ok+uPYkcDHBDjNXHVT7PWR4HSKdhAv5mJFfv/A+ZwT2s9L4iquk/Mv+mBhiuUwpvr5IG
         ZBwuRqe49b16Hvddl3rtoFSUgTe3fPThk/8aYiJWxrtsua/+GRa+cxkuyauPah+sYT4K
         dS054tnKQXIJAGw+C1y8t4uVrsTRr85+2FsOVlLMPUqax4GBezvXG3aOSWg0NsqKnspR
         XxaQ==
X-Gm-Message-State: AOJu0YwBOUB8/6ULs5sS3xJoLiG7vrscKO5JGviRHJvVkgFxC4krxn08
	rsn0Xo1kDjiMtPsEWsBq6GM=
X-Google-Smtp-Source: AGHT+IGPrHBBxJh0j/3OfMzxwodQkGdjtbgxBw4JHCjuMYIfydB4r+AWvF0NB+wuzWOB8VGMGi3Ekw==
X-Received: by 2002:ac2:4c0b:0:b0:50c:11:4745 with SMTP id t11-20020ac24c0b000000b0050c00114745mr1725166lfq.137.1702041083136;
        Fri, 08 Dec 2023 05:11:23 -0800 (PST)
Received: from eichest-laptop ([2a02:168:af72:0:905b:7c28:f9e2:a6aa])
        by smtp.gmail.com with ESMTPSA id a4-20020a509e84000000b0054ccc3b2109sm817801edf.57.2023.12.08.05.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 05:11:20 -0800 (PST)
Date: Fri, 8 Dec 2023 14:11:18 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: nick@shmanahar.org, dmitry.torokhov@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: input: atmel,maxtouch: add
 poweroff-in-suspend property
Message-ID: <ZXMV9gzFbc05IEKg@eichest-laptop>
References: <20231207111300.80581-1-eichest@gmail.com>
 <20231207111300.80581-2-eichest@gmail.com>
 <CACRpkdbSs-vebvchxx-Tg+O5CUF5M3vZf-iytuW=ZECnHb2anA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdbSs-vebvchxx-Tg+O5CUF5M3vZf-iytuW=ZECnHb2anA@mail.gmail.com>

Hi Krzysztof and Linux,

On Fri, Dec 08, 2023 at 01:54:21PM +0100, Linus Walleij wrote:
> On Thu, Dec 7, 2023 at 12:13 PM Stefan Eichenberger <eichest@gmail.com> wrote:
> 
> > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> >
> > Add a new property to indicate that the device should be powered off in
> > suspend mode.
> >
> > Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> (...)
> > +  atmel,poweroff-in-suspend:
> > +    description: |
> > +      When this property is set, all supplies are turned off when the system is
> > +      going to suspend.
> > +    type: boolean
>    wakeup-source:
>      type: boolean
> 
> As Krzysztof says it seems you are describing an operating system feature.
> 
> I can't help but wonder: shouldn't that pretty much be the default behaviour
> if wakeup-source is *not* specified?
> 
> I.e. the property kind of describes !wakeup-source.

The maxtouch controller has a deep sleep mode which is currently used
without powering down vdd and vdda. However, because we have a shared
regulator which powers other peripherals that we want to shut down in
suspend we need a way to power down vdd and vdda. However, I agree this
is not really a feature of the device. The feature would basically be
the internal deep sleep mode. I didn't want to change the default
behaviour of the driver, so I added this property but maybe I could
change it to:

atmel,deep-sleep:
  description: |
     Use the maxtouch deep-sleep mode instead of powering down vdd and
     vdda.

Or to not change the default behaviour:
atmel,no-deep-sleep:
  description: |
     Do not use the maxtouch deep-sleep mode but power down vdd and vdda
     in suspend.

As I understand the datasheet even if the maxtouch is using its deep
sleep mode it does not act as a wakeup source. It is just faster in
waking up because it can keep the configuration in memory.

Regards,
Stefan

