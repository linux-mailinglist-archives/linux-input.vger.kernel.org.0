Return-Path: <linux-input+bounces-8878-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C27F5A00827
	for <lists+linux-input@lfdr.de>; Fri,  3 Jan 2025 11:58:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E6811883E06
	for <lists+linux-input@lfdr.de>; Fri,  3 Jan 2025 10:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3518D1F9426;
	Fri,  3 Jan 2025 10:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="oBoVCeD4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1C71B87C2
	for <linux-input@vger.kernel.org>; Fri,  3 Jan 2025 10:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735901926; cv=none; b=lhRJe+FWOyhw2a/NX/Sd6CVUyIypxe7Z3aQesLFR6nO6sgfECM6HrcQAM7MDo426KAg0AqAqqz8DlfCT+wYJWjEPPh+1yB2ysScbrka8pxLIF1f4iuewdYNwxPT2ay/V6nKduqrL06gUsuBJlhxGdyOY0mMNVbBRtMMRhxoWPPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735901926; c=relaxed/simple;
	bh=S2Y3f2kQVH/tjvDflF9nMzRgoypoP7J8xfTe80ikY08=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZdfVdLnqub1FL12N//Wg8JGpkdWsy5NfMfaOWPNP6zyMiZ5HXOPaHYoGt390r2Fo3HJ5IqyCHstSp3CKTwx/SPEEYxlJ9AUWHfskr0CquEEViaMugsn32NImUzD+amWxgD0vKM2MmiT5BxJPhEKNPV2TSAr14CF0D9GNaj4xVNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=oBoVCeD4; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43634b570c1so87123725e9.0
        for <linux-input@vger.kernel.org>; Fri, 03 Jan 2025 02:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1735901922; x=1736506722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h3u4oGWBQKjEPREELrdTT/cBTk6tLIvMbyFiElHLVLk=;
        b=oBoVCeD4JOoMFNmnlhSXu9xavcF7ldgvT8AfIQSPQ1ke3TsXCEzilwIrPdvrPOsoiA
         ijkCSZp8fGQe5f7AYgF3UcBpUBajH5XyaFycaPPgLCwuhihASc0nc7N4cyu2KE/Wnbea
         lDIjRetN6pTM8EDuL7vgdrb5BsmLf+Fy2qR+j4eGszS8KhXTBDkbp6ynBqKl/P4XdSKM
         FbID9AsS/rW+zJPTUNuVfNJBEVNiF0ggy/mPS/RCMwqJb2yNEwOAp6rAjCWzxhoZgCik
         2aoZPNmc5JhJA97fY2tLFuD6uW1E7C/LL3MhtSgme5TWMgn9Nrw3WjhmhsgRPL4FLBEr
         O1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735901922; x=1736506722;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h3u4oGWBQKjEPREELrdTT/cBTk6tLIvMbyFiElHLVLk=;
        b=XkrLyptH5W+X/iwvfH7q/1hkzVKLZPYXFk0kh6HT8YPfD/mF4cAcwQbmSWxnNXAwpC
         LWaBzEZ/pTuvEbegJ4S3FE3OV86GKBFurB/koLpgjWVwXx6rN20jY3PPWxpMFHfH1dtA
         xDQBpwLsCT+K3C5B1R03QgqaFfv8cacQZjtSV46lgJzanzvqe5ZCK1xf1sarYjGAAvr3
         5rfj1inXO8qEKAIbam05A5Qdsg+TT/S7MAYCIpnzlPszLKvcx/hi7ul/16oFBskYytg5
         2auzRERtt62jCDUkgAn3EX9O9sbfw4DNPZZLETp/pKGHFtc9zl3OU3KQ2S9TJo/i72wW
         IrCg==
X-Forwarded-Encrypted: i=1; AJvYcCVZP1IvLlm9FsV02Id0j10dTYlOW1LwJR4LbMBg70rM+XI7F1DfCtdyP5BED1V0NTrqArWt7wyc+0doyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5NFnA0zMZ8LN0LIat39KI2kIYnCMW3qe9Rh2SFSlIe2HhCNzS
	Gwz6wmCigZrMGtVrVoHB0Fr58CEqgEwSkNoqRFI6X1D+EsNa27Ui2Z8oXsNgin0=
X-Gm-Gg: ASbGncum0oorUcg7XIq6UtoYj/Z2nAo+nLONTVpK0uUenKmUlUDBiOAe2uFWhCkVHMM
	Ai4XZxp9w7P03yB5zmilyuMMrZv73QVXvlXRuVmZzXrxJRF5UnZAiS5WFyvscTHz4bdiWiQ0/Gc
	0ngTq8f9+1nrwAjMZt800wNyscSEN9/GGoIUCl1f3cLaEZpDrQ9RINMTBXBsENoDyvqv5Mc6kOq
	G6/zdcyboyqX4hnWBXxMICAUcHwUx0J0GPZmVVordppNRXRKRKXQgwP+y2G0p0GwQ==
X-Google-Smtp-Source: AGHT+IFjtv32f9kYfRVKeyGYT0IEP5Qw+m/gGOhzKk2Cr8BmmZ9Jl41YENFOU1sjQfF0nAEj/HJdsw==
X-Received: by 2002:a05:6000:4703:b0:38a:69a9:af91 with SMTP id ffacd0b85a97d-38a69a9b0a9mr1730131f8f.13.1735901920712;
        Fri, 03 Jan 2025 02:58:40 -0800 (PST)
Received: from localhost ([2a01:cb19:95ba:5000:d6dd:417f:52ac:335b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a28f17315sm35078406f8f.108.2025.01.03.02.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 02:58:40 -0800 (PST)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Val Packett <val@packett.cool>
Cc: Val Packett <val@packett.cool>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Fabien Parent
 <fparent@baylibre.com>, Alexandre Mergnat <amergnat@baylibre.com>, Amjad
 Ouled-Ameur <aouledameur@baylibre.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/3] mt6779-keypad: fix compatibles and add to mt8516
In-Reply-To: <20241225192631.25017-1-val@packett.cool>
References: <20241225192631.25017-1-val@packett.cool>
Date: Fri, 03 Jan 2025 11:58:39 +0100
Message-ID: <87jzbcnoyo.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Val,

Thank you for the patches.

On mer., d=C3=A9c. 25, 2024 at 16:26, Val Packett <val@packett.cool> wrote:

> The mt8516 patch was previously sent in another series but rejected due
> to not using an mt8516 specific compatible - which the other usages
> of this driver (mt8183 and mt8365) weren't doing either.
>
> It's only fair to add the SoC-specific compatibles to all of them then :)
>
> Val Packett (3):
>   dt-bindings: mediatek,mt6779-keypad: add more compatibles
>   arm64: dts: mediatek: add per-SoC compatibles for keypad nodes
>   arm64: dts: mediatek: mt8516: add keypad node

For the series,

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

>
>  .../bindings/input/mediatek,mt6779-keypad.yaml        |  3 +++
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi              |  3 ++-
>  arch/arm64/boot/dts/mediatek/mt8365.dtsi              |  3 ++-
>  arch/arm64/boot/dts/mediatek/mt8516.dtsi              | 11 +++++++++++
>  4 files changed, 18 insertions(+), 2 deletions(-)
>
> --=20
> 2.47.1

