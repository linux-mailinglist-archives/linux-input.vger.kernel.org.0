Return-Path: <linux-input+bounces-3861-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5837C8D00F4
	for <lists+linux-input@lfdr.de>; Mon, 27 May 2024 15:05:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 140B8282053
	for <lists+linux-input@lfdr.de>; Mon, 27 May 2024 13:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94D8E161909;
	Mon, 27 May 2024 13:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LcqLreLS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0508C15F404
	for <linux-input@vger.kernel.org>; Mon, 27 May 2024 13:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716814926; cv=none; b=BOhS9rL9Jl4frdqNAPskl7vXw90zejQoHtM0lNbmSRjMpQ0hpKNasZfBxd4MbLsK7ULH1/g6AvsJXjf8XUzY+hKT0+S2079R9XAQ1xAUWYw7Tzp3Qr9IFVZT/QddeAV938BzVVu6nhcZHuV4oPfcMeBYDdNrB1OBEAzIjVc85dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716814926; c=relaxed/simple;
	bh=wgk7WXRbuBVOxXeNcCecE0I5Ssrmoyonz0n5453vRtw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c5QsEekZH6aeaTvqAa2ggDDreNdw3CGyBLJzDK5QdTZ4I5++PhnSADIgNyZpLPMeJt/IMlbcu3fECnFZOo597w8rSn5Wb0uK1dR+uw+5N3sdqKF8t9HXdILMbH0WeEE+8wDjmbrTuIrdFc92CVkSeJNvad1iKudtn3j5xfW1EWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LcqLreLS; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-df7721eee79so2134398276.0
        for <linux-input@vger.kernel.org>; Mon, 27 May 2024 06:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716814924; x=1717419724; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wgk7WXRbuBVOxXeNcCecE0I5Ssrmoyonz0n5453vRtw=;
        b=LcqLreLSmAOol1+iWp/9g0SzC/1PUcBnGPP3KY5R6MZnZsCy6DA4f9yTcjS7x3A/NI
         GtSBvZ+XvQZJeWqoz4IP+LWsClzO2UjuB496CdfIe+ezaDVmy2mr1T533k27TIudY3o4
         LQwiZs9Ib+Iku1u5f6p748brGTcjmsEEOt8pbJan41KfKE7djDER8ZP74cL9cSm1aUtn
         QSF1G6q4uQWRHPLpEJ/VZ1N/Pd9Oroi80VFaO2RI5FM5gQoLr8LfvqtuQt64uCrkvqe6
         GZKz5zbMTSpXWZO0bayrz8NDVDvYbKXfT3OotW6XiK2WkxzH5owMJHxHHH29PxxTnrXF
         +xzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716814924; x=1717419724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wgk7WXRbuBVOxXeNcCecE0I5Ssrmoyonz0n5453vRtw=;
        b=axZgvFdrsWYdSZlKFybiFyCOWLgrJSf26l92zkgIwd8Ny1hv3iWg/UpqcWS0qXsHCW
         XndoyhfgPLodawsUp7NoyW2uP3RzhpIpMJqkVM4c8rgOUNp+ITmuIFsuZOvLyzxfqM7F
         yt42URf1llDtF18XVyHjZbF2TMcx8XFjUwW8PHDCCdWeEwU5PQgDvkzVInQXaNAnImd/
         GDkdiYVS7tG4V9wjTzhPvc+ij3nqPO26Mum4oF2mCbpqAgMnD9oSS2hzc/Nj0eXqa912
         3DkbxELkqCs+qXbofft39grXj5kTAK8VyCKrdEkr1Zy8T4nmzWfDIFD4wJRj8w4z72CS
         uo5A==
X-Forwarded-Encrypted: i=1; AJvYcCUtxT++EREGs1S68Z647ZwTIlHTyKA7I9XspJi8ERMcAbP316xZIDdQZuqHBBl9wZa9WVoWqL1hXji6yNys2JODoexW+0HUQWOjiYg=
X-Gm-Message-State: AOJu0Yx4mGA9cp0B/51lOdV49vn/VAMV1ekot8HbR/5xovUtfLUpEY5k
	6j8qcmXV5tv+P4rZp+vF/HvPyewh/pl5JhO4kOaELMhYGfe+4JM/d05L1xgqNlI7uD5tsahZiBz
	8xVZS5TuKEOL/qDtNUeyHn5a+aQPXrE9MKRGFIg==
X-Google-Smtp-Source: AGHT+IE7lfH95P9CZ75FsUEqTbZ6lMKUg3CE06+7S2ZlNbsftLNAwXmGR02nDIY6dJYKm+SYL7/4iLQAHH1jddPM7CM=
X-Received: by 2002:a25:838d:0:b0:df4:dbdb:40b with SMTP id
 3f1490d57ef6-df77094a5fcmr7149710276.5.1716814923932; Mon, 27 May 2024
 06:02:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240507144821.12275-1-johan+linaro@kernel.org> <20240507144821.12275-4-johan+linaro@kernel.org>
In-Reply-To: <20240507144821.12275-4-johan+linaro@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 May 2024 15:01:53 +0200
Message-ID: <CACRpkdZjG4FrKsWARpMO_Gx0Eo21EQyofPx9KUdut2ENxdwROQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] dt-bindings: HID: i2c-hid: elan: add
 'no-reset-on-power-off' property
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	Bjorn Andersson <andersson@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Douglas Anderson <dianders@chromium.org>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 7, 2024 at 4:48=E2=80=AFPM Johan Hovold <johan+linaro@kernel.or=
g> wrote:

> When the power supply is shared with other peripherals the reset line
> can be wired in such a way that it can remain deasserted regardless of
> whether the supply is on or not.
>
> This is important as it can be used to avoid holding the controller in
> reset for extended periods of time when it remains powered, something
> which can lead to increased power consumption. Leaving reset deasserted
> also avoids leaking current through the reset circuitry pull-up
> resistors.
>
> Add a new 'no-reset-on-power-off' devicetree property which can be used
> by the OS to determine when reset needs to be asserted on power down.
>
> Note that this property can also be used when the supply cannot be
> turned off by the OS at all.
>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

