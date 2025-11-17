Return-Path: <linux-input+bounces-16163-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B0DC651EB
	for <lists+linux-input@lfdr.de>; Mon, 17 Nov 2025 17:25:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 693A1366104
	for <lists+linux-input@lfdr.de>; Mon, 17 Nov 2025 16:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F17F22C21E6;
	Mon, 17 Nov 2025 16:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="U/Nd/MNH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332FA1D61BC
	for <linux-input@vger.kernel.org>; Mon, 17 Nov 2025 16:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763396295; cv=none; b=YRb3ZWpaRsZPaGBDmfhjS8M31oJPDumAKhHm2X7ZWsQMSzpx/vLDrzgmyHxTlb7nb2CSH2JKhO3aZvVhHJlBpzUYsMp/MnHKRhq+FhNS7jf9F3O5ALajQIh7VwyZrjueMFWERGy/k0y8C8dnvGADvtatfzTbxriGAkUc7kXGbqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763396295; c=relaxed/simple;
	bh=st1sy12xVdiiww05d5en5kmbdFykF+ESG3J78+EnMss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YIdXgvwDTBLWDaAz3PMIwewUq78Gg2V/ovOnFvsYQ0CbaqSI+01MYgwjyssi+YbT86wmSvr4Oc7bRGp+xcOzw4ZJHkrehSBUXqGPPC+qM8D5VOnJLzwHX4sTS/toTCv3HGyIkiTZc9gi5ia40XTZtElpq79QKdcyQ9gWKQmjQWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=U/Nd/MNH; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b736ffc531fso521189166b.1
        for <linux-input@vger.kernel.org>; Mon, 17 Nov 2025 08:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763396290; x=1764001090; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4zHWMJeoXqa/Kpjr9Kft3G6dbfwE8RyUB0gUkfverw=;
        b=U/Nd/MNHHVQ1LlkgKz1klIBSvByvkn7eMbhEFasR1zb7P9GjWW+NW1Aat/5nyA/8Vf
         yfJJpD9jYBjjvrNXGCqn5WKclYCQWdSGV25CaoCeEIWoLGXlwEhrAkHQP1o5H3vcimkk
         x59JGb3pe39n22AiUTkiyf3nnkrQnZRjo4pDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763396290; x=1764001090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W4zHWMJeoXqa/Kpjr9Kft3G6dbfwE8RyUB0gUkfverw=;
        b=fhIghebVSN7UJReGbQ8uJaZ5eWz8vOgHyMaR/jer/mcm1evaamSU9au0tfsKToYc4Q
         3lcXEynecRPWuTBIfQTmmXHa4UDqQ9H22M6BYeW8bX007YCzV1rx6XAMA55Gxfo7aj9h
         UtGx+FqvTrVFZGdGpkx6cGVHwMcgy4iYuscTDry+co5OKiNOvRAkld6TS1dqaPwoeAFI
         tmecPK5Hrm+4IV82invQEL/NUV7lxNqK6EVzXKh1MfQgaeM73cReTmqkKAicIvUL7J/z
         qdS5qu4EKo/wRWMK+m69vZ+SudL3UyJxPtDohYy7bURT49u0JGZ7lQWLGp/uiqepVjHf
         snCg==
X-Forwarded-Encrypted: i=1; AJvYcCUvwiFFd05b4/aj654OPSkxM+3iROIyA2wE6FqG0LrDaFb7Nir80SOQRDVBjfs65oUS450s+hSXsYTosg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTz5we4wJS7ZYlG55BNmAIcjOGVtTD0OWeZ1RVlUOYMMOzKq3f
	CjCZar3PD6Gs5pQRUTvMiDCF97l4MFIUvnwLlv35zykKc/rhSc5p3sb1eLrAGUqs1ErcglKtHJw
	DvNWvOg==
X-Gm-Gg: ASbGncub36TvrWN0LMA3cR/WgryCOMyIGkTf2IPm3hybe6pQv7sg4blkvWjz7SkfobQ
	fXWeo7gMAlgR5vK3St36rY6gbTWD0vONkq3LGPee4fkk+Bg2S6JyvXjsABP9sKj9J9wEij6SMm9
	b2x/4u1/1QlptxeTDriv0Sy7McqH61GTuHakFQWsWPi18ix4mVLMaokVPnO28zVTlSn0mNXfiFB
	LZBuFc/nXRXcpCgWI70jfDw+vJi8+mrkzdeQGN7XuCTu2wHCwEPVcy6xkTsbt2OwBfMk94j+COb
	fP2TO3FURgDTBYNec2p9Cj1vlqu9wPCu1hHTvEFOe63aXu2HuWTGIAemR0IAVsFUuiFLXvu8Tes
	B+GiizeKh+DLAAoRb2/Ydax17Cy5iKwoaQJvcngxcMDFreIpGRaqfn1Ebeues91Oa0fLmDdbTIL
	/R0rwbb/nZ3zJtJGEnyGR+ytQu6biov0fMVvji1hnowlinGxbySA==
X-Google-Smtp-Source: AGHT+IHuxxQM1JhIxT15OBRgjf7pl6BoF7vkMCVQuD8ca9eAYwERRjOh4kO2zvPxkQaRqWkj31UmVw==
X-Received: by 2002:a17:906:ee89:b0:b43:b7ec:b8a1 with SMTP id a640c23a62f3a-b736780de83mr1374068366b.24.1763396290286;
        Mon, 17 Nov 2025 08:18:10 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fb12d55sm1104405966b.33.2025.11.17.08.18.07
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 08:18:07 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso30538345e9.2
        for <linux-input@vger.kernel.org>; Mon, 17 Nov 2025 08:18:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVj6hdGjzAybhjXNbcIKcbczPXJzs0Hevrf8AYKbSxiVdOblX2gW5rV3T19kldOA2pYpTHQebK5aWDoAg==@vger.kernel.org
X-Received: by 2002:a05:600c:c4a3:b0:46e:32dd:1b1a with SMTP id
 5b1f17b1804b1-4778fe603ccmr118515015e9.7.1763396286684; Mon, 17 Nov 2025
 08:18:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117094041.300083-1-Daniel_Peng@pegatron.corp-partner.google.com>
 <20251117094041.300083-2-Daniel_Peng@pegatron.corp-partner.google.com>
In-Reply-To: <20251117094041.300083-2-Daniel_Peng@pegatron.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 17 Nov 2025 08:17:55 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W4KUC-KAHhKeRQ18k=sqVGWRTajvrJpfqsNc5u8ev5GQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnm8LPJB5tljs6dC66JnWVeI8YA8FJ-Lmeo-JQe9C-b8vydL1l7HXDcJNc
Message-ID: <CAD=FV=W4KUC-KAHhKeRQ18k=sqVGWRTajvrJpfqsNc5u8ev5GQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] HID: i2c-hid: Add FocalTech FT8112
To: daniel_peng@pegatron.corp-partner.google.com
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Pin-yen Lin <treapking@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 17, 2025 at 1:40=E2=80=AFAM
<daniel_peng@pegatron.corp-partner.google.com> wrote:
>
> From: Daniel Peng <Daniel_Peng@pegatron.corp-partner.google.com>
>
> Information for touchscreen model HKO/RB116AS01-2 as below:
> - HID :FTSC1000
> - slave address:0X38
> - Interface:HID over I2C
> - Touch control lC:FT8112
> - I2C ID: PNP0C50
>
> Signed-off-by: Daniel Peng <Daniel_Peng@pegatron.corp-partner.google.com>
> ---
>
> Changes in v6:
> - No changed with the v5 due to relation chain.
>
>  drivers/hid/i2c-hid/i2c-hid-of-elan.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

There are no differences between this patch and previous versions that
I gave my Reviewed-by on. You should be carrying my Reviewed-by: tag
so I don't need to keep replying. In any case:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

-Doug

