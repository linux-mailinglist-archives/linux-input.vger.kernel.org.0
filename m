Return-Path: <linux-input+bounces-5332-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 396B1947702
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 10:15:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A55F1C20FBA
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 08:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB18D2A8FE;
	Mon,  5 Aug 2024 08:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t7pZg+Hq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD575A95B
	for <linux-input@vger.kernel.org>; Mon,  5 Aug 2024 08:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722845735; cv=none; b=lESPQP169Ieyw+pocGWFRJqTLvTdm7Y3qAo6BrAILViiQzujeg/ZfR+lSG1i9UsMCr2Cr1/IfpXOS6HWr8HsmheG30Lj1daoRMpqDfODmFbXdF7HKf4lHs4ZCXa455neTPEtfDQ+MmcISSaEJGXSUH7cgFY+fY+WZ69QBufaPak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722845735; c=relaxed/simple;
	bh=AWygBS58pVLnH8WGnv12dTRYLLawYbAp6XClIuwOAl8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YMrNadOZPJMJ0v3dJOXsJ/cG35IZSPpoVibuOqK2whnoD/22v9ePo169y+BpXk2acdjrdImodhkXELvnEpixSWz0Vo+AI6Ijio6HcIEkiAVDCVWq/UuNjCedUnvKZKBXfoIetxPO1HhCxds73/MoNcb8yNQYxnsc/FC0pWkF2Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t7pZg+Hq; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52efbb55d24so15717092e87.1
        for <linux-input@vger.kernel.org>; Mon, 05 Aug 2024 01:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722845732; x=1723450532; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWygBS58pVLnH8WGnv12dTRYLLawYbAp6XClIuwOAl8=;
        b=t7pZg+Hq2pHaYd2Z2m/K9LAV5htrU+h/nhV6ocvPJhT3Pqk4ZZQUSABAkZb1+a8N4H
         K6hl8cELliTbD3B1GdeUUfzo4Z9P6RFuZoAmifogyXZmVkGTEHbYc6LsdtT3dzpWs5QB
         qLOBWiTX9+1/WUzenMlaaUy1wiiegBQUVG3A8Au+4UkM4j9NomN5fqi59EeOk62HcFPN
         G1DnEx97SRAjvsos7oNc22C88dOxOQY+DXOSx90SMtgJZWBze49WIQFP5eLICO2dOR0l
         raKrbn4tZkYM40zuExSDwMd3pHaOvrMn9c1hmWUOgtH2waGw9+p4TPqyuLCJWyU2SKEh
         I/+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722845732; x=1723450532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AWygBS58pVLnH8WGnv12dTRYLLawYbAp6XClIuwOAl8=;
        b=P49zKRp0MHyMkkWWf/hJdaog1EzRl80gQgGzoegxGuC0NzWBcMfGbMX3UGjfI9POhZ
         3zdBNc7duAFCQ8qdZ9KsUFiz/jaSw3jef0a6QFJqAYNRaEQaipuqz4ooLjqNv9x8eVO4
         Z3tyD5YrS3jNT+gAje7Nvk+EQ2JxcpLYIureqY8lEQryM3Yh1seUf5aqJA7lkhgCQhW8
         99G3NfWQFCiU9qnkY8BxD5j6aRsZhnfuu65g6hSyvKA6MXa/eNNfPXBjMk9JGZqvuibL
         CHZXQA7vsFqd8MbQidZ7WxjHG8fQqoyTVOA9szgEA0Eqw8yt4bF1L1WLxk50mRnotDg2
         KZUA==
X-Gm-Message-State: AOJu0YwX7GQGxsLGmWYsQBwgxcYNr/LUuYey2Ha9C3hcsBsFh7OwN1H0
	NbTJpRhSpT7jKuHgA+gONR873SDil8BGWJ7cjPtQXqIRBKKHq8WwFOSvZUeR0tka2paPcZ4GPsE
	LTwVAs5kPtRF/sXM/VAyCfwCJIM2W3qE1PJC/PQ==
X-Google-Smtp-Source: AGHT+IHwJvXxft505dOw4BjE+DCqQLDSSl0WMpgcMc5CB9vJt9lBcVTTh3PN6fM4GpeQAy9Ayk6G3UHvp05CdQTuJao=
X-Received: by 2002:a05:6512:31c1:b0:52e:716a:1898 with SMTP id
 2adb3069b0e04-530bb3bcc80mr8390562e87.58.1722845731822; Mon, 05 Aug 2024
 01:15:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZrAaOu_vf-cVBhRn@google.com>
In-Reply-To: <ZrAaOu_vf-cVBhRn@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Aug 2024 10:15:21 +0200
Message-ID: <CACRpkdbjNaqnTnyri_pL8fUuBagpihNzeSf7FEriymba6hGmEQ@mail.gmail.com>
Subject: Re: [PATCH] Input: cyttsp - stop including gpio.h
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 2:18=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> The driver does not use legacy GPIO API, stop including this header.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

