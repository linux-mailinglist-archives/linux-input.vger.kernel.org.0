Return-Path: <linux-input+bounces-15932-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8E4C40FA1
	for <lists+linux-input@lfdr.de>; Fri, 07 Nov 2025 18:04:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81DE01885404
	for <lists+linux-input@lfdr.de>; Fri,  7 Nov 2025 17:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75BAC2DF3DA;
	Fri,  7 Nov 2025 17:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FRuiTEgg"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664232B9B9
	for <linux-input@vger.kernel.org>; Fri,  7 Nov 2025 17:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762535061; cv=none; b=S1QFbNfNPa1weJBV1UF80hvPhnlS2DIm+dzYd1LrQGR66GLThlnOaP8ZlM/2tWlSEK+2uWT/yHkm3rW5cKPsMgbzt1iYb84JEuYOu7MLfFcE6CJByfZZ9fr2ZxGBKp8llFCokSqJ00Is0z8vApARuQcNZuHnPxaAmF3qKyvqbHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762535061; c=relaxed/simple;
	bh=jAXZwY1JFAlSau7Sh36qtfmk425lQGaaTTdIu/DKZnA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HxOIdDUDbaxGzupM0ZE7O7Z4miQICk9N2BhQar6c1MUbrlV4I/v05BESIQ6zrTCvtUUlxgtXQMx0B6xJuOHatLjgJ3h5jpUDCe50Zocq6ra3FZ4M9V+1FGnuBagP4GKcHcCuIsTa7qyX8+ztks5KOkHBo0aKEGZjQXGIvEU4xL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FRuiTEgg; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5942bac322dso1005985e87.0
        for <linux-input@vger.kernel.org>; Fri, 07 Nov 2025 09:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762535057; x=1763139857; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jAXZwY1JFAlSau7Sh36qtfmk425lQGaaTTdIu/DKZnA=;
        b=FRuiTEggRGAS7Vfo1Uagld0Lf18jRFnzxorwEG4ByBp6/oEbLGLvr35XYZm49IZt2v
         O2aqnvp0W+uFG8/pyOSl8K31LpKFMOgvGw+YQpYgwM/iwiuXQiOcqbPVxV+IsOltV+jf
         Nsn5u3IAKa2qCGCwh+/a1oKYKYY7s7A5aQGwCSkdQaQVPX52nQ4AGN7ROYY4l40uu0iI
         eSfmAJq8W93JiOLnxDBTobKE4tF/E7UKkbJS7Vyw+m5JskPebMWujC1Qj6aMUWUhlUR0
         2Y5VJZeu7Bh+uXBgl3TvtCSc3gkQx9cxojtd03G+O0xYt7wX/dIEas6mBjqDUC1WzYXI
         eueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762535057; x=1763139857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jAXZwY1JFAlSau7Sh36qtfmk425lQGaaTTdIu/DKZnA=;
        b=SYvImujs2ajJa7tsLfbwSAX/Qm8dg7/Zd5bJKvhjzz/PxLh6NrGU/S5Z0igAggTBfy
         kQbxB4jVGUK5e7/958yUtQoaZMM8fxIDGeeTmqYsho2t8NT9W/NcQ0SDW/t/pdbBeXKy
         jhWAN0Zs2oT0HsZso/2oMpC8CdiOuiRy/KlNYuxq8VHackis+uemBIL1dXY+QoEf38xB
         IkQSXWCNK/GZTuIc7kNNU1w1s5FrnbNmuVI4AG7sHPlkUMXdJ/crLWJg92lpCx4+1jSV
         acQ11vJdxFVp/srNA3cTMGpjTX2Hb6mYdzSr4SGcQ/iv6HsR3Tmw9tvwfrcG1z59tzm5
         ieiA==
X-Forwarded-Encrypted: i=1; AJvYcCVBLlfuNwpB3N0onLvD/Px66NSObqxhgPuB7JKzVMbpr5IwmmsCBVhFClXF+wp/QCpeUK7ko54VUU9G7A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7OFemPQvTettxDK4QErqhEyIpr7gdF/zsmkpDkRAlQX100N+p
	vAFJt1WbsmDt0LhTah2pcwf4NN+XFxq3Jm+4f4uAa0Xps0zUH2o/M5FQQzzOUTXigTnQ3ZSXlPe
	0xygJ62pEw/Ru5El4BR4FizkkXBxdthog03iwduugKYxBFlcJWqrZ8bo=
X-Gm-Gg: ASbGncsom1vSK4qkCo5b6vKKUPJ1UfANNfSYg+kVWOJJpnewOhJOQHVqvwOaeMdCZJT
	76SmG/vkwQs3IeFOenrclk6lmC6D6KBAHXyYbLHzfUsD0D89JcHLhLVKcFgJ36w5wKc8uLtpubP
	u9z1S2oRbOsQXb/E8WcaV6vmqHw+lhswjSvlrtwRgD4Zjb5MNj8qSlpcnlbUGnySsZA++R1cpee
	ADiLTAYAeoqNVqaLcFKObLzky9MevdkS7el4PvvYiTkU5xBHUknxo+evG5CuvoyRWW5Pa5SiX4o
	cmR8bjE7qgUH/eaoug==
X-Google-Smtp-Source: AGHT+IEYqlVxvx1AEblNqiEQwOeS/KsDd3n8m7JMMGSQrBI5xG6zdz7o0UWJc+8B7rV9L/oXAJXTHffVLD7ZrMBGPJ4=
X-Received: by 2002:a05:6512:3a86:b0:594:2c1f:75cf with SMTP id
 2adb3069b0e04-59456cadbffmr1263195e87.57.1762535057489; Fri, 07 Nov 2025
 09:04:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107132443.180151-1-marco.crivellari@suse.com> <50rq8s8q-q098-rrs5-r1rp-p5p5r7929psq@xreary.bet>
In-Reply-To: <50rq8s8q-q098-rrs5-r1rp-p5p5r7929psq@xreary.bet>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Fri, 7 Nov 2025 18:04:06 +0100
X-Gm-Features: AWmQ_bl64GFB67e5z_8H7PGOfSgSCx7BB9bx-w6X3bq96IM3M1Sp-Wq2cLF8vi8
Message-ID: <CAAofZF6OBZsD+3PA98dwWEAMmEhOzBTjisHt6daaW_hik2L60Q@mail.gmail.com>
Subject: Re: [PATCH] HID: nintendo: add WQ_PERCPU to alloc_workqueue users
To: Jiri Kosina <jikos@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, "Daniel J . Ogorchock" <djogorchock@gmail.com>, 
	Benjamin Tissoires <bentiss@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 7, 2025 at 6:03=E2=80=AFPM Jiri Kosina <jikos@kernel.org> wrote=
:
>[...]
> Applied to hid.git#for-6.19/nintendo, thanks Marco.

Many thanks, Jiri!


--=20

Marco Crivellari

L3 Support Engineer, Technology & Product

