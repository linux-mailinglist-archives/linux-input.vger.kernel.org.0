Return-Path: <linux-input+bounces-12342-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBF3AB5A4B
	for <lists+linux-input@lfdr.de>; Tue, 13 May 2025 18:40:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D3FE3BCA77
	for <lists+linux-input@lfdr.de>; Tue, 13 May 2025 16:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51C562BFC7F;
	Tue, 13 May 2025 16:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l3xY6cbu"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1A72BF3C2;
	Tue, 13 May 2025 16:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747154200; cv=none; b=AgYMkCykXMe/x4adg0Rc6S9wYKnh2MUbZdArYuh3OswwrpW2qSr2ioM9b243B8lG+rBxppRF1yy0hn9nCAyWi+PfJw8Jv29euumJZYKy+BImN0TBJA0pTBrjrmTyr7rsnsr7ZKL8TqOKURQDTpXnip4MikYCcjtTyONlcQByyyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747154200; c=relaxed/simple;
	bh=1fc/sQ+P9o0ipV5D3O7z9zWJXnbN0LEa3EBYKHDE8BI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KtXv9VyzfK0cF/Xraesx+Gkhe6w9ipCPqamXtUmW6MVqnyrVyK6bGy2faaS3vYVt6LzXuDrbrNmEeW/hFd/e6hdRsx56fO7w5uvL8Z1Gdm3bpcQ2LZfGGouk+6vqkLc8ufQC9vlAysWXcbT6M4OCfgyh6U3jbMkMCtpRvqU/Oqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l3xY6cbu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5E02C4CEE4;
	Tue, 13 May 2025 16:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747154199;
	bh=1fc/sQ+P9o0ipV5D3O7z9zWJXnbN0LEa3EBYKHDE8BI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=l3xY6cbuC43zDEKCwhVN97tK+3pyTXjYOMqxjuc0IlxYHiqGLU2E6v/Wg+USfx5Nk
	 kBfqDoNe2Ox4emAzyHaZb7tn5xGFogadkAKK5QLb213QbzvHhvOt1qQqLOGWyKqkNP
	 TIlCW8oOJQaSlN5kuG6EX7h9b4cZ0bogK5OYwnqaQ1PkDIYTKJvUlvwrRB4OLEqCWi
	 7qyTTqfR1BhdMUAlrAAuDRFYKjmPEttZZ6yE62pulFs5t2Trd4NqOTyUvo/h43OEKz
	 vz16zyMPF3KO+N0aqKCbzHdT7MNnNPT6tdmoT3V4KbpkGUiEGpAeaRK5p25NTJuwZH
	 mXNGw/1b/KaVA==
From: Benjamin Tissoires <bentiss@kernel.org>
To: Jiri Kosina <jikos@kernel.org>, 
 Werner Sembach <wse@tuxedocomputers.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250211133950.422232-1-wse@tuxedocomputers.com>
References: <20250211133950.422232-1-wse@tuxedocomputers.com>
Subject: Re: [PATCH 1/2] Add functions for HID drivers to react on first
 open and last close call
Message-Id: <174715419848.1763317.447136950522845466.b4-ty@kernel.org>
Date: Tue, 13 May 2025 18:36:38 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Tue, 11 Feb 2025 14:39:05 +0100, Werner Sembach wrote:
> Adds a new function to the hid_driver struct that is called when the
> userspace starts using the device, and another one that is called when
> userspace stop using the device. With this a hid driver can implement
> special suspend handling for devices currently not in use.
> 
> 

Applied to hid/hid.git (for-6.16/core), thanks!

[1/2] Add functions for HID drivers to react on first open and last close call
      https://git.kernel.org/hid/hid/c/a98e892c6942
[2/2] Disable touchpad on firmware level while not in use
      https://git.kernel.org/hid/hid/c/6a9e76f75c1a

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


