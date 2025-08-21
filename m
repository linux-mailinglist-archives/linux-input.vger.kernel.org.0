Return-Path: <linux-input+bounces-14236-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A8EB2FD22
	for <lists+linux-input@lfdr.de>; Thu, 21 Aug 2025 16:45:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95EE95605B0
	for <lists+linux-input@lfdr.de>; Thu, 21 Aug 2025 14:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DC441B21BF;
	Thu, 21 Aug 2025 14:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m05cM8RI"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14691B3930
	for <linux-input@vger.kernel.org>; Thu, 21 Aug 2025 14:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755786607; cv=none; b=NJhuXmcGxauj8V51PyjFLiCZCs0Fq7oubPyGj5xy4S+Y9dsXch8yrXaKo5en3RT6BI1cbPJlbLMcHU8klFw80dzhkQGwQV0/ZwUH6ydfz3CtrT4QB5YdNabU2euuL0mNBru6BuVNv6hbRDYK0CJj7lgYtcvrJvcGZCkkmKoD6+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755786607; c=relaxed/simple;
	bh=DrLvhhxqjDy9OjOvGrvNpOWVRgN/uFtVRiHdl8KLoa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SWT+NQY6HyHEAjPywd6+QzTvolXe1hWgTZObI4Qgc2oO5Bs+xrEJEkGjV5vDJBnfK1SLk8Q8uzfGFpUp/UmSIBzwwAwqosjqNeOC4Ft6o7rmVTwreVI0GiVcOT38IzMGpQIDzjFZ53GDJL+GmjjsXBj8eImOMKTfVj8T7krZt2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=m05cM8RI; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-76e2e6038cfso1321064b3a.0
        for <linux-input@vger.kernel.org>; Thu, 21 Aug 2025 07:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755786603; x=1756391403; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HPG1XhgfF5Y/ggPoRvqsUax+jmouXC7rqUmLB6NWpdA=;
        b=m05cM8RIUFggiQ7tR1Ja03si/Me/w09ItaeKUs9RGK8+TkNPvA83sdl1WYcdww3lsu
         jcikBK77mNdnL/wE5JEPPxAQv4ITgf+3Z/tdBx7Ost/at4qa/szkSuwbBf+/1a/4wsBu
         0PI4ow+BmlHGyhC3v+FPwYwOZPiWbC6kzB2Cw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755786603; x=1756391403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HPG1XhgfF5Y/ggPoRvqsUax+jmouXC7rqUmLB6NWpdA=;
        b=elg1Q90nxMZBUbbnnGzZmV9IVBWDBuy95wkR+8LcCMgO2Ce9M6kGE6Nd6YsCtYabBX
         zR9mCpmUGlnCBIYhqaoEOHeDsvonGVAUuM19ljy9y/FGIh2muJQVHq+UKidkQcT2ty2m
         t/Bfdxm+PsbrtNNzxTKns9os3p3EfseuCMScj4jdu8NQYySsb0XoxPptQDxPgInL4Eir
         3j045copBY491ea0ls19INlYtlmBj2tFArGQuaAEmmDsqqPgQWbaUAJ22YyLtyDLYuy8
         M0/XRCHfwU2d6VpyOaGb++s9MTNVAjGyLFBAS2NHvCrzMeKose3erez3kdhs7eHSCiq7
         cmVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjcbOPSC0mI9T7un7gtm9dfLf/hqmui6MxWMpXOcdKtQX17Q15NDJ/XCKxfvatNJS5WcJkL76DHetEig==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKbJ9mz+pzbyaLxahyCyKKhONAJ8/PyUDU+yuHa47T4Y4f0Crx
	EAplXY0g8BlbPG+HwGLITnHO8BDDotri+ZZH4PRfmKyNg6V9W7BIJVic2TqVRTtpxNei6WSMdba
	nqkNDXQ==
X-Gm-Gg: ASbGncsSmwKhe7uM6CoSX+8obUut69qg+jdRniM3YZ94/ZED60Yz7JCMQK2Dcu5uGEM
	VWwGvJT2HgzjRrdKv/+Atwcp5+stkO96S+vgLp2fYV6MwUdarznAI+K0/UZoBV7cFqt/tZcah/A
	ucPVHwYzhO0jW4yJbVTZWPL8ETIpRFP49TrFmDLczCjcGc+tpJzst80iAVqGnx9zJeRupxlRvb5
	CN1oncUkJhNIXKkX+5rYkfM74eI5p1RTtp0QSKN0PKgUFd7pl7vhp8brhWtDB7qzif7xNxV+IYC
	gFQyVSmO60sOpTn19HZ2+t/MYY38pX/cnuLgNh+oOGmNQZ7NHnAZEnGvKFriBSr1ow4Qj0ZdLRr
	h98Aq1lnEBgMWcPaXP9snuiiPoVzI0WbsgH8Rfuqm4U86S3l8GuYGU4NBgg3WOFWcMQ==
X-Google-Smtp-Source: AGHT+IFAvBMTvoQUiMvfI11boCGjykHqkkK4Des5eBX1q9PDt5BSAdiHYkUPtmRKO799H6gLu96bqw==
X-Received: by 2002:a05:6a00:3a1e:b0:76b:e868:eedd with SMTP id d2e1a72fcca58-76ea320a695mr3718626b3a.24.1755786602889;
        Thu, 21 Aug 2025 07:30:02 -0700 (PDT)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com. [209.85.214.181])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d13d2b8sm8394657b3a.46.2025.08.21.07.30.01
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 07:30:01 -0700 (PDT)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-24458272c00so11555245ad.3
        for <linux-input@vger.kernel.org>; Thu, 21 Aug 2025 07:30:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXVfUhC9n787GSNLEML6X4wjCc4BGrmhMZJJUTSxmBrvt0VbGmu/GmH8wuojuv+oASZhH/HoxN5k5ViCw==@vger.kernel.org
X-Received: by 2002:a17:902:c410:b0:243:7cf:9bcf with SMTP id
 d9443c01a7336-245febd6a76mr44126015ad.2.1755786600878; Thu, 21 Aug 2025
 07:30:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250821031514.49497-1-yelangyan@huaqin.corp-partner.google.com> <20250821031514.49497-3-yelangyan@huaqin.corp-partner.google.com>
In-Reply-To: <20250821031514.49497-3-yelangyan@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 21 Aug 2025 07:29:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wv9czjES-xADVSLP_m7aQuuBht9vEyFRZwJC_drxdL+A@mail.gmail.com>
X-Gm-Features: Ac12FXxcomzywXeVkuRLJiRQa5Km14yR-Mbb8Mxu-Qo9E3qk5NCycqUXiWipDN8
Message-ID: <CAD=FV=Wv9czjES-xADVSLP_m7aQuuBht9vEyFRZwJC_drxdL+A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] HID: i2c-hid: elan: Add parade-tc3408 timing
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, jikos@kernel.org, bentiss@kernel.org, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 20, 2025 at 8:15=E2=80=AFPM Langyan Ye
<yelangyan@huaqin.corp-partner.google.com> wrote:
>
> Parade-tc3408 requires reset to pull down time greater than 10ms,
> so the configuration post_power_delay_ms is 10, and the chipset
> initial time is required to be greater than 300ms,
> so the post_gpio_reset_on_delay_ms is set to 300.
>
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---
>  drivers/hid/i2c-hid/i2c-hid-of-elan.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

Whoops, I guess I should have realized that the commit description
(300ms) didn't match the contents of the patch (100ms) in your
previous version. Sorry about that. This version looks fine.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

