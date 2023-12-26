Return-Path: <linux-input+bounces-1017-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF56181E72B
	for <lists+linux-input@lfdr.de>; Tue, 26 Dec 2023 12:45:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 019FA1C21DF5
	for <lists+linux-input@lfdr.de>; Tue, 26 Dec 2023 11:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 679B34E601;
	Tue, 26 Dec 2023 11:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L/O5eTGc"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AD44E1BB
	for <linux-input@vger.kernel.org>; Tue, 26 Dec 2023 11:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6dbd0b6501eso828407a34.0
        for <linux-input@vger.kernel.org>; Tue, 26 Dec 2023 03:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1703591092; x=1704195892; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KPcUV+tt+3NONa1U+XeUunPSpE35CKRRbX0A29CO2cg=;
        b=L/O5eTGcms+ZfmnFDP+RIg3EtW6sOQ5wHsEmiHqYFD0xzNEDmkpkS9eYCB6181ZUTx
         5YGEvu3iz+ccAZPYcaJQCOVXoopwuvW9rrgcBjhfMGLugSOGl5gtEDWzAn3IQ+OXYa9I
         zBCqHFLi/pwB3fPvFYzQU7XwjceQyYyyw0lQaOR6whsvHyGqwiy/BJP+Zn9ZXLwB1o8o
         kL2fYHoDCJlwuN9SceMrgVA2Cy14egjuUV8RugwBE0g40OKFNxK+LVZ6i3KKO6hN2Aa1
         zO3DRwmL5ZyqhhxgyGRni1yng/cRJQKtpyLxmVQoXmcYGCAslrWuGZdZZXW0xD+O+cf7
         uDGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703591092; x=1704195892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KPcUV+tt+3NONa1U+XeUunPSpE35CKRRbX0A29CO2cg=;
        b=cuXhvrENum69G7LWFuuy+8IVhd1Ak8pq39v1oGRG25om0kOlajzszZa7yMercD4rgU
         X1l/cKO62MSpKv6FSsHobW3ddcWfpaWAUA9kiGQA+rnFOnB7BbavKEhUj9blqVxFOTqE
         fgMe0F4Tz2cllROGBq3UEFd/dE7dedGIUnNnJKOHfL5hPcbe+feLD3RPntx0+uFhpUHZ
         JMBvUasMyqWeeQOMg0dTTe4jCVeqHX9nCezTDmeLbMbCZJ150/3Tp6Y6oUz3yQw2S4In
         xkTohZ9tD1exo2MdrqqO10+hmWC2Bsq2xo72J/hMGyllWwoTBGty7KkZfY8/j2l8RiIy
         pj5A==
X-Gm-Message-State: AOJu0YzY6Jwdm8m8U0pB94q21nHDKdwPToxWPFkpQfQAQ86eL0QEfEMU
	7QBH0+oVYiWUtxbpTygLvr7FpgvqagegsB+V3Voeyd8b92ilnQ==
X-Google-Smtp-Source: AGHT+IGi4FFxW1nJv9aEdgOjeYJIKhNTegQWlpjdTUBCzIKNejzwhSHMfoh3PxReq2D/ulBJI+0xxaVpJ7YGSsYBy58=
X-Received: by 2002:a05:6830:3486:b0:6d9:a19e:9ae3 with SMTP id
 c6-20020a056830348600b006d9a19e9ae3mr2467542otu.62.1703591092676; Tue, 26 Dec
 2023 03:44:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231226023737.25618-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <20231226023737.25618-2-xiazhengqiao@huaqin.corp-partner.google.com> <b415e6d7-d69f-4fc8-8b4f-13e942859ead@linaro.org>
In-Reply-To: <b415e6d7-d69f-4fc8-8b4f-13e942859ead@linaro.org>
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Date: Tue, 26 Dec 2023 19:44:40 +0800
Message-ID: <CADYyEwR9knAAjdZA3fN_dLbW2LkK0Eny7Nn14n4LCLGZLx6xNA@mail.gmail.com>
Subject: Re: [v2 1/2] dt-bindings: HID: i2c-hid: elan: Introduce bindings for
 Ilitek ili2901
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org, 
	benjamin.tissoires@redhat.com, dianders@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof=EF=BC=8C

Thanks for your patient reply.

On Tue, Dec 26, 2023 at 5:09=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 26/12/2023 03:37, xiazhengqiao wrote:
> > Because ilitek, ili2901 needs to use reset to pull down the time for 10=
ms,
> > so we need to control the reset, use this drive control.
>
> I don't see relation between commit msg and the patch itself. Perhaps
> you wanted to say you document new device which is different than elan on=
e?
>

Yes, I added a new touch, its timing is a little different from "elan,
ekth6915", and other control logic is similar.
I will re-commit my message.

>
> Please use standard email subjects, so with the PATCH keyword in the
> title. `git format-patch` helps here to create proper versioned patches.
> Another useful tool is b4. Skipping the PATCH keyword makes filtering of
> emails more difficult thus making the review process less convenient.
>
> A nit, subject: drop second/last, redundant "bindings for". The
> "dt-bindings" prefix is already stating that these are bindings.
>

Thanks for your guidance, I will modify it.

> >
> > Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.co=
m>
>
> Your name still does not look like in other reply.

Do you mean there is something wrong with my name? How about changing
it to the following:
Signed-off-by: Zhengqiao Xia  <xiazhengqiao@huaqin.corp-partner.google.com>

>
> > ---
> >  Documentation/devicetree/bindings/input/elan,ekth6915.yaml | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
>
>
> What supplies does the device have? Not the driver, the device as
> written in datasheet?

This device only has a 3.3V power supply, I call it "vcc33".

>
> Best regards,
> Krzysztof
>

Best regards,
Zhengqiao

