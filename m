Return-Path: <linux-input+bounces-12051-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 071A5A9F98D
	for <lists+linux-input@lfdr.de>; Mon, 28 Apr 2025 21:33:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30FEE7ADAA1
	for <lists+linux-input@lfdr.de>; Mon, 28 Apr 2025 19:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D7552973A9;
	Mon, 28 Apr 2025 19:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FfA2BkEw"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1969B1A00E7
	for <linux-input@vger.kernel.org>; Mon, 28 Apr 2025 19:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745868779; cv=none; b=eAyA3AeKkPVE6fVoPjqkqvbUA29OcVizMviGDBem+XqIh8thdQRQmx8uNJzrgYKDG11qecm5XGTt6rRAzhcygq9/RP3HVi7YjRHLgW5eNKkQvLXoO5ebInwnkphfmsRLomXR0OVu+Xwd7W0/zG1wRBMW2e9VYTk9x3TMpuHNDXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745868779; c=relaxed/simple;
	bh=Y6n23dawAWFH2JLNBPqMIuR/bd0pb0K07Z82KXD09aQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EHdQy0+4izlHZ8q6kqWmZBd7thmqYcRpeCDeHfcbQJ6+uQudg4693QMmeM8ol0x2GIBDUOVFvNj35YRaYb56q6YItblinvD/1qBySAWvcUdpSSf6svvqFTAdl/S/MvP+oUr6I4/si491Zpf+7nJsoE+1jhQuxXJgi6iic98BVHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FfA2BkEw; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-73bb647eb23so4350689b3a.0
        for <linux-input@vger.kernel.org>; Mon, 28 Apr 2025 12:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745868774; x=1746473574; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mfzpR+XCt8jA2E6ve9YtKygB0tbO6iFuLJbvzZ6DwIk=;
        b=FfA2BkEwTwr9KOQ8KAZbQeysdT8UIDJ4djqzsKw+g7gpvN520khg2X8rk0UTcTpjFc
         AQI8G//evY5QKjp+SUUgNrE2DYOJ2bZFxK7hajmpgeYGuHDkE/ygJgRz/atwVR6/OWYY
         yV8DYAzW+sl3GHkEvqxP+WmHwN0fydyAn1DsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745868774; x=1746473574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mfzpR+XCt8jA2E6ve9YtKygB0tbO6iFuLJbvzZ6DwIk=;
        b=fg+blsznqmXXn9gIFB2HmmFErtnHNo/aSXMXMXm73nC5980cr0kder1sUy3JlVQ1qi
         WWX9g2rF7stQqporhxbpTY/wRmhygKU+Vd/XY6SuhXbJpvLC34L72UP3IhP6QaUIrKft
         oUVvF02KVvBvOpynZYrkrIOy9I7MmFwua8Z3w0vz5svQSUVsYEg48LHXsLLSKlVXHSE3
         9rvsqi/tB2oDNIT6exXixZALzABDVYSTmgpwQyZr5XTUZW/UjsLQTyKYJh+WW0+ZqvgO
         gAV52Id0JkiAVG04cnQafln8YIjJtW+KBSEON1JhTqWdyEAFEHPUFvAXX9u8HFqrUd04
         0yHw==
X-Forwarded-Encrypted: i=1; AJvYcCV/qA9JXtc0CpG0i2x0CDofGoLw3VuAjtUxcxxYUgqdqLdkeG5/mRO9dTzeefu37luUJbi3ZPHq/1HQAA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf6Y72nEolY/GccxtykVQDYWfVRqN6QNWJnt+73GuNHsd/563v
	UAU+/QBuvCInVehsTXYl1T+O+CWrAohmXOzqf89vBkkOSfLQu782xx42wWa/mNRJZ4f8aTDpPDQ
	=
X-Gm-Gg: ASbGncsJozjs8Qgac0O6dRRvpReGUwgEgo1VMk1Kh3PDfuA5wdkZ1ULadGIBtOkKUTB
	l8nd3LkpTxKXP/sbBTwSUjVrnU4Wyaq2adY/AXfmEHaCBfdron3rv+koMgfyQPOqTElMj4dv/So
	hO5DzR2/xUU/YiniP99wqmHrjRR3OgpcqfeJq3UwWSOgF7g02iNPFq2rvuKdG4txE8jYjz/WKlK
	QCD6mJKzw43Uaa30i2LZPjjHv2oMvzSB3+7EmptJLFhWojsJTmdnwcNuRP6ahDN6Q5WsaBFP9Fu
	A3libN176C4wxXxAtUDbui2uIo5nkA2G5OTZ5jbqysVSrQlDgBqk4lrMbD3r5L43Qw6/t/G/VMr
	pmcTmwf8P
X-Google-Smtp-Source: AGHT+IFsSvabXu/tx74PiOoOQee89NtMfGGiFnIMTtranCHYIr0UA87r2ShKjaBaIn7VBVkyoGsd/w==
X-Received: by 2002:aa7:8889:0:b0:736:5c8e:bab8 with SMTP id d2e1a72fcca58-73ff7247e46mr14098432b3a.3.1745868773719;
        Mon, 28 Apr 2025 12:32:53 -0700 (PDT)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com. [209.85.215.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25912325sm8729210b3a.14.2025.04.28.12.32.51
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 12:32:51 -0700 (PDT)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-af5085f7861so3876283a12.3
        for <linux-input@vger.kernel.org>; Mon, 28 Apr 2025 12:32:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVSoLtHN6xHMjPleWyJGxSkMJsc48bkh/5EvMrUMuLMHD0HOQZceM/CgeFy9uwojH5esu8kZ3lXwWb0MQ==@vger.kernel.org
X-Received: by 2002:a17:90b:5490:b0:309:f5c6:4c5c with SMTP id
 98e67ed59e1d1-30a01398884mr14674637a91.25.1745868770606; Mon, 28 Apr 2025
 12:32:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250421101248.426929-1-wenst@chromium.org> <20250421101248.426929-2-wenst@chromium.org>
In-Reply-To: <20250421101248.426929-2-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Apr 2025 12:32:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XLonF5qM+f6diESvnqAHKm4Y7wwPsNssdNqZfkn2OzSw@mail.gmail.com>
X-Gm-Features: ATxdqUEnTKoRxhC-TaBEXil7UFoCr2GvfRCzsqwspS2g_INzWAwlvG_Di1SAl68
Message-ID: <CAD=FV=XLonF5qM+f6diESvnqAHKm4Y7wwPsNssdNqZfkn2OzSw@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: HID: i2c-hid: elan: Introduce Elan eKTH8D18
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Apr 21, 2025 at 3:13=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> The Elan eKTH8D18 touchscreen controller is an I2C HID device with a
> longer boot-up time. Power sequence timing wise it is compatible with
> the eKTH6A12NAY, with a power-on delay of at least 5ms, 20ms
> out-of-reset for I2C ack response, and 150ms out-of-reset for I2C HID
> enumeration, both shorter than what the eKTH6A12NAY requires.
> Enumeration and subsequent operation follows the I2C HID standard.
>
> Add a compatible string for it with the ekth6a12nay one as a fallback.
> No enum was used as it is rare to actually add new entries. These
> chips are commonly completely backward compatible, and unless the
> power sequencing delays change, there is no real effort being made to
> keep track of new parts, which come out constantly.
>
> Also drop the constraints on the I2C address since it's not really
> part of the binding.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v1:
> - Reworded commit message
> - Dropped the enum for the new compatible string entry
> - Dropped constraint on I2C address completely
> ---
>  .../devicetree/bindings/input/elan,ekth6915.yaml     | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

