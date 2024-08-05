Return-Path: <linux-input+bounces-5334-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CE8947708
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 10:16:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A82CCB22CF8
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 08:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8C1114D290;
	Mon,  5 Aug 2024 08:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zF1//vbV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC59143738
	for <linux-input@vger.kernel.org>; Mon,  5 Aug 2024 08:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722845798; cv=none; b=SkV+pDZZxdApjQi7ji3fquGj2V6RNoHqKbs+tgLCvE/2ECeplfly4CvMphAcFHzM+z6p1PrecGZQuyQRCmxl1+qvpE2VJHzQ1TfBMjOek3hebcCYE56cybTttz9MeuzT+SmuknznHgZv3V/88nk9MVqi/UGKXHA7aoAEwma9Rbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722845798; c=relaxed/simple;
	bh=5unLlgc6A6zclb59BucjBaezsg4VcXs/IowJ1jRLzcA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mqwFyKM+1tfrmYsnmicHGqhRsqFBzEhhUxBl9vKfgZXYxxO65WV6k3BA5YwEhLIKLqG3eUYBNVC7FSWjtVYBQ7frf/tBwDWSxr0BEvTMeTNaaPExVF5EGVWGEIJSIsepT2YNrjxaw0VpX3zqLDghD/3yXybv6Kdd1tQFLXURv5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zF1//vbV; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52efd08e6d9so14889727e87.1
        for <linux-input@vger.kernel.org>; Mon, 05 Aug 2024 01:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722845794; x=1723450594; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5unLlgc6A6zclb59BucjBaezsg4VcXs/IowJ1jRLzcA=;
        b=zF1//vbVzdClJz35M2lTfM1iGNvwUq7MAMV5x84wurR/Aw29fSXAIl+GtjS8cHui9O
         xisw+QcXNOidbYEm6eYRGdcaRSKAXWiCZRQYOBmzeBsRIs5olxWPBD7zRlp7GnIlM3sl
         zJQaFPVZ3/2L4h0p2ySGgJr8tnQqhyq3XblDpWsSncK3/C2yuA8Im5C3p16+HAkd1OVN
         lVvOZeu8jbs5rdLyEEAHxg4FOdzIdvtJkJO3XQmhIPVOtqAz5fPfefmvKwkzliWfWolK
         EtF8J0qAGBBfEDwLPxqUNdTDRpyVdZNjKGrMxpjiX8b+IOOL782Ui+N6IlRGJRZSmIak
         9+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722845794; x=1723450594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5unLlgc6A6zclb59BucjBaezsg4VcXs/IowJ1jRLzcA=;
        b=LNCvbYqVZYByVwJkZmdhkJCn4v10Qe+dXifAg/TmOZSBoT2YtqImi85KgZfGtBRBpC
         3ot4HJXHJdgIE+57RSNzwEWiVGMs7e2tKKxQcCkQiszSltNRQHr2AYPQ9udfM760y+Ce
         IfWYPeZpJc5cMUzgEjwxTgyNPTlioTWeoyadOx8bdeFEDI+1Ui0g+vDSHtBCJlUwbTc3
         mvsdwDIenz1JH+X9ORul3hnNrEfncJVZZYk4d5zI3c4kD0T3wQpFZziMCnnnlredg/2Z
         aP3x14i/kDEjwIp2kMuRBuMNvVvQ1G0B7ICC+sNy39sVE0/6vitbNMqaig2bUPdXxdJi
         82pg==
X-Gm-Message-State: AOJu0Yz/xmTalDTZiGAXLnbj2fQWzfcEGyK+yAMVkqPQW4+6n0GDyVJg
	J+oU+t4mzLvpUiaHEEHyuBhHApgpPPRyvj2WPONuaeMiKbir1q+3eXoMW0vrTyFxoumb+Y6yloF
	LzvuRDCXebdILdFAeOJJR4510bP/N3LzGDFvghw==
X-Google-Smtp-Source: AGHT+IH3RK3cbhFuy8fuCp+3vtZx2KcsiayetJDkYeKN58B24FoHtQcGq9smDLZXRdkzF4xXi3Z4oUykfCeFy0UYzUc=
X-Received: by 2002:a05:6512:2310:b0:52c:8df9:2e6f with SMTP id
 2adb3069b0e04-530bb3d4333mr8370398e87.42.1722845793449; Mon, 05 Aug 2024
 01:16:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZrAgj9rG6oVqfdoK@google.com>
In-Reply-To: <ZrAgj9rG6oVqfdoK@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Aug 2024 10:16:22 +0200
Message-ID: <CACRpkdYV3AZLLShnnstKK8SrenDoWzhnC9XO13OUWKgWgG7CKQ@mail.gmail.com>
Subject: Re: [PATCH] Input: cyttsp - use devm_regulator_bulk_get_enable()
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 2:45=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> The driver does not try to power down the rails at system suspend or
> when touchscreen is not in use, but rather enables regulators at probe
> time. Power savings are achieved by requesting the controller to enter
> low power mode.
>
> Switch to devm_regulator_bulk_get_enable() instead of separately
> requesting regulators, enabling them, and installing a custom
> devm-action to disable them on unbind/remove, which simplifies the
> code.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

