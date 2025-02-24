Return-Path: <linux-input+bounces-10268-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A974AA4150B
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 07:01:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 50D6D7A2924
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 06:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 703A028DB3;
	Mon, 24 Feb 2025 06:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+FwJDvm"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56A043ABC
	for <linux-input@vger.kernel.org>; Mon, 24 Feb 2025 06:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740376901; cv=none; b=mP8lvhmSpGBjJXv4y8nFAB2ns9U9TfPZ0QWlBcLTpSmjAtu/+87vQj3MfH0BxwuwZ/4x0XbT5Vg30lZIL9Okx/ob6GmOkcOThw0xtbY7nZG6g2IgEg8cjjHFjpT9BybURjFepD2MF0XHsaI84hCbadM04vD0mk+EjYAV07mkzEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740376901; c=relaxed/simple;
	bh=N44fmTY1TFHpAr6HwC95artTVPZYY6tlrun4Ng/4E4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=luEOGKNx+2QkWq0G1kogpUmmHjlM/aBLlT3l8aq/ZeLmIdpqtesnrZZUv+5EBdOuaIfGWbE9hFiSjLFnlv4YhZzYcjczYp8qcXWEsAPl1L/92qZiJjXb035VRl+ytp7tbwvVYxBbWjW6MMxxcRGFMMPwBZ2t6L/Qf8vICtswb6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+FwJDvm; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6f9625c0fccso33400507b3.1
        for <linux-input@vger.kernel.org>; Sun, 23 Feb 2025 22:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740376899; x=1740981699; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZFTxMu2op6oy1gswaQ051fMLoJ9zWxXdZaJYAi4Se8=;
        b=T+FwJDvm9qgVZ4eR+ekJ3mtwF8CTh2a3qhzr3GfNTu7BS/6BtHDIW6sCrqGxF1dWHZ
         XwdhVUZFOW3UHumncEKylkASjXFsdvWjzGQbgow3YbD7oTXZV5B41T84LHi8dTto7CSw
         uiFqfiCcXoSLoFN8wf7vwZjvhB8aeebt/mpYMXcTVJObK5tcimIqiF1y+UC3p0jJRgRe
         dmPKxYXN02pwMWgFuPAZiydgEvErXvdZjcmguPW/VWgkKKCbkQAAL269QwYJj8d2DPYt
         j/S5VbAuUqeIneS6JcPYrnIgbDpiqoaDtbHP2Xwvz7WpXXZQ5xv5zpndNxIMijmEvwCg
         Ze3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740376899; x=1740981699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PZFTxMu2op6oy1gswaQ051fMLoJ9zWxXdZaJYAi4Se8=;
        b=u1z769IIl+pnidQbY45JMg6eUkO8UTptetaNsZWA8RWK93Y02zIep8rn9yiZjzZ4fF
         HPO/Ap1qKUdnBG9K8DbNwSh3UmYthsjCsjQhKmYS90myeVAFu5qE2ojoiuqlPQtWBHn1
         fq++BwMB8tcLmqI8+0flEpr3AD0J+5rj1wmHhe6L7yUHqa3zATQWWg6sydrR/B2PlJ/k
         sCoXFX/wU3Wy43kipVco+42xbjudPzeJsv/LeWZtlDWFUuRmouHhdYSQ3BTrlYcEpVkD
         moXkdgktbT+awyzVGvx12itLxAIJ8G2wJGcZNrhhZgS5Rv+7CP4eaabnuHH4wvmT4cwI
         R2mg==
X-Gm-Message-State: AOJu0YwFY3zxwtzx91O6ofBNgpttGDy+/g87oO4xjjKfaHwsayfJAwFS
	eLMgw/m2RTjyLVxP32LFa53w3R0QSK2+QhqpRhcbYwlkL+I1MBsTdsN2JS69orMp78+2VND3HI0
	rDK6WlUpzEF/57lOs85hXyaMjEQg=
X-Gm-Gg: ASbGncvEy2pUXch3wX4FurqIWWDngzvgsvCVTMgxfr/uT24G9GZo02DiYmEaUKpfzcB
	i6qnR1Wtkak34TDwEOtWkY3W/P9YSqcY2ym6XSTpUATb14ACaWXXSbXYroKZAdNplReTAZJ9hFp
	tNyTg5eA8RUoznurRg2199WcleYxa+g9gDdrOlbqII
X-Google-Smtp-Source: AGHT+IFjuVObwB/7WLZMdT8R2L1wi/ZEeNI9uE7uTUC8R4kFOCp8GymJY5DtMMpEGeiN3Jrgh/lAwYqcopJH+fk9wWA=
X-Received: by 2002:a05:690c:67c4:b0:6e3:323f:d8fb with SMTP id
 00721157ae682-6fbcc244171mr103997807b3.14.1740376898740; Sun, 23 Feb 2025
 22:01:38 -0800 (PST)
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
 <CAMMLpeReEKgizVQ6Z9=Go2y9djoTBPofbB8vJbPDbjvunuLDLw@mail.gmail.com>
 <PNZPR01MB4478510C11E2D619C793D23BB8C02@PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM>
 <CAMMLpeQwAiD1_7Wc+25Gt4UHKwn6vfup+xdvekpEfr2G=-vW3g@mail.gmail.com>
 <PNZPR01MB4478184BF3EBAE540C876EA9B8C02@PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM>
 <CAMMLpeQ_pT5310atonw2-bs8Zn9a+Uwe_Pb16WQ3dV8SG6vZbw@mail.gmail.com> <B5111ED6-6D0F-4DB5-8258-5297887EEC32@live.com>
In-Reply-To: <B5111ED6-6D0F-4DB5-8258-5297887EEC32@live.com>
From: Alex Henrie <alexhenrie24@gmail.com>
Date: Sun, 23 Feb 2025 23:01:02 -0700
X-Gm-Features: AWEUYZlICtatLhde2As3a7I96CyCFyn8T2c3sFmJB2zCuH-N2JkXiyz1dMrybPY
Message-ID: <CAMMLpeTzikyL49_P9GJpqY3aVU-_QWr1AuBjzTgbcBwWwjyU=A@mail.gmail.com>
Subject: Re: [PATCH resend] HID: apple: fix up the F6 key on the Omoton KB066 keyboard
To: Aditya Garg <gargaditya08@live.com>
Cc: "open list:HID CORE LAYER" <linux-input@vger.kernel.org>, "jkosina@suse.cz" <jkosina@suse.cz>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 23, 2025 at 10:47=E2=80=AFPM Aditya Garg <gargaditya08@live.com=
> wrote:

> Could you see this patch btw. It also addresses some minor code style iss=
ues in the driver.

Each patch should do one small thing. Style issues in unrelated code
should be addressed in separate patches.

> +               if (strncmp(hdev->name, non_apple, strlen(non_apple)) =3D=
=3D 0 &&

This will match any keyboard whose name starts with "Bluetooth
Keyboard", instead of keyboards whose names are exactly "Bluetooth
Keyboard". A name such as "Bluetooth Keyboard 16" is only possible if
the keyboard is a real Apple keyboard that has been renamed in Mac OS,
which means that it is not an Omoton.

All in all, the general idea of having a table like in your patch is
not a bad idea, but like I said in my previous email, it seems
superfluous at this point in time.

-Alex

