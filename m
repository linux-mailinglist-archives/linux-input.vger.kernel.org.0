Return-Path: <linux-input+bounces-942-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3521D81CE27
	for <lists+linux-input@lfdr.de>; Fri, 22 Dec 2023 18:53:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 67FADB20E85
	for <lists+linux-input@lfdr.de>; Fri, 22 Dec 2023 17:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBE7528E39;
	Fri, 22 Dec 2023 17:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h7iDilPN"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A79F28DDA
	for <linux-input@vger.kernel.org>; Fri, 22 Dec 2023 17:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dbd99c08cd6so2139210276.0
        for <linux-input@vger.kernel.org>; Fri, 22 Dec 2023 09:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703267572; x=1703872372; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HMCbd/diw1/PZRPtQ076d98pKtkN7WoHEgmPA7lfsto=;
        b=h7iDilPNXwKqlmQBzl9RCtwYM99oZppwAQNoigfy8F6gB0Mnci3OMvD8XOWSe3qtda
         E4tpGF7fxulgFfdjuWt83EtZc7sDndV7GImknZkTiYZrnnAtxsSJdt0/12aRVvNV4xxe
         MMLdgj5hVAylSPZZSAqctyyvxY4urqsJF7j9XmV+yZGM9Glu0nPU+D0t4HVQi0f4+3l8
         k2xz3rc66t2Hclt6cJaO/ox3wfXsvRMF8qF3ZoFvOJ4V+oQQ7J/gGtoOy/6kELKUFmlj
         db7c3AEKvhXsvr83KGCyh1GEJtZnBvbwzQfctN/XyP1vrJ9SsCxOVIsRbpMCSoafL679
         3esw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703267572; x=1703872372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HMCbd/diw1/PZRPtQ076d98pKtkN7WoHEgmPA7lfsto=;
        b=wf1lIYgtLVKITSrkzqfjVtUspotNAeGSuQr1IwCBjzZLWAann10Hlri6XFQAn3zL4/
         MqwXO+y64wQeot6koBTrn3F0i/x6Z38YMFWldbOombbFsyz6vv7NSFBnk/UFpn9fnxaj
         bkXvMYL0vSYwxpy20/3MvUW7AZ1QAcGCzeiOfm+2PFZCMxmxOTz+UJbOpEJCRrRnbJqX
         gctzPF0TZkJJrTK91AhuQv1/rcbyXbkrEwEy3Czv0StjayFJoWb2IH2OLJMkXoe6u7z1
         FZAbx4w+iUPqMAH3ylddQBAGm1RV22VrhVQxuwsbHetXagKj6aC3FIdh2ZZ1o2LSCg8+
         hmQQ==
X-Gm-Message-State: AOJu0YzN0cix7vLBhbELz9yR72b2pjSDQ4TJhASv+ORvSCx6yw2Q0egv
	88qS/yBy86Cjuj+DgSTbtMsQuF0sLIP9C7imuS9jK5/KyCBFCQ==
X-Google-Smtp-Source: AGHT+IFn3hVwv10mifvBnkB0e8lClyIXHpLdBggu6vKgEMkcL1Pe4gtnuC8RSU6VC0aIt5quwrzNgOtAZu7lo6WOISo=
X-Received: by 2002:a0d:d812:0:b0:5e9:4c7a:5036 with SMTP id
 a18-20020a0dd812000000b005e94c7a5036mr1610808ywe.85.1703267572347; Fri, 22
 Dec 2023 09:52:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231222095258.33369-1-eichest@gmail.com> <20231222095258.33369-2-eichest@gmail.com>
In-Reply-To: <20231222095258.33369-2-eichest@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 22 Dec 2023 18:52:41 +0100
Message-ID: <CACRpkdbPjA+atjWt101f_o8hFkeUsUXL_raGdd802g_+n4FYOw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: input: atmel,maxtouch: add
 poweroff-sleep property
To: Stefan Eichenberger <eichest@gmail.com>
Cc: nick@shmanahar.org, dmitry.torokhov@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, francesco.dolcini@toradex.com, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 22, 2023 at 10:53=E2=80=AFAM Stefan Eichenberger <eichest@gmail=
.com> wrote:

> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
>
> Add a new property to indicate that the device should power off rather
> than use deep sleep. Deep sleep is a feature of the controller that
> expects the controller to remain powered in suspend. However, if a
> display shares its regulator with the touch controller, we may want to
> do a power off so that the display and touch controller do not use any
> power.
>
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>

This LGTM:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

