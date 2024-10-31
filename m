Return-Path: <linux-input+bounces-7813-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E4B9B80C1
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 18:00:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D83A2823E7
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 17:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06ED719DF60;
	Thu, 31 Oct 2024 17:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a7AA7x0W"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FF326AD0;
	Thu, 31 Oct 2024 17:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730394033; cv=none; b=SttFZxsf0cDxRVMS3MLqHqJuFmw42FXIj7SSnxsm9vH4c8h8wmItKcHoeiGGV+0fYHQ6vm3CkkxnDVSIfJM8b28z0TmnoAweCRHmDEeFha+/5oVO91HmNZgJXZgDFlNn8AFMx49PbK4qrgapNFT7mFuhSUZmro+7K29pg6/0J/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730394033; c=relaxed/simple;
	bh=Ec0dfNXPdtRnZ1FzN1nuF3yly5U2x7zqaKVwZEidAQA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gXeZ8OM/KMWsB2vW1Cl+VoqzPHQyHZ1q4V8gWzDU/9QpjOjjmPhxue03ctxnhmCWpsglmtRkQ2ymfD9D54sEuyUVuSc1bZU3PqU8n1+KNA0oMI9ShHnuzrgdgs0hiemENtgd3zuTycIYRFlG1LqdubW7sYXYxkQNs6DGas8B1XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a7AA7x0W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9755BC4AF63;
	Thu, 31 Oct 2024 17:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730394033;
	bh=Ec0dfNXPdtRnZ1FzN1nuF3yly5U2x7zqaKVwZEidAQA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=a7AA7x0W9ou8hc6tpPzbtjiJA/UFH1WCly8/h4HDDHNN+CRJJex+8nQYgjQODxGZ9
	 d1vkuL7DeH027/TFFN3EPrAg49o2bVc+VwMKyX2qwI+rE/1AanW18rPtFbgD7Vk58T
	 lzfngkjl20+KuTjMUhF0/p/xTmrb9T7+TZAuc7fFMcqiDR6/ik9VICqqlq0k/zbGA9
	 S2jgyE+icbOIJbaOq6pRu9/J2boKvbEs2qfccTkWwPldWTjSa4si8HQpa7LqOAIAp6
	 9rLQy2HpF14J7jOcdIvg4SbdoPgVBYNL2zz8IaEkwjYFWdvcsaYUUIOc3h0fHQGpTx
	 VnXqdENTrKJrQ==
From: Benjamin Tissoires <bentiss@kernel.org>
To: Jiri Kosina <jikos@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <Zx_hBvg5Qa3KU3ta@google.com>
References: <Zx_hBvg5Qa3KU3ta@google.com>
Subject: Re: [PATCH v2] HID: multitouch: make mt_set_mode() less cryptic
Message-Id: <173039403232.835209.12009251652096122219.b4-ty@kernel.org>
Date: Thu, 31 Oct 2024 18:00:32 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1

On Mon, 28 Oct 2024 12:07:50 -0700, Dmitry Torokhov wrote:
> mt_set_mode() accepts 2 boolean switches indicating whether the device
> (if it follows Windows Precision Touchpad specification) should report
> hardware buttons and/or surface contacts. For a casual reader it is
> completely not clear, as they look at the call site, which exact mode
> is being requested.
> 
> Define report_mode enum and change mt_set_mode() to accept is as
> an argument instead. This allows to write:
> 
> [...]

Applied to hid/hid.git (for-6.13/multitouch), thanks!

[1/1] HID: multitouch: make mt_set_mode() less cryptic
      https://git.kernel.org/hid/hid/c/5f21e2242f9f

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


