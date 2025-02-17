Return-Path: <linux-input+bounces-10092-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6BEA37B9E
	for <lists+linux-input@lfdr.de>; Mon, 17 Feb 2025 07:42:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9E777A204B
	for <lists+linux-input@lfdr.de>; Mon, 17 Feb 2025 06:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3C8918F2C3;
	Mon, 17 Feb 2025 06:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k2ib7WJW"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCCE18DB3A
	for <linux-input@vger.kernel.org>; Mon, 17 Feb 2025 06:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739774562; cv=none; b=EQ+Ok5EaPwKRBh1m9K3BswD/gv92Dl7xb73+RVT1wjncLzNByOh7dQmlmqnqD8uRv6kpWNf8tUdm9g/ieEUGA6TJ/1VaWBIAMftpbrycjYvkm98YQLvZjCh0wgoYlZKlkhQksnNc6hhf+G7ChOo3CYnHcZLZ9/t17PRIJRurWpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739774562; c=relaxed/simple;
	bh=ofDVVUVYDd8OFohxZP64eLr6VG7FCwqZ8Qpg4oL7RHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o66XaIB4P+kiGcxo+I/tT0KD9jqr9F90n+rI1umXkFbwCOiiyktr07oG1w1o175xA4uC+x9mick4e50abbIQc73cD5Opa9LEvL6ZaXPVVDwYEfs5OGzTb/WkC0epOyKqvi0cdgbrUi5njrCyqO72mKxxYwPYDWHaGSITJxDJVsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k2ib7WJW; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e46ebe19368so2950870276.0
        for <linux-input@vger.kernel.org>; Sun, 16 Feb 2025 22:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739774560; x=1740379360; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ofDVVUVYDd8OFohxZP64eLr6VG7FCwqZ8Qpg4oL7RHY=;
        b=k2ib7WJWFf3tLXYbwrUhNTfGavr/ozFf4A+c/gGUIFu6m/sl/vWI0/Bt5p0azQE+VV
         SK75v26v/WmideUlA5EXoQME5JyeKFkFUHYT3TErtpCN8W8rf0IxJv6/qJoyEabsP5sh
         v+iCoAHMWbmkQnF/4xFx100Mor2XC1YLcfjzvYR+DW2s/JQwjBvrk5utBKxPQeV62tGE
         TAw8rQW4dMT0gnNfrbWJdzyzzki8kz3ysaaesnwk9ey2DTVkXB/H7X4Ue5Wd1WQq1NGw
         KlwkENVnCD0sbAlA0iXfUxscFAw5kXo8b4l+yu3TW1g1/oPzwMWN8ZoIfXg6LmTcYJo5
         iAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739774560; x=1740379360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ofDVVUVYDd8OFohxZP64eLr6VG7FCwqZ8Qpg4oL7RHY=;
        b=CS6gPLKT0bEFWs87+zQJpgg4a+uoDsqdo1rKGeCOpTIr1OHnu1ErFM3hMRn1v0e4h7
         FcMIsvF9O/dQL6hRa1nrr7l4zUKsnpK75EjKuFNx5Aef431aP81CoqsHMCX+S8PwKG9G
         sHFzOqhEJproiFWEZ+j3eOy0WOeH4juE9Mgr+Al+7ISLbmLewVWsCdO6IJPh8MnQFHKR
         K6+Cnjf7jHoFhQkQ+ljviIlAapXzHtWOUpcgdUuZqujp2CKe5+DU1uvWnUTc2BunMcSg
         ese9MhaN3bK27bFzVEIUNSzgU+BtaTJhH23F1PZvgu8InB4ZCOMGtkYWE1ing8OQ5/wr
         tycg==
X-Gm-Message-State: AOJu0YwalpTDrhH4c11BEAzrL7yWqpGTfXNbRfef9GF4037/SXQQ0Bip
	qQjGp2KsolHzvd736QiXNvXGZ1SXoXbAMMYbdJzIdKTAC15pwDMtLFlizip+GR+9iq23quixW9M
	zKKjnqtt54oviDT+BI5T/LvbCFWw=
X-Gm-Gg: ASbGncuJI73KVwCVbrS3LTs8a1/YDagMr1TeEEpdJWgOYwKNvUcUG/rBIQa0Sttbs2X
	dFIDVI3hw5lDM/gcVhZfZhfiOu9KPtMt+pOuIFUhkop9UONYJQiydfFN5i0Yqd2VHfg/SgxXV8q
	LrYZcYTQ3TDO9DIsLmgPRBrsEOAOAWyg==
X-Google-Smtp-Source: AGHT+IFK6yddIhfVcNU1Tx8tE2fr9HCt5eiw3yqgGgwOyTRViNgd1JU1E1XKKoN6QRtO5raI6ElX02d4Z1Or2TfAY3c=
X-Received: by 2002:a05:6902:845:b0:e59:dbac:d993 with SMTP id
 3f1490d57ef6-e5dc9043ed6mr6524635276.17.1739774560172; Sun, 16 Feb 2025
 22:42:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001055146.543800-1-alexhenrie24@gmail.com>
 <20250117061254.196702-1-alexhenrie24@gmail.com> <3137A636-3FC2-4016-BC64-F5CEF308F834@live.com>
 <55B3D2BA-F363-4335-820F-21DB90312CD2@live.com> <CAMMLpeTgY0pnAr9Q=_Dc4iUWkmZc3ixGU656CK+KU8qY2sLBsg@mail.gmail.com>
 <F209BEE2-29F0-4A0B-8B94-2D5BFA00AC90@live.com> <67482FB6-C303-4578-8B3D-6F4A4039D379@live.com>
 <CAMMLpeQDVinMKsRi-u5afKSYzoG=FGgYPsHwibHgheZwHaJSQg@mail.gmail.com> <99960098-E28B-4C83-BC52-BF5DEC1A16AB@live.com>
In-Reply-To: <99960098-E28B-4C83-BC52-BF5DEC1A16AB@live.com>
From: Alex Henrie <alexhenrie24@gmail.com>
Date: Sun, 16 Feb 2025 23:42:03 -0700
X-Gm-Features: AWEUYZmoTwrgGujwKIgeeC1MqF3mx4rauUuNx01VABEtHFm2HSIahucgMi3-O6I
Message-ID: <CAMMLpeSaND7MTYYF=uccM_HBYysHX_GuuTp3YSWzV_kx_9D6hA@mail.gmail.com>
Subject: Re: [PATCH resend] HID: apple: fix up the F6 key on the Omoton KB066 keyboard
To: Aditya Garg <gargaditya08@live.com>
Cc: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, "jkosina@suse.cz" <jkosina@suse.cz>, 
	"benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 16, 2025 at 10:18=E2=80=AFPM Aditya Garg <gargaditya08@live.com=
> wrote:

> BTW, are there any differences in HID reports if Fn+F1 and only F1 are pr=
essed?

No.

> You also said F6 shows a reserved keycode, which IIRC, you sent in a patc=
h to translate to F6. Is the keycode same with and without Fn?

When Fn is held, F6 is plain F6 and no translation is required.

> In case you have an Apple A1255, could you check whether hdev->name is di=
fferent from "Bluetooth Keyboard=E2=80=9D. We don=E2=80=99t really want to =
break the original Apple version just because of this defective clone.

If I understand correctly Mac OS sets each Apple keyboard's internal
name to "<username>'s keyboard" by default, and that's what mine is,
but a user could conceivably override that with "Bluetooth Keyboard".
It's also possible "Bluetooth Keyboard" is the name that all A1255's
had when they walked out of the factory, before they were connected to
an Apple device.

-Alex

