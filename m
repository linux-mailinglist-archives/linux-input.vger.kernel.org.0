Return-Path: <linux-input+bounces-11-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6349C7E86EA
	for <lists+linux-input@lfdr.de>; Sat, 11 Nov 2023 01:29:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 033671F20CEA
	for <lists+linux-input@lfdr.de>; Sat, 11 Nov 2023 00:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E17DBED8;
	Sat, 11 Nov 2023 00:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MDC7I5Z7"
X-Original-To: linux-input@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFD9EBB
	for <linux-input@vger.kernel.org>; Sat, 11 Nov 2023 00:29:46 +0000 (UTC)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C08D94496
	for <linux-input@vger.kernel.org>; Fri, 10 Nov 2023 16:29:44 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-507a5f2193bso2879009e87.1
        for <linux-input@vger.kernel.org>; Fri, 10 Nov 2023 16:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699662582; x=1700267382; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vc6pY2X/kV1rFostxbU0Y7TflzeE7tCSZzGD8ktPRxY=;
        b=MDC7I5Z7LhZHt3YeAfpXr2pBNomw29Vk/ttfzeFF+K5OszucAqumbgbfmBFDJmfNrB
         T1jXeFn5miBcKtxCIC508zMCUevqr5K8NY8hDOXjHNJWEcOp44xXcQ9PmvWnM2gEbv9D
         1OkHGTnnNprG3cnkrlwSGYfzzBDoyRzpwBk98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699662582; x=1700267382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vc6pY2X/kV1rFostxbU0Y7TflzeE7tCSZzGD8ktPRxY=;
        b=Xc4e2rA6b6IzJ88zX91S5krzhFZBiBQwoF/kTHTwOjqzYpZHF7iDNfLgEI8wdSYkZi
         ZIHaSJ03ITz3rQcs41aFOMeWLyc1nGMPQ5OlKUCPneZhe70MNlThNbjqIku0MoDXAEHZ
         jTwfvuzWpZCpuC7GII/WWNF1oCcU5KWmiweSZ55IMamzpQOhVMC1MPUXcGXLCdq6etOy
         oDus3qsVjBJggXVI/3xYom7dQxEDmmaMYgyNd+Tkd+A9whaMfhdwRT/PMcJJo0VTzIUT
         ep7zPUVnbURo5ltwVvWiF47w0B0MN2UfWjk0PEaL/KFWRn8mjega4/QvzTrD3rocxdcu
         e3aw==
X-Gm-Message-State: AOJu0YyTCNh5tD234Pg6ZED0LcN3BSgMzqnRmKDVVcrPx/EM5KY3zMsq
	jz+ym+ojt/6a5ea/HZxHxMUnjTTF+kNAj5WECo+XdzNZ
X-Google-Smtp-Source: AGHT+IFNY9TXoFyo6VFjyDD7hKTi1nE+kxXSKYaPKHtYF5dJOmSLHQ12KQmeiqodc4GfQHmm4G8YXw==
X-Received: by 2002:a05:6512:b1a:b0:509:39c0:7207 with SMTP id w26-20020a0565120b1a00b0050939c07207mr255732lfu.1.1699662582413;
        Fri, 10 Nov 2023 16:29:42 -0800 (PST)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id p12-20020ac246cc000000b0050481c400e9sm98487lfo.287.2023.11.10.16.29.42
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Nov 2023 16:29:42 -0800 (PST)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50931d0bb04so1084e87.0
        for <linux-input@vger.kernel.org>; Fri, 10 Nov 2023 16:29:42 -0800 (PST)
X-Received: by 2002:a05:600c:1c91:b0:405:35bf:7362 with SMTP id
 k17-20020a05600c1c9100b0040535bf7362mr34662wms.0.1699662560938; Fri, 10 Nov
 2023 16:29:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231109100606.1245545-1-wenst@chromium.org> <20231109100606.1245545-7-wenst@chromium.org>
 <20231110210443.GA419831-robh@kernel.org>
In-Reply-To: <20231110210443.GA419831-robh@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 10 Nov 2023 16:29:08 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XARZpeEZo-i+CNTAH=AQrxPfwnzSMXDWx6Pvj4k6cP8g@mail.gmail.com>
Message-ID: <CAD=FV=XARZpeEZo-i+CNTAH=AQrxPfwnzSMXDWx6Pvj4k6cP8g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 6/7] dt-bindings: arm: mediatek: Remove SKU
 specific compatibles for Google Krane
To: Rob Herring <robh@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	andriy.shevchenko@linux.intel.com, Jiri Kosina <jikos@kernel.org>, 
	linus.walleij@linaro.org, broonie@kernel.org, gregkh@linuxfoundation.org, 
	hdegoede@redhat.com, james.clark@arm.com, james@equiv.tech, 
	keescook@chromium.org, petr.tesarik.ext@huawei.com, rafael@kernel.org, 
	tglx@linutronix.de, Jeff LaBundy <jeff@labundy.com>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 10, 2023 at 1:04=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Thu, Nov 09, 2023 at 06:06:03PM +0800, Chen-Yu Tsai wrote:
> > In cases where the same Chromebook model is manufactured with different
> > components (MIPI DSI panels, MIPI CSI camera sensors, or trackpad /
> > touchscreens with conflicting addresses), a different SKU ID is
> > allocated to each specific combination. This SKU ID is exported by the
> > bootloader into the device tree, and can be used to "discover" which
> > combination is present on the current machine. Thus we no longer have
> > to specify separate compatible strings for each of them.
>
> You just broke an existing kernel with a new DT having this change.
>
> Just because you come up with a new way to do things, doesn't mean you
> can remove the old way.

I was wondering about that, actually. My understanding was that what
Chen-Yu was doing here was correct, but I'm happy to be educated.

Specifically, I think that after his series old device trees will
continue to boot just fine. ...so if someone took a device tree from
before his series and booted it on a kernel after his series that
everything would be hunky dory. If that doesn't work then, I agree,
that should be fixed.

However, here, he is documenting what the "latest and greatest" device
tree should look at and that matches what's checked into the "dts"
directory. In general, I thought that yaml files didn't necessarily
always document old/deprecated ways of doing things and just focused
on documenting the new/best way.

Now, obviously, if someone took a new device tree and tried to put it
on an old kernel then it wouldn't work, but I was always under the
impression that wasn't a requirement.


-Doug

