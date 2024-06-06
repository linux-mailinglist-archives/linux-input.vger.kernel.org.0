Return-Path: <linux-input+bounces-4162-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8188FE13F
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 10:40:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B353F1C24976
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 08:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E27813C812;
	Thu,  6 Jun 2024 08:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qFDKTftW"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EE473477
	for <linux-input@vger.kernel.org>; Thu,  6 Jun 2024 08:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717663239; cv=none; b=dX2lN40EfRuer2wUO98sGKhbp8XRM+mFCc8IrCCexK7jz0TcSNR1E+HtslxzX0xIAkH9tz00BDioh1A27z8xp7tIzB2yfd7LH+tB0WiNxTyIGN5ZFilXS3atqr44rwfX7Wrcz7T1r1oQPFx/hnD8JmgffNp3cFGY4La1Jx+iNQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717663239; c=relaxed/simple;
	bh=SzsHot4ljj0Sl4gFOE+wAgtBDUAMCYc5Kfia8x+oSnc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DFG3DR8SzMNr3MtzZoID5X7mstwMUW6V2M5viCtRi73Zf+5/rZ5AePBOv8K7F2ROpWWO6rh0s2UiW3J0LcYm82AogGL+VvBy7396u2njOAYDiqMN0oFgf2Dqu7YsOKaAKN4nW1jQUmLfZs9YXkDwG+ZfLtupjTSZxkcFRqsNd98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qFDKTftW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C76B4C4AF07;
	Thu,  6 Jun 2024 08:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717663238;
	bh=SzsHot4ljj0Sl4gFOE+wAgtBDUAMCYc5Kfia8x+oSnc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qFDKTftWZ2mTnkTz7kKcChEJl/Ir/jO61szGkV6sTQPhpBw7JZhDCMcWKOJoWBCdi
	 T58YzX6VKYBRSxS5HsoGuivveH6xhpV15oPzVy6/de7v/fGMm+HWftGC1UP+LTa5cg
	 n1gZGAUK3tH3JilSm59xKlcC48IFOuwOQUSDRX2VllYUbIs5LHf8x4dlpvhuFU5dwU
	 TzDqX7Dhzx2frstFyyIzCHqwK6hmp8S7hwijo8YFDNCmJQPqwSbWgE9CvUOuGCuMQk
	 LCyyc9QF8Y6TQfsOU9aCDUaGBI+CObNDQBqlfhkP4WCKqA5u4jWCxah772HIivxo1b
	 UC0BZnjxmhl4A==
From: Benjamin Tissoires <bentiss@kernel.org>
To: Jiri Kosina <jikos@kernel.org>, Aseda Aboagye <aaboagye@chromium.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 linux-input@vger.kernel.org
In-Reply-To: <Zl-gUHE70s7wCAoB@google.com>
References: <Zl-gUHE70s7wCAoB@google.com>
Subject: Re: [PATCH v4 2/2] input: Add support for "Do Not Disturb"
Message-Id: <171766323754.2920183.8091026161506538325.b4-ty@kernel.org>
Date: Thu, 06 Jun 2024 10:40:37 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4

On Tue, 04 Jun 2024 23:16:32 +0000, Aseda Aboagye wrote:
> HUTRR94 added support for a new usage titled "System Do Not Disturb"
> which toggles a system-wide Do Not Disturb setting. This commit simply
> adds a new event code for the usage.
> 
> 

Applied to hid/hid.git (for-6.10/upstream-fixes), thanks!

[2/2] input: Add support for "Do Not Disturb"
      https://git.kernel.org/hid/hid/c/608b62583b58

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


