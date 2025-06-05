Return-Path: <linux-input+bounces-12724-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 156B2ACF625
	for <lists+linux-input@lfdr.de>; Thu,  5 Jun 2025 20:01:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8C4B189D886
	for <lists+linux-input@lfdr.de>; Thu,  5 Jun 2025 18:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 417D827A477;
	Thu,  5 Jun 2025 18:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hWWh+tAz"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com [209.85.166.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A277B278E40
	for <linux-input@vger.kernel.org>; Thu,  5 Jun 2025 18:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749146484; cv=none; b=BydjVKguNyrKrndzd6K5ZWT7jOj8PeliFzAAeuufhmU4jSxoTXFZzd+pW7OrtFIbNQR4URRGCchznkYYP1GNVc6jlh4I8NG1OsViQXhikCQPmOkCmfHlqCjPkHhy2s0atUWP3vp/k321+E+of1vDkE+6G/LEreBWC2cTv6huPhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749146484; c=relaxed/simple;
	bh=XBwUD+EnabYj2RVD3zWcsTotebaWwCnnRU9G+ZT8BwA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=lqfkobOkj7aFZ2dcJ6bpBaZse3VTzZjC+WIMRV8pHQNIdfam7XMAkJlZBh1Gk5oEeXH0bEoQgYLHyxBcgaWvCPYWJn0HUbRsOEimiH/q09WYV5vnt2WLCDj4MXQek54MOP81rd4B2cryxusrMWXM6kI1eUtrYZwpFPfWnvGrvvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hWWh+tAz; arc=none smtp.client-ip=209.85.166.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f65.google.com with SMTP id ca18e2360f4ac-8731c4ba046so92735339f.3
        for <linux-input@vger.kernel.org>; Thu, 05 Jun 2025 11:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749146482; x=1749751282; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XBwUD+EnabYj2RVD3zWcsTotebaWwCnnRU9G+ZT8BwA=;
        b=hWWh+tAzGRpK/F7M8YdKdZbUTY6En6LLyGa6fOmh3CvmwRbgqeXYPoqFQrsXFVfU/+
         Jp/91Md+PzFw0SNmNkJLW3qIiAgFK8ThqYt2sQzdE0ulwnYARUbXxDcezI3cigqNiQxo
         34AfGuJGsJZKtBy3urM0Lq3oGX31j2ufTs3B25HLgNOMVDrLr55xM2YtcM02Bm6OOoIH
         Qc+jtXy2Pg8zPpBJpiYkgp93oDUCmWAxn0V669J7Bm+Q/8GUa1TQrvfHPM5CvJ1ECsEw
         HP2IMPMfqmPGJ+5nhanvBtv6AbRod3iZZrk3dcT4WFPqE6HXD00W2gJKgaeLUvNkSM13
         rcWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749146482; x=1749751282;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XBwUD+EnabYj2RVD3zWcsTotebaWwCnnRU9G+ZT8BwA=;
        b=QiawFr2n+TDAch0I6yXJO8EXzDKz+zcKnZ84UFVSpYbuwS3/2lI1OealNgrbpJvuf+
         guZ2HY7ZQab5hYXM4rDOuXsSlFngVxjLPW4lL0AsahDN6VDn/+imjvGxe+cWrqmfgQyw
         hpdc2rmfO0KReJ0MH97ABZ6AtmAk0PKjv6EyNQ1FgOE5TKBzxNzrOAtF6EeUG2dk7Zpd
         aqDNZtF2aQuBWcMfOIkcvb3woOnS0IPecqSkOIDmhlAsZgXl48USPMgLlhX75CI487nk
         3qNwDH2ZX0aDK2tWnZ02jYFAoIbLq0eoZswKl0uoe0PG4fmY6a1Bpcb3jsB7TkjBPeVh
         LOSA==
X-Gm-Message-State: AOJu0Ywfw5DCYoRTIIPqpRyYzubFaCmwsZAV5mBmY5VMwSrBqYMN7Cjl
	p51GeeCqEYynlITzLe5f7HpZ844MBuKTVGx1eP50vGWYJ0AJJXB3X5d3ek5dJSbVR8F4oCW0L2L
	o9iI8djYGOXfwHiKkvSj1/IHW02h070AvaG0VTu+pBnc1
X-Gm-Gg: ASbGncsz0xB83+HploajdKC5i+GdbmlyVBHq5iaM1gGVGyLeSI8BcXhWUIFrwnKD4ZS
	aAUrYTXGAZV0TI+GpSbV+7Zi5qTLCq+e4Naxb3V1McCPyzIbm2q7CuKqsBrTFVizAQrkhUCh76H
	E64i3D0tEuzxTExnwQ9lPWCfsZCaDCjgM=
X-Google-Smtp-Source: AGHT+IFCylTOGBzCI2f7fwzm6eXyXwlivo8RpvxHeQkEOxXQh8bpVC8RbUJWhvUagyW+5M0gER7wrVFhen9cH7xgYdo=
X-Received: by 2002:a05:6602:b88:b0:85b:3c49:8811 with SMTP id
 ca18e2360f4ac-87336647823mr74852339f.4.1749146481590; Thu, 05 Jun 2025
 11:01:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Raoul Roi <ein4rth@gmail.com>
Date: Thu, 5 Jun 2025 20:01:10 +0200
X-Gm-Features: AX0GCFvZKlle4ObcsFQBJid6sxYjciEDG0agnx2KdlVgQzW8zvmz5cc2Fmv0NUI
Message-ID: <CAKjzi=ZjWb0KbYch_6wSjYoxUzz7GnR2oc0weDGZH0E5SyAntw@mail.gmail.com>
Subject: Bugzilla 220116 - suspend failure caused by keyboard wakeup
To: linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

I am currently experiencing an issue with a new laptop, which I
reported at https://bugzilla.kernel.org/show_bug.cgi?id=220116

It seems the keyboard is causing wakeups shortly after suspend and the
only way to suspend this laptop is to disable
/sys/bus/serio/devices/serio0/power/wakeup

I've been told it's probably a firmware bug and was advised to ask
here if you could confirm it. I also reported the issue to the
manufacturer.

System is a PCSpecialist Lafite 14 (AMD HX 370) with Linux kernel 6.14.9.

Any suggestions would be greatly appreciated.

Thanks in advance

Raoul

