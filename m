Return-Path: <linux-input+bounces-7544-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E2B9A486F
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2024 22:49:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C6871F21E1F
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2024 20:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3A2C18D625;
	Fri, 18 Oct 2024 20:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Hss/a/DJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36652CA5
	for <linux-input@vger.kernel.org>; Fri, 18 Oct 2024 20:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729284558; cv=none; b=Oa6miTxZXGq72SfCyQ3M5uGBtozoJs0qWOQVyH3noSOHoMlyM5e1TqgrJiCYh6N38iplbarDjsQutpUXAPDHSvh28kUU7dY4g6mCWXZWdm8IlGQHQWXTtMdxK7OSZxzfOCwjNKd3Zhpy3aqdscevMNjMwXMEFLBlwD7GrGHP47w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729284558; c=relaxed/simple;
	bh=sq2lBEx/oPK3mFck2yfdIPZDDYu11WVFdH4z5opWiaw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uM90Xl8IRXW0JOeiC9n798A/EG20aqEXgfKnhMiRKKYJlgtsMxW9lD5Eei1el/1/VogI/R7sTDaMoXx2xCAfMQEp/ks2zpee/g2EEcGoWGR99PGa/f5ZZeydf99J4PoM1+FDCZgcnCPyE6JHj0jnLWSbHmeYgXFph5nyDisVqXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Hss/a/DJ; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb3debdc09so22035711fa.3
        for <linux-input@vger.kernel.org>; Fri, 18 Oct 2024 13:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729284552; x=1729889352; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SM/k2Z4ZPVx9AnrPUOX6+i0klklaqbDryXRJgrrJdkw=;
        b=Hss/a/DJ5Nb2+8tInkvIJbaLgJJh1RD7vbWaSnNXp2cq1xAvJQYrpyIZ9/g8Py8pvH
         +WTGD0V63yvstX/5452TXTqqMTgfnzloPI+Xy1NyF8RWqYMdKSTCn3VsJjqCPUzpRj2w
         kP4SXFR3HfE78NhpS51UW3OOSRh0zgjehQ/J8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729284552; x=1729889352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SM/k2Z4ZPVx9AnrPUOX6+i0klklaqbDryXRJgrrJdkw=;
        b=vhtVtAOrg6nB6NqiMDgjio7i0oBTkXW9Uf7SBxomyFECvkJIvULGxnA1H/yREHasvg
         zzyX1Kl7kLFh9XaoeIlvROPitAnlt4m9r32sfqZoRfACQH822cReo6963oWswv+5Xsf0
         pVIRkHFTYgw+MYIzos6TdJ3pB6dlS/Ag1I5us8rLJW7UpJPLkrKtuwdOASnhP+YfLAnM
         /kgAuihp6As23HQHW/jdgmug074PKCBWRW6GmuqH5/Q/uNKnaMyZJEMTThzMQ8IaHJF0
         s7QfuP3SjYddODloJBXKSZf0GRAyHfIKWueJJzPwT4txxZYfrr901yZVpAD6/9NfBTOv
         rUvA==
X-Forwarded-Encrypted: i=1; AJvYcCUpsmVyawXQpFyJT0bjCALn9g6REu166WcUOafq61YqZ/JlghROR+LNxpQvJaSgXOe+jyDpylH7gBXrfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiahdwGf5XCxayyHiqyCq458lbH0UBQRCWOoQaM+963NYzhA69
	I0QluDmmzmocDEjTPsKxHcA+IdbcVbzO8oV27zkYgVfuc6ilz2ZIkMXH6bJlxKKvarIF/RxaQh6
	k9OyC
X-Google-Smtp-Source: AGHT+IEpqJkqPuflBbQTxi69XYxcEn6QM2d8jNxZCb/Z17Q0tXN+yRDdjoNQ/hLT48ee2nK3X6iyuQ==
X-Received: by 2002:a05:651c:b10:b0:2fb:51a2:4f63 with SMTP id 38308e7fff4ca-2fb831e8b81mr21711161fa.34.1729284552182;
        Fri, 18 Oct 2024 13:49:12 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb809bae1dsm2907001fa.64.2024.10.18.13.49.10
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2024 13:49:11 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539e13375d3so2958404e87.3
        for <linux-input@vger.kernel.org>; Fri, 18 Oct 2024 13:49:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXK4sUfHG1fqZ/CEY2CZyh6vjjWNpxI/0QOUZV/OqicRjfuZxzuWzdlfMmrvIdoX/AleM8PuI0vRx0PEg==@vger.kernel.org
X-Received: by 2002:a05:6512:3985:b0:539:f23b:59c3 with SMTP id
 2adb3069b0e04-53a154b3094mr2178158e87.34.1729284550257; Fri, 18 Oct 2024
 13:49:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241018020815.3098263-2-charles.goodix@gmail.com>
In-Reply-To: <20241018020815.3098263-2-charles.goodix@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 18 Oct 2024 13:48:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UFrk4QCxWzV9zUZnjhwiFf22Fji5KH83svdwba2mPVBA@mail.gmail.com>
Message-ID: <CAD=FV=UFrk4QCxWzV9zUZnjhwiFf22Fji5KH83svdwba2mPVBA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: input: Goodix SPI HID Touchscreen
To: Charles Wang <charles.goodix@gmail.com>
Cc: krzk@kernel.org, dmitry.torokhov@gmail.com, hbarnor@chromium.org, 
	conor.dooley@microchip.com, jikos@kernel.org, bentiss@kernel.org, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Oct 17, 2024 at 7:09=E2=80=AFPM Charles Wang <charles.goodix@gmail.=
com> wrote:
>
> The Goodix GT7986U touch controller report touch data according to the
> HID protocol through the SPI bus. However, it is incompatible with
> Microsoft's HID-over-SPI protocol.
>
> Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> ---
>  .../bindings/input/goodix,gt7375p.yaml        | 68 ++++++++++++++++---
>  1 file changed, 58 insertions(+), 10 deletions(-)

I'm happy to let device tree folks make the call here, but IMO it
would be much cleaner to just consider the I2C-connected GT7986U and
the SPI-connected GT7986U to be different things and just use a
different compatible string for them. So essentially go back to your
v7 patch from before [1] but change the compatible to
"goodix,gt7986u-spi". If, for instance, this device also had a USB
interface then I don't think we'd try to cram it into the same
bindings even though the same physical chip was present...

-Doug

