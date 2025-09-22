Return-Path: <linux-input+bounces-14989-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA4DB933CB
	for <lists+linux-input@lfdr.de>; Mon, 22 Sep 2025 22:32:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 780291905BEB
	for <lists+linux-input@lfdr.de>; Mon, 22 Sep 2025 20:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3078C1E833D;
	Mon, 22 Sep 2025 20:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K1d70yzY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F24A259CBC
	for <linux-input@vger.kernel.org>; Mon, 22 Sep 2025 20:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758573141; cv=none; b=mBvvV759NfL1fAKgAD/fsiN8HewkHasrjQaPEY3NduSiDnA75VAXab58HkTcAhHZBOKnqqeon/LOWOuabMQP9SH3r03Yai039H1EriFEIifRua92sHqwap7FhCcq+w7nvJl1beleA1ImPimu4HU0bJE6ao1fDftf7tJld29q6fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758573141; c=relaxed/simple;
	bh=UG69M1IVVdE2PGp0fqTRKe9oVR9CdEzH1MNduD7Uexk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rCLlaqO6r1bGuzbKBRBa5GXfPspI0MWwKgXF/JQkXwJbRq6gmUU2hJLVw0+PHHnmaJT7SpYj8sJwN00F85Ak5ezKXPRoIfZZrgl+AQ9hJhro9nwscWQ7KuR9b9nLZaIwsTvQEUrVR8ZB9Xc/kRsucWCoZg+zxMrNsi37su9kq7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K1d70yzY; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-84c3308acf7so121462785a.0
        for <linux-input@vger.kernel.org>; Mon, 22 Sep 2025 13:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758573138; x=1759177938; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UG69M1IVVdE2PGp0fqTRKe9oVR9CdEzH1MNduD7Uexk=;
        b=K1d70yzYo3LA2a586ItgQUZ0UeFQ5ggGN2MONG+KD6Z2mt0iiLLI8/9+SktniEKzMd
         T4aFEWeWSMJhaEWIYcXN6MQDz+ePELlUo0MUbPsY/jQ4E+PWJsBhPedmnHYlX2kz846U
         V8YRo1J3IXXY0XdckcoMwIgPJE4u/dZ2XeET/Jsa0BN/QuyordWAr5VDKDoHltlEDtyF
         oK1uWBfMTEvvJvyt3Iw2noUW3zg8vbQp/N1Y+sz1HsA6D384o+05hR261wl9u9LyUmfC
         Gu3p+ss35iTQ41w76oLwm2M2fkWwETck23GRbcpMj4XVM6Br4pJHSPIj3PFHXREVP3M8
         4y7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758573138; x=1759177938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UG69M1IVVdE2PGp0fqTRKe9oVR9CdEzH1MNduD7Uexk=;
        b=ICUZAHtxm+gUkjuNRknPHz4YjpWM/e3qQAb+x28IQsJzjl+dJ7bdzqwRlMF1czwVep
         w1o5Wntzorn7CTSwPo0ehoj+MzvPKn6gFvCK5Vae2MWK496E03gzPyDCcX7L7dCPxT8u
         3DrDUjss6pa+8JGIrnzgRZTLixRaocLTP3DEVVc7C6Yf3Q5CQvrXFg+bBVESsM9pcKNS
         tJT9DHcMGDV58ItMfVipJSI+tKsbdmpSy8Rb4pjvA06iUCv3uB7m9a+aVcrG+JIz+Ky6
         mSZk+4+Xcu9/zHcxdBu2jwenmb0bwdVLWIGIEUSn0Miqehlx7aFHWqNnffqXCmSXlfXM
         +jJg==
X-Forwarded-Encrypted: i=1; AJvYcCXiCILJnJw4wpRdECHcRKYPjnmkepIuu4hFVYdi4ymGTLmHlOXF+DXqXzcXEYzqYQRZnM+r68E+XFAitw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXYkAG2njuzjGf1yyyEzn4DVAT+9GGdQB2eqKjB6S53aDwW1DM
	rGxGOUG0ftWv8SRIyaNAz99TZuSPBN6vLqvO7Uk2d/E9h/Z7cMeg6iybo7c4xTC/Iwl6Eu25Ulq
	rVsVD96Y03Zlv8TUu0Pjocc5HSkbvzvA=
X-Gm-Gg: ASbGncslfKAdBSI7hvHAkG9buOseUo1yrDZFzBOMpU8JM1xFiS1dtazumddM6MONram
	dg83JgCrBKaKyFSyASlewBaPZr4N18PGtL1U6pOxBLb78ye50JFNLs0h8MOaB6kfTEyISVol9g3
	DSvtiw3Ih5PfQ2cOmWz59CcFcQh9Dl6Y/c/VNSVVD/R05DYzZLVVv6yoeXTz2TmVJWQ3WFbPs4S
	fmzl3IKxMDUS7HA9xcqONA9l7GpHXCBZOR3rIiuYw==
X-Google-Smtp-Source: AGHT+IHSqXAXRvrgQnAfjh65roix5LaKfKH4YNfu9oaDRcJHx5FbfpRJ/aJ3R/Xkk0NazNTr0SN+HDKIIBs1Mzh1IIo=
X-Received: by 2002:a05:620a:370c:b0:829:25f1:3208 with SMTP id
 af79cd13be357-85175f52ec2mr33267385a.61.1758573138310; Mon, 22 Sep 2025
 13:32:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEU-x4=Zs22b5LX_rsBVMu4BxvDfO+CZkkuWuVNaxv8mqvh9Gw@mail.gmail.com>
 <bjtev7sgmcafoysd53xrxih4nawn2dbq4odylwdglbub6td2a3@nhoxenprhjvy>
 <CAEU-x4kL45DAddmNahjR2C97+43jchpmXep++LbeP8cXLEWN-w@mail.gmail.com>
 <CAEU-x4nv3XnXchevtwN5mkVcxqnpgBobhavxZc7BjS7EgYG8Ng@mail.gmail.com> <c3plpgl2zsx4do2odwdeowodkkdnfqpexlwqg5a5mckyibxlge@qai35f5yeswy>
In-Reply-To: <c3plpgl2zsx4do2odwdeowodkkdnfqpexlwqg5a5mckyibxlge@qai35f5yeswy>
From: Yinon Burgansky <yinonburgansky@gmail.com>
Date: Mon, 22 Sep 2025 23:32:07 +0300
X-Gm-Features: AS18NWC34wlHuTeaKU4_gAJIUEcIDl27QqadqogiGTSWePhgcUUmRrAOIWjEJR0
Message-ID: <CAEU-x4mJiBM_zKg1DaeJkKB3W3Ay08bUTc-D3QjFjDxNiZGd0g@mail.gmail.com>
Subject: Re: Touchpad multitouch leaves ghost fingers
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 22, 2025 at 7:51=E2=80=AFPM Benjamin Tissoires <bentiss@kernel.=
org> wrote:
> Well, I was meaning that I would provide a HID-BPF MR ready to install
> for you.
That would be awesome! Thank you very much!

> But if you want to play with it, feel free to do so :)
> For a jump start on HID-BPF:
> https://libevdev.pages.freedesktop.org/udev-hid-bpf/tutorial.html
Thank you for the reference. I=E2=80=99m feeling quite fatigued from the
debugging process, as it took me a considerable amount of time to
identify the issue.
It was surprisingly difficult to determine what exactly was wrong with
the touchpad and to uncover the root cause; perhaps I didn=E2=80=99t search
for the right terms.
However, I=E2=80=99m glad I finally took the time to debug it, submit the b=
ug
report, and find out what was wrong. Thank you!

> The advantage of HID-BPF is that we can drop the file in the filesystem
> and then forget about it.
> My plan is to have the HID-BPF detect whether the quirk has been applied
> or not and would gracefully remove itself once the kernel is fixed.
That's cool, nice design.

> PS: please try to refrain from top-posting your reply. The usage is to
> inline your reply or reply below,
Sorry about that, hopefully I did it right this time.

Thanks,
Yinon

