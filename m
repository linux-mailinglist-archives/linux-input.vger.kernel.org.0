Return-Path: <linux-input+bounces-9826-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E54A2B190
	for <lists+linux-input@lfdr.de>; Thu,  6 Feb 2025 19:46:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0542B1886108
	for <lists+linux-input@lfdr.de>; Thu,  6 Feb 2025 18:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E11BA19E98B;
	Thu,  6 Feb 2025 18:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HSb8bKjl"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D328919CCEC
	for <linux-input@vger.kernel.org>; Thu,  6 Feb 2025 18:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867603; cv=none; b=ZrqFzzrXjQzuoGk16o4mKaN35En5xm/+TTmRWV6lJ0eqQ1uww3TgY0o+tbM6OsxO5W//hMLXvWhocmEc5KwOlPuxsufFo54I4ETG6aiaYbsMsxr5YbXjJgfQvypbHXlBoaQbNNTju368PKG3hCgJlqutMhm32E0WtpYPHmEVptA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867603; c=relaxed/simple;
	bh=P0zr8OoINeTGs7g0sjgckyXehEfeKe5nFPFZvgr4A7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WAdzxJq4NGZUX/bOAIEkUvMKvaCURYkCylTpQ2JUEje8pIwpuZTFa3NIB3ZTMQaqgHIZ2M9I+bLhNRm5a8APuZHysx54IykVa0oZKoXoyNhUOwKJgkuRpOfa+/Sw+lPKrClMtsfI48h2t9Fkm76Ke2LB3i87+ug6bE/TJh/qh/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HSb8bKjl; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-307b8e4fc25so13131751fa.1
        for <linux-input@vger.kernel.org>; Thu, 06 Feb 2025 10:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738867600; x=1739472400; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0zr8OoINeTGs7g0sjgckyXehEfeKe5nFPFZvgr4A7s=;
        b=HSb8bKjlCso8Q2T33K6TqG78MC1pBc6iML9i+BJ8Q0DgT9npYfT9ppCDFnD8y26dIO
         q/bS5EVPVi0bwLw+Vf13weupn53gFOnG6j8UZB0r6mPsrIUzmM9AMXW9Q1sWhpK/ZvXe
         pUpJUj+ITtePG3fvDFxFRoc60DY/bPX6ssJ/mXBpmZ53Aa4ZMzX6aUSJJVaXWRm20mkV
         EL3ZyJz3zSio1/7DKWPuAWOP4VahXA735Hkg9ngvlmFLp0nr/wwFT8b7P35MVG+5q1Cf
         8lKMd53PhI0MoiAWFLrBlsoQpNgt+NQIFrH9x1RGdk96WrLI6MY5DU9xsUC7hG/UFxFa
         6HPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867600; x=1739472400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P0zr8OoINeTGs7g0sjgckyXehEfeKe5nFPFZvgr4A7s=;
        b=YnrfiSL8u4nrjON5FYpCqDh2bDsuuP+1lEXk8mf1q5T9EETHinnMVsNsXwgVm9yo4C
         ZOtYOi8BhtW0rtAQWP0KSBlAiW1o/NZuQPMfth2vhEjQYlpI+N++MxIuPLaSx0I4x3ZV
         qk2WRinSEgbVTqRwuq/X6SJGDMxZqWAC26L6mzFbKpWPoLMHfFsJgdN+t7f7stFN7kYy
         KfhxtpNm2CGyFnJvBg5LC0XHVTUKBcZoKLxmZoalWgQAnHenBacin31exKv1xgDeCVBL
         m/BDcOMglSFCRXHM6If2xvdocFMl83ul/XhhxWcXgnnyPERHV3kyAl7Nb95poZXwUzFp
         DU9A==
X-Forwarded-Encrypted: i=1; AJvYcCX8jKvgO7YcbV0O4LN7wlwhynKWcfhIhJsee0hV/7Q2NGS5KyzoN3X1IPS1NyVCd1h2NktDCQCN5XbH4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOhtoT2RE++moqjZ12LSfEzKOKbbdf/mJyAv2pXomuQqibvZgT
	L1a1cNv6Qg8Dfa/R6nmj8jCTGT71srhFPjlB/SYXZ4mJBSy4LAFs6PLmtdHuVxH7FlxSWqnLLsf
	H+QNGJGN2avrksle1O7czONtEH+TkL6s0WhC/IjKnKCbOOsiSAuY=
X-Gm-Gg: ASbGncvMOGVpzC7gepTt5RPnI1OIuTR1VEXxyU2xn4cScax5t7kKq1cqBPYSs+msjeU
	qF8YJX1hwUxf+UoVYfQprumj5Z1vA1DwlVV+7z5JZ3Hdj9H1m2XprJm4wY8wcl0g91LEW9pI=
X-Google-Smtp-Source: AGHT+IEpzVZeWcxUUFevUxXUUtkE4eDoK/ekTj85xIIJYmnvT+leN3VUeeipd/F5aigtmYFlfRv7++sKlMafMRpOAt0=
X-Received: by 2002:a05:651c:548:b0:2ff:a928:a23e with SMTP id
 38308e7fff4ca-307e5a7c213mr216161fa.25.1738867598438; Thu, 06 Feb 2025
 10:46:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203080902.1864382-1-raag.jadav@intel.com> <20250203080902.1864382-11-raag.jadav@intel.com>
In-Reply-To: <20250203080902.1864382-11-raag.jadav@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 19:46:27 +0100
X-Gm-Features: AWEUYZmP4B2GJCmX-AuJOGL0VPK6_mEkpxI9o4n-GutRcEqg2kbz1wZ69XnDlBM
Message-ID: <CACRpkdbKzZ2WWEOE=ustPhL9GjmN3tkoAsgThW3ei7Gjstbp4A@mail.gmail.com>
Subject: Re: [PATCH v3 10/20] input: ipaq-micro-keys: use devm_kmemdup_array()
To: Raag Jadav <raag.jadav@intel.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, 
	mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com, 
	dmitry.torokhov@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	sre@kernel.org, jic23@kernel.org, przemyslaw.kitszel@intel.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 9:09=E2=80=AFAM Raag Jadav <raag.jadav@intel.com> wr=
ote:

> Convert to use devm_kmemdup_array() which is more robust.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

