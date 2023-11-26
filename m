Return-Path: <linux-input+bounces-254-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3987F952D
	for <lists+linux-input@lfdr.de>; Sun, 26 Nov 2023 21:08:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EC43280D48
	for <lists+linux-input@lfdr.de>; Sun, 26 Nov 2023 20:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87C1D12E5F;
	Sun, 26 Nov 2023 20:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZeWVBZ2b"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D84FDDD
	for <linux-input@vger.kernel.org>; Sun, 26 Nov 2023 12:08:16 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-db40849f2d5so3116904276.0
        for <linux-input@vger.kernel.org>; Sun, 26 Nov 2023 12:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701029296; x=1701634096; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oY/+6Vdf/DK4Vduwgn3n01nTcjhDvzNRLJfMJ/HHsLw=;
        b=ZeWVBZ2bsTOBYFlv/CEqfALy72G1JJXdcBFze91qgJoacKJ+7Ob2czV9Cz52qGL2Bt
         n71OwK364yWaBqvI6TUZZfW4ooHS2igd+LeUBZ5MWvE/xstwbo0u1Yocq/lXW4p6Jb9N
         qKLUpAo/Jv4gOijX1nsCOLLA04s9eXgATcw0H0R/msRKIgDNOEQhw45a3Et3wwtx2FVR
         pE6n+SsH3Ki+ICROzykztMeUFOp+q41eO3uVFaqX9cWKRbUgLCjV6W37qt0ZXCMsVn01
         KbEM7hEjmBGhRmzdMOjL3mwk2wXFslcjYx1A2LX5Hmur8HElGHi6ztj/GDdrQlkjojk4
         Vr+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701029296; x=1701634096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oY/+6Vdf/DK4Vduwgn3n01nTcjhDvzNRLJfMJ/HHsLw=;
        b=fl9uShvSORKevzg3SZna228I+tL8A3RYwp1A/jpBwskaFEZbgDBY1t1eoJNw3U5dvB
         bV+1yntAOhyuzd6n4fG2ceUDiirOO5XLFkz/PR3druZ42AMaMQRWmD8WgS8iyJXi0ENz
         r1AJWRlp7rKXY7yUE3mofIVdmXMBHz03aJImNhaRrHJlCs+EvZkM12LU6ZE7yMxDAImd
         X6NmUCYoh3TWjg4lZoi59UVOERvizIR0v6GosGqSCdZLc+OAw3qsryic+QaJlJxH3Hc9
         5QoMZ21gtqt8jdloryN23MwscyVz03+g9hTk2qnqo8AJat3Z8HKGoA/UrqryYKZwhnIr
         Xixw==
X-Gm-Message-State: AOJu0YzTG86WaiddaHcWcTWX75n2N4cZM0WqVPpwl0Ztg1y7FgmGTYpP
	9r8Rodqr/KTmNzdS5Qi4+CEhypp2kM2rH3qjpmGw4g==
X-Google-Smtp-Source: AGHT+IFFBCc7DEmI9LRDuJXBegkzaw0XRK2lD9elEp31ICkd9wVkz9h0c066lGIr5re94D7Av79NdJLG0iWp7EOCIMM=
X-Received: by 2002:a05:690c:2b0b:b0:5ce:2148:d4bd with SMTP id
 em11-20020a05690c2b0b00b005ce2148d4bdmr5935726ywb.4.1701029296078; Sun, 26
 Nov 2023 12:08:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231126103029.851742-1-anshulusr@gmail.com>
In-Reply-To: <20231126103029.851742-1-anshulusr@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 26 Nov 2023 21:08:03 +0100
Message-ID: <CACRpkdayV=KUv4j+af_HSEtz05kmg+g-UTOjENsGuS4xtsdTNQ@mail.gmail.com>
Subject: Re: [PATCH v1] dt-bindings: input: convert gpio-mouse to json-schema
To: Anshul Dalal <anshulusr@gmail.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 26, 2023 at 11:32=E2=80=AFAM Anshul Dalal <anshulusr@gmail.com>=
 wrote:

> Convert device tree binding documentation for GPIO attached mouse to
> json-schema.
>
> Signed-off-by: Anshul Dalal <anshulusr@gmail.com>

Nice work! It looks flawless, making good use of default typing suffixes
-ms -gpios.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

