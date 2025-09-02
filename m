Return-Path: <linux-input+bounces-14435-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BB0B40E4F
	for <lists+linux-input@lfdr.de>; Tue,  2 Sep 2025 22:04:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46DF07A1034
	for <lists+linux-input@lfdr.de>; Tue,  2 Sep 2025 20:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DEFD2E762D;
	Tue,  2 Sep 2025 20:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JT8PIGRU"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41A32AF1B
	for <linux-input@vger.kernel.org>; Tue,  2 Sep 2025 20:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756843449; cv=none; b=n/OtD7RO0L1tI624FC5JRTkCUrHAVUb1yquGru3DmUnftdF+UAjfY4Dlcg2ii97AE0xSlCHJterx9gcL13lrazeYrs1zkX/UR9gqHN2M8BIqSX+LpGzl/hpzRoZe+i+PQZdqSBcD+jsNhrJmebbfjpl8BOqHia1dQmqVS5UaBkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756843449; c=relaxed/simple;
	bh=Zs+mtu5xXthktL1feYCHtLu9lPu+5JPgc8V8WtIRKss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nMem6i2FmBqbeVKMl2gA7GaAyOLD+QjMnF8B11Oy0m3VWwPCNgBfJPOnDxqgbrnnJSTe3a2xi7qetPUa8fHcWLXzwAk9v69PEU13gcfEMP2O6fCFfnXwb0PLXboBMJ+QdluIxtbah3BJ4N0elEgtJH9lyC2DWpwWc5QR/+6Gj54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JT8PIGRU; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3da9ad0c1f4so813046f8f.3
        for <linux-input@vger.kernel.org>; Tue, 02 Sep 2025 13:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756843446; x=1757448246; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Zs+mtu5xXthktL1feYCHtLu9lPu+5JPgc8V8WtIRKss=;
        b=JT8PIGRU0pktfxUCqyhz8rDlhYcHWrAbhL+LwtAprDquKff4PXijrKhhRb0Ifaoubq
         qoJWmGP+TdFCr+FQlXhh72GuulBzO7/hOZGJfov3kMT6LS9rzuNPL4Irq9ODjXzFQtad
         UXwjY8SMhldSLRNudJGwzbnCc6Uc1WS8OaDiUJ5kuxaRHxIegrwii++Jd+MYYUvqvfHB
         b76ei7uJPcDeOnlvFVoUQ40SCoa8EFVc1y7s32mJtL1LcJ2dxhpb86scO0CWiEUi+oEs
         QGAz+7SId4psISubj7NF+xLjebkoR/hT9uvvyukyJ7r/n9e6IZGkr245Gc112wE4Dnm/
         XevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756843446; x=1757448246;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zs+mtu5xXthktL1feYCHtLu9lPu+5JPgc8V8WtIRKss=;
        b=XQRlyXCa+T8H+UcQu97ZUsUJCyT8SQ/RvPX5TdqN71pXcqw4PfOXEmPekDxdwWumNl
         sBZT9K9naBqQeqHehruAFxhWKADmbqfOAHPV9gqoRqnL75l/inFBwlSdeUWSTtcR8jZX
         INCXD+rydZudsH/QYCzpCsUrSuPBBDMu8FxGDseGjpMLQ5DuxH+aqaGjaTloNJyMsL7p
         CdH7+7/A5Nx4oJHWyYhPz9lRFDqtQWo81bOPc+BJpvu4vfqWowiSeu21wSbwr8nxsq/p
         ttBirUvxMI3CnEJM5otQVIGd7R+nA5YW9X1Tb6SIIzDnbEPVsatVICXsCj/7ptPaC5th
         rBOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXueBhg16x5gYKNtY6G0LjEJj4EKZPBwE/SPHMSBWP/NJlit817CyXs/Yt+kDaqGC0qEthwUPucsLqhZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxspeovPbCMwywdNpxZk5358RyBVeL+BavFpl4oN9XrD9i3fUBM
	zQBbw8kecWV+Ctvketkfrc0ydPz1+KMqFcLidQCy/mRVrWNsYWZMg5GxSX8LkZT8CjttSJdeiQQ
	TkPYaQEHWPjK5biXbq6y8Ns+4WzqDIt0=
X-Gm-Gg: ASbGnctEdtqP+xgVQBeOLiPeuPNlJL8kWDaXill350XTKclHkwst8J6hF7hj/A+qL2g
	JRjpF3UCy43NlRMROqOTlShLqdOmR4q6qgDtemfvYOG95nGtMbwzAV6TfXwkGo2apZH1RbmPejp
	pSSyo9Nu9m/VbUXX4aZtiXb4oSWtvI2jtaC/4IpocYw4pOcJ9UnI95tnlSEr50BxJu26nAEDqGd
	B+dbqpy5M0d6eLweHAFnXSH96VCBZT5VhSIwnuP
X-Google-Smtp-Source: AGHT+IEfseR4UwMkRVvyVlvn2N8YuH2hOrjQymcjWR45zXD4rVsGwqGIRXSkRYusv6AsE/Ue78cxsdj+61cnMc3lwrQ=
X-Received: by 2002:a5d:64e4:0:b0:3ce:f4fe:403c with SMTP id
 ffacd0b85a97d-3d1dddf0380mr9082878f8f.16.1756843445824; Tue, 02 Sep 2025
 13:04:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902184128.4100275-1-mavchatz@protonmail.com>
In-Reply-To: <20250902184128.4100275-1-mavchatz@protonmail.com>
From: Stuart <stuart.a.hayhurst@gmail.com>
Date: Tue, 2 Sep 2025 21:03:54 +0100
X-Gm-Features: Ac12FXxh2trPNqCxyLHMeBzFTt_jGZyoiDpK2JlAG_7vBAnm8S1_EkFWv-m1ir8
Message-ID: <CALTg27=fZ+_2b2AXmKk5UcZG_2-zm2XP3+xzbSUrWdahD7ShaA@mail.gmail.com>
Subject: Re: [PATCH v4] HID: logitech-dj: Add support for a new lightspeed
 receiver iteration
To: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
Cc: jikos@kernel.org, linux-input@vger.kernel.org, 
	benjamin.tissoires@redhat.com, hadess@hadess.net, lains@riseup.net
Content-Type: text/plain; charset="UTF-8"

Thanks for rebasing, testing with a Logitech G915 TKL:
 - All the keys work and the media controls work perfectly too.
 - The battery is detected and the sysfs attributes all look correct.

However, caps lock correctly enables caps lock, but the caps lock
light doesn't respond to it any more (the light works without the
driver).
My laptop's internal keyboard lights up correctly when caps lock is
pressed on either keyboard, but the caps lock light on my G915 TKL
never lights up.

I'm happy to check anything you need for troubleshooting, I'm also
happy to compile more kernels :)

Thanks,
Stuart

