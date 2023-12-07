Return-Path: <linux-input+bounces-583-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB58808391
	for <lists+linux-input@lfdr.de>; Thu,  7 Dec 2023 09:53:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35F8C283DE6
	for <lists+linux-input@lfdr.de>; Thu,  7 Dec 2023 08:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B4D218E0F;
	Thu,  7 Dec 2023 08:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iejhpSNK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0520910B
	for <linux-input@vger.kernel.org>; Thu,  7 Dec 2023 00:53:12 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-332fd78fa9dso608641f8f.3
        for <linux-input@vger.kernel.org>; Thu, 07 Dec 2023 00:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701939190; x=1702543990; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K5+J2LUrKF38xRqWK50x1df9pbzlgKrpyAn+HVZYCqU=;
        b=iejhpSNKhVdDkNDn13RLsYeEVR9isVLQDJ4wPPCR3ByDvpcPWf5U3kF5nFXWd4HztA
         RB0TJy9qX+RPnve48IP/BGNaPBbDqQcg9YK9aHtncyOaBfXCBi/G1yIorTDQptI/7xPN
         /hr4h0MfoxL4hJKRhFb808KcKkJsSuDK6DeX0pSv3baBSgdhdpj41Rv0HP82SZc28jD8
         +qBJZ9dDFqmzx9048lKemIhr9C+0P4KeDHy/iOg1QbsKPMW8vdlrcqMvaUBwQ3/LITVS
         n+QfkN3b1DhMqlbeMedwlxwr3Z3s74CmDi40ACRuws/3Eozq6qv5UeP7YpvncTDVuDbd
         hZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701939190; x=1702543990;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K5+J2LUrKF38xRqWK50x1df9pbzlgKrpyAn+HVZYCqU=;
        b=LPiWEMpOS95MV0YoPz449omF04N0hD2XqygD0blRySFuuNFojq65Xxm+YBkig2+NFa
         FcY/egXVDSNKT3ugY6hhcSxaaQo1qAPOQiQox50Lo6EO6aCUrzQ0a/x8xwwEYsdy3sd8
         k5xdcp7GLNZCD6fHDXlnNUgcAVnQs6XRJkiGSjvglLkZh6hNRMAvRtyn940arNsCGmbS
         0ULlA8jDZLBsSybpycADyhFkZupaX+gMRi4otWPFdYXnTaJfz/LajvJKBdD28EvcwKyq
         dxSUizQdV9pJEWZdlkvbIDBCTpz59lNPxm139qv1TRfJZfSpC19SZeIwzd8/TSxxGrMA
         EicA==
X-Gm-Message-State: AOJu0YzU2Cpg8+quqMvvXeVkAFxWgA4cCIqEtQEc/cSJOoDUsCh/9fzI
	/sHyvZp6wXl7Uf0qzVso2VIEPqZmQHQ28VwZ5F4E5J2a
X-Google-Smtp-Source: AGHT+IF1T8EGh1FmJg8sp2rx3AngJe3zTw6TX8p3d+RV333bb7BNd9mZRo8tEWbsjsxfaHDg9bb4zD1gDGL1tEbmAZ4=
X-Received: by 2002:adf:da4a:0:b0:333:43b5:6ec0 with SMTP id
 r10-20020adfda4a000000b0033343b56ec0mr703839wrl.114.1701939189998; Thu, 07
 Dec 2023 00:53:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFR=A7mFbMH9xt=FnzQzeZUtYv0AAMK=9DfPaBNcttpFj1z7Jg@mail.gmail.com>
In-Reply-To: <CAFR=A7mFbMH9xt=FnzQzeZUtYv0AAMK=9DfPaBNcttpFj1z7Jg@mail.gmail.com>
From: Kamil Duljas <kamil.duljas@gmail.com>
Date: Thu, 7 Dec 2023 09:52:58 +0100
Message-ID: <CAFR=A7kPqerLy_7_XcyuG-GDiYKr64bpRJUYw0LnbEi3G1p1Vg@mail.gmail.com>
Subject: Re: RMI4: The RMI4 specification not found
To: linux-input@vger.kernel.org, dmitry.torokhov@gmail.com, 
	Andrew Duggan <aduggan@synaptics.com>, Christopher Heiny <cheiny@synaptics.com>, 
	marge.yang@tw.synaptics.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It nice to update this document. I found a problem with out-of-bounds
memory during probe device. I need new manual to create issue.

Kamil

=C5=9Br., 22 lis 2023 o 21:46 Kamil Duljas <kamil.duljas@gmail.com> napisa=
=C5=82(a):
>
> Hi,
> I would like to become familiar with RMI4 driver in the recent linux
> kernel but I couldn't find a reference manual to RMI4 specification.
> On the net I found an old version without the f12 feature.
> Follow path: drivers/input/rmi4/rmi_driver.c contains link
> http://www.synaptics.com/sites/default/files/511-000136-01-Rev-E-RMI4-Int=
erfacing-Guide.pdf
> returns 404
>
> --
> Pozdrawiam,
> Kamil Duljas



--=20
Pozdrawiam,
Kamil Duljas

