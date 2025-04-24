Return-Path: <linux-input+bounces-11978-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E278AA9AA83
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 12:37:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AFE33AC4F1
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 10:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2AE620B80D;
	Thu, 24 Apr 2025 10:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vQrn9u08"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EBF221FBD;
	Thu, 24 Apr 2025 10:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490747; cv=none; b=iTfTOz8LkfQH5gezItbMf1htzIpneUeus91cKEirHa0ljPslsNKWtrrmA8rczgziHzVQzy7oOGYCIpBUkH5RC42NXooCWmo6hdaeKvGLkyXjGc0L3hRLhEvpVkGYgkLrLMlnpewO98JKBzQ0dIJ5JPBa/XB3aNb+N1sxVHubkm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490747; c=relaxed/simple;
	bh=6Qv7UjRVby4F88uw4e5xnM2GBBt0ugEJ1k4Issm05y4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=U0J9fFHQCV2dVbnMMyU7SYVTZDkBUF771XmNYX78WqFjoVaABKZq3cDPKY1P9iH+/9cWR5TztkhHhc+kf6ABF8yrepmerMjQWTO3gEo3/0UeewsqA95JjzKt+jLoiDdQD+1hIEkCIqo6zyQiCTD6i8FeVxTfjhubjM3pHsOEQLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vQrn9u08; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF38FC4CEE3;
	Thu, 24 Apr 2025 10:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745490747;
	bh=6Qv7UjRVby4F88uw4e5xnM2GBBt0ugEJ1k4Issm05y4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=vQrn9u08igOyWA0Xwopa0LwzuFXvmVCt/S+I8bZ5+NIQUSmVSTr06ugwURzjZ348Y
	 UNbUIH/xjDE8E2a+5Vlwq5AXieIObD8y9/sV//HF2XJOJH3J1IboD1ygfRQrHd7pn6
	 KRCrDlCznn4F4AR/TMjKmgVvj5PElqXWEtIRtaOgXyb2dIkfu2aniFQSF3xENsfhgb
	 jasPk6E1yXvQghbhf4o1ciWo2mHshH8AJgUQES573++4iOgvSLSBqsbehqMzFnMSfa
	 ri2ljn8NbXDxYMyzJmnRDm+bn26KGdzSNb9NLzopKjyBTB+s/RosVf8ktMlKgFcus3
	 9F4KR8yI77rbA==
Date: Thu, 24 Apr 2025 12:32:24 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
cc: Benjamin Tissoires <bentiss@kernel.org>, 
    Aditya Garg <gargaditya08@live.com>, Kerem Karabay <kekrby@gmail.com>, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] HID: HID_APPLETB_KBD and HID_APPLETB_BL should
 depend on X86
In-Reply-To: <cover.1744273511.git.geert+renesas@glider.be>
Message-ID: <07p22q96-1r81-061q-2nns-q40q51nqp9sr@xreary.bet>
References: <cover.1744273511.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 10 Apr 2025, Geert Uytterhoeven wrote:

> 	Hi all,
> 
> The Apple Touch Bar is only present on x86 MacBook Pros.  Hence this
> patch series adds dependencies on X86, to prevent asking the user about
> its drivers when configuring a kernel for a different architecture.
> 
> Changes compared to v1[1]:
>   - Split in two patches,
>   - Correct Fixes.
> 
> Thanks!
> 
> [1] "HID: HID_APPLETB_BL and HID_APPLETB_KBD should depend on X86"
>     https://lore.kernel.org/4b046ce1cae2170453037c7ea006c91c12383dab.1744190441.git.geert+renesas@glider.be
> 
> Geert Uytterhoeven (2):
>   HID: HID_APPLETB_KBD should depend on X86
>   HID: HID_APPLETB_BL should depend on X86
> 
>  drivers/hid/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


