Return-Path: <linux-input+bounces-10266-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7E6A414E9
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 06:51:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB0521887AAA
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 05:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C79641547F2;
	Mon, 24 Feb 2025 05:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c5qX66AN"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6041448E3
	for <linux-input@vger.kernel.org>; Mon, 24 Feb 2025 05:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740376143; cv=none; b=EoiWytxgnx0OtmIaNDGqojMdg2y0PeoRnlYN3pTHx/alSotn70sOb+v3fnoE0f836UTJFNDEEL5vRx8Omkmpe7mVtNkzJCz87udIZB3TzyLkr+3wPLhVcyfwadTCbXI+4UTh7/66nhXVLG/k+HHtK4pZ86e86Gs68ASdCakkvp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740376143; c=relaxed/simple;
	bh=m279ZjzztTi8LtNqL/aTE5lsULasr6q1as//DopvJuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sBJiFcqjl6O1Jc++fxWLxN8W5KwagntM6Z5rqR+xyIoJOSHxdMZU+c83kYrxLfzWZLfUX9L2wTaXrIzPFzvTaGFrVUimT5D2AckGvKtudP4njVDYKH5qtpPsl1Ej+ZlOc5sLQ6QNrBgK8sKI+RH0JRITfMIEoupelPXj4qlK2yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c5qX66AN; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6fba8e84d3cso31559337b3.0
        for <linux-input@vger.kernel.org>; Sun, 23 Feb 2025 21:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740376141; x=1740980941; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rpvlm371irs6LL/ku4vT0q4d26XIYYAN2u/8x40Ww/Q=;
        b=c5qX66ANAhsCdo+fbRwDhHk+96qrRR4c1TdT5ezLyZPScc6yLk1dLZytj9kwSaiFGV
         1oxkB66IQLFQnwyLEsbfBPHeeeRfGTynGx1z6p9AKQ3WdFaWhUSKZJSL2Ojpqo4URhTT
         zYXzvSVewWuoS235BeBzAwH1ZvH1Blsx2UD7bT/E4ChRsPvi01PcoGYTEiv54BnGisku
         4oB/FL4JBSji/FKNvxJgHJzAusjHOY5FDzLW9EmPWoPq4sT/zONmLnj7mGy12NM0Gbq7
         lADlYHMnMYrpcJqEsfBAMUV4tORC/GPnvTg7Tt5cl+BuHTsYNevmLrb+UokukBUy3t3b
         +q8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740376141; x=1740980941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rpvlm371irs6LL/ku4vT0q4d26XIYYAN2u/8x40Ww/Q=;
        b=lKC0UPzWai5sh0zmnttnDAmbXgsa3oBe1ngyDC5Mm7VfN8RX1mNpm1wF5RVzKrHLn1
         NQOJ2Nf7GyMkRFxCcwB8iHds1m8gM54tNpWKaknuKCwR71G7MP8WWWAwwWefu4Su1dKz
         5yv60p8Cua9a82J0D+NcAQtDegC4SEFcci0hOjcuDwRyulYsO/UI0LLo9UpA8ne++jEa
         3Bp01PWfJorYIP0arJH67InEO1QfobLViXuwVsNJboPQH9oiRCRS23s9B4/MnDFLii7X
         iX6yGVkgOBUyhxMORcpiHEcT0GXf3MdWgVhO356gdsIPy6DMtsrdAkOeEnWhUlta+Orn
         ipDA==
X-Gm-Message-State: AOJu0Ywnq9g3qJsdk5+7NtBiehwGdMBO5DbDdMJrbrfvRfTtSb1Vbs8a
	UCBlLm03C8TO/rYyhazG0tn7y/7BZMW+XqgXGrE1EuRADw3JXAjoeHWH72rmxp5PptYHkFKN9jD
	jCEvLeCReeqSZeiBVDqDx6XJbLm0=
X-Gm-Gg: ASbGnctySquTs6X4hUeUo44kdDhOTS1+FG5Cx3nQXN7fOsqTVAQ/9XBtk8p8MGmdbPP
	WcOlf2+Kat9kv7p8xDfJTVs2yBY6kuxTbnueCoWxbmh6CIJ5CUT+lwdn6f3zcdYiL6yp2RaekEM
	VMm+nOesoQVA0pSvuwop72ing0oehq2xd+5F0ot3BO
X-Google-Smtp-Source: AGHT+IGdtQlTeJOcVaYLNKV/Hd2Zq0LI3ZgOJUHYMmSj+VGiS9WUF4aJ3ZhEDfIYjzq8OLzJ29QmPp83uzIi0WFeTT0=
X-Received: by 2002:a05:690c:6112:b0:6f7:ae50:6f0a with SMTP id
 00721157ae682-6fbcc37236emr100056597b3.24.1740376141067; Sun, 23 Feb 2025
 21:49:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250224053632.2800-1-alexhenrie24@gmail.com> <PNZPR01MB447838FBA8CE5A22C8096A4BB8C02@PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <PNZPR01MB447838FBA8CE5A22C8096A4BB8C02@PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM>
From: Alex Henrie <alexhenrie24@gmail.com>
Date: Sun, 23 Feb 2025 22:48:22 -0700
X-Gm-Features: AWEUYZkKtpQE-ikoNHkergZ0s9pBjwLFsXf4FZm76KEbKJCsB32dtuIapPjfgp8
Message-ID: <CAMMLpeRoxAvZGcHmB2B=Z2QU84tbwOfjY71GTudmn0AxasytGA@mail.gmail.com>
Subject: Re: [PATCH] hid: apple: disable Fn key handling on the Omoton KB066
To: Aditya Garg <gargaditya08@live.com>
Cc: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, "jkosina@suse.cz" <jkosina@suse.cz>, 
	"benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 23, 2025 at 10:40=E2=80=AFPM Aditya Garg <gargaditya08@live.com=
> wrote:

> > On 24 Feb 2025, at 11:07=E2=80=AFAM, Alex Henrie <alexhenrie24@gmail.co=
m> wrote:

> > +static bool apple_is_omoton_kb066(struct hid_device *hdev)
> > +{
> > +    return hdev->product =3D=3D USB_DEVICE_ID_APPLE_ALU_WIRELESS_ANSI =
&&
> > +        strcmp(hdev->name, "Bluetooth Keyboard") =3D=3D 0;
> > +}
> > +
>
> Should be make a table here so that similar keyboards who want fn to be d=
isabled can be put?

Since there is only one known keyboard with this problem right now, a
table seems superfluous, but I would be happy to add one if the
maintainers want it.

> > -    if ((asc->quirks & APPLE_HAS_FN) && !asc->fn_found) {
> > +    if (((asc->quirks & APPLE_HAS_FN) && !asc->fn_found) || apple_is_o=
moton_kb066(hdev)) {
> >        hid_info(hdev, "Fn key not found (Apple Wireless Keyboard clone?=
), disabling Fn key handling\n");
>
> Probably change the message here to Fn key not found or has internal hand=
ling

In my opinion, we don't need to change the message. If we found an
Omoton keyboard, that means that the Fn key that we found in the HID
descriptor isn't real, so it's fair to say that we did not find an Fn
key.

Thanks for the feedback.

-Alex

