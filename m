Return-Path: <linux-input+bounces-9094-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 64162A0706F
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 09:57:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29ECB188A33F
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 08:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B52E32036F4;
	Thu,  9 Jan 2025 08:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lAluccdx"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA8A1FDA;
	Thu,  9 Jan 2025 08:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736413069; cv=none; b=SEfolGCJGr2P88WapaEHMj0vTpN49GGz8jhq+PWL/AhCATgKkWOYbK9IBHydKImloTCHCIUHokee6OPhzXbPGIXFyO/iI6Ez3VlSEeBZpXPvWE/p+9hPcHUKJDWEG99M37+V3pc14iZ726R9sCjauI/FKPy7mlJY2p70pcjSk2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736413069; c=relaxed/simple;
	bh=x2GsenrQunaqAI/1HgLji0dzukFaaJQHfX1V156HY20=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=A1cB7ONBke89KxhTTTTcVkqzxc+J4cCU4Gdhc7WXnlzOOrfldYyGt7oI084dWBEh4lSvuhk9lEL7bSEorE54QWi5Z/iSGF1CrBI1l4kEDgLVoAVTAiifMq7ON49NRxkRoro09J/0a42eAmFD9BTKEmklfvEyqfEJaqYAMu67gfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lAluccdx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A1EFC4CED2;
	Thu,  9 Jan 2025 08:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736413069;
	bh=x2GsenrQunaqAI/1HgLji0dzukFaaJQHfX1V156HY20=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lAluccdx3ImOki5Oe/C412QGvfef+Zz6uvtIFQ3muUweTtuTgqIqm1wDkSK26ksTZ
	 r0vqQHWy7aaGzbNizzyT67+jp0b9uGfVthe2EA9OU8FaXrTlg0xTwqPf3tqO3ldkjr
	 WMTNmd7qM2NLTFqjEJcXlf0WcIrSqXjKTf2KRhTn8RLULfmk+3i30yC2kV7VcshIPK
	 F3uxLVRdE7u4l9xwXCTJ04pMD447Vqktp1GFCfKhE1Rh29d/CrXRdGIV+mv/uf6nU7
	 dBPWQ8MsBMFk/EkEg8hFWrWkINGbC3n51aqemlAQzqQwL8XQ5gzFt0e30chTDbrBZS
	 GRctYh4jGbf8A==
Date: Thu, 9 Jan 2025 09:57:46 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Karol Przybylski <karprzy7@gmail.com>
cc: bentiss@kernel.org, mcoquelin.stm32@gmail.com, 
    alexandre.torgue@foss.st.com, skhan@linuxfoundation.org, 
    linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
    syzbot+040e8b3db6a96908d470@syzkaller.appspotmail.com
Subject: Re: [PATCHv2] HID: hid-thrustmaster: Fix warning in thrustmaster_probe
 by adding endpoint check
In-Reply-To: <20241205222221.3094702-1-karprzy7@gmail.com>
Message-ID: <0r15030s-6r63-p644-rn4q-393s3p694p1p@xreary.bet>
References: <20241205222221.3094702-1-karprzy7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 5 Dec 2024, Karol Przybylski wrote:

> syzbot has found a type mismatch between a USB pipe and the transfer
> endpoint, which is triggered by the hid-thrustmaster driver[1].
> There is a number of similar, already fixed issues [2].
> In this case as in others, implementing check for endpoint type fixes the issue.
> 
> [1] https://syzkaller.appspot.com/bug?extid=040e8b3db6a96908d470
> [2] https://syzkaller.appspot.com/bug?extid=348331f63b034f89b622
> 
> Fixes: c49c33637802 ("HID: support for initialization of some Thrustmaster wheels")
> Reported-by: syzbot+040e8b3db6a96908d470@syzkaller.appspotmail.com
> Tested-by: syzbot+040e8b3db6a96908d470@syzkaller.appspotmail.com
> Signed-off-by: Karol Przybylski <karprzy7@gmail.com>

Applied, thank you.

-- 
Jiri Kosina
SUSE Labs


