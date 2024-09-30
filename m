Return-Path: <linux-input+bounces-6904-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E71E98A1EB
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2024 14:18:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 364101C21B65
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2024 12:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4045519047F;
	Mon, 30 Sep 2024 12:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aStAWMxj"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD40F18E341;
	Mon, 30 Sep 2024 12:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727698145; cv=none; b=tY1Vfl5O/kh3/2yxp2lyudqR04A6FRYeWyEIn+7VaRmoZnMhmUn0CcJY5Nn0xzhKHPcCutRmd8ktaC5RUhG+zx6pKuz1P5usFfiD+Dcju7RN90vCW4dId4Gq6nIWUORDBnol7S+CpBpvlw3rJcM/Ma4CEE8eeFNH9g/6uP1eKn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727698145; c=relaxed/simple;
	bh=v9q3x7z8QvhX052EYW3xZ+X0Rw9aY0rzg99yCATyEtY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aOfPCpIFFQQGdct2prJzi/pWmDiUSS0BBTkvkjMkGBrLK+xfV7wP+W0223Cv8sQp9dgprRMaeuPdr7lMXRndpG+HfKSmJmtVezaAYIpwRl7mXoi8ymDcvH9BRZamMQiZPDm8yCtXt57ypx8ZJtrlc03D4tJnXkMs3yicR23NqRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aStAWMxj; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7db12af2f31so3564495a12.1;
        Mon, 30 Sep 2024 05:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727698143; x=1728302943; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VLCfsAOM/sf8jX6lMsEq45E9J6koxN4fTvlUf2fHSJk=;
        b=aStAWMxj4akqmcYkxAIgo29WES1QOgtpxwKyKtEW4u863G5DaSCPG7MYV+plkG3B7m
         cP/IiVcU29My4iRaCrGWaeac9ZZRQvfIW1VdgXFrj5OmEqfPBKIcbMrS0EYT2TkZ1+Sx
         DZe1PPwGs/zuvRSiBjevwbgJXJ9av/fsL2Xu5etBEa54aTQMh0RiLTbBCwfE7PT07iFD
         UGTEqIb1Ktj8bpAoqibf5C4gydYNXW21zWMV4gEUBQZBZDTS5Jq52wPaT01w7H0y7uwi
         Ml3YGjewK6LvsgKpVU+BtykUN6yOAIaGccE+4VXhuyCpZZtSEeBsZF5ZrFQbPYurWBzv
         e0AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727698143; x=1728302943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VLCfsAOM/sf8jX6lMsEq45E9J6koxN4fTvlUf2fHSJk=;
        b=YhTbgw/0HWWQ6m4TwzDSlbm8FZMKjE3OjjMTMyB1n3ZwmDUGS6cClaj+JHPJpVWNIn
         CXnjd+NVa5k4jlXFWgh8GLhhSVt6EUY2r1HeB7Oi4wNFQggxRFJDoBroONKWLOJTzjSV
         LrCsAtmQvjnjshhnll0ZLHsZW7Gzea1LKyOoMdEq1c5+ubpxZWGQQrU3InmUJtCMWVRC
         7IIMwGNIK9M0/cnd+ckvI/r8iil1ubAg9njzDT5OtsWxtRE/VNURY48SINKaAtmnAhwf
         KKkkU4HQuDy1TMyuHfZuZpdBW0NYnkfXAHBJJGGd0h6HRLP+Ok2b4vGPOYbcjvOxOUkL
         qG9Q==
X-Forwarded-Encrypted: i=1; AJvYcCW58Z7zinNPvfR86HbOozRihili0kdGT/yZJ5c4WX/bsT/WrUh3Aq/vCLCZW3zwP76hyIV8uF0oUoaGDyeG@vger.kernel.org, AJvYcCXLBURdbW8Z0vDuzP9/OWikxn2yQ3d0uP2Hx3/0L7FMXO6T/KoedVzpp2x69Gvzd6XhI6ypZ5jvoGjCoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSbAybi7ua6vsNv3Phxz/nULteilCGDytwC8RFDfb+0Os7HlLH
	XyfDr0hreshqMtegAfB6G9RApy4EU3dO0hNufuG1MQJy7A3fCSgCJDOrMVHY0bO7YUMG/W4/HN5
	prqwF6Kqrkxg9neuQnvb+u5gsa3YobH0MKgc=
X-Google-Smtp-Source: AGHT+IGVtNKUzCfcnZJqltrJXhGmWKupIdnDAgKWSurVkc3n976IsCMk9heB4JmhBC5qqsWzjb/F2Hjgwcy9W2a8kfs=
X-Received: by 2002:a17:90a:8a17:b0:2da:d2a2:4a71 with SMTP id
 98e67ed59e1d1-2e0b8ee9508mr11239187a91.40.1727698142969; Mon, 30 Sep 2024
 05:09:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240917100432.10887-1-vishnuocv@gmail.com> <202409211318.ZsE7JGOi-lkp@intel.com>
 <CABxCQKuya7HUWPPw+3vSigddHa84hGZdtuN-02mxvNdfieLXZQ@mail.gmail.com> <nycvar.YFH.7.76.2409272018370.31206@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2409272018370.31206@cbobk.fhfr.pm>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Mon, 30 Sep 2024 21:08:26 +0900
Message-ID: <CABxCQKvWsKVoHtz3vkuwePSpQuJpWCkCch5RxXdYM7b0_sY-Zg@mail.gmail.com>
Subject: Re: [PATCH] hid: hid-lenovo: Supporting TP-X12-TAB-1/2 Kbd Hotkeys
 using raw events.
To: Jiri Kosina <jikos@kernel.org>
Cc: kernel test robot <lkp@intel.com>, bentiss@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev, 
	mpearson-lenovo@squebb.ca, vsankar@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you.

I will resubmit the patch rebasing on hid.git#for-6.13/lenovo.

On Sat, Sep 28, 2024 at 3:19=E2=80=AFAM Jiri Kosina <jikos@kernel.org> wrot=
e:
>
> On Tue, 24 Sep 2024, Vishnu Sankar wrote:
>
> > Sorry for the inconvenience.
> > The base I used was the Master branch.
> >
> > Should I resubmit this patch again with the base as linus/master next-2=
024xxxx?
>
> Please ideally base your patches on:
>
> - topic branch in hid.git for the particular driver you are touching (in
>   this case it'd be called hid.git#for-6.13/lenovo)
>
> - hid.git#master if a topic branch for your particular driver doesn't
>   exist in hid.git
>
> Thanks,
>
> --
> Jiri Kosina
> SUSE Labs
>


--=20

Regards,

      Vishnu Sankar
     +817015150407 (Japan)

