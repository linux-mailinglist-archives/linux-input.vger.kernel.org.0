Return-Path: <linux-input+bounces-16636-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D044CCFFDF
	for <lists+linux-input@lfdr.de>; Fri, 19 Dec 2025 14:13:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33ECB30848A3
	for <lists+linux-input@lfdr.de>; Fri, 19 Dec 2025 13:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20758328260;
	Fri, 19 Dec 2025 13:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="chQlgzeX"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4CD3A1E9E;
	Fri, 19 Dec 2025 13:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766149560; cv=none; b=Kj6pv/qKzd4EGSb3VTNQZwPMx1/Sm5EdP7hYSNECu+aqtY8tjUpyUQRh33HIAOs1mPGvrKHSURtiVviF+4FFkUVvSc4ZRnwSiJqyvYqbGgAW8pNWT+FzuINCnBb6SOBTpXIY6J3qkEZ1FrnoGCC0PABASMtfiHWWvQOo4LNVy4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766149560; c=relaxed/simple;
	bh=JPjTL4XH7T+jm2QkvjMJ3FNkyWPChas1lnuAIeBBGVs=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=D6dZjL+svDZD7nRBlz28WNVH5akXQxs4eALSJz/5NKGYBTzUVL8C/l8dvUgxBUEbLaKt9bIkJc7T6onr1rVpO5yyqMTAlOzTDH0QaNphp713deJRavktmCiWWa6pY65dSVsBdgL6aQlZIB4sWqTfMkNaoE4+7iubpnnNhD2wz4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=chQlgzeX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8450FC113D0;
	Fri, 19 Dec 2025 13:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766149559;
	bh=JPjTL4XH7T+jm2QkvjMJ3FNkyWPChas1lnuAIeBBGVs=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=chQlgzeXIBLnpBXvpilb7+VUIDvlKzJ8lwT7NFkhLW9a4Wc4KHXDex9Uvx3n+yZ2j
	 2AfakOOBSpuWWpXz5MS8OwKwVPSuGRDWw2lR3hJghMRalOJsVQ6uvoeqpEe3G5j6vi
	 li//92U3i07PY97c9DgT0vKt3oimhopVUmCilpIyksSN1l2xzg/Ves7nElDbqkArZ0
	 yrCtvFQiyg/s3nUwttSN5i0mFjXz73yAsVmnSsiHGHVKQEKE9/a41BsxyM0fBl1yAu
	 WDalQYg2CgLQAv+zvQIqs252Gl0NzeoIgvOlTkqS3DTVaMyo9SkX29mA9ZBQop1SH9
	 7evPtsw85x5UA==
From: Benjamin Tissoires <bentiss@kernel.org>
To: Jiri Kosina <jikos@kernel.org>, 
 Roderick Colenbrander <roderick.colenbrander@sony.com>, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Siarhei Vishniakou <svv@google.com>
In-Reply-To: <20251111234519.369652-1-svv@google.com>
References: <20251111234519.369652-1-svv@google.com>
Subject: Re: [PATCH v2] HID: playstation: Center initial joystick axes to
 prevent spurious events
Message-Id: <176614955824.1654761.12377841756672891057.b4-ty@kernel.org>
Date: Fri, 19 Dec 2025 14:05:58 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev

On Tue, 11 Nov 2025 15:45:19 -0800, Siarhei Vishniakou wrote:
> When a new PlayStation gamepad (DualShock 4 or DualSense) is initialized,
> the input subsystem sets the default value for its absolute axes (e.g.,
> ABS_X, ABS_Y) to 0.
> 
> However, the hardware's actual neutral/resting state for these joysticks
> is 128 (0x80). This creates a mismatch.
> 
> [...]

Applied to hid/hid.git (for-6.19/upstream-fixes), thanks!

[1/1] HID: playstation: Center initial joystick axes to prevent spurious events
      https://git.kernel.org/hid/hid/c/e9143268d259

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


