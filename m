Return-Path: <linux-input+bounces-9100-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F71A070D7
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 10:06:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0128A188A899
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 09:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ACE8204C0E;
	Thu,  9 Jan 2025 09:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aQfPWYpn"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013E52010FD;
	Thu,  9 Jan 2025 09:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736413610; cv=none; b=PsPCgdMclGG0cjt4MQ8Nuvg+C+jL2faKmezuDr/vHDBA+fTLz5VZLMJfRapv1O+twxiGkBBWY34SofjRHAvY+ANsYZVAx7a6omJQwyyEVqpoiPipzMqowlkhPx5Fhw43AUDcrLW+idBGHQQC3v1GlNuGFbU0Y5mtsQBG573D+aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736413610; c=relaxed/simple;
	bh=t3WFYrfwCsAoJkRTRQEIgQzkK/QABYo/9RzcWlT8ktg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=jhQtlLJPUkHSleH1aomyxAeWofi42rKt3QmuX+IdT7Y492uU/S3cSP5Weyk9u42Ngb/asKGPHmw7JdzRL2mNsOJgyQ18cp1mQLm3brGJ9/ODVwlCb04vi5NNCeiKVCxm0ELKK1d/5JrV6D9u1xKnoNQO8jieijF1XzpakVarrMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aQfPWYpn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7904AC4CED2;
	Thu,  9 Jan 2025 09:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736413609;
	bh=t3WFYrfwCsAoJkRTRQEIgQzkK/QABYo/9RzcWlT8ktg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aQfPWYpn5rGThm3a7LqPHh1X+Gn2DzJ3eR/sUaqidK/EylUs2lpLa9R43gvI7+I5v
	 43MTf+YAFKgvztG8gqRAKDeBKwRyNrbTpcXuHY/HyDWNqw3GhLelj3PFME61MLy5xm
	 QJiR7Q3MTvhHMaDaFVA3NkVPqqFGloKMuOsYFZUpl7DdiNOMShIyCN42NmEByKedYi
	 I84SuUdTPUGhFBVy0hbBUhan7gt5yDXBVZwIV7ayLGQq8O7/gWuHos1j9I3uEuw4Io
	 NGynZqe8gdhojuhrFrX+ThCMtEVnqN0Ux14olMK0jLbhHAohSP9KpEcH2OUtc260Ly
	 qMvPa03pqXFWA==
Date: Thu, 9 Jan 2025 10:06:47 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Terry Tritton <terry.tritton@linaro.org>
cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org, 
    linux-input@vger.kernel.org, Aseda Aboagye <aaboagye@chromium.org>, 
    Peter Griffin <peter.griffin@linaro.org>, 
    Terry Tritton <ttritton@google.com>, Carlos Llamas <cmllamas@google.com>
Subject: Re: [PATCH RESEND 1/1] input: fix generic desktop D-Pad controls
In-Reply-To: <20241220192318.1174945-2-terry.tritton@linaro.org>
Message-ID: <qp179r82-pq47-n2r8-0912-p8s21965143s@xreary.bet>
References: <20241220192318.1174945-1-terry.tritton@linaro.org> <20241220192318.1174945-2-terry.tritton@linaro.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 20 Dec 2024, Terry Tritton wrote:

> The addition of the "System Do Not Disturb" event code caused the Generic
> Desktop D-Pad configuration to be skipped. This commit allows both to be
> configured without conflicting with each other.
> 
> Fixes: 22d6d060ac77 ("input: Add support for "Do Not Disturb"")
> Signed-off-by: Terry Tritton <terry.tritton@linaro.org>
> Reviewed-by: Aseda Aboagye <aaboagye@chromium.org>
> Reviewed-by: Carlos Llamas <cmllamas@google.com>

Ouch, indeed, that was broken, thanks for the fix. Applied.

-- 
Jiri Kosina
SUSE Labs


