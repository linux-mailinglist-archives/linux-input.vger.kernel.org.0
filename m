Return-Path: <linux-input+bounces-16801-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DE1CF95BF
	for <lists+linux-input@lfdr.de>; Tue, 06 Jan 2026 17:30:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A1B53084399
	for <lists+linux-input@lfdr.de>; Tue,  6 Jan 2026 16:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EBF8337BAB;
	Tue,  6 Jan 2026 16:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TojN845W"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BC0337BBD
	for <linux-input@vger.kernel.org>; Tue,  6 Jan 2026 16:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767716546; cv=none; b=TCm3+16T99qtzp12tP62spNI6qyrfma0jiBdca4jPYLGi9TDs0knNJpknQ/mC/KB/ljZ0dc+hDOt3pGo9gDdhdZTMM9EMWzPga9xu7lxIdy7Zr958vv8SbWm/s0LHJRDiJbwrxxq+l148tgTRyLgy72tQMzemCRjUhu9VK0SEQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767716546; c=relaxed/simple;
	bh=dWuLj9vIX6Xr1gmSVDR+2ClTl5jKQSOkLp3CRmWgGzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D+3/cVx0yG1OuSpzzrxibv0idWT6jD+5OEcCkkFrZN+YGmpL6Py1HNyJ6ZCWqUJnZ/Fdeb72GDGV8lNqmb2ID5eVjrCVlGBWozQ3bmMd/WKcS42BiRGYFdiuPxwGA1MaRH/Eqc2zSBd1FDN6O2G5OWL3ScO/lfMuTFaLAovklqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TojN845W; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b804646c718so171316566b.2
        for <linux-input@vger.kernel.org>; Tue, 06 Jan 2026 08:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767716540; x=1768321340; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uX+lfAscht316YktzuAfhTqn9xtlSWRjZZvzo5p8u20=;
        b=TojN845WvoehBXlto1o0PJYIPWc/dNF1jRrX1QQsXoHPy+pbuE0AXzIzhIzlatfFjE
         u4HWi9HqvEUHYDPwri3VvBQRVz1Hzu9aqT2/cuy4gUEPx5ufNLIM2YFnZG96jnpsLSYL
         IOys4YtfiPb4XAhm97pp66De2fMcNLStkpxFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767716540; x=1768321340;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uX+lfAscht316YktzuAfhTqn9xtlSWRjZZvzo5p8u20=;
        b=XtruI0SlEQoRRzjTQwj5pqUmGDbUCTsziRkrYu4B/6ZeebpcwnciTcWQXkYu5xV0Cj
         hM85F1uNUenL5XOMxhysWGhF1GCHoMZA8jCcvHl4w5yZ5L1fPWjjHr00vrLm/yQWRejY
         /KFfi49Wtr38IC8ptOWzMiYHh+upznL8M9fRq6pm0c7Xv+7mFaQoBuhSeqAGhf7mvH0P
         tkfA8X/po7vacyDH9TRP+f/0IhUYSmwCN04jx/9NxW8W38tkpvLvwVEgxgRgam+B005G
         TAsJBNyYhFd3eD3xRkVWRuldJ/HYLS+2Fzmhy2eaheVdnJV0w6lIAWMg2RJRnIs4zAmK
         nPSw==
X-Forwarded-Encrypted: i=1; AJvYcCWxddWuEiUiwCALxx2Q31pOjQA802Xhhd5XhK7Nfokx5IfdK/4HEFoBCWYdNm9BW9aI055h75q0Ka6/cA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUqaWEzgEe0jAPAGyeYAM1XdjiXY4fLQMgCdZUlv5gLP0mQt3w
	nKEgbi1GePD5FeOmtdZJXI+qUAyhAPuArVwlXtau1434VHjOAQ0dSLck/2pGCeDTxLBV7j8n+Io
	sRYYXwsaqkNl44r5z+eGOcprTqwNQbXlzJDZQq1bA
X-Gm-Gg: AY/fxX5uhBbIl99U/9TZTcLCNnEvE9zyWnhRfki3ZKUFqWVC2kKDQhIVPz2i05QmhwI
	D6XY8PeVH4lT0WJrWSmPM5mM4+jl909JlWetYNwvrMGOZhYBSqUuMtQEVKf36pCjdCGfI3RygM0
	CCe74XYaRkNLCrEVf+1DnTEIqLwnxM1yZEULeyROtxHHLeRNUSwYbPpK4A+V+yt8ZRL4Re0uAWg
	12P4MVzHxSeQwJkVOGI9wK2yUuiH0EFCFcZs+CQMdK5HGKsQblqRNsG8BXaeXQm3++iE7ElhICl
	stti
X-Google-Smtp-Source: AGHT+IH1kwvJFtp9y/n6/ONiW20q2rv3AbRml/XchfFRAgwVzGFRLV+QT8FB4w3lW9mYX4JDYpNYwhKMkzNzeEyEHEM=
X-Received: by 2002:a17:906:fd8d:b0:b76:b76e:112a with SMTP id
 a640c23a62f3a-b8426a423dbmr347721766b.11.1767716539722; Tue, 06 Jan 2026
 08:22:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260106112953.692304-1-fabiobaltieri@chromium.org> <20260106112953.692304-2-fabiobaltieri@chromium.org>
In-Reply-To: <20260106112953.692304-2-fabiobaltieri@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 6 Jan 2026 09:22:06 -0700
X-Gm-Features: AQt7F2qtMfWGAhGoeML78_KdDH89QwuHJwwSz10spdBmWVzi88rZjh-rN1XnT2o
Message-ID: <CAFLszTgMeRRi_=Bs6wzdZZGDn9DbmnZEdkbqPOhi0rqDs7DnPQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] Input: cros_ec_keyb - add function key support
To: Fabio Baltieri <fabiobaltieri@chromium.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-input@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Fabio,

On Tue, 6 Jan 2026 at 04:29, Fabio Baltieri <fabiobaltieri@chromium.org> wrote:
>
> Add support for handling an Fn button and sending separate keycodes for
> a subset of keys in the matrix defined in the upper half of the keymap.
>
> Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
> ---
>  drivers/input/keyboard/cros_ec_keyb.c | 174 +++++++++++++++++++++++---
>  1 file changed, 158 insertions(+), 16 deletions(-)
>

Reviewed-by: Simon Glass <sjg@chromium.org>

> diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
> index 1c6b0461dc35..74ac1700b104 100644
> --- a/drivers/input/keyboard/cros_ec_keyb.c
> +++ b/drivers/input/keyboard/cros_ec_keyb.c
> @@ -29,6 +29,11 @@
>
>  #include <linux/unaligned.h>
>
> +/* Maximum size of the normal key matrix, this is limited by the host command
> + * key_matrix field defined in ec_response_get_next_data_v3
> + */
> +#define CROS_EC_KEYBOARD_COLS_MAX 18
> +
>  /**
>   * struct cros_ec_keyb - Structure representing EC keyboard device
>   *
> @@ -44,6 +49,11 @@
>   * @bs_idev: The input device for non-matrix buttons and switches (or NULL).
>   * @notifier: interrupt event notifier for transport devices
>   * @vdata: vivaldi function row data
> + * @has_fn_map: whether the driver use an fn function map layer

How about: driver uses an fn function-map layer

Regards.

Simon

