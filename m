Return-Path: <linux-input+bounces-9894-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4ABA2E551
	for <lists+linux-input@lfdr.de>; Mon, 10 Feb 2025 08:24:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED53B18869E9
	for <lists+linux-input@lfdr.de>; Mon, 10 Feb 2025 07:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FE2E1ADC68;
	Mon, 10 Feb 2025 07:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fpjtRNN7"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A8A1ACEAC;
	Mon, 10 Feb 2025 07:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739172282; cv=none; b=h29FNaZl0WG2mR4QHwQeXH/SRSb4KOiUzDeLshNc2WChL5W2/4wWD99pBJ3GORV6pVh6etAdgVDIuJwbl5ekHU33yCPe/ODfnENwkVIZSydXVR5Si0GadBY6m4nK6/jDDlOlxCz2OdPqQQpUhND7IREQqkd9DI5cwGiv+AjMwc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739172282; c=relaxed/simple;
	bh=2s3aTwhPvsGOR3Pr4ialCybcV4vFwYYzkbYuU1F/aQM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=QF07vlC82tcyq87k0P6T1SbueE2FYKprYdYUCuImshvvSS+dN24hBFnCuHUPdsnTh2zVXAZwrN0boF+OPaaxNxJTM4Pv08o3wRrtbXMj40fSkptfEiD/IUoqJhSAUNp2E+XWhsxx8yKw0n+Q6fUVvNrSLEfEf+IeMu/jq3uoQNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fpjtRNN7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F28AC4CED1;
	Mon, 10 Feb 2025 07:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739172281;
	bh=2s3aTwhPvsGOR3Pr4ialCybcV4vFwYYzkbYuU1F/aQM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fpjtRNN7WRKkoySSOhBhBc0rlPs6bQcl5ciaAlDPSdxn25K7uiSDM4zfdifR0Fn/n
	 3GRUWkcdOTgZxMa5EeXmkXeA2KwKFPSxbsqOyRYfPSkal+6TmYs0Tb4QftNZpcF05r
	 MiB89tlcCKV0RfrHDBxWmrxUNG8zSCKKqc+EUub1lKzj2flZldinZ8zDbo26jKTgpc
	 ODyfGKy6siZcErlVLCHFHuxe3BaEgG4h1ZLRefB9MAybOVzTlltwGBb5pL4xlTmVGJ
	 S+KLAeY33AAjjYppXmWtGjeqXGZdBir/+C54w7dwXQuufgRSpLkWqZ97JoM0wlQPzz
	 gmzFLe4glLxKw==
Date: Mon, 10 Feb 2025 08:24:38 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Aditya Garg <gargaditya08@live.com>
cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    "bentiss@kernel.org" <bentiss@kernel.org>, 
    Orlando Chamberlain <orlandoch.dev@gmail.com>, 
    Kerem Karabay <kekrby@gmail.com>, 
    "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] HID: hid-appletb-kbd: make struct attribute
 *appletb_kbd_attrs[] static
In-Reply-To: <3AE31FDA-2F6B-4CFA-9E19-0DEECE363D30@live.com>
Message-ID: <o01691op-53on-7s72-n480-1n5p9r9nopoq@xreary.bet>
References: <3AE31FDA-2F6B-4CFA-9E19-0DEECE363D30@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Both paches now queued in hid.git#for-6.15/apple, thanks.

-- 
Jiri Kosina
SUSE Labs


