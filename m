Return-Path: <linux-input+bounces-3482-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 319308BC794
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 08:29:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E112B280DB4
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 06:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 209B44DA06;
	Mon,  6 May 2024 06:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="om+cmUzm"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7114CB58
	for <linux-input@vger.kernel.org>; Mon,  6 May 2024 06:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714976994; cv=none; b=fnF/AcFJlMIAP8QtphWZvneb+91BRzUK3jM1F49M/iRYPbYR5dCvrrFGKmvMoNsQG6c+kwlD+jUoL6GxlmagrKW3XeOvVkBNFaYv8fayVHujEClyEmGgSzxXspt3M2zME33QjBrTHhMrCp80X3z0b0hR3WVMhm64GmZDYC2pFmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714976994; c=relaxed/simple;
	bh=w0Dlte53WJRCIvtxzCyGs12oGYGUL4gGyOsmoReVfEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HAG+9OStVQeoHtF8dID2Kdb50GVybTE/f43pp1sJsvHEkOS+Ajkup1q7pMc6wLa/eBtK7Tsek/4qBTRUwjbn9DtH3aoCeb2IPJywcPs/c9ZEXxENZtyXQDLGZUpriNQeOJx7zyGWFQ+zyir3yoOqkV7+udv7375cXo2shvoYXKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=om+cmUzm; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so1398770276.1
        for <linux-input@vger.kernel.org>; Sun, 05 May 2024 23:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714976991; x=1715581791; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dxr7JrisHMydcKRiJtSDqGEYBkrpK+VSNsF4Ji3kjUo=;
        b=om+cmUzmadZSdvLygQNEsVcubqkz2TBf4IRc1SvS3fUxU/dSB4e338ATOZwXrp0sWI
         0gT10ch+aNqPWiJCbnUEYSlp3XrASs5KDqrWC1u7c507LOaDtUHhIXfg2yE8hzDR0dMB
         6trQpLqanbCUg9pW3cDcgC1yT8E0jyWLTXTeHDgmULwrlxUMDJd71DfhxX4l4OpK5Z0m
         PgCQQ+S5vONbUxWYuLWvQBYrulrjqwrsD2GPD20nVH3zH0AhwjS7R/W2DppMSHkpPQzZ
         G1vBvhm7FGeTwSaTmr7eP63IpVtIR2hN7IEj87wgAnUbwOKNU4aeSV+ZDc2jFczFTsa0
         dZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714976991; x=1715581791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dxr7JrisHMydcKRiJtSDqGEYBkrpK+VSNsF4Ji3kjUo=;
        b=FaBZA84YKIzTgXGQnJK2m/W5txSmlROS01jIyygwsuk7M8z341J65K1fVMteF/8Fbs
         Z/2KyICFTERtfd9Gbfi5yGfZ+MKW514Ginhfc3k55ot6Vcu2mMaw3YWT6kIaGTG0TWHb
         mgka1bnnjmDvDYcYdZ6orASfHscwnDhYZOrW7V4kM8m0Rw9GTuThfiJmcbu0Myclu3Dd
         ueEuxkR+t6Wds1XZvwtHf8IVjOSUzx+p5Ja5kLxD5SPBiJhCIFbXuPyqgVTviqWwTvcQ
         j7KxeeAGISKjU9w7b4haz8/B/qE4t439kxm6so5SujlA+QOA4XNOui2/N4KdoQAo295f
         3MRQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4Mr3cSBJHBqLiTM+rQKG5clBjthPmSPa95ZmeuAALprSXNGHFdQP4msEqrSyy4LljpJLgnvl+2eklhkbw1SfTm0elM6HfSIj0AUQ=
X-Gm-Message-State: AOJu0YyeMMv0+aP7VWbuEq0Fs378NNQQ5x94w4IHel2LYHenM7++2y/2
	GG7T5/WM7miwqv8DigAOvi/GZZaOVFEoLbh1zEKCJ4MT0uGBTuS8V3sZb8Q7V/LY77mIISMLYO6
	VpV3EGST3d5u5YJz1z47jNqCDV5yUjYQpX16iew==
X-Google-Smtp-Source: AGHT+IEW+Hz8JBmVo7SC235dDlRuUcsYwIn39CM402hXKIdN+c6eBtHohjS4CULU0pQZO6QvmBfh/4rgh2WLtQ/eV1U=
X-Received: by 2002:a25:2fc2:0:b0:de4:673f:da17 with SMTP id
 v185-20020a252fc2000000b00de4673fda17mr8576741ybv.22.1714976991283; Sun, 05
 May 2024 23:29:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423134611.31979-1-johan+linaro@kernel.org>
 <20240423134611.31979-4-johan+linaro@kernel.org> <CACRpkdYXfZwBdLSTTPbruD9qynOPuQBOZjCwA_6eE+1MUBCkgA@mail.gmail.com>
 <ZjSksM07OlgpE3yO@hovoldconsulting.com>
In-Reply-To: <ZjSksM07OlgpE3yO@hovoldconsulting.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 May 2024 08:29:40 +0200
Message-ID: <CACRpkdYZWixc1E3=Y2j0etuDS7vNY3QcqK2Qiac_KPorr7s0Ug@mail.gmail.com>
Subject: Re: [PATCH 3/6] dt-bindings: HID: i2c-hid: elan: add
 'no-reset-on-power-off' property
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Douglas Anderson <dianders@chromium.org>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 3, 2024 at 10:47=E2=80=AFAM Johan Hovold <johan@kernel.org> wro=
te:

> > If the above holds true, the driver can then just check for the open dr=
ain flag
> > in the reset-gpios phandle, and if that is set, conclude that it should=
 not
> > actively drive the line low in the poweroff state.
>
> That is an alternative I considered but rejected as just knowing that
> the gpio is open-drain is not necessarily sufficient, for example, if
> the reset line is pulled to always-on rail while power to the device can
> be cut.
>
> Perhaps no one would ever construct hardware like that, but it does not
> seem like the hardware property I'm trying to encode necessarily follows
> from having an open-drain reset line.
>
> And then the OS should probably not make assumptions like that either,
> especially since getting it wrong can potentially lead to damaged
> hardware.

OK it's a fair point.

I was worried about over-specification of behaviour, as that always
leads to contradictions.

+  no-reset-on-power-off:
+    type: boolean
+    description:
+      Reset line is wired so that it can be left deasserted when the power
+      supply is off.

To be nitpicky: *should* be left deasserted rather than *can* be left
deasserted, right? If the behaviour is desirable but not strictly
required.

Yours,
Linus Walleij

