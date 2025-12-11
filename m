Return-Path: <linux-input+bounces-16539-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21291CB6071
	for <lists+linux-input@lfdr.de>; Thu, 11 Dec 2025 14:30:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA0B4302BD29
	for <lists+linux-input@lfdr.de>; Thu, 11 Dec 2025 13:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2E67313E07;
	Thu, 11 Dec 2025 13:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CaGRNucx"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D8A31355C
	for <linux-input@vger.kernel.org>; Thu, 11 Dec 2025 13:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765459761; cv=none; b=Ey68X/OLlznoVv+iKVYHjMv47jUI37XeoZ9ihQvVZjNLkofL5zW+tFBqGLYiA8n1JR+QrsCrZ2oRX5xk2rOnelEarr9sujZALGpEKVhWdqTHiryM5PgQQQSh3paO/4K21tyT6GLGMjECgfe1UlRMDz8puZNdHM5MmUmm/CtL6MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765459761; c=relaxed/simple;
	bh=ojJInOep1VLoL9h+fD5rBM8sQU+rlkYFjbP0Rr11rb8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GG/QHihrY3kZonHCURmyPRiwuzHWdBUze2+Up4eNWf/TV+T5mLCesy7x/v6v0E6kpzxsg2lu4ghzuMVZRqV4PyCjJVZ9fIsQvN8XrbsdulL0NFa7KIuDYaDxr1PBqlFX9G1kt8Qi+Zxcq/NJ+Xu+a9Tdr0S4JzCRcA4/bdMjBhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CaGRNucx; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-640c1fda178so189601a12.1
        for <linux-input@vger.kernel.org>; Thu, 11 Dec 2025 05:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765459758; x=1766064558; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=40J2ufHoRtplJjSJlhlkCbvquopI47IOlsToESLd6RQ=;
        b=CaGRNucxGZV1EsP8+WOMWwVBb+CcctYdLuGG3lT6PoDoHwIQVWuNpJqdJgFznT9jkc
         Y98DMN5swJiVXdUB4znRBTVLH5QBXC2OUebBVdDOWmwVVqkDvyeJy4PhL7jNUrdDW2AF
         b9sZmVAXZ1WoTkjsUDpqQz+HAxiEbcmBym1Og=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765459758; x=1766064558;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=40J2ufHoRtplJjSJlhlkCbvquopI47IOlsToESLd6RQ=;
        b=jjRvpwx+JLF/sTZW1iL6p3UvXgxFGOsLYa/ynk47uNhknLmUm8k6XegK7gE2+hM5um
         i3zbpAtFuYmv/pFjdh3fhqImh30L00tlHdkjWLnmQzThm5ws1emo+hZ1I4CeUAnTXH3M
         LF3Jonw3tvkqDOXj2h1bHBDv7uJ0FYk4fmSlLiY19pCzVafFMru5DKNwHWPIfY1cnX+g
         p9q+BBQlcMY+cCFYSdp/ujL2ZqrsLv3qzwxVOCjz/oZqkBqbL60Chj57hDr6KJNAKNLX
         RhWocZR73LhSuAuKv2e7RP1BZ5/xX8Rgqw/XsIjbhSxInK5Amfv0xkTmr4VNDTIV9kuR
         msNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvX1AxtlAdLoCv8w16iC8IW+FYypaR7DxBa1+cu0Wz3VaR5TQEyaxY+bBjo2wcfhiKK1uU9rViC+naUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPO2IQ+37ofHGVPlTuUaeMe7P5yeuiDowFUP2gm30DZD9tHzO5
	fBMmqF6vAyHITl4D8PW70Tr9niBWi/XSTFew3EabPkU/mnhRwW5rMK/E2J7erwFuIbUX8yS4FZ6
	hvVxyb7lZuQEGaasr6LMlAUPiSGtPu/IPH8tB6qMX
X-Gm-Gg: AY/fxX7DmtuXT4UkLzL95nekcTZSomxlAPyf/p3jcYt8FA2oCjX0zTkCfl7XQ6PnJlN
	n24NOy+qt6VedQez7ggnTHzZYe58HE/Ny32b7fGfyeRVB7/ksMqWsSUEGu4fUi1jVOXMYBemx+i
	JOo+x3r50F4iaMLFv3DblyhhF6VS0F4JsUBo3k9nNdmRHeRTZ1EWckj64HHLTxN8hjzTUBBwm1D
	AVs6HZvPZdMFNTHTGkQidrALuyfeV2iVgLlC1+FU9W3HYIHND3W5vGCEFkNi+EsLAwq9g==
X-Google-Smtp-Source: AGHT+IFOJf7KsX1gencvXlznomNuZ47WJRKUVY0snnRl9GGqsPTHs1K0HSR+8cnk6z5dt0Wl//1dZqiYxyZLB7dcvGM=
X-Received: by 2002:a05:6402:50cb:b0:641:1cd6:fee9 with SMTP id
 4fb4d7f45d1cf-6496cb6b810mr5048329a12.1.1765459758184; Thu, 11 Dec 2025
 05:29:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251209154706.529784-1-fabiobaltieri@chromium.org> <20251209154706.529784-2-fabiobaltieri@chromium.org>
In-Reply-To: <20251209154706.529784-2-fabiobaltieri@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 11 Dec 2025 06:29:04 -0700
X-Gm-Features: AQt7F2q39jfzfQcSjoh2PhZIB0p10Hq4RkLwBSMZXGJoO0Utb3wqUiNtN-ClMDg
Message-ID: <CAFLszThG_iHbm3A=X585_SVpLgWVqoAC9j_qJAG4yrJxfkG5Cg@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] Input: cros_ec_keyb: clarify key event error message
To: Fabio Baltieri <fabiobaltieri@chromium.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.orga
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Dec 2025 at 08:47, Fabio Baltieri <fabiobaltieri@chromium.org> wrote:
>
> Reword one of the key event error messages to clarify its meaning: it's
> not necessarily an incomplete message, more of a mismatch length.
> Clarify that and log the expected and received length too.
>
> Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
> ---
>  drivers/input/keyboard/cros_ec_keyb.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Simon Glass <simon.glass@canonical.com>


>
> diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
> index 1c6b0461dc35..2822c592880b 100644
> --- a/drivers/input/keyboard/cros_ec_keyb.c
> +++ b/drivers/input/keyboard/cros_ec_keyb.c
> @@ -269,7 +269,8 @@ static int cros_ec_keyb_work(struct notifier_block *nb,
>
>                 if (ckdev->ec->event_size != ckdev->cols) {
>                         dev_err(ckdev->dev,
> -                               "Discarded incomplete key matrix event.\n");
> +                               "Discarded key matrix event, unexpected length: %d != %d\n",
> +                               ckdev->ec->event_size, ckdev->cols);
>                         return NOTIFY_OK;
>                 }
>
> --
> 2.52.0.223.gf5cc29aaa4-goog
>

