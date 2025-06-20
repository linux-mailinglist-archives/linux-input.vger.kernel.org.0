Return-Path: <linux-input+bounces-12984-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E266DAE1C51
	for <lists+linux-input@lfdr.de>; Fri, 20 Jun 2025 15:35:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85F161722BF
	for <lists+linux-input@lfdr.de>; Fri, 20 Jun 2025 13:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B16528B407;
	Fri, 20 Jun 2025 13:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hlv0aqle"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1341F283CBF;
	Fri, 20 Jun 2025 13:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750426517; cv=none; b=GdlHWlTpvGDi59CQh/VJQbN5Y83SUJ7yr5QDk7qR1kgmqI3hkXOEM96SLSH1NhtaquuH7ntumYEhb0lUkZTYYiTGmY15GRSNly6th43jDNgWQJQDP7IVI/x3dZquyqkFfdMaoMytoea7T33mXqFEJNxRuRSwemFFAeOy+K1FudQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750426517; c=relaxed/simple;
	bh=RkyEkvG+IgbuNXl3pljb967tt3iCqsHQtD1o1uI0N/k=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=nc+PIxcMhbEj08VWp/XITfmlPLOGLUR5Dw7i4NdnJNzWuWjdEOr41C2+CzZw0h6FOsWl6WiexWJPUlyOCtVc+p+4YUqqOp/1Bu1ly41khBNg+20BTJb57LXyYkTld0rDsVGbhOU/VHcaeJUiuiGubbqNtIGvD8qokV59ruDoyhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hlv0aqle; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07EE6C4CEE3;
	Fri, 20 Jun 2025 13:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750426516;
	bh=RkyEkvG+IgbuNXl3pljb967tt3iCqsHQtD1o1uI0N/k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Hlv0aqle1vcv+hZ8CobmiSOmQ6NGUxP2L5mD3CBlWQyC7PJfyvIi5JuTKbq7am55+
	 hZY1B1Dh4SwchALfdBYnDK+64XKldjap7qDbiL81qtJ50v/Mnm6O2SYKKJI/dRvxAE
	 C+Ah8aJdF/H+6fN8nUTn5GxnNl+c2hbMbVrowX1y3lTaTmTM0gTQE1v1M8wJ8axCal
	 IDwQiif2ZqDEN7zxxDerkrg8lmSY7K8GSjp6JYw/74W6rgGx7kCcbkvnYdiRpw+Zp8
	 GHIDJWAkcTCUlF+tM22hKkOFkDPFL0HfWvumkfpYjEzM2w/aMUTtCHBR3pVLxC4h0H
	 x1yQl8vBGSXQw==
Date: Fri, 20 Jun 2025 15:35:13 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Li Chen <me@linux.beauty>
cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] HID: rate-limit hid_warn to prevent log flooding
In-Reply-To: <20250620120232.81649-1-me@linux.beauty>
Message-ID: <448r1561-9570-7816-2705-0nso4919r3op@xreary.bet>
References: <20250620120232.81649-1-me@linux.beauty>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 20 Jun 2025, Li Chen wrote:

> From: Li Chen <chenl311@chinatelecom.cn>
> 
> Syzkaller can create many uhid devices that trigger
> repeated warnings like:
> 
>   "hid-generic xxxx: unknown main item tag 0x0"
> 
> These messages can flood the system log, especially if a crash occurs
> (e.g., with a slow UART console, leading to soft lockups). To mitigate
> this, convert `hid_warn()` to use `dev_warn_ratelimited()`.
> 
> This helps reduce log noise and improves system stability under fuzzing
> or faulty device scenarios.
> 
> Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
> ---
> Changelog:
> 
> v2: Introduce hid_warn_ratelimited to rate-limit the specified log.
> v3: also ratelimit "reserved main item tag ..."

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


