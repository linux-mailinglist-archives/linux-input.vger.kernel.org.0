Return-Path: <linux-input+bounces-10260-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD51A414B3
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 06:21:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81AB93B856B
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 05:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE98155CB3;
	Mon, 24 Feb 2025 05:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B9n/YiKe"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A681A32C85
	for <linux-input@vger.kernel.org>; Mon, 24 Feb 2025 05:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740374340; cv=none; b=Va2HSkD/8QFv5uM9tzXACwwCbNgeUsttNYC5XNftajMnZWCWqPBs7A2SXyUwVvPUp8FctFPUNq3V9M0qEOn9op69Wx8U8p25xuNL+qzAllWDAIcW/WXUJo01u/Sa5NCqFHE3egb7UtG1yj6P8lsBe/OqAECvCUaj8O2gEXVz2uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740374340; c=relaxed/simple;
	bh=tNnXwYMYI/Ml/g3eoWcjj5rQ/2A/JAJx1nPDTFWiTCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TFvnyIt8HYveEDw1vK/oUC6C7EKMhyHpvKEQgp/thMdlCSJt0cTnsDdDRe7CChz9UUvg2ze7XGDMHlNn7ZTApx5AjwPLbocMSp56/4A2qu1CdZOKTanKhIg7O6bBaA6OKMJ9NJAK930ZfCdXIkZPNi1qFYJGdqP3gbj80RGVwJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B9n/YiKe; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6fb9388f9f8so38248937b3.0
        for <linux-input@vger.kernel.org>; Sun, 23 Feb 2025 21:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740374337; x=1740979137; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tNnXwYMYI/Ml/g3eoWcjj5rQ/2A/JAJx1nPDTFWiTCY=;
        b=B9n/YiKeWQE6nBiWPFOinZMNXBeiDWtEnatK2Da4TpMWdLGwcLQfNTnJ6r7Xq9G1+7
         Zuc+3qmNgJbVL5To3xBDLF24XeviY9LM0owd1z+Pqj+LgIJAELolBcNslr067KXFT/40
         0BBqZ9gLlLfR4qCmNsd4HQ/7OZfFxmb1pKKWy4Ex4sBk2qdLfPPAD2g1rWBcWT2fBHyY
         tslUIdXun1YHeZ+dItJlq9dNdl/NanAUtUhht3FDgHGXzwcq2m2E6mMu/0jLj+QuEQd7
         hcapEgfd78VqjFdNywutQEdlTQJJdYZLhL+hei6WbWwxOOxFuGElreTU1GB1IigZSA2Y
         ovhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740374337; x=1740979137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tNnXwYMYI/Ml/g3eoWcjj5rQ/2A/JAJx1nPDTFWiTCY=;
        b=iJbx02STuoOVLWs47P8UcZa1KKKuzEsUMd9WAiXcZ0Fm4jtsBdyTna56g5Q8vlgoO/
         jVGVDv5yMPdUL2YC82KbJW6sVfV4fPqc143n6N7LAyGAzWURFy8EbY9LZouI+hUNcbzq
         yOyvnnkbIb1LC5G2mKxzV+lEHTCu+48O8lwMjOQ7645rTxFYG7RFnA8zz8DuQs0uK0RH
         hdOj2o3a3bA2iWxvr6N+8c8qgbhE/8/qOWUNmhlllSzgZ6qbclzmJWNVlx2y+esaq22B
         PzV/2w04YTVPPSXidjDCirLlPn5KfqxnDUKax9Xpe4veXVbMuFNWsrWTUDKyxCgNzmov
         44oQ==
X-Gm-Message-State: AOJu0YwVVSrKWrusXeRyZdAoDCHekm0Kvujb7mimQbsjoLng1/lp6GDt
	uDQRr6Gy+68iSvdYv/HO6xyc7XqI8oKRD2saP2sUzlXL8U222kyEs/RW4Iojl0pjLwT9ZlglBLD
	ZIyaZ9HiCS+vekr0XofE5hIsslHs=
X-Gm-Gg: ASbGncu26oVzaCc3Dt0AZ5w5EIO0XrTcYUBanI+s5dgMujqQSB4Cuwn6tUu8oYk0dBZ
	k8xFoV6Wxk5a0WSAeD0z1yYY00oOHaqLQsGK0jKpspMvcjophIhC5PwhTR8xkWUQtIKa6j8SGzz
	hEOGsOpHsJS/SQ70yumcYq9QZZX3I/c31+D8/15IVt
X-Google-Smtp-Source: AGHT+IFXzHMwbN48Bxiq5ByNP7XatI8UvEZswlHys/w5WUbImRMij35BBOPe781FDXsWyUc+HC1BXVk0Wo5WGgE7YiM=
X-Received: by 2002:a05:690c:4483:b0:6f9:7ec7:386a with SMTP id
 00721157ae682-6fbcc7ac34dmr101937007b3.21.1740374337436; Sun, 23 Feb 2025
 21:18:57 -0800 (PST)
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
 <CAMMLpeQDVinMKsRi-u5afKSYzoG=FGgYPsHwibHgheZwHaJSQg@mail.gmail.com>
 <99960098-E28B-4C83-BC52-BF5DEC1A16AB@live.com> <CAMMLpeSaND7MTYYF=uccM_HBYysHX_GuuTp3YSWzV_kx_9D6hA@mail.gmail.com>
 <A58096D0-D8FC-42F6-BCAE-8D099E81E3AA@live.com> <CAMMLpeRg8RhncwwK7yyJsT=8Q7221euMA7=-mySN3YLFpWPQjQ@mail.gmail.com>
 <CAMMLpeReEKgizVQ6Z9=Go2y9djoTBPofbB8vJbPDbjvunuLDLw@mail.gmail.com> <PNZPR01MB4478510C11E2D619C793D23BB8C02@PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <PNZPR01MB4478510C11E2D619C793D23BB8C02@PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM>
From: Alex Henrie <alexhenrie24@gmail.com>
Date: Sun, 23 Feb 2025 22:18:21 -0700
X-Gm-Features: AWEUYZndIcv__t2z1EhOIlYklCJfDZ9J25NFWDVgUN_nm_GDYy_qlGdwYHsEzFU
Message-ID: <CAMMLpeQwAiD1_7Wc+25Gt4UHKwn6vfup+xdvekpEfr2G=-vW3g@mail.gmail.com>
Subject: Re: [PATCH resend] HID: apple: fix up the F6 key on the Omoton KB066 keyboard
To: Aditya Garg <gargaditya08@live.com>
Cc: "open list:HID CORE LAYER" <linux-input@vger.kernel.org>, "jkosina@suse.cz" <jkosina@suse.cz>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 23, 2025 at 10:05=E2=80=AFPM Aditya Garg <gargaditya08@live.com=
> wrote:

> > =EF=BB=BFOn Sun, Feb 23, 2025 at 7:50=E2=80=AFPM Alex Henrie <alexhenri=
e24@gmail.com> wrote:

> > fnmode=3D0 really would be the better
> > default for the Omoton.
> >
> Removing APPLE_HAS_FN quirk seems to be a better idea tbh

I agree. I'll send a patch shortly that will do exactly that.

-Alex

