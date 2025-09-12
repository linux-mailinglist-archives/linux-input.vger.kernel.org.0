Return-Path: <linux-input+bounces-14661-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4E7B553C6
	for <lists+linux-input@lfdr.de>; Fri, 12 Sep 2025 17:38:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FFE91B2260E
	for <lists+linux-input@lfdr.de>; Fri, 12 Sep 2025 15:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF9A42253FD;
	Fri, 12 Sep 2025 15:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wd74tKSm"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8877741C69;
	Fri, 12 Sep 2025 15:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757691487; cv=none; b=KTi2dwch77Kq0j1H3cXlCIDtdd66DWCOe0nY+NVcg5d6PNAazc/9sO/40uq6lfzk+Xy5CmmHA/Z17ChU/0JI/3Egs+6CS1xlxwzMPkDdCTv0vyNPwbMTp97saU78dHwvnYygE3n9p68n2C5zIRf8cAyCp0n6heHuU1YDUS3HopE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757691487; c=relaxed/simple;
	bh=FIXOusmClmEDElszqhmgBwbKHv1LUrSyp+tPS9ku534=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=PxbG7UQq6nljVgxG2u7y/RAxaQVw8aW2IFkiUZEF6Rj34O+wN4PYu5SDhbgQ95PXl1Fw+UDmhC2X4sMTo3fDYGbglatrjw3DjbdU47KhUMxzPFliAcJuwY/aYTw2skXxRUu+AtpwuilPPWgUNBAF3xIf7LBfs6zJPuV6J7A8is8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wd74tKSm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1DEDC4CEF1;
	Fri, 12 Sep 2025 15:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757691487;
	bh=FIXOusmClmEDElszqhmgBwbKHv1LUrSyp+tPS9ku534=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Wd74tKSmaHgd6sfB4t0xwE76vUswbiJlejk5XRwmhoNZ5yW0WFKbbCBLAE/PQMgaA
	 YuudEvuBgJ88zt7qBBEF7YI1gPEhUZRgWE09aGQiH8LYVCOa9cKSW+jSYVmBd1d/34
	 hPniMaV20H70cCUmgcTC+HdMle1yI/SBy04Br9cEJ1JdzraRU0jBa2OlekV7VI8u+Q
	 Uy9NRzjG2iYSP8SbPOJdDoBYJy6hXKzwFkE7jsJmum2jsWBT6fFbRfC28KfFo39XZx
	 FmoTwue5YNHJsBeGmh/x7YOHhvM9vXAxJh+Lr3qdhQlyI5nDVt+sdNINd6AdtJZ2fO
	 zwsJZZpzsijGA==
Date: Fri, 12 Sep 2025 17:38:04 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
cc: Roderick Colenbrander <thunderbird2k@gmail.com>, 
    Roderick Colenbrander <roderick.colenbrander@sony.com>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Henrik Rydberg <rydberg@bitmath.org>, kernel@collabora.com, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/11] HID: playstation: Add support for audio jack
 handling on DualSense
In-Reply-To: <c6a16e71-e431-47dd-a3d1-6a79fd7e4a37@collabora.com>
Message-ID: <r8qr0nrn-0n5r-6r96-7p26-q22ns73484np@xreary.bet>
References: <20250625-dualsense-hid-jack-v2-0-596c0db14128@collabora.com> <s4596421-sr43-893r-o90r-86nr588sp32q@xreary.bet> <74d4675d-d6f5-41ed-b715-f62fb569df5d@collabora.com> <CAEc3jaAFV_PXdFAX9th4-hhKNAhBKdVCNP+Qf8nH=g8FwoCabQ@mail.gmail.com>
 <CAEc3jaAGP3HV_+tGLHWZXA-baD4HkA2nYWGxpmox4cuZMh+ksw@mail.gmail.com> <CAEc3jaD8tUNW6hkPHDp=iGmdwD5m3uKg0vNtyZr-u1mmPSAkVQ@mail.gmail.com> <ab1c06b1-9b79-426a-a43b-cf5a89688770@collabora.com> <CAEc3jaDsX8OSVskO6-Rsvn12BbV2-8ZjhV+tPaRpu9Nai3czEg@mail.gmail.com>
 <8f7242f0-c217-47e4-ad88-fc1481ca936f@collabora.com> <c6a16e71-e431-47dd-a3d1-6a79fd7e4a37@collabora.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 27 Aug 2025, Cristian Ciocaltea wrote:

> It's been over a month now since this was kind of blocked without any clear
> reason, and by the end of next week I'll be on leave, which means we're
> close to missing the merge window once again.
> 
> Considering the counterpart quirk in the generic USB audio driver has been
> already merged since v6.17, I kindly ask for your support in getting this
> into v6.18.

Roderick, do you have any word on this, please?

-- 
Jiri Kosina
SUSE Labs


