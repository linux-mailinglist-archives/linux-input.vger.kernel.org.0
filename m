Return-Path: <linux-input+bounces-8301-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA3D9DBAB5
	for <lists+linux-input@lfdr.de>; Thu, 28 Nov 2024 16:40:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FC65281E5E
	for <lists+linux-input@lfdr.de>; Thu, 28 Nov 2024 15:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C27311BCA0E;
	Thu, 28 Nov 2024 15:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZvWz3H7C"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0061B6CF3;
	Thu, 28 Nov 2024 15:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732808446; cv=none; b=ZCvBdKVZYZ/8RzLUlKLjtePtF1oS7h9gL5G8TN3/YUKnhY8stS1CwkSOIm3qAhOOWGxRF/JPJ0kAoeUdwWwe94qZim9ndkxta280Vd+xhWKdt04NvXy5RopGguDoVwGUC770Qo9/FLBKD5ZETxX4Glj+YacraO03BGXHqZQiB8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732808446; c=relaxed/simple;
	bh=mA2iP2ejPJOCZrStz5dQwDnSevuBYMnW1WDNfPX2DgI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jIvcOqGj7gMaI7Qicpzvs4+ZKDuZTkoevFeMX7e3fV5OJ31keEmycGHG796+iP89QJEOM/Fdn84bSAX8hWl3GuJsxjTXfg4lPtvg5fEhQEB/UKS51GHwJoPaqkVV90RQVFubHVQFCLzMej4M0iwolOREOU/SIdSDpxSVkRcGcwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZvWz3H7C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 919B5C4CECE;
	Thu, 28 Nov 2024 15:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732808446;
	bh=mA2iP2ejPJOCZrStz5dQwDnSevuBYMnW1WDNfPX2DgI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZvWz3H7CT73DI3JWP/E+vRn5VNOHjyU/uD9APEuwlzg/Nl8DSHNiMIggxlb6no8yc
	 PqbZsNGYleVTJ0qDiCguzFOoxHSarZ44cVb4nBbysP8BM0KCzH/DC50y4rxfcQ6K/o
	 GvwXv9QbHIwzkclwEmLRlLZWblbZL/jEmH8ANM5jJ+yAQj9dgQfXll3P64bcJUSCwc
	 E5H5ozGX1tYKxnkzE7ef2yT/XYK+jVO5U5O9dNQ4LS9IKfm5o1cK9YNAuyi7XUW9z7
	 sN4cNvQ5IqDwrnGeQZIfcxahmNDc7qjGjIJeNy/x/cbrWNfYroFAHs3R/UfKBncXLM
	 DSG4a939mDWUA==
From: Benjamin Tissoires <bentiss@kernel.org>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Kenny Levinsen <kl@kl.wtf>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Michael <auslands-kv@gmx.de>, 
 Linux regressions mailing list <regressions@lists.linux.dev>, 
 stable@vger.kernel.org
In-Reply-To: <20241119235615.23902-1-kl@kl.wtf>
References: <20241119235615.23902-1-kl@kl.wtf>
Subject: Re: [PATCH] HID: i2c-hid: Revert to using power commands to wake
 on resume
Message-Id: <173280844432.2348538.2409437012007158638.b4-ty@kernel.org>
Date: Thu, 28 Nov 2024 16:40:44 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1

On Wed, 20 Nov 2024 00:53:17 +0100, Kenny Levinsen wrote:
> 7d6f065de37c ("HID: i2c-hid: Use address probe to wake on resume")
> replaced the retry of power commands with the dummy read "bus probe" we
> use on boot which accounts for a necessary delay before retry.
> 
> This made at least one Weida device (2575:0910 in an ASUS Vivobook S14)
> very unhappy, as the bus probe despite being successful somehow lead to
> the following power command failing so hard that the device never lets
> go of the bus. This means that even retries of the power command would
> fail on a timeout as the bus remains busy.
> 
> [...]

Applied to hid/hid.git (for-6.13/upstream-fixes), thanks!

[1/1] HID: i2c-hid: Revert to using power commands to wake on resume
      https://git.kernel.org/hid/hid/c/34851431ceca

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


