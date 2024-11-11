Return-Path: <linux-input+bounces-8018-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 855439C4385
	for <lists+linux-input@lfdr.de>; Mon, 11 Nov 2024 18:25:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49D4B2850CE
	for <lists+linux-input@lfdr.de>; Mon, 11 Nov 2024 17:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4BEC1A704B;
	Mon, 11 Nov 2024 17:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YZmsLlt+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C27B25777
	for <linux-input@vger.kernel.org>; Mon, 11 Nov 2024 17:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731345952; cv=none; b=YVe+cySBCep9+yzu6KOCh5b7vlUbOsYjSUvoA6//gtuOvv/onCcg/F8UCtSpXf33hWdCMQ3nDmmoeHGk1FQwF/P241Y1vNX9po/jkYPO6gGFvY3XJ2zgLBOEdLZzZSW1z21Wje9mOw9KzUkmRGDvr3PCH9KUoiYTldQ3Lzbz5rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731345952; c=relaxed/simple;
	bh=ZTk11ZVemdflfr0virzfjHPwj/DySg68gOxo+IYI7+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P56ygsnR1tpd9tDEPfcp7bxbQBCHYQSGGKnX/Sw0tZaAfq5JejYEF0H3o31H5KitliUQeVzgtjEfFUhllPQPcCw2rJ1gjMu7/kOxbd8BZnsWiTPwtXkcOBgJ2vsqDWbSuDKXT+YrNFDmVlyAJFIJhkFlUFLnSTfQHjVckWMQXmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YZmsLlt+; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53a007743e7so5663101e87.1
        for <linux-input@vger.kernel.org>; Mon, 11 Nov 2024 09:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731345949; x=1731950749; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jH1JjioDnQEXEHp1YxtApalVozz8jy8hPAeJoS9fBbM=;
        b=YZmsLlt+y7Rd0Omr+40zZ/HfxSdmp0NmvrfXBCqw62B7x5Va7ImQLM/xAqXjDKFADe
         3aYUcZtVg56gQ7lboA9dN1oU/LsqMNnPCjephIRAXq/pSISP6oTEwnzzhjG7C10sU7XZ
         vPAOOFagaSsKbSzmRmU1/JkdEVAFMqst0Sh+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731345949; x=1731950749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jH1JjioDnQEXEHp1YxtApalVozz8jy8hPAeJoS9fBbM=;
        b=Qqv+BbXr71F5PEsW7Uk0lo4phGPQVS412OV31GMCRKCZdhWzekHHnJPdm8K6gJikJy
         d1mESb9O+5tq5sNnvA8B+X5Og330/yB3WEXVl7VI+pEMoVzHXjQKnY6ANf9Fs1TGNvh8
         kPu/Gb1Y3NExMOoYza08WKMF9auspyYNlCjgJeF1TrTmHkSL4R2UdNUAce3OmhCntH+u
         OwVC8+9Z5g+9vPqBu2udB4mqY3GFVZXOkSlWXXG+Z6qOcu+EOgdotRZNiZfSDKsKyzSq
         ct4WmHECgLyTJXwy4b/v0d3DvX0UihcSpcVflSuVMJ7f+g792qmdPiDuRueylAlUkioX
         14UQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQjKfR5c1lexEKhS6a7U16xryqf5vecO+bK8msLVqU33w2KpLDIjuPz+poB3Z5y46AE076CeZy2+NaQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy61RJ65hy/N5hb8Y2wfssHNacZrDQMMBKn6fHFr8BGIkZwXAzQ
	AK+bbrCfTW8eR3+Rxo8Szfuz5UCGxMFK9FgdeLWIEK9nEMTHeESfiq8HPtx6oIQm90J/hrRlDkb
	HXw==
X-Google-Smtp-Source: AGHT+IF1mSjLdB4TnFpX7/BjPRntryBLtvZHzUEDEfg1Ai+VC2To/FS8lHdb0rp+420TB3JIsF166g==
X-Received: by 2002:a05:6512:1255:b0:539:fcba:cc6d with SMTP id 2adb3069b0e04-53d8626c818mr5747776e87.42.1731345948746;
        Mon, 11 Nov 2024 09:25:48 -0800 (PST)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826a723dsm1594258e87.124.2024.11.11.09.25.47
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 09:25:47 -0800 (PST)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fc968b3545so38675931fa.2
        for <linux-input@vger.kernel.org>; Mon, 11 Nov 2024 09:25:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXbBOIIEZJBGp5odKl81HOT0weyGY0aHEfPz/jHo6bHopHIyWxtr6016BJ6F94Ix7PhrTpc5y5zV/iuLw==@vger.kernel.org
X-Received: by 2002:a05:651c:1593:b0:2fb:60a0:f4e1 with SMTP id
 38308e7fff4ca-2ff201b29a7mr58237271fa.24.1731345947358; Mon, 11 Nov 2024
 09:25:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241111075000.111509-1-charles.goodix@gmail.com> <20241111075000.111509-2-charles.goodix@gmail.com>
In-Reply-To: <20241111075000.111509-2-charles.goodix@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 11 Nov 2024 09:25:31 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UDGqVHxFLEh1e5BW5p1Db+WNjntuSqFjf5uSFLncJUvw@mail.gmail.com>
Message-ID: <CAD=FV=UDGqVHxFLEh1e5BW5p1Db+WNjntuSqFjf5uSFLncJUvw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: input: Goodix GT7986U SPI HID Touchscreen
To: Charles Wang <charles.goodix@gmail.com>
Cc: robh@kernel.org, krzk@kernel.org, hbarnor@chromium.org, 
	conor.dooley@microchip.com, dmitry.torokhov@gmail.com, jikos@kernel.org, 
	bentiss@kernel.org, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Nov 10, 2024 at 11:50=E2=80=AFPM Charles Wang <charles.goodix@gmail=
.com> wrote:
>
> The Goodix GT7986U touch controller report touch data according to the
> HID protocol through the SPI bus. However, it is incompatible with
> Microsoft's HID-over-SPI protocol.
>
> NOTE: these bindings are distinct from the bindings used with the
> GT7986U when the chip is running I2C firmware. For some background,
> see discussion on the mailing lists in the thread:
>
> https://lore.kernel.org/r/20241018020815.3098263-2-charles.goodix@gmail.c=
om
>
> Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> ---
>  .../bindings/input/goodix,gt7986u-spifw.yaml  | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)

As far as I can tell this looks fine now. Thanks!

Reviewed-by: Douglas Anderson <dianders@chromium.org>

