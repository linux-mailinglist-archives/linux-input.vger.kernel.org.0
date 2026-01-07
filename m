Return-Path: <linux-input+bounces-16829-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D114CFE601
	for <lists+linux-input@lfdr.de>; Wed, 07 Jan 2026 15:46:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 929F830DCC7B
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 14:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1FDE34B1A3;
	Wed,  7 Jan 2026 14:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d75ESGL6"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE3334B1A1
	for <linux-input@vger.kernel.org>; Wed,  7 Jan 2026 14:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767795992; cv=none; b=V1GZ8yoiFndRjc6xKJa4Xv4zKNRTxedC4E8s2Nb+zynOdTdemd8PIvpkBUrc5oexe4ToYilYCHZm1WOh57DU7Ly4bIv/pFx/GHhYy4qY1Uppe/EykPqKsa0URTeh4/d0VxrkGSkrI1y33hKsKm0p/W7sqsS2iLG0bL30QZMeiRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767795992; c=relaxed/simple;
	bh=2JdyJOgKBNftFxwPA7E01V+jgXUZkdAyusVlcbt84zU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=b1Bichq/npn62mgffPePiV1dNoJ0n/cKEqKEUk74zlJQnADot2szCsOsN7ZTg06TOamBCxP4JTv8OboyVNiFAZD3Hhp0wEIAKamDqcdKbF2bjgyJfAFOa6GBaWd19M8Nw390/ZUqcnxewGito2RjmEGYPYrJk3kwAU0kOBsq/lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d75ESGL6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1E28C4CEF7;
	Wed,  7 Jan 2026 14:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767795992;
	bh=2JdyJOgKBNftFxwPA7E01V+jgXUZkdAyusVlcbt84zU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=d75ESGL6VXtfkKeu4GP9vgQiaZgLT0MSp1Ri/GLXLfkcoc46aBlBp8Mh9TYwCQQUU
	 GbKiqHdq9f2TbydJ5IYfN+y653A3ohhhGC3ut8n32a3BZVi8CWUXo7k7FZ/UrrQtzp
	 DBu48sSCm8OT1CTPhGrCizXZaDBEuvzCfibMaWiXjtsjhgpBD/+Tv4jzbYLoJD3icR
	 DPZzvBeuUUKzJPka9379vg0Wq6Nzw+EY2XrOAB+exFJF8JmMYrUYi8YppwAAL5Pjmj
	 jGX0amR6eFxFrWaE34lP38EsNA1pChpm0wFevzMjXuwS4pLoRkGiIgtjDKzjFlm3k7
	 YCzXELc8Fyqcg==
From: Benjamin Tissoires <bentiss@kernel.org>
To: jikos@kernel.org, Chris Chiu <chris.chiu@canonical.com>
Cc: linux-input@vger.kernel.org
In-Reply-To: <20260102065643.1832426-1-chris.chiu@canonical.com>
References: <20260102065643.1832426-1-chris.chiu@canonical.com>
Subject: Re: [PATCH] HID: quirks: Add another Chicony HP 5MP Cameras to
 hid_ignore_list
Message-Id: <176779599152.3426536.7091080248632836268.b4-ty@kernel.org>
Date: Wed, 07 Jan 2026 15:26:31 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev

On Fri, 02 Jan 2026 06:56:43 +0000, Chris Chiu wrote:
> Another Chicony Electronics HP 5MP Camera with USB ID 04F2:B882
> reports a HID sensor interface that is not actually implemented.
> 
> Add the device to the HID ignore list so the bogus sensor is never
> exposed to userspace. Then the system won't hang when runtime PM
> tries to wake the unresponsive device.
> 
> [...]

Applied to hid/hid.git (for-6.19/upstream-fixes), thanks!

[1/1] HID: quirks: Add another Chicony HP 5MP Cameras to hid_ignore_list
      https://git.kernel.org/hid/hid/c/c06bc3557542

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


