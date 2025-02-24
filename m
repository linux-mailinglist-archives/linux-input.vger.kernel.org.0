Return-Path: <linux-input+bounces-10276-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEFEA4176F
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 09:36:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F6623AAB89
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 08:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A992746C;
	Mon, 24 Feb 2025 08:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tff7ZpM4"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08BB8C11;
	Mon, 24 Feb 2025 08:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740386155; cv=none; b=kYSXUBi1dDR3TAhoBfpBysih8WrFU8x4csLFNOSEsiDTLYa1qhR3FMzQ+wtCz+NQB4oedHRosAgc6JBY6Vm8itZvJUV+rw78M3jUNL7pF2tteZ2Shsbu+KW059jQosxSYWeB7MeWUlQSay02z60YSbizJ/GC5PsUzjoR4cD2YHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740386155; c=relaxed/simple;
	bh=WuwA9lx8DIhJc69cVxyeSZRKBoaJAiCZxmUVd9ueWRg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lsL/qIuG8L5KJeOYTLUocqgFBnAKoMtGyYgruQoxnhblrDPi/8YomjejiUUMA/TIwCetDkvoGvlM/X8Oz+fxO6UX+PoS8Lyfwvd0PMZKBMY4qf0YKgB2Vw3XhR8WXQ2AJQ45n9ATTbx3uNQJrjtNaoIjeO11mQGcPzd+lnOAuP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tff7ZpM4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF107C4CED6;
	Mon, 24 Feb 2025 08:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740386155;
	bh=WuwA9lx8DIhJc69cVxyeSZRKBoaJAiCZxmUVd9ueWRg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tff7ZpM46rgfQr8eH8R0XyOxkGKWhcgkcpIfyxVQhRwy7dtsyDT+sjFkKwrNRRd7j
	 YbJQpiNXvjER/UK5xKeMALWvEWTai2lzCO41VZ3KFSpHyEUD077DfERFT503A0EGO/
	 6zSRVKs6y8qEDDhaJg11fNRavgyMfglZ0LQ7Y/tuY2QEGwDiHt30jlTDOCBUatN0Zx
	 5uJVXHNqR0FOiMt0PTpz7P7bXe0zdbCpOeFqO5QQcl0pRdgQfr95T1HZIQEQsyrAU2
	 gw1V1VtEwxGAgWmQZIn4f8JkHAVkgVdqmXN3jWNqiogsiR+HrxH8gykasXf80tGiLa
	 AtUH3TjrxJfyw==
From: Benjamin Tissoires <bentiss@kernel.org>
To: Jiri Kosina <jikos@kernel.org>, 
 Peter Hutterer <peter.hutterer@who-t.net>, 
 Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 Werner Sembach <wse@tuxedocomputers.com>, Aki Van Ness <aki@lethalbit.net>
In-Reply-To: <20250207-bpf-import-2025-02-07-v1-0-6048fdd5a206@kernel.org>
References: <20250207-bpf-import-2025-02-07-v1-0-6048fdd5a206@kernel.org>
Subject: Re: [PATCH 0/7] HID: bpf: sync with udev-hid-bpf
Message-Id: <174038615371.3769057.7408139095276010309.b4-ty@kernel.org>
Date: Mon, 24 Feb 2025 09:35:53 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1

On Fri, 07 Feb 2025 14:55:56 +0100, Benjamin Tissoires wrote:
> Here are a few hid-bpf device fixes from udev-hid-bpf.
> We've got the usual XP-Pen and Huion plus one from TUXEDO.
> 
> Cheers,
> Benjamin
> 
> 
> [...]

Applied to hid/hid.git (for-6.15/bpf), thanks!

[1/7] HID: bpf: Add support for the default firmware mode of the Huion K20
      https://git.kernel.org/hid/hid/c/56be86393214
[2/7] HID: bpf: Suppress bogus F13 trigger on Sirius keyboard full fan shortcut
      https://git.kernel.org/hid/hid/c/43db1911f807
[3/7] HID: bpf: Added updated Kamvas Pro 19 descriptor
      https://git.kernel.org/hid/hid/c/531a1cc66713
[4/7] HID: bpf: add support for the XP-Pen Artist Pro 19 (gen2)
      https://git.kernel.org/hid/hid/c/4be933521ffa
[5/7] HID: bpf: import new kfunc from v6.10 & v6.11
      https://git.kernel.org/hid/hid/c/91bb3115efdf
[6/7] HID: bpf: new hid_bpf_async.h common header
      https://git.kernel.org/hid/hid/c/4a94deb94994
[7/7] HID: bpf: add a v6.11+ compatible BPF fixup for the XPPen ACK05 remote
      https://git.kernel.org/hid/hid/c/834da3756f49

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


