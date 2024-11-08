Return-Path: <linux-input+bounces-7987-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E50D09C2028
	for <lists+linux-input@lfdr.de>; Fri,  8 Nov 2024 16:14:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 937251F24C78
	for <lists+linux-input@lfdr.de>; Fri,  8 Nov 2024 15:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEB2F1F666D;
	Fri,  8 Nov 2024 15:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fOcN++J+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264CF1F6660
	for <linux-input@vger.kernel.org>; Fri,  8 Nov 2024 15:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731078857; cv=none; b=AUuFSPTGcmQe73vYwcoCgypaU/rnwfHk/5KYMQWK9Q5EXIGJyDSXMPWEXDPHxmREkXQK0TrosOqrzkuGtHztYi3PDVIS3hqtJMyZSYXutG7N49GBP1V2L//0moh6MKbc57lm9IcpnxK+5dYFZVKnkv4p7rP4khRLk1QL5HXjua4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731078857; c=relaxed/simple;
	bh=smY4h117cYR692sX/32C1fiEi9e/UhXm2F3tRfVz2OE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KO1KmMgJYlqwn0SobDz3VP68tmKhWse/PldWItzrC57YI7xfpFRyFNWyFqtjdZ7MoSurPV+5LV6KXzPovErf45lzJqX2w8/UHweG36KXXvaVx5p6kt83RovbMdDzUA9BnNbyWnVVQ+PITHzSrmDjaj0FNwBV5qI5iavDrpDoz8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fOcN++J+; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539d9fffea1so2181349e87.2
        for <linux-input@vger.kernel.org>; Fri, 08 Nov 2024 07:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731078852; x=1731683652; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EbptqwjZLNdVS9qjZW7J9pwzy8My758ZGi0V06mo61U=;
        b=fOcN++J+O7rjb3qWqdUYU1GVX1fvlvvH/RwQoiwYjTctSUUmMh2B9E6vvYXaSyemZv
         3TrE1UYjWuLziIkJT7VUKhulnGTV1BoONOKh4PNtqbMb40nq/fXSbBK6xQ9olxwdG/no
         c4v13hYm0MTzbajmZYaL+20Tk7z0/YXKve4EQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731078852; x=1731683652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EbptqwjZLNdVS9qjZW7J9pwzy8My758ZGi0V06mo61U=;
        b=N36LikDBjHfQcb8ezLuEqjNbcqdRQQQp6f0enjSOl35Qp/9pxEy1sxiVHJ+bHBBVc0
         XdHM7ZLB+L7foYtwJcD5tJ7j3ud7BD0O3w3qK6twJ7XfZi7l87wyCSxaGmtJo0c0STfF
         QxCHfhXtXQC/fp3sN1SCsGyH4G+n5BmHavKk4LrNWBYtLkIrzivLbCaLvVoJbr9dWlIj
         S/wEo+aOMRSTYL5FAnEMaaEYGWzFNbY9OGkJPJ8ONJ9ffeSvxAAHSZ/Lcs8JCvjEpp7z
         VVfy7fwqkoMkMO881MxUmUtH6vBY4u+WMCI26N9IzjzekIOyTtYTFGfMNLbKUH2FmKzZ
         dW7Q==
X-Forwarded-Encrypted: i=1; AJvYcCU14f/v4Ck1rjKGjgEBAzikmsEukoAVPtLbmoXDlck5gZ2bMm8dDO2o2d7YfeSMbZV6WXojocfDPh6jxw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzuu79R7Oswq8GJd4aMUigTDczINMzjXB7Z6ll/BFzIqaXs72yt
	NifKBoogIQ5Z4Wlz+JdbCCh1cdRNSNrlEG5+66wIyxmGdGqx8j17J0jfhtKJDY1FzV2+C1h4lGX
	ZVA==
X-Google-Smtp-Source: AGHT+IGxYCRG1X5fUV2ppVp8JxUE/LBTeGT6EtueTI/ENGnyhcBcXaXI5RRP/QBXJg+Yxkf7FZb1Rw==
X-Received: by 2002:a05:6512:b09:b0:539:d10b:e389 with SMTP id 2adb3069b0e04-53d862c4703mr2046198e87.13.1731078851803;
        Fri, 08 Nov 2024 07:14:11 -0800 (PST)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d82685da9sm646190e87.84.2024.11.08.07.14.10
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 07:14:11 -0800 (PST)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539f84907caso2403213e87.3
        for <linux-input@vger.kernel.org>; Fri, 08 Nov 2024 07:14:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX4CR9CmtLrGr+yY39Z+0eAyHHBKsw13OzdSL4HxCiS8zN6YUvNeID5zZcvIJy4elH7n+3dtHYcUTTxYw==@vger.kernel.org
X-Received: by 2002:ac2:4c4a:0:b0:539:e97c:cb10 with SMTP id
 2adb3069b0e04-53d862ebfc3mr1963420e87.40.1731078850184; Fri, 08 Nov 2024
 07:14:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241108120311.87795-1-charles.goodix@gmail.com>
 <20241108120311.87795-2-charles.goodix@gmail.com> <173107281349.1752060.15353696141928017835.robh@kernel.org>
In-Reply-To: <173107281349.1752060.15353696141928017835.robh@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 8 Nov 2024 07:13:53 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Uc0PZZp-rupazy9tGfZMssGET=904cdUJXbhS=fMCUvg@mail.gmail.com>
Message-ID: <CAD=FV=Uc0PZZp-rupazy9tGfZMssGET=904cdUJXbhS=fMCUvg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: input: Goodix GT7986U SPI HID Touchscreen
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Charles Wang <charles.goodix@gmail.com>, conor.dooley@microchip.com, 
	linux-input@vger.kernel.org, bentiss@kernel.org, linux-kernel@vger.kernel.org, 
	dmitry.torokhov@gmail.com, hbarnor@chromium.org, devicetree@vger.kernel.org, 
	jikos@kernel.org, krzk@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 8, 2024 at 5:33=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org> =
wrote:
>
>
> On Fri, 08 Nov 2024 20:03:10 +0800, Charles Wang wrote:
> > The Goodix GT7986U touch controller report touch data according to the
> > HID protocol through the SPI bus. However, it is incompatible with
> > Microsoft's HID-over-SPI protocol.
> >
> > NOTE: these bindings are distinct from the bindings used with the
> > GT7986U when the chip is running I2C firmware. For some background,
> > see discussion on the mailing lists in the thread:
> >
> > https://lore.kernel.org/r/20241018020815.3098263-2-charles.goodix@gmail=
.com
> >
> > Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> > ---
> >  .../bindings/input/goodix,gt7986u-spifw.yaml  | 75 +++++++++++++++++++
> >  1 file changed, 75 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/input/goodix,gt79=
86u-spifw.yaml
> >
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/input/goodix,gt7986u-spifw.yaml:16:7:=
 [error] syntax error: mapping values are not allowed here (syntax)

FWIW, I think it's objecting to the "NOTE: " in the description
looking like yaml. Maybe just change it to "Note that". It's also a
good idea to get yourself setup to validate your bindings _before_
posting them to the list.

-Doug

