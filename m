Return-Path: <linux-input+bounces-17213-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 708A8D3C55F
	for <lists+linux-input@lfdr.de>; Tue, 20 Jan 2026 11:34:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 69D5C5A463B
	for <lists+linux-input@lfdr.de>; Tue, 20 Jan 2026 10:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CED63ECBD9;
	Tue, 20 Jan 2026 10:20:47 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BD53E959C
	for <linux-input@vger.kernel.org>; Tue, 20 Jan 2026 10:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768904447; cv=none; b=hmO6HzcAv3jkPHn5eTr8n8/9JR7Pndr8fhHwmDjCR/gvud0HAWlIkLk68GwAaKTzgHzuFHoQivvU23JISxQjuroIoSImmfbg6KMo6186IEkMKZgAISAYKI1zCrQ+Ynpkvz9weHU8uOPddkxd/ZEl7AnPO+iZ3HBwMUa14q6b1Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768904447; c=relaxed/simple;
	bh=aAg7Ezp3FuZ606SiZuKQuwvHZ2cnjOgD6370edqmDyI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=paknGqNi2DGdDk3nH3DIb0gMaVqmfAf/tD2hYP5pWpYgxIyYpquYNeS+mM4EiyvAdDM+jdoyloecUJ4MmaW96Cu3Aodv7YOEaR030E3UqcWRYMXPnTO/DdKlXBSYJ7zUGJ2G8VL0WB8ES9rG9htMsrSTppD+DujXm8kmQw+EHMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-93a9f6efe8bso1311064241.0
        for <linux-input@vger.kernel.org>; Tue, 20 Jan 2026 02:20:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768904444; x=1769509244;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nyv07j23r/do4ZgfLqH89KjdmB98dkcyShTfl8D+6CI=;
        b=hL4akMNKntPRdWpgAPeeXQ8CXrO66KI5p0l3dbwmpFf+TVRA671Tb1IhzfTYV2+gwJ
         lB1R7Y3opXmHf2atKiKYNyP1MxJEnveFgsDw5yLqRzV0xinSJIJx1euiCre4HWHaAkbz
         wJzT3s+CyyB+Oo3rB8nTj0VhliuqSs/Cg57/vJK3YtTlr4ruoLfhKAUvirwbMLjdOKvv
         GWjAbqH53StY8FlAk0FQ7BLTbjpcmoNhfkQqEzLjpsIrKWAsq9NAorMqhb22UIL+ahpI
         9xaJwS1PjnO8+8eeGg2CTCDN9NVeYkhpoq6EWElGtwNeMowG9crXF1dsADyjxx+JI91W
         3nxg==
X-Gm-Message-State: AOJu0YxOxvvGll7ng55IaWXRxEXrPCaJRcrM3hO4vx4SMInGEXIU11rx
	kAsGhd13P68V4zW+m1l4wFsDuLy2SUnAUFOjHyb49qzKojek8FQETYYXuu0Vny0w
X-Gm-Gg: AZuq6aI7a/TEWMOQwEtHPBRlBfLyq9Ie9RfP8BNNMo8AfZmvo2eHhlHjpjUolVbvI4Z
	TzYXF7B5MW4171o7rJaSEpX6LgvEkDzf7buBdbuXcjL8oC2Ccmdoyx92Be1bceD24nb695srW0R
	qH7Qy/ssyb7Op1L2eNfrEylhmIepzuV7vS008F7v61gYcI4PJDRrlc8bYhyXPIHrR6T4xd8RZNs
	weZQ/4ngt5iisvcxwgxqyXLKp/+VIKvX7//S9E8SAJ4TRZK1qVFKRss+2YGQPdb9QVVdrepCYum
	ACi99F2ICcrRyt523p7mO8z8dzlHbImDyseaM17yS4muszLFiY3YOvtm9PSr/Th4hbVkQE7yVgk
	AjoDTooOwmFSJUh4acfUOIayLCgU4eZJdGYVraxECmuHpIyjqXbcJrHITggH+7UI5babltz9wJ0
	UPSKXyuowgmW4UUl+5q/gwFKJCW59rMmO1d25NkudNsSXJVSqW3xRelfgbFRw=
X-Received: by 2002:a05:6102:950:b0:5ef:a346:a020 with SMTP id ada2fe7eead31-5f1a53b59a5mr3938009137.17.1768904444566;
        Tue, 20 Jan 2026 02:20:44 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-947d03013basm4144354241.0.2026.01.20.02.20.43
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 02:20:43 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5eea9fbe4a4so1819315137.0
        for <linux-input@vger.kernel.org>; Tue, 20 Jan 2026 02:20:43 -0800 (PST)
X-Received: by 2002:a05:6102:374c:b0:5e5:5ed7:60b6 with SMTP id
 ada2fe7eead31-5f1a55b92famr3532144137.39.1768904443274; Tue, 20 Jan 2026
 02:20:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260117001215.59272-1-marek.vasut+renesas@mailbox.org> <20260117001215.59272-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260117001215.59272-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Jan 2026 11:20:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVWrnn0vkgKra8mPzTLk5sWzE=CeQv-FXJ7-Jb+-mqU0A@mail.gmail.com>
X-Gm-Features: AZwV_QjATqdrAwQiQ-9Ivrk8GAW5lhpXxjdgsjHmeMx-cj4-rn9YTbwg6Jsj-98
Message-ID: <CAMuHMdVWrnn0vkgKra8mPzTLk5sWzE=CeQv-FXJ7-Jb+-mqU0A@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] Input: ili210x - convert to dev_err_probe()
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-input@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Job Noorman <job@noorman.info>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 17 Jan 2026 at 01:12, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Simplify error return handling, use dev_err_probe() where possible.
> No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

