Return-Path: <linux-input+bounces-10809-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD60BA60B66
	for <lists+linux-input@lfdr.de>; Fri, 14 Mar 2025 09:27:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F411217F226
	for <lists+linux-input@lfdr.de>; Fri, 14 Mar 2025 08:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE2FF1A2545;
	Fri, 14 Mar 2025 08:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NIyuv0no"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7E41A3160
	for <linux-input@vger.kernel.org>; Fri, 14 Mar 2025 08:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741940867; cv=none; b=FfdfWMrgWs5EeQTKw6mabv5u4tH0vsVgn1aBj7V/n2tjR2Xe7e3/oeDviuuIWKMj0iq9LEi/tCj3bUKGv2nvROxGT4IFYTjgCitkO3ot37s03EMPGaJIbRWhYHuNyH07dHeXEVYNpv9tKsmAH6Mx/E0BjYRRFZ2apHVZPZ5m7Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741940867; c=relaxed/simple;
	bh=M0qV+T0e9lTbs6LgBpVvFlT54WXYpOStA4hJ0BfvdEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mbNoo4r57OvRvJ7Rmys7PVzka0Tgwovg4IT+araljLlm6M+cjjPEhoGwLV/wgKusvcMjfYRKfVaRAM708U2ObN3uwu1FWWVUc0Kgr8Wf77ER5/CFqWqYI+gCJGvT5YWFhxLcVIr57G4/HvYKHXUAeLllVfnjVAdhMpQW2LCz9DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NIyuv0no; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-549b12ad16eso1932581e87.0
        for <linux-input@vger.kernel.org>; Fri, 14 Mar 2025 01:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741940863; x=1742545663; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AIazsbhGjTnWVs4powPGcBo+ahU9A4azfZMflVf9GOM=;
        b=NIyuv0noqkjgWjeY3l5wyiGXiv7C/n6qbRj+6jSfWsnAhEiB65CSQ4poXUbQp7JyFA
         BPH8eESAK4jD3BvDyOfKTFV1R9+dwf642Xu5aty2d44KFVHjWwNpofCkFD0XuXGrsm2Z
         tM+t8sCdsbUnk3NxkN0AS5uEgu7Wts9EUyHtc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741940863; x=1742545663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AIazsbhGjTnWVs4powPGcBo+ahU9A4azfZMflVf9GOM=;
        b=rv/TpA/8UrpYqHaqqjEtXK4Rk57DV94ttYG7VdPOqxdxGwHAdgr67w5pjMRKWQRVCm
         ZZXiP/tWWfy9AeZF2ryp3n4mRJ9T0rZHSN/rkyMTHe7atGFjitpwEPBpB0qoFZ/4U73n
         yFrBX+Mt/okZCMAvA6Xtfzq2Ypj4ncj0ysTHWg0tTGuE41PoUvKNAFi7px1vhLKHAjDE
         4APyVUmAxeQZzHsGYjhN1BgY7hfyOJcdFDzRYUFxiMbhtvM8nuyXI1jMiLXwPlicOEG2
         UuNTBPA0Y5mkr7DknET7tAiDvzSGySLK0/Zi6568J8vTm78xXgCU7Z3X9YoSwkKFeLvj
         fduA==
X-Forwarded-Encrypted: i=1; AJvYcCVTsfx4GbD+StInzEBsHoqxXoZ7kEAiCMlAMgF7sd2pUIvXW3ZmOGLYDgY+a7rTMBnHW4kTJN5sa9NS0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPP30K7DZmEDEvF//Po/MrjYBvTCHXDoi+okgJf0vSUgGTr+oM
	dhsURxafU7ZSwslvLd8sRxUeb06GCQikkzy65Y7OJedgEHGxgy95U5wwjcL314zCP7smf7knONf
	hZpZSZKog/NjTD4eUN4P1hW1qPs3hsodVCES/
X-Gm-Gg: ASbGnctyCAF9T80g7g2awV0v3lrChzwu/SzL4rJRHt5F4ZlXGwit8G28rGjqQLiz71V
	NQvUMT6qFkH7QUztyx5i0IvbMME4US3/+oA/lBy6Zkuuuxav+DmMzicv25or6wVv+3pCszghVPR
	b2ApifIUIJtUGTL2fGg5ogH5j3Gb8QYc6FM4Juddf9P4XdkXtTgxuS
X-Google-Smtp-Source: AGHT+IFNFAiq0DF0mxEisHTLx9G59G5mtBKcvgViPsH0J58VO/6T1UIYLgI9JMkclJbxf4qIJjWLMm8EKW+D8w91aec=
X-Received: by 2002:a05:6512:2245:b0:549:4d73:641b with SMTP id
 2adb3069b0e04-549c398d3bdmr568085e87.52.1741940863125; Fri, 14 Mar 2025
 01:27:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250314073307.25092-1-Lu.Tang@mediatek.com>
In-Reply-To: <20250314073307.25092-1-Lu.Tang@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 14 Mar 2025 16:27:32 +0800
X-Gm-Features: AQ5f1Jpo3FChFigHgYdppgke4q0-o7VP4uIqPhGPsM2p4V783Z7jAOTWY1--PXQ
Message-ID: <CAGXv+5EzdMtOXotGUNdwdP-cKPwMccH6kGDifpg+WgjX_2z2VQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] Add PMIC and SPMI driver for mt8196
To: "Lu.Tang" <Lu.Tang@mediatek.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Chen Zhong <chen.zhong@mediatek.com>, Sen Chu <shen.chu@mediatek.com>, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 14, 2025 at 3:56=E2=80=AFPM Lu.Tang <Lu.Tang@mediatek.com> wrot=
e:
>
> This series is based on linux-next.
>
> Changes in v0:
> - Modify SPMI driver for mt8196
> - Add SPMI PMIC mfd driver
> - Add PMIC regulator driver for mt8196
>
> *** BLURB HERE ***
>
> Lu.Tang (5):
>   pmic: mediatek: Add pmic auxadc driver
>   pmic: mediatek: Add pmic regulator driver
>   pmic: mediatek: Add spmi pmic mfd driver
>   spmi: mediatek: modify spmi dirver for mt8196
>   dt-bindings: pmic: mediatek: Add pmic documents

You are adding three PMICs at the same time. Please separate each
patch in this series so that it is one patch per type per PMIC.

ChenYu


>  .../iio/adc/mediatek,spmi-pmic-auxadc.yaml    |   31 +
>  .../bindings/input/mediatek,pmic-keys.yaml    |    1 +
>  .../bindings/mfd/mediatek,mt6685.yaml         |   50 +
>  .../bindings/mfd/mediatek,spmi-pmic.yaml      |  173 +++
>  .../pinctrl/mediatek,mt65xx-pinctrl.yaml      |    1 +
>  drivers/iio/adc/Kconfig                       |   10 +
>  drivers/iio/adc/Makefile                      |    1 +
>  drivers/iio/adc/mtk-spmi-pmic-adc.c           |  576 +++++++++
>  drivers/mfd/Kconfig                           |   26 +
>  drivers/mfd/Makefile                          |    2 +
>  drivers/mfd/mt6685-core.c                     |   83 ++
>  drivers/mfd/mtk-spmi-pmic.c                   |  518 ++++++++
>  drivers/regulator/Kconfig                     |   34 +
>  drivers/regulator/Makefile                    |    3 +
>  drivers/regulator/mt6316-regulator.c          |  381 ++++++
>  drivers/regulator/mt6363-regulator.c          | 1106 +++++++++++++++++
>  drivers/regulator/mt6373-regulator.c          |  826 ++++++++++++
>  drivers/spmi/spmi-mtk-pmif.c                  | 1040 +++++++++++++++-
>  include/linux/mfd/mt6363/core.h               |  134 ++
>  include/linux/mfd/mt6363/registers.h          |  168 +++
>  include/linux/mfd/mt6373/core.h               |   94 ++
>  include/linux/mfd/mt6373/registers.h          |   53 +
>  include/linux/regulator/mt6316-regulator.h    |   48 +
>  include/linux/regulator/mt6363-regulator.h    |  424 +++++++
>  include/linux/regulator/mt6373-regulator.h    |  318 +++++
>  25 files changed, 6037 insertions(+), 64 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/mediatek,sp=
mi-pmic-auxadc.yaml
>  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6685=
.yaml
>  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,spmi-p=
mic.yaml
>  create mode 100644 drivers/iio/adc/mtk-spmi-pmic-adc.c
>  create mode 100644 drivers/mfd/mt6685-core.c
>  create mode 100644 drivers/mfd/mtk-spmi-pmic.c
>  create mode 100644 drivers/regulator/mt6316-regulator.c
>  create mode 100644 drivers/regulator/mt6363-regulator.c
>  create mode 100644 drivers/regulator/mt6373-regulator.c
>  create mode 100644 include/linux/mfd/mt6363/core.h
>  create mode 100644 include/linux/mfd/mt6363/registers.h
>  create mode 100644 include/linux/mfd/mt6373/core.h
>  create mode 100644 include/linux/mfd/mt6373/registers.h
>  create mode 100644 include/linux/regulator/mt6316-regulator.h
>  create mode 100644 include/linux/regulator/mt6363-regulator.h
>  create mode 100644 include/linux/regulator/mt6373-regulator.h
>
> --
> 2.46.0
>
>

