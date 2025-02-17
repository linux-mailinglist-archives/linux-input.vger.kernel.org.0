Return-Path: <linux-input+bounces-10084-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74313A37A5D
	for <lists+linux-input@lfdr.de>; Mon, 17 Feb 2025 05:14:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79BC63AE813
	for <lists+linux-input@lfdr.de>; Mon, 17 Feb 2025 04:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9911B5C603;
	Mon, 17 Feb 2025 04:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q63dwk92"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051D82260C
	for <linux-input@vger.kernel.org>; Mon, 17 Feb 2025 04:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739765644; cv=none; b=Wcs8S4XydeiHnPLJV5UxzEuuXrpsQ+HoPQzjRmIxJ0VT7KwaLZpAmyFu1ZxZi1t90HCh6qbPluUk/mUY+QPIQxPJ3yB72rTo7gU0A4vtVwwjhoWN3LJHwfXc8NsATXU1cXkJ3lHA8/ZvWfEqpWvpXZJxlITfrVrsNMgQIGKBH6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739765644; c=relaxed/simple;
	bh=WNF///oyCq8UoMdRKqabyfZ7RPoA/9gWKUeE39vCWkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZZReq/sKohwpezdyg0j+P6DakKqbOu5QbwyV0hUgHfWxzLPKszA5eFcNEXzCDIh3dK9BnVL1N/k6B6Vx6AcackEVI5hYZ5ksTKSvODjfPNKCaLpxsySV9wOgyfnjgioEIC47DVw0jtvYMRudE0F5JjBnQKEIfxm/ygB4kWB6Nxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q63dwk92; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e5dcc411189so519653276.0
        for <linux-input@vger.kernel.org>; Sun, 16 Feb 2025 20:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739765642; x=1740370442; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNF///oyCq8UoMdRKqabyfZ7RPoA/9gWKUeE39vCWkM=;
        b=Q63dwk92Y/I72gcjxVYoeMDxRPTm6y92qI+9Sb8YJLMWDQ3CP3ucNtia9qqLqqq/zH
         aOClwo4dL5ZIDZfOR4Ef3WUzpoFMdyOq/ZH9edsH1HvQDRGqwT6wz8+TnET5V32pY/kv
         +HWkT1lhgkMFSPbkWQC2x/nqVYJbfy96AavthUNoCfyykJ0997pKw1N2jTt8QalXXsZp
         WcxYlSCBiMy8ocCFNgeMnw2RLFkrtVTcnfYoYSW7VmUjeb6UgN3uEzh4iJ4vtJk4sgOq
         sM1ckAw5k1JPFD+a7oGni/PfNgnVIPIqTFnBphUoi0HYIXEC8yvhlRcN52/WbtTy3eao
         ICrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739765642; x=1740370442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WNF///oyCq8UoMdRKqabyfZ7RPoA/9gWKUeE39vCWkM=;
        b=e3aHrVWJGe4niGdMepHq/KcQTam6tDbhD1spE1zQbGOXv5gA9knb2OCnE/+I9I1vbu
         VZV/cspT7bR20zTJa47z+Tqq218n6KMqYzuRBIWtxiBU89+eWHlQg8giJY1JlmP+sxWi
         iVVFXYNopy/qHFC5jUhp4G9neD+BFiQ8PpCK9W1P9sqw00z+oogwM2k6bD+mSmiIMJqs
         ycm75H52V0AiHfxEHFlaBBB9i4ySeXPY2/hWBqKM+Tzki7nGfAPF7zLT2cvsvZdqzYUJ
         HbYNnbBiTqY6hgLFk03yeBkXi7qr5f5Y5TKkIinE/MNX0BXk0yaTMgyCa6DPbVT7KYUt
         w9wQ==
X-Gm-Message-State: AOJu0YxQdlcJ+FFxTi6fMS0f13qBzocHDMZFNW5xIEfDQ47RhHWcGF+D
	HwAMMoC8Jw0Ya+lfJBq+xy6XmiycckX3fWsNee6Tm6AMjshwq17yP6IjUj7H8MqVWf+CNzNANps
	OsAk3wO1k6mqjT5iB76KfgNTjS4I=
X-Gm-Gg: ASbGncvUy8rCabm/qKn9Ogz5yauh8p67Evcvuvjifrlt5qFKKOXCQqpveql+bsbkKUH
	OX2b+3s3M0LH2jSkZoLRJT8trk4m7Kyi7wckJn8u7sbeWJkmbpypJkd/SPafMaTcrai2mzmFpp5
	pcot4vYeMXrYUtg6Q53I6aYbaubhJzog==
X-Google-Smtp-Source: AGHT+IHB7HfCUkg60qPU+GPHeS5oFQr7tTVpNWf2U/YbABOsJNdtZNwKp9bSgererUgvYc+63Ad0vbDWpCcbt9K+o6k=
X-Received: by 2002:a05:6902:708:b0:e5d:d6b8:231a with SMTP id
 3f1490d57ef6-e5dd6b8259bmr4056261276.34.1739765641873; Sun, 16 Feb 2025
 20:14:01 -0800 (PST)
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
In-Reply-To: <67482FB6-C303-4578-8B3D-6F4A4039D379@live.com>
From: Alex Henrie <alexhenrie24@gmail.com>
Date: Sun, 16 Feb 2025 21:13:26 -0700
X-Gm-Features: AWEUYZlhBcttOCh8oAXJJ92CpUuhLFY_IEwT9tNoEAErxOnqv43pHR_PceZcZzw
Message-ID: <CAMMLpeQDVinMKsRi-u5afKSYzoG=FGgYPsHwibHgheZwHaJSQg@mail.gmail.com>
Subject: Re: [PATCH resend] HID: apple: fix up the F6 key on the Omoton KB066 keyboard
To: Aditya Garg <gargaditya08@live.com>
Cc: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, "jkosina@suse.cz" <jkosina@suse.cz>, 
	"benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 15, 2025 at 11:06=E2=80=AFPM Aditya Garg <gargaditya08@live.com=
> wrote:

> In case I am wrong, can you share what exactly happens in each mode with =
fn on as well as off?

In fnmode=3D0 and fnmode=3D2, F1 and F2 are F1 and F2, and the rest are
special keys when Fn is not held and ordinary function keys when Fn is
held.

In fnmode=3D1, F1 and F2 are Brightness Down and Brightness Up, and the
rest are always special keys, although holding Fn changes some of the
special keys to different special keys.

In all modes, Home becomes Escape when Fn is held, Lock (which is
actually Power) becomes Delete when Fn is held, and F6 always sends a
reserved key code.

On Sat, Feb 15, 2025 at 11:45=E2=80=AFPM Aditya Garg <gargaditya08@live.com=
> wrote:
>
> I think its best to disable the internal translation of this keyboard and=
 let the kernel manage it. It can be done by implementing a fixup table tha=
t first translates all the media controls to their respective F keys, and o=
ther similar internal translations, so that the keyboard can mimic the orig=
inal Apple version. Like the all the 3 fn modes should also work.

The trouble is, we have no way to read the state of the Omoton's Fn
key in software. The Fn key is entirely internal to the keyboard. I
even looked at the raw HID reports with and without Fn pressed, and
there is nothing. So either we translate F1 and F2 to Brightness Down
and Brightness Up (in fnmode=3D1) or we don't translate them at all (in
fnmode=3D0 and fnmode=3D2); we can't conditionally translate depending on
the Fn key.

But for all the other special keys, what you are saying makes sense
and is a good idea: In fnmode=3D0, we can translate all of the special
keys to be ordinary keys, and in fnmode=3D2, we can translate them to
their opposites. For example, if the keyboard sends Volume Down, in
fnmode=3D0 and fnmode=3D2 we'd translate it to F11 (because the keyboard
only sends Volume Down when Fn is not held), and if it sends F11, in
fnmode=3D2 we'd translate it to Volume Down (because the keyboard only
sends F11 when Fn is held).

> Also looking at the keyboard pic on https://www.amazon.in/OMOTON-Ultra-Sl=
im-Bluetooth-Keyboard-Compatible/dp/B07S7VPQG6?th=3D1, the translation tabl=
e for magic keyboard aluminium seems quite different from what this keyboar=
d keys show.

Let's please not change the special keys to be different from what
their labels show. For example, F3 is Search on the Omoton KB066 and
Scale on the Apple A1255. Personally I wouldn't even change Power to
Screen Lock to match its icon, although I'm okay with changing it if
others feel strongly.

-Alex

