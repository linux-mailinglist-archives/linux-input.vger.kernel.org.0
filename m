Return-Path: <linux-input+bounces-17214-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C664D3C570
	for <lists+linux-input@lfdr.de>; Tue, 20 Jan 2026 11:35:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 806366C1201
	for <lists+linux-input@lfdr.de>; Tue, 20 Jan 2026 10:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77B4B3EDAB8;
	Tue, 20 Jan 2026 10:23:18 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE6B3A63F0
	for <linux-input@vger.kernel.org>; Tue, 20 Jan 2026 10:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768904598; cv=none; b=ej6/tSfpv/It0SMWuqLq9eM5S4Hq7p+bXwe/NIwI07+XoH/K6sefJlF5zP8uP6IyB3D/VhP89CbCWGs7h+NmV7ZEWQTX3Lca3XsEKvb554F2sKTINtuTwilcOlzR1PU67pyBv8PgZ1Mvyol9UYVVYbAxg4gUSp5TCUYBVp+AG9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768904598; c=relaxed/simple;
	bh=ly0/vW5IDlDw+5wI+QKQKa0L1EivDoecPfiopYcWyII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LbJxe75sLAoNcC1RRP+SY1N5vjxOf/yoZlZnqdYLVKvyOzm+IfpnvP1ua4gl1Flag109KUeY0xmjzn1/zFzyGP4VUMcCiXp7G3YMoV7NpGztCZiGHQp7h95CWCffoSSGpjV9V2FDhVIdNgOp+hDm9OhmeVAIXnZ5y5kFLCLLWiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5635e6b80easo1335327e0c.2
        for <linux-input@vger.kernel.org>; Tue, 20 Jan 2026 02:23:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768904595; x=1769509395;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N0ac9c/OTxQ/f6N2lklbqJQ1hEcN+Ckhb/mx79x7PYg=;
        b=ZaBMUgcsxtsiJeTjd4BSVv0DjNfudl66vncrPV4YgNCevNsApfqTyByg2Yvl+XRFy2
         exr4zGpWg9CwpzpmrFJAeL+CxZC/E+hCeCNqWtb6Oho805FDrSZwmJccKi6Q0MBREkUq
         xpSERLzYDlQaP0Hh8KUQYedGLzbrUeY9sdEJ7riDeqkQHFfkMugF65C9iUGb+pdkLF3p
         CRFQFnvFaeHcvzatu+WNA93DxwT/SaMsHk9IdCA+kV50A4qDJ3Pg9HNUCjXuct/rK+hJ
         h+gkzFtKb7OAZokxqWpUlLTATlNBep8momlSV5nUwuhtMYjl3mMjroOZHf5d9yxuFIfH
         sWhg==
X-Forwarded-Encrypted: i=1; AJvYcCWqH0qeMUNbP15n25zsbrj9B/7IfvAjl801/gIxPKqkSj6bIjBRspvDuPe37YGXr2MUhev+XzN/rl6tlg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yykbcb1buXllW0oRBF2okFpOlwbxt1skiaJjkZDBR5kWQ9T7q5g
	yi2tbhKklTE1mreKhj2l/45PG2pBmIvOXjnfpVeGop9SOQW+OtIrhQQdB1022Hnd
X-Gm-Gg: AZuq6aLmS+zAoYN1tllNNiKhvHzoFY/mXx+Zv6w17A/sON3phwCEIhLexa+5/qegBEz
	A1GjzEiz8yiwsZls9vTn88oWn4+s1lgxfta27dkO7e58uTylkMIKFbJS3HveG1xF2uLg0cXtIER
	SIZrhdhIqV9b9TNaVNMsk5UTEU7e8mzR+ERdwrc5nOuTcME5ee7aGt3LYL5VOxNkpkQSG1S5I61
	w3LMx3vYb7rFcLMgtToaDvdIZrAVRMeLyZQQn0u1D42+4+/I03jjFEIWi5ZwshOiOb8o0tw9fJw
	2l+2GhfjEFEUd5qgLiMMn5haZ+4qW+W9X00iqYaJOxAYC4OgaRPk7KJ2HoVhYpptzenQ8FcZIHH
	LOm1M3gKIjvNbwvbBLavUNYQWDuDAnt05lqCnxeqMTxz5EvshtL55fB/YL/6sTkZ4cdF1/zv8Rn
	l2D3SuvGiYAcvsWUlUA0DkToFgtswU/jtj4ZZIeYRvjq0b9HwG
X-Received: by 2002:a05:6122:318e:b0:563:4d66:359c with SMTP id 71dfb90a1353d-563b7195353mr3792785e0c.0.1768904595330;
        Tue, 20 Jan 2026 02:23:15 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-563b70e516fsm3374565e0c.13.2026.01.20.02.23.14
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 02:23:15 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5efa33b2639so1599438137.2
        for <linux-input@vger.kernel.org>; Tue, 20 Jan 2026 02:23:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUnhmPBEckrrS35LiPpYDlRJ94WpT/BQMQAq/dEW11fThGTyif9bjyWgDxSaLmdyXTbLh0h+X/C7LnpIg==@vger.kernel.org
X-Received: by 2002:a05:6102:dcb:b0:5dd:84f1:b51a with SMTP id
 ada2fe7eead31-5f1a720e344mr3802674137.43.1768904593920; Tue, 20 Jan 2026
 02:23:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260117001215.59272-1-marek.vasut+renesas@mailbox.org>
 <20260117-grinning-heavy-crab-11f245@quoll> <38a146cf-8eee-4fbb-8783-231108a01b54@mailbox.org>
 <578745f0-0865-4195-9237-6d41c7fd55f2@kernel.org>
In-Reply-To: <578745f0-0865-4195-9237-6d41c7fd55f2@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Jan 2026 11:23:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUuYJ6pSFXy9KBsgkbJ003HEEKhMPgUHkQbdJPFchR39w@mail.gmail.com>
X-Gm-Features: AZwV_Qg0GRK3xtZRzMXlXd6nCURzar6s0zix0S_d3ClYfwO2CsgqrBgFFjQMPVY
Message-ID: <CAMuHMdUuYJ6pSFXy9KBsgkbJ003HEEKhMPgUHkQbdJPFchR39w@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: touchscreen: trivial-touch: Drop
 'interrupts' requirement for old Ilitek
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Marek Vasut <marek.vasut@mailbox.org>, linux-input@vger.kernel.org, 
	Frank Li <Frank.Li@nxp.com>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Job Noorman <job@noorman.info>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 17 Jan 2026 at 19:34, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 17/01/2026 16:33, Marek Vasut wrote:
> > On 1/17/26 12:22 PM, Krzysztof Kozlowski wrote:
> >> On Sat, Jan 17, 2026 at 01:12:02AM +0100, Marek Vasut wrote:
> >>> The old Ilitek touch controllers V3 and V6 can operate without
> >>> interrupt line, in polling mode. Drop the 'interrupts' property
> >>> requirement for those four controllers. To avoid overloading the
> >>> trivial-touch, fork the old Ilitek V3/V6 touch controller binding
> >>> into separate document.
> >>
> >> One if: block is fine, so IMO, this should stay in original binding
> >> especially that more devices like some azoteq or semtech might have same
> >> rule of not requiring interrupt line. Anyway, no big deal.
> > I am not sure about the other non-ilitek devices, but the fruitboards do
> > use at least goodix and etm/edt touch controllers without interrupt line
> > too, those I have on my desk (those two have separate, more extensive,
> > binding document). I also suspect we will see more of those touch
> > controllers with optional interrupt line, so if we do, I think we can
> > re-combine the binding documents again ?
>
> Yes.

IMHO more churn, and more git blame mismatches...
Why not keep them in a single document in the first place, like in v1?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

