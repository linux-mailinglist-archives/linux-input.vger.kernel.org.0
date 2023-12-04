Return-Path: <linux-input+bounces-466-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6886803766
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 15:47:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B04D2810F3
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 14:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 626FF23774;
	Mon,  4 Dec 2023 14:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XykgohPd"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 575E4125
	for <linux-input@vger.kernel.org>; Mon,  4 Dec 2023 06:47:11 -0800 (PST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-5d74186170fso18281227b3.3
        for <linux-input@vger.kernel.org>; Mon, 04 Dec 2023 06:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701701230; x=1702306030; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0vucZ1p7lmrLTgOrAv8yDP9iwaoHQ9uGpar2Z2YYKFs=;
        b=XykgohPdN98MPrT/aD9Ahw5v0XrZDQ7GI7RiABqMLJkVH/MQCevD2rLKCn+qXQOd31
         /cAwXMSz5bYdysMRt5mMgl8xlkgUwLJlmKxW2pjhPmyuyIF8C2SLoT5rq6tZeaa/oSPz
         znKAlVGGL2Bs6/Z1b44FUQk5KL6JQHZWrZX35Oe6EDqLBAG6iLMguwUQNal76ZyiYU2G
         fzyj/PphdO7Y9vnxlg+HWN+W0S6qXb6pMPt4t36Lj5CoK/X8e3sAM47DjCHmM+gl9Yef
         yvQyZFcqTjIUqiRxWaTOheY9XPjBF762VsejWsporr2baORywN7BKgLZSVnGkp84EYxH
         iYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701701230; x=1702306030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0vucZ1p7lmrLTgOrAv8yDP9iwaoHQ9uGpar2Z2YYKFs=;
        b=k0Of9Ghlr8fgwpCDKZ6hcCK4QQkiDNxxwctzD35v/zeet2Xx2aWfHuJjwLyEexZAE4
         5EONPY5FiiA+6Kgq+JvnlEnvgC6GFj05mZfemCfXuuF4NsEOcdzmJvrE+mzYLFfageX6
         kF2S5ztl0WNDcT6x8DpYPKLGatW+7Fsn4GsxDk8dijcMQ1hX7Y63bySGtd7Kg8lOTVa9
         ujz4azUVAWo3UAudud4dPk76xH2oVBGzogBTELqj0E1biM2xdfQ0r/qhVLVVHmWuShoP
         qzaBuXNqAsryX8FyFRHGjEDG6AaFM/YkYTTJyMO1/nPNNfuxCgKYC3DbMjFeupFMMM3K
         NBnQ==
X-Gm-Message-State: AOJu0YzmBy+Gwg966ixM7qN+S33GQWSGEdgNOpmAMHxC4lQiNDYoU7wb
	UVPCs9yWpdsozIfkiVfQCsD8PG3Jjdaq56i7WDLHlQ==
X-Google-Smtp-Source: AGHT+IHgXzWviSQW2d1SePNsoxk1BKBmHjrLPdI55ANyIj7rDYII0ZG16RM7of32E1ktEFD6/FELQXGdGyRD9bzJrGU=
X-Received: by 2002:a81:4426:0:b0:5d3:7ee5:d0db with SMTP id
 r38-20020a814426000000b005d37ee5d0dbmr2558189ywa.20.1701701230569; Mon, 04
 Dec 2023 06:47:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231203032431.30277-1-mario.limonciello@amd.com> <20231203032431.30277-3-mario.limonciello@amd.com>
In-Reply-To: <20231203032431.30277-3-mario.limonciello@amd.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 4 Dec 2023 15:46:59 +0100
Message-ID: <CACRpkdZQ+q3meJkGc2j8QQhHtpdK6g69C5MVfXrqY4xy3bct1A@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: amd: Mask non-wake source pins with
 interrupt enabled at suspend
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
	"open list:HID CORE LAYER" <linux-input@vger.kernel.org>, Marcus Aram <marcus+oss@oxar.nl>, 
	Mark Herbert <mark.herbert42@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 3, 2023 at 4:25=E2=80=AFAM Mario Limonciello
<mario.limonciello@amd.com> wrote:

> If a pin isn't marked as a wake source processing any interrupts is
> just going to destroy battery life.  The APU may wake up from a hardware
> sleep state to process the interrupt but not return control to the OS.
>
> Mask interrupt for all non-wake source pins at suspend. They'll be
> re-enabled at resume.
>
> Reported-and-tested-by: Marcus Aram <marcus+oss@oxar.nl>
> Reported-and-tested-by: Mark Herbert <mark.herbert42@gmail.com>
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2812
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

I applied this patch (2/2) to the pin control tree for fixes.

Yours,
Linus Walleij

