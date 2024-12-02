Return-Path: <linux-input+bounces-8346-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F9F9E09F1
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 18:31:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BD7D1630CA
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 17:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ED7518784A;
	Mon,  2 Dec 2024 17:31:06 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904FA27713;
	Mon,  2 Dec 2024 17:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733160666; cv=none; b=O1lawzJF/qU3OSAQyzlZFK4HXf+tJyvqONbd8hZJ4j4iPKCSBo8LLH4+eEa8IJUPHM5OqiefSX8VCHXiT6q8Ji/UEftSWVUdeV8RdQTdUSp06yUP852DZ8YLg8rI6fhZBBUA/fyiivRz3U1l5kHXNyVp+Tjj5K+Hqgun8pIIGZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733160666; c=relaxed/simple;
	bh=4JKZtSuEmqMuXeOBZrPyNLIm8CYD/ejkuMqx3I2WX1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hzVOgDN1n+J8f64eCsLSRR8dXBLicSViO6VdOSe0Ig8WDSueSPSIOaPNol/D1GReyN/mMqGWp9Ut/uFOefgzMin2REcAH17mz9b9PHoY+GNQMEBtIOziESiXdJ4IK8aQjqAwleugktqOU1G4ziOBzhSCXIyhV3htC0ajpqrv1uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5d0d71d7f00so3239634a12.3;
        Mon, 02 Dec 2024 09:31:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733160662; x=1733765462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R4Uhvy8tTjWy5oxzfIAviwoG/Zaxlrw3hfu/LH+0UAk=;
        b=eTCg1LS74fzi04WAsAPcUs84GqB135TTikwBwPEk941WJt5FaaRpN7tWCQOA8n0WzE
         fqzwkbN/qiJ/50eL7ypXX4d/XpJ4xJFqg+pRUwSIThvYgj//bVqvmCp1ToqDgSnaxJyV
         0+w+mU9dODHFR+X6erpxL8kwfYfJtLeowKZ057okjH9LTCmaKI6Of3x+LYGkYUE/nEPp
         DvZO07qnDnw6FjNZmhkIQ4rGBJllkZY1sTrY4L7Ir31JCcCdiQpKjNVm4NN1qLc3Ksub
         Up/lc9ofBYUz7SP/XYG13HUzTFtTsgkIFfiRiWi8LW4u+vnEeptqBbQ5cKlGSqSXjBq+
         xw7A==
X-Forwarded-Encrypted: i=1; AJvYcCUsq5mRg1cO4bhcZKvVuBJtCzDKMc/kWzhABZlmbhHxQMs9HGaMF3OmDHtwKmwjm1gBtG4utNDLiWe3iM0=@vger.kernel.org, AJvYcCVAAbton668URsVxzbx5L8h6rRwZX3w9Ba70SQkidtALQj59tCUs3H5WzFE22c32FP5HdjHTj77vJl5Frqa@vger.kernel.org, AJvYcCWP/E9qK1GFueL9ogN/HKfp+HJbk+IoBWUSHKKPgztmdoKxlw1uhQXHmWck7CgteckpQKubv20WFVki@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/XPRtoWU7G1OLcbAAn3noRWK9lrDYvDuqdHG0leWUe4eonKaw
	LOPw0FcGb4ppBsScL2XiF9CO+avkIJj1OWWAfQfrYISziRPL50EbCihJjtZy59Q=
X-Gm-Gg: ASbGncuCDak0wRXVvWmXv74Q7VJEPCF+Snn1MIacoemBriwjSzIlY4ZnOpQ63P+JnLB
	CPjzUSonoZaynmnJ+llYzRLorh+qHQXlOugak5UiRM0R9b7bYIFu2nk0uAkrrGHkDxS4A/dLDHJ
	L3tVg4DYnDX1zOwg75c/4m5CuJK/DvRVKDM1t9IjAkQWVWzvRFcO6rlnpyjvX7zamoKqaXHsotJ
	u6gO3TNKDxnRzT3ZdCTtal5jZ7b8TKXBlAV4T7jxroI0J0WEoFqSV/CRRUVCE5TNE//tNMY8ejM
	w/G4
X-Google-Smtp-Source: AGHT+IGXER7t4xt0MPo3fnBNAOSZ2V+uXN7N1xG2JCqsNpSv8UQ2jllVfOEA7x6l/9jexvtsPSx0Qw==
X-Received: by 2002:a17:906:3d31:b0:a9a:646e:d2f7 with SMTP id a640c23a62f3a-aa5810a363cmr2319133866b.61.1733160662025;
        Mon, 02 Dec 2024 09:31:02 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996c1207sm533424366b.22.2024.12.02.09.31.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 09:31:01 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aa51bf95ce1so82815266b.3;
        Mon, 02 Dec 2024 09:31:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUEhPehjTyVCRy9mEwcR5JUXWvYZY/1RikHSdUhyf6CSIvQl5gjRw73eGmomGWy8964w0ojtXhnN+ZUSpQ=@vger.kernel.org, AJvYcCWnyRd+lTJmPhg/MFvb7Zf/m57l26PcVj7cpngqoWE/2GswR7cc1fqEn1hGkoVhyY0WEyF4qe40w9r7@vger.kernel.org, AJvYcCXEU8VTMKVjsLIpZHOWUR9iS/OakdufHzRx1MKJFqYEWmeyutIYZ7K7iVWBEPzalF4+sHO6BUWBtqG29YGo@vger.kernel.org
X-Received: by 2002:a17:906:2932:b0:a9a:238a:381d with SMTP id
 a640c23a62f3a-aa581073eadmr2214547066b.52.1733160660680; Mon, 02 Dec 2024
 09:31:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241128-z2-v2-0-76cc59bbf117@gmail.com>
In-Reply-To: <20241128-z2-v2-0-76cc59bbf117@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Mon, 2 Dec 2024 12:30:23 -0500
X-Gmail-Original-Message-ID: <CAEg-Je_bx2aa-LpSgWjRjwWMGa9NDF9YbwkT1pP42s5=791oPQ@mail.gmail.com>
Message-ID: <CAEg-Je_bx2aa-LpSgWjRjwWMGa9NDF9YbwkT1pP42s5=791oPQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Driver for Apple Z2 touchscreens.
To: fnkl.kernel@gmail.com
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 28, 2024 at 5:29=E2=80=AFPM Sasha Finkelstein via B4 Relay
<devnull+fnkl.kernel.gmail.com@kernel.org> wrote:
>
> Hi.
>
> This series adds support for Apple touchscreens using the Z2 protocol.
> Those are used as the primary touchscreen on mobile Apple devices, and fo=
r the
> touchbar on laptops using the M-series chips. (T1/T2 laptops have a copro=
cessor
> in charge of speaking Z2 to the touchbar).
>
> Originally sent as a RFC at https://lore.kernel.org/all/20230223-z2-for-m=
l-v1-0-028f2b85dc15@gmail.com/
> The changes since then mostly address the review feedback, but also
> add another machine that has this specific controller.
>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
> Changes in v2:
> - In a separate patch, fixed an issue that prevented the SPI controller
>   from using GPIO CS, and as such, moved the hardware quirk to there
> - Went back to uploading the firmware in probe() instad of open()
> - Other changes addressing the review feedback
> - Link to v1: https://lore.kernel.org/r/20241126-z2-v1-0-c43c4cc6200d@gma=
il.com
>
> ---
> Sasha Finkelstein (4):
>       dt-bindings: input: touchscreen: Add Z2 controller
>       input: apple_z2: Add a driver for Apple Z2 touchscreens
>       arm64: dts: apple: Add touchbar digitizer nodes
>       MAINTAINERS: Add entries for Apple Z2 touchscreen driver
>
>  .../input/touchscreen/apple,z2-multitouch.yaml     |  69 ++++
>  MAINTAINERS                                        |   2 +
>  arch/arm64/boot/dts/apple/t8103-j293.dts           |  26 ++
>  arch/arm64/boot/dts/apple/t8103.dtsi               |  20 +
>  arch/arm64/boot/dts/apple/t8112-j493.dts           |  24 ++
>  arch/arm64/boot/dts/apple/t8112.dtsi               |  14 +
>  drivers/input/touchscreen/Kconfig                  |  13 +
>  drivers/input/touchscreen/Makefile                 |   1 +
>  drivers/input/touchscreen/apple_z2.c               | 458 +++++++++++++++=
++++++
>  9 files changed, 627 insertions(+)
> ---
> base-commit: 9f16d5e6f220661f73b36a4be1b21575651d8833
> change-id: 20241124-z2-c012b528ea0d
>

Series LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

