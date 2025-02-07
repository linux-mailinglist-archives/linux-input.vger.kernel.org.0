Return-Path: <linux-input+bounces-9831-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE66A2C279
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2025 13:18:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37C53161C86
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2025 12:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A76C01E5B67;
	Fri,  7 Feb 2025 12:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fZHyMuF2"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8223C1DED70
	for <linux-input@vger.kernel.org>; Fri,  7 Feb 2025 12:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738930660; cv=none; b=bx/y+0FA75PKAiPVU8upSR1vdVcMxqv7S4kkBN3GQ76WouKJ2tCDvfNTNZ5PTf0787WXw9B2mzoKbvEo5rKJadjogh9QZn7JPEv4fGIR3FQqqPlS4ScZMoGqXZG9FkcuIGdzDRNL/Cce0uRyC0nTnCvIIXfO4TVvk/xGvKkYo7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738930660; c=relaxed/simple;
	bh=z5H7QBU8xEn6MTRTkULJRO8u+uEae7MjMsmCpeE32/8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JamhmoqL8IclrqK9gga7N5YyKpzQt3gqxJW7gsMXdiWI+bt5KTG97K8+UQGuFhmxZWfGsF8Ce4Nj6aqjsysDG8Qd4/tScZAq7EXz6andc+yo7G6bkZnxacky48Pw6h+knxadAwCAgQRAt4OsrzCnTuaN+9fsnP3kQ5EaYsgNc8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fZHyMuF2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCCD0C4CED1;
	Fri,  7 Feb 2025 12:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738930660;
	bh=z5H7QBU8xEn6MTRTkULJRO8u+uEae7MjMsmCpeE32/8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fZHyMuF2bvLOzgtm0pM2sEgABK85km8B+kQ6MbX3EqFtv6rUIA54DrAZH/Ehwgzi+
	 8cSCj+GyJg4prWDfPgGSWRQX0ox1deq3ATYEcZ/JuVWB7kjz/5iATGpAPphRO2qwp2
	 zx1AJNbINUPCpCCBH6njPH/OqqQmeZLNpxT6plrkUBL7FUssDiJKbGwDQqev6Nf3hn
	 g9AjaABSb9Y+nMEwYpH3b5tNkJ/syp3TpV1im5W6Siqia2eSLF9Lr7aFpEs7rU+jk3
	 q1ft/JaucH/q8e6ZKx9uGUEFlQCuCozdqY/CfyHN9ZonjycYZ8f4h7qzX7/lwOlm//
	 QVgF7Tkg4Fvsw==
Date: Fri, 7 Feb 2025 13:17:37 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Roderick Colenbrander <thunderbird2k@gmail.com>
cc: Alex Henrie <dhenrale@amazon.com>, roderick@gaikai.com, 
    roderick.colenbrander@sony.com, linux-input@vger.kernel.org, 
    alexhenrie24@gmail.com
Subject: Re: [PATCH] HID: Enable playstation driver independently of sony
 driver
In-Reply-To: <CAEc3jaDtBwBdH2sqMFqR+0C+GeNJ5-p0JB7ruxwfmnB9CnfuZg@mail.gmail.com>
Message-ID: <1o20q453-5qop-52r6-ro2s-on09q503p3sr@xreary.bet>
References: <20250205202532.2586-1-dhenrale@amazon.com> <CAEc3jaDtBwBdH2sqMFqR+0C+GeNJ5-p0JB7ruxwfmnB9CnfuZg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 5 Feb 2025, Roderick Colenbrander wrote:

> Hi Alex,
> 
> The change in general looks good to me. It had been an oversight.
> While add it, I guess also include the PS5 controllers in that list as
> well.

Can I take this as your

	Acked-by: Roderick Colenbrander <roderick.colenbrander@sony.com>

? I can do the PS5 change myself on top.

Thanks,

-- 
Jiri Kosina
SUSE Labs


