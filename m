Return-Path: <linux-input+bounces-3206-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 199F08AF80E
	for <lists+linux-input@lfdr.de>; Tue, 23 Apr 2024 22:36:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 469961C2240C
	for <lists+linux-input@lfdr.de>; Tue, 23 Apr 2024 20:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D77C413E02C;
	Tue, 23 Apr 2024 20:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lwd23R60"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2DF1DFD0
	for <linux-input@vger.kernel.org>; Tue, 23 Apr 2024 20:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713904598; cv=none; b=EhwCSsqEQLxRmDzpr869hXK1t3abixfBokCMJwe77MqWLt0HCU3KJUrGcFwPFf0iCuqHcluUAU0HIOk5LZ8TmqGvXoGy34xN9AXF2uD2wYw7QAQdWa78iIOCemhIkhkBaUYR/TKVQZP4d9Rj9dbY+wjA2lUDBusCbOEQvj2AXkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713904598; c=relaxed/simple;
	bh=hdVBYhMGvt4bNKMToAfaZbct/f7HDFw/iwj5G53CShY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X8Eu+f1j1L8qFtwEZb9I08eA5xWFMOF5xncWeN2pAxPVVtnMZa3cGIOnjVMjHXfMV4oVzm/VrY6dxC18m6Gn2Vc5rHytu1GYqVP+2Yi+wkBJlnMV3RwT/cUpAAVXrrO32QcVH4IV8DrmpVBvSBd9M9l8QXhPFxBUVn5nDvL2Gyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lwd23R60; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-436ffd27871so38242101cf.2
        for <linux-input@vger.kernel.org>; Tue, 23 Apr 2024 13:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713904595; x=1714509395; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hdVBYhMGvt4bNKMToAfaZbct/f7HDFw/iwj5G53CShY=;
        b=lwd23R60KfycWzKShhdr48TRAxJWtMM4UlQAnOFDDjMmb/ThFPTlW0dGl3pl6DQLIV
         ICEEeP1B2xZvdYu8QimmgWZid6INfc12C8nYN4zIfvqAlJtFJvefrxZ8NJE4W4QPphJ1
         KMIXlsvk+E6+tqgmiNuA9gnVFzfQsDkvrJoo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713904595; x=1714509395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hdVBYhMGvt4bNKMToAfaZbct/f7HDFw/iwj5G53CShY=;
        b=jzq+1lK5ZE3hU43GfQ5O4XzisnY/KEQeAdmRBMxUgWh68pWTiolHvue2fYOCOlsNCW
         Nt0r4NZVKJYyGJE4ij/rkxFqyVWbYqIGw2PG32oLtJEKkh2bKF7RFyhZsWNYdjs3ivPW
         x9y0qIHPMoFPhWhIpJyM7ntbNSDeQcdH9AdmB9mlp2hVvnonrFb862w9IZp7SlLYJzvj
         JJWnBWKbff4alWTgU4b3KfylTBjTBLYwcaLzUI31X9wSgkwo2k+p08rw2stT+/99LbOz
         Rb6V7VJ1WqKbQjpYScYGF5BGh7wuSqBXCec1Z2m3jelKvCxW6hiYgFs+S62qve+trW7J
         mqqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXafID6qO82xNfuJfRqbcC7BxKVDcFT8t5HKslhFQigCBiFY5ecslu26A8bSFKuFN+Hknd2ijsRKvUTJGuZQRzguji1ZbRGUjoFSfs=
X-Gm-Message-State: AOJu0YzzfWDCoBkcvSMqOPGecLZ0C7E/T8u0dINZUxDzjwwSCL0EwKsX
	iTq3fex+1Io9TQB1BUC1Tid1wc6iz+SccHHMWbpySlVkVw/Tv9C3ORERbJ4BF1YMltzYeRJSIu6
	Hk5hF
X-Google-Smtp-Source: AGHT+IFOw9/XZNMF882/x/cERlLeA3LZj48i0weeApui30rIj05xWJqza6mkWMyG3H7IwARzWIaXkw==
X-Received: by 2002:a05:622a:1a92:b0:437:885e:a012 with SMTP id s18-20020a05622a1a9200b00437885ea012mr724372qtc.10.1713904595268;
        Tue, 23 Apr 2024 13:36:35 -0700 (PDT)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com. [209.85.160.180])
        by smtp.gmail.com with ESMTPSA id ku10-20020a05622a0a8a00b00436dee942easm3910090qtb.91.2024.04.23.13.36.34
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 13:36:34 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-43989e6ca42so95691cf.0
        for <linux-input@vger.kernel.org>; Tue, 23 Apr 2024 13:36:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVlLfOADyfytpgv08HERTWS4sGuK+1IHB4Td51OCJTolf7XU1ugLzM/sRNebas+8IXlY2YdMcUrCYuPrklwh7L0WH8ZfeAJfiR3FhM=
X-Received: by 2002:a05:622a:1cc5:b0:437:b572:6a with SMTP id
 bc5-20020a05622a1cc500b00437b572006amr6192qtb.23.1713904593750; Tue, 23 Apr
 2024 13:36:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423134611.31979-1-johan+linaro@kernel.org>
In-Reply-To: <20240423134611.31979-1-johan+linaro@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 23 Apr 2024 13:36:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W2Y=Sr-=YkKb01XLQsbQJr2b981c9kcfvAc4_5E9XD7g@mail.gmail.com>
Message-ID: <CAD=FV=W2Y=Sr-=YkKb01XLQsbQJr2b981c9kcfvAc4_5E9XD7g@mail.gmail.com>
Subject: Re: [PATCH 0/6] HID/arm64: dts: qcom: sc8280xp-x13s: fix touchscreen
 power on
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Apr 23, 2024 at 6:46=E2=80=AFAM Johan Hovold <johan+linaro@kernel.o=
rg> wrote:
>
> The Elan eKTH5015M touch controller on the X13s requires a 300 ms delay
> before sending commands after having deasserted reset during power on.
>
> This series switches the X13s devicetree to use the Elan specific
> binding so that the OS can determine the required power-on sequence and
> make sure that the controller is always detected during boot. [1]
>
> The Elan hid-i2c driver currently asserts reset unconditionally during
> suspend, which does not work on the X13s where the touch controller
> supply is shared with other peripherals that may remain powered. Holding
> the controller in reset can increase power consumption and also leaks
> current through the reset circuitry pull ups.

Can you provide more details about which devices exactly it shares
power with? I'm worried that you may be shooting yourself in the foot
to avoid shooting yourself in the arm.

Specifically, if those other peripherals that may remain powered ever
power themselves off then you'll end up back-driving the touchscreen
through the reset line, won't you? Since reset is active low then not
asserting reset drives the reset line high and, if you power it off,
it can leach power backwards through the reset line. The
"goodix,no-reset-during-suspend" property that I added earlier
specifically worked on systems where the rail was always-on so I could
guarantee that didn't happen.

From looking at your dts patch it looks like your power _is_ on an
always-on rail so you should be OK, but it should be documented that
this only works for always-on rails.

...also, from your patch description it sounds as if (maybe?) you
intend to eventually let the rail power off if the trackpad isn't a
wakeup source. If you eventually plan to do that then you definitely
need something more complex here...


> Note that the latter also affects X13s variants where the touchscreen is
> not populated as the driver also exits probe() with reset asserted.

I assume driving against an external pull is _probably_ not a huge
deal (should be a pretty small amount of power), but I agree it would
be nice to fix.

I'm a bit leery of actively driving the reset pin high (deasserting
the reset) just to match the pull. It feels like in your case it would
be better to make it an input w/ no pulls. It almost feels like
something in the pinctrl system should handle this. Something where
the pin is default "input no pull" at the board level and when the
driver exits it should go back to the pinctrl default...


I guess one last thought is: what do we do if/when someone needs the
same solution but they want multiple sources of touchscreens, assuming
we ever get the second-sourcing problem solved well. In that case the
different touchscreen drivers might have a different idea of how the
GPIO should be left when the driver exits...

-Doug

