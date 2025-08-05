Return-Path: <linux-input+bounces-13816-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F352B1ACAD
	for <lists+linux-input@lfdr.de>; Tue,  5 Aug 2025 05:11:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 405B16220EE
	for <lists+linux-input@lfdr.de>; Tue,  5 Aug 2025 03:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC4BF1DF258;
	Tue,  5 Aug 2025 03:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L4wy0gfJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361FC1DF248;
	Tue,  5 Aug 2025 03:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754363501; cv=none; b=T8AN2ADwBx3sqLXyp9c8vN2Ig684JsLYOR4vmUoeH4CJ+q+XpCQNkll03NEOwMboC4Ks5IZHth+hZilLbPmtNvR3Toio87R3KSYvq7BJRC7Ac2eqlKH+yEJ8L+2CEAylWpiEbGkIWCzcQbrU2qkFJFoNvLsvuBPnjK5Vd5tHGJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754363501; c=relaxed/simple;
	bh=bl5QHnK9V2D6VL8PhIbqiP//fzrQSDMVxQYIyXUbSDM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JcFXa9ahxN6Uj9piVJSoQ0VUhX0Abxi24ssiL9sWVDNgPah/2/Fkn02AlwZ2JQk0aO13cIqilhO0ZgPK1hFAn+lfl09vEF3UQxQMRXxcoDpbFRZQnhv6InUoahzi7yP8XSY4Qq+uBoMGwI+66TOHlLGiIQGJtsvaLMAdowhay3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L4wy0gfJ; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-71b71a8d561so38034167b3.0;
        Mon, 04 Aug 2025 20:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754363499; x=1754968299; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bl5QHnK9V2D6VL8PhIbqiP//fzrQSDMVxQYIyXUbSDM=;
        b=L4wy0gfJbymgrj8EMK1kEetPlaFBQnKRIeqXC8pt6sxDrqGUrpn0YUo+zvE1bZJ030
         1tfzW/IFXUVBV3TN+5712dnkL4SqdWOlc+d7jKPcQqCcc4pWBG4aqHyWLXpO/qhiygYO
         PtXZNQQJT7co6j44JAXjNT84RBraUmqaR6pIiiNO4YxpZG/1i2rUUw8i/nbHitXs5xpW
         RcH4H2zRwYFS9fyGIsJTFm4sudiBiy7fl56h1Pyz8oKBgoVi7G+xmrW5SAlgwBIzFDGw
         +ZA0jdvYvGzLfQdkoLDO4KY1MEvryQHMDoi2De2pDB98OYAxkeohY4EBv+hbg/3ZiZ+v
         u0jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754363499; x=1754968299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bl5QHnK9V2D6VL8PhIbqiP//fzrQSDMVxQYIyXUbSDM=;
        b=TwwpINxwnib+yzD24RcxE/yD8olsy/LefGA+H2B8g0MuisASJeB4hqs+i3hl4cqq9b
         1kBJAcGlVp/S4ch5jRIv+VxeYopdFn14sKGIzqLXEDafjVvjfaM55cDtASRcLlXST+U6
         L6niAqtlgcjasCjpdw6FzI9K3C9QOviwUd4HszkCa8RNdzH13Y2qMpNFUqt3leWsvm9D
         0wfE64g930UhqxXH9MG+Nwied5ZFdO8VhMLwY6Cqj5ZLwWTEI3xHzgE+Zw/fPbx8Wi9R
         iLTx48fUnxA3ycqI+JmBaby+Ft1HgIYHcpNXBbZQ/Lb0vlixqESx9+lu/pIs4fjtAdO6
         uHVg==
X-Forwarded-Encrypted: i=1; AJvYcCVK5MgVEIY8ml1B8XxeocQJTAtjU9j0VOHboCLbbiaUplYv/08/4D76hYs5sZ2us4KPhkezqLENGktE@vger.kernel.org, AJvYcCXXJ32QpjaXSoGjmQnRFW+WkJI6JYhziEvFvQ2mN6JYqStcfDknCiYrSKrkbKEFmwkhWtUvugaxtKzpnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBv4yFHv2czWQ2cZMY14whdWrbL9qjENCc11KhTRp6HOuVqvPW
	CpPdyQfcK9nWBRzJJdMuOn1UAu006ZC7nMrtZZvNCOhu7rN8P9WYhPf8ymao8fmB9ytpS3IT9nM
	emvYQx9vQBpi7G0vyFpE/O4oZY/xOe94=
X-Gm-Gg: ASbGncus6/IetyHP5XvMTwj7XSZjwruG/RT4tvwuowdip2w1PagUuldT2mEqguk4Jqs
	XW4WxDT95LQSMDHW6cV2z7/bdAqxbmUOtZ988ftxK/5u60go5qkF831hPHY40471bFjPxWZ32P0
	35/6jEA1BjIJkV13mUiffTBcR40oekKuBPCsLgjhdcrwBsj14pMaSEVshM7dY0fZpLOsbLOUmuN
	KqKiBE=
X-Google-Smtp-Source: AGHT+IGTv2A4SdvTPg/pr3OEHuClij56x00Z5edF222oJQu3UWXexuTeFDK3OtsIjwAgMoKNgz5I0WA6fUFDZjeAGP8=
X-Received: by 2002:a05:690c:60c4:b0:712:ca60:c5fd with SMTP id
 00721157ae682-71bb6cb6429mr27795507b3.1.1754363498970; Mon, 04 Aug 2025
 20:11:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHQ1cqErtqZjSakSUppxKEPvK3xJYfKydM02RJTcDO0RV77r3g@mail.gmail.com>
 <03s194q6-n6n7-2p42-5o48-99726p7qp0n0@xreary.bet>
In-Reply-To: <03s194q6-n6n7-2p42-5o48-99726p7qp0n0@xreary.bet>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Mon, 4 Aug 2025 20:11:28 -0700
X-Gm-Features: Ac12FXxcs2jX6IHCHFZr-1pKB7hGY01P719Uhd7Pbwitd52aQVaDEmBhdtT5xYQ
Message-ID: <CAHQ1cqE_bmPWVwKm-AV2b4BfUqt1PjUPCdUuKvY-BEqTGTHZcQ@mail.gmail.com>
Subject: Re: dev->uniq is not unique for individual USB interfaces
To: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-usb@vger.kernel.org, 
	"open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 4, 2025 at 12:20=E2=80=AFAM Jiri Kosina <jikos@kernel.org> wrot=
e:
>
> On Mon, 21 Jul 2025, Andrey Smirnov wrote:
>
> > Hey folks:
> >
> > I'm working on a custom USB device that presents N battery powered HID
> > interfaces with each interface reporting its own battery life via
> > standard HID Power Device report. The problem I'm running into is that
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/hid/hid-input.c?h=3Dv6.16-rc7#n524
> >
> > assumes that "uniq" field of a "struct hid_device" is always unique, bu=
t
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/hid/usbhid/hid-core.c?h=3Dv6.16-rc7#n1415
> >
> > populates "uniq" with iSerialNumber which is only unique per USB
> > device, not per USB interface. At the first glance the right way to
> > fix this would be to change how uniq is generated by usbhid_probe()
> > but that probably would break some userspace assumptions?
>
> Hmm, actually, from top of my head I am not able to come up with any
> userspace breakage this might cause. Do you have anything particular on
> mind?


No, not really. It sounds like we can try to fix this without gating
the change by a quirk. I'll try to put together a path in the next
couple of days, then.

Thanks!

