Return-Path: <linux-input+bounces-15810-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C8DC218C1
	for <lists+linux-input@lfdr.de>; Thu, 30 Oct 2025 18:46:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F38A21AA1048
	for <lists+linux-input@lfdr.de>; Thu, 30 Oct 2025 17:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 607AC36B982;
	Thu, 30 Oct 2025 17:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OnHAwF/D"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB92277C96
	for <linux-input@vger.kernel.org>; Thu, 30 Oct 2025 17:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761846260; cv=none; b=iizTOw7/pCL5Dws6lmOj2tMRUTrPgQ+yOGfXUuJbml2Foh60psU46X9Aw2AhVj6qBnacX/vK167Z5SyytfJWB1pSW7wJE/SPlnA38+WfzBBhklQokBRqMXhIuC4rXv5QlX7IxRlkSGL877wHehdrRegzXh6gVpEX9VmwEZBTpHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761846260; c=relaxed/simple;
	bh=D6cA0tuKeFpeMg9nWmYaQYp+gHaB5LK2pOt58ibUKA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WLBR4qmeLUJHBOnax8O51YGT0aHXpJSlPPoazjrXxMJE/q1JtHtsSUClQ2V97h8E2+9Zb6uJkX4irZL4Ag5mIX2CLpe5qWzfaZcsQTPRUH/WY3OK3UdM1WeZYm8hvrv728gdSRl+oh5SnFVuQpebp+1qFNcLw0U6wQ8id+2e1gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OnHAwF/D; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-783fa3aa122so20946797b3.0
        for <linux-input@vger.kernel.org>; Thu, 30 Oct 2025 10:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761846257; x=1762451057; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPcGBwo0LIxONJDvhEXLjvnHJC4KOb17GqsunV3dmKw=;
        b=OnHAwF/DFejoPBpnC6PrPbPyjJqHSgn4ZRpWE3jjEC2n7KWT/IWkpFFlAw0yvGP1wH
         +F0Fb0qDhBlJkqIwclzEup6d1L2hlNuBGtaq+YNf/A8L5XViAr9jUk/NfztpUs6Kmuln
         3HOJSASODT2cowculb53XIMp+20Qh+Og3EdALmvIztSCVKkXOt+Z7pPdcAiAEw2gWrYB
         FEZnYfEot/mMV4ABwclvVKl4W4UAwfT+P710Ylz4Xv0xrT7I9+QI/YWbe+LdjmXCy4zD
         SJhEzkclvc2kNJpXfCJLJb3roVR9yDv1MoBAtJ/MNnhinEpkXx3q5wBdxCwdruLtV7Wj
         xpCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761846257; x=1762451057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dPcGBwo0LIxONJDvhEXLjvnHJC4KOb17GqsunV3dmKw=;
        b=YOH0P1AP9gVvFRbebYOq2pZfLPW5YRIz29Tx3uy1DFX9urQ05Isr0JtmNd1YGJ1PDr
         Wn/TVBUxoazO2zkQosIzD/sYYclAS6BtvNFMaX+ZoeG+3B14PzF/aloYDaTyGWAuysyB
         MjTtZ1wseE4Z0KVhwSoeRp8hn8TkkOfHHr8x9c+ZfhB5UDWR4IVxph0BcBpTmYiFIVtR
         xgXitm0NkxBzUTCYKg+mnsUND5REjmVHjcFc7mreT3HanWmIrYZg1YYCUrsuhXn9c9sl
         J8wgKIz8VBF5qZNlX7kTPhcDfaIbZ+85wyzLaK0Zo12BHiXo8yU4JHDZZqKfHNLPuQDB
         S+tg==
X-Forwarded-Encrypted: i=1; AJvYcCU+ALWG5tXj2ZeZcP6G/aPYUZFbKc/1GyNnDtnHMaqguHtcsopcmRJkXAxY9i8SJJXRWSgSDW7d0bohWg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfu62tV39w4yHlIROVWYqdynu+0+hnCYtHoq7xLf22LrEYFa7T
	FUolR+bg38byCntNNIAr2y0gIuK01f/NqN1QulLpHrZ4RUmlC9Gawv4XhpeumXqmQQrSnCmGqjt
	kWQh08suZzmuWk2xbohEux/BM+JEiiiI=
X-Gm-Gg: ASbGncv7sKEc/HF/WhpTxhQ2PTNLdV46Xi0QsTNboR3oKVwyTcvikd69620vR/m2ouM
	a6L772DL0ULJF/hPPQA9nrO/6NQYS8JkAHh0JyJOsB3FkLpQID7g8ILAUkSq9dU8DUVC7OqhdEo
	W+vwsIWKjfosVM65H/HBrADUD9Vbp7quXLrw492BQ3tnLqe2mjQS4qxWQoVNTmdpe1+kR6z7xET
	0wJlIn+Ekbf7+hIr6M7IOCyu4iNaUAO6Ecu/5VaVpNKFYz91aXvSsVJgvY=
X-Google-Smtp-Source: AGHT+IHUzr1i1p7RU6UbmOcxsnFajiDYf7p1VqY7fU7ZTT5VMVQZ7PZnaERwesvfRaKWecuNG4UrqRarnwwWYMVZGFg=
X-Received: by 2002:a05:690c:7601:b0:77f:6c6b:bfdc with SMTP id
 00721157ae682-78638e17dd7mr32251337b3.21.1761846256822; Thu, 30 Oct 2025
 10:44:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251030063704.903998-1-willyhuang@google.com>
In-Reply-To: <20251030063704.903998-1-willyhuang@google.com>
From: Daniel Ogorchock <djogorchock@gmail.com>
Date: Thu, 30 Oct 2025 13:44:05 -0400
X-Gm-Features: AWmQ_bmxtubT41TSd360g6dW7G4Zo3f5Auufn28DCK8uKGh1hxFirWw0tHt3aIE
Message-ID: <CAEVj2tkow09F0CpnWBy1CqyC_CGTqkPkH4geNgCGn5R_ZGD9TQ@mail.gmail.com>
Subject: Re: [PATCH] HID: nintendo: Reduce JC_SUBCMD_RATE_MAX_ATTEMPTS
To: Willy Huang <willyhuang@google.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Willy,

On Thu, Oct 30, 2025 at 2:37=E2=80=AFAM Willy Huang <willyhuang@google.com>=
 wrote:
>
> The JC_SUBCMD_RATE_MAX_ATTEMPTS constant is currently set to 500.
> In a worst-case scenario where all attempts consistently fail, this could
> cause the loop to block for up to 60000 ms (500 * 60ms * 2, including the
> additional retry after a timeout).
>
> This change lowers the maximum potential blocking time to 3000 ms
> (25 * 60ms * 2), improving system responsiveness and efficiency.
>
> Signed-off-by: Willy Huang <willyhuang@google.com>
> ---
>  drivers/hid/hid-nintendo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
> index c2849a541f65..342cd6893502 100644
> --- a/drivers/hid/hid-nintendo.c
> +++ b/drivers/hid/hid-nintendo.c
> @@ -819,7 +819,7 @@ static void joycon_wait_for_input_report(struct joyco=
n_ctlr *ctlr)
>  #define JC_INPUT_REPORT_MAX_DELTA      17
>  #define JC_SUBCMD_TX_OFFSET_MS         4
>  #define JC_SUBCMD_VALID_DELTA_REQ      3
> -#define JC_SUBCMD_RATE_MAX_ATTEMPTS    500
> +#define JC_SUBCMD_RATE_MAX_ATTEMPTS    25
>  #define JC_SUBCMD_RATE_LIMITER_USB_MS  20
>  #define JC_SUBCMD_RATE_LIMITER_BT_MS   60
>  #define JC_SUBCMD_RATE_LIMITER_MS(ctlr)        ((ctlr)->hdev->bus =3D=3D=
 BUS_USB ? JC_SUBCMD_RATE_LIMITER_USB_MS : JC_SUBCMD_RATE_LIMITER_BT_MS)
> --
> 2.51.1.851.g4ebd6896fd-goog
>

Thanks for the patch. Seems like a good change.

Reviewed-by: Daniel J. Ogorchock <djogorchock@gmail.com>

- Daniel

