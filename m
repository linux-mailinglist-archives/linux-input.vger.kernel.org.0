Return-Path: <linux-input+bounces-5767-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB36A95D248
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2024 18:02:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6897F1F26335
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2024 16:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7415714AD30;
	Fri, 23 Aug 2024 16:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="THUKa1hM"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035931C680;
	Fri, 23 Aug 2024 16:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724428934; cv=none; b=kOF7feHGFyVHkzcqmMjtFh/YqgZkKQiTWY5Kv4uVq9ixiSkt90uV11Nc4Epp6cxY1DyFMs5KpKUfmouBMmmctmWzSFBPUJf1sHP/9jli1JMurAi7Vm+axlvO/vy+eFRstUo4DQqvF3SY+PqJ1041ygdwhdoVzb7a+0SAQ4mc+qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724428934; c=relaxed/simple;
	bh=b8LE5GoA7/tNfcDosifTE11C4eHpBOYZ1OfVcLjIlMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PvfLa0RXKhLMFGBBWfh29oC4eEBOxRuNqLcqjq+XfK8hcnbaYlch/AAJk8PCViKUkytUXN5LnK3BtWUUwd0JQQpXMvid6HvthLZx6oVrlGn8x58xwtJ534A0/OC6z6ZCfjJn0T6/eB/R1Q+GtUD0wSyMyATbBTzrxCWHd9WoLJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=THUKa1hM; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20231aa8908so18760815ad.0;
        Fri, 23 Aug 2024 09:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724428932; x=1725033732; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rSEc8IuLgrEwWAM8+Mg+yV+OINf+nUjNczzsNR2PhoI=;
        b=THUKa1hM2hitWRDjR4oIEUXzkgNxrZStsnVvJtrW7Bgat1LF2Ym4LTkseU8F19pgvE
         puuO63EQj1mg1GqEWxxdIO/aJMWsQGpWMvG0WEs5IfPUKPuCDKBkM/mmQ1GriU191bz+
         GjRb3u9mSKF0pz0vseF7V62peLbSwzh5+d4HON8N7k+C75Jcf6m92rispIqLuBlKkJKF
         Q4KiDF5xaRQPvV7PydjKp2CyP5wU92ebDPkRYciRm4eUG4MxO6WeuxRpJEEdx4aM/IFI
         9QMBUiFi6NEJoRlZmvrsRcu8vewIPOppojGUumqJvMKjHRatggdtO52JUb3KSww7MkMb
         a1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724428932; x=1725033732;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rSEc8IuLgrEwWAM8+Mg+yV+OINf+nUjNczzsNR2PhoI=;
        b=h7ztvqRxox4msQ8CTnG/lLdb9b/ISF53/nqwvtTgRbtr0xoTLSf4WH8PKq7V+9nro8
         6z1sb0/GVSDgfHzC5Ddqcm2z6SYa5z4B2UEwtGsqGDd/8/g0AmtOlcy33jAMevKzBYGB
         efZExsc0p3UtBrRGNhSiZCROyrSE8I6dg/Dx+gyAQJIT/9553ZaIcc6B+sKODaQ957ss
         JIXzGccvTMswx8JYAflukFA4agBjFURRA2QVviFMbif8X+fwLvg9yBeuwVNYusLu6JjX
         RUH7Fb4l+B5lVpagTHaSojBtdsE0oM3aN/KaleX8ZUZW/O/wu7RtHuhioyE3oDf8TePG
         bEZA==
X-Forwarded-Encrypted: i=1; AJvYcCUONHK+7h3uR8IbZSWOKWo3QQGumiCQoyaKiKN30NdRMLN+aJKnckuF8KEnx3koR83MnjsLF1OMXz9wLa3g@vger.kernel.org, AJvYcCXGjbzaq57QyIJFP1xusM+ipf3phag+lMdHofj1eUmBCdYlGAOhwiHP1pL35384SOayv0cWVv6xnc7mtw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXsTKtGycTMegLodO7jETWcB2I3Xjrpp7f2qL78Fxl6i58EB9b
	mlY3myAhljJoIYurBe6OKjnfuOD0/+zt/3j3IkGqkbqZilgwDJ9B
X-Google-Smtp-Source: AGHT+IFm9bfhV0E2ppaQ2w4WAd8hdG2KagFxE0sirDEjgyyoq1tgA2ruqzLgtHrDzAQMHCSgozUvnw==
X-Received: by 2002:a17:90a:680f:b0:2d6:1c0f:fea6 with SMTP id 98e67ed59e1d1-2d646bad283mr2408625a91.11.1724428931106;
        Fri, 23 Aug 2024 09:02:11 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:75c:5a5a:d7dc:18f6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d5eb90c4c1sm6595170a91.19.2024.08.23.09.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 09:02:10 -0700 (PDT)
Date: Fri, 23 Aug 2024 09:02:08 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>,
	Daniel Mack <daniel@zonque.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [PATCH 0/5] Remove support for platform data from matrix keypad
 driver
Message-ID: <ZsiygIj9SiP4O0OM@google.com>
References: <20240805014710.1961677-1-dmitry.torokhov@gmail.com>
 <CACRpkdYFc8vuz__7DkFSMFxUC=LSwCJmEun2KXgUvPMq+_e17A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYFc8vuz__7DkFSMFxUC=LSwCJmEun2KXgUvPMq+_e17A@mail.gmail.com>

Hi Linus,

On Fri, Aug 23, 2024 at 05:51:30PM +0200, Linus Walleij wrote:
> On Mon, Aug 5, 2024 at 3:47 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> 
> > This series attempts to remove support for platform data from
> > matrix_keypad driver, and have it use generic device properties only
> > for the keypad configuration. Spitz is the only board [left] that
> > uses platform data.
> >
> > As part of the migration I am also dropping support for "clustered"
> > interrupt mode, as it was only available through platform data and there
> > are no users of it in the mainline kernel.
> >
> > Additionally gpio-keys device used by Spitz converted to use device
> > properties instead of platform data.
> >
> > I would prefer not to have the song and dance of merging first 2 patches
> > through the input tree, waiting, merging the spitz patches through SoC
> > tree, waiting, and finally merging the last patch to matrix keypad
> > through input again, so maybe we could merge it all through SoC?
> > Alternatively, I could merge everything through input. What do you
> > think?
> 
> Sounds like a plan. The series:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks!

I'm glad that we agree that we do not want the elaborate merge process
and instead push the changes through one tree in one shot we just need
to decide which one - soc or input. I am fine with using either.

Sorry if I am being obtuse.

Thanks.

-- 
Dmitry

