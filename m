Return-Path: <linux-input+bounces-10258-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D3FA41482
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 05:44:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69E1A16D796
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 04:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3CC51A23AA;
	Mon, 24 Feb 2025 04:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ua2IdM8T"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCE443ABC
	for <linux-input@vger.kernel.org>; Mon, 24 Feb 2025 04:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740372290; cv=none; b=L/yr4DmWIU8akcIt83AwD0ZdluAj9suq6kEfb4d+BB2SpOmkYVpZ8yAzsLRYEuNnTK6J/pGfLx/rTFGCN0YaGgskg3EaG5C1nDgq3WgzaKryqSISMAgLkC1rp9fp5q5c4ydkHXNRC+2h5hS3ZBp5TLP59pMG+FNa/tjA2N783EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740372290; c=relaxed/simple;
	bh=OBZOYWfpZTUn8QhipfO7F7Nu/QkSYUusAgwlZc/JDRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E4WrN67CJVp/xc2MKXKAj3xVZbXibAs6D+BIQkkOhEhmh3LDiKv2nszT3LkaHLOh2UzFIypM6G7e6BpU6XZFq6S+Ezv3q1GUm4VWNIf+pwJ/49uc5IjfhtKWGqkK1DpAMM/eVrmnXYl0sPCIGJFXmGQGpy0PlE19v3Gjw5wV/es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ua2IdM8T; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6fb73240988so25222287b3.3
        for <linux-input@vger.kernel.org>; Sun, 23 Feb 2025 20:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740372288; x=1740977088; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBZOYWfpZTUn8QhipfO7F7Nu/QkSYUusAgwlZc/JDRk=;
        b=Ua2IdM8TEI0rTNBp0hfIjXMWXOME4K94EWP2rM2reY3JwdNLcrmDv3PCBKJMvNvwmE
         HBX822iQQFWAAKx4h866OyEDkEsxRAYvCkfBLhJNBoLoCq2pY11pOIxGqemdmiLkIEMq
         IrOLT+rUfNp7yLtx6TEo+S3o806ovC5mwudWji5Vhz96Uf14g18R146Lv5jFD0kmunvs
         RqIY0vuBwUQm37N+6cRE7ZoMSQg8fDNEAD+Z+VijAQLzasVrjXbxO+P7ln3G0QgN9qdM
         yWd378GX02Mm1ZohKKxGPG48tmTkKfl7Qtr4CsHOn+yMiuDMb69Zla5CAcUTyrbvjPuT
         yyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740372288; x=1740977088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OBZOYWfpZTUn8QhipfO7F7Nu/QkSYUusAgwlZc/JDRk=;
        b=aVFQojmhqJqQOd2Owhf8oX8fgIxa4aFFAXOxzEHWSgDB2heNYdiYPCU+d+PgnI9QqV
         p6mF6Gud4WaU0IEkwJT28+wEbwqSOpuh4/vQ+Sl7XGrdKAVxHzhoS48c/M1yuCVsfrjl
         11v7yI7Mz9sUVmr+pDdvCVD1UT+kpg77rCecFpp3Z2hvrJxZOwlFhxBUxZDs1NRY7QP1
         LrPs/oy0geR4ZWYXS0lA325vX4u3PcIp8mFKOvtfc7YleLF++bql1pGuaoVc+ZheO7ln
         WcOUzeRC2dF/f+jdJAeuuA08gI6eVwwOAu1I2t4xq8mZhF2SeAksCdm3FlyiAXQgjMRN
         69Sw==
X-Gm-Message-State: AOJu0YzN2Ib5aU7Rjfr5Nq81tWnH/8KC0h4Q8Ln0vBsZc7UIn7rhMYz2
	K+Cx31azn+N+UfsEjZ3Fr/aswTG0xX4UXpm4RjzPGpCXMgoe7XrvlUPETvQf5lTBmd11/fJ7zCx
	c1iacpG6xoSto/e+S5HEQUjkWhZDLVg==
X-Gm-Gg: ASbGncvh4B6/9f/ahCgwaQt7ot8w2zyVBIQJduCtxN8obUGUfcN+iCCXyljwwnOdzlR
	DLN/L8TOB0TRhg2tQUW5A6JrpkGOX7GZBhmdaB2I39+KTL8p4QitQNMusikvhOYL6vPXbhraUH2
	d8Yf9R1pOFE+rfC4e7axLOe2fQnnAcP8je5VqCL5tn
X-Google-Smtp-Source: AGHT+IG/Mgl8HluzmHfUjNsW4i4ajkmw1K5Y8M1fZccFWgmPmxd68x28u95td1BSR+BhiDLyF9xuXfZMCG3Uy3VQcMs=
X-Received: by 2002:a05:690c:360f:b0:6fb:5019:7a1e with SMTP id
 00721157ae682-6fbcc23a229mr98330927b3.13.1740372288074; Sun, 23 Feb 2025
 20:44:48 -0800 (PST)
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
In-Reply-To: <CAMMLpeRg8RhncwwK7yyJsT=8Q7221euMA7=-mySN3YLFpWPQjQ@mail.gmail.com>
From: Alex Henrie <alexhenrie24@gmail.com>
Date: Sun, 23 Feb 2025 21:44:12 -0700
X-Gm-Features: AWEUYZlUiPZaaKRkrZDLYGBbLP2bKgTnJ_YbdS7kIQODP7tHcrYgsx26rLrrcKo
Message-ID: <CAMMLpeReEKgizVQ6Z9=Go2y9djoTBPofbB8vJbPDbjvunuLDLw@mail.gmail.com>
Subject: Re: [PATCH resend] HID: apple: fix up the F6 key on the Omoton KB066 keyboard
To: Aditya Garg <gargaditya08@live.com>
Cc: "open list:HID CORE LAYER" <linux-input@vger.kernel.org>, jkosina@suse.cz, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 23, 2025 at 7:50=E2=80=AFPM Alex Henrie <alexhenrie24@gmail.com=
> wrote:

> fnmode=3D2 is equivalent
> to fnmode=3D0 on the Omoton.

Ugh, I just discovered that I was wrong about that too: In fnmode=3D2,
F6 is still converted to Num Lock. fnmode=3D0 really would be the better
default for the Omoton.

-Alex

