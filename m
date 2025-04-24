Return-Path: <linux-input+bounces-11961-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9054A9A89D
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 11:44:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F00B7445E4B
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 09:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFCB821FF5D;
	Thu, 24 Apr 2025 09:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N218jrY2"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F3721FF3E;
	Thu, 24 Apr 2025 09:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487426; cv=none; b=tBhqa7hdKU24MO09bmeJy/kL133j+XwLIaQ8tnApJz9DgMxN6tB1DpKhzJBahOjFFk6ksQrW2ag4NqszoXELDCHkuodjcmFOXgkjHPNhM7CGXpZPmpOuO1IyeC6nUCPd+C3m8MrTBiJBPKWeIJvpgakNK08E9+xkfyU+18VhNyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487426; c=relaxed/simple;
	bh=UdRUxgrNizbeQEksu12Ms+MCRZ7rtTm5faobax2tEMw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=jjMeG6HFoGWZbKOn9m9cTQ8Uy8t5knQ32WLqocYsjac48FQQ53cW8fY/UkgKLR6ncOo+cJMtDAm5xbAT/9GY9LE0QsZYVwEPoSXMyY7oJQN+k1BD34zhHK98oD3dwvlc4Pv7d8D28moccgLKpTHY0i7EiQZ98qyvcY2wu/TRoyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N218jrY2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90903C4CEE3;
	Thu, 24 Apr 2025 09:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745487425;
	bh=UdRUxgrNizbeQEksu12Ms+MCRZ7rtTm5faobax2tEMw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=N218jrY2yQW3SVQBVj85rvky6nPJO2UxT8z0GQR9kfUt0yPL43tMUG+HmIsk/hllh
	 Asp+VyvrCN/0T40umdzZBL+DcTEUHOB2U4r4D5RjMPLF+ip3aC6V6kDrvyO2sDHkOq
	 wqelitoGeDPdNriv1bS4qFxypuCqxqVUVwSAnyWUXehmm3LKgmB3wdSB4hQxJaZTd+
	 KPY24o/8C3lH+u59XzKlTNG9wR0plcFUYxHnPWMKdh/uJbMGMddajpkCc/kRbm3sTL
	 KRmEi9FyAj5z2uDwfRZ3X8TOjf0q76e47AqRTGkmSmMSKRzEqcUDKk7iT8lxXeFxL+
	 ghPy1FatY63bg==
Date: Thu, 24 Apr 2025 11:37:02 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Peter Hutterer <peter.hutterer@who-t.net>
cc: Benjamin Tissoires <bentiss@kernel.org>, linux-kernel@vger.kernel.org, 
    linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: bpf: fix BTN_STYLUS for the XP Pen ACK05 remote
In-Reply-To: <20250324053625.GA79579@quokka>
Message-ID: <59oo0905-nn07-o18o-7537-9pp3204255nr@xreary.bet>
References: <20250324053625.GA79579@quokka>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Mar 2025, Peter Hutterer wrote:

> Usage_Dig_BarrelSwitch was applied in the UsagePage_Button
> which incorrectly mapped to BTN_TOOL_PENCIL
> 
> Link: https://gitlab.freedesktop.org/libevdev/udev-hid-bpf/-/merge_requests/193
> Fixes: 834da375 ("bpf: add a v6.11+ compatible BPF fixup for the XPPen ACK05 remote")
> Link: https://patchwork.kernel.org/project/linux-input/patch/20250207-bpf-import-2025-02-07-v1-7-6048fdd5a206@kernel.org/
> 
> Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>

Applied, thanks Peter.

-- 
Jiri Kosina
SUSE Labs


