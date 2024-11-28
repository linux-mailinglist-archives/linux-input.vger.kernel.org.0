Return-Path: <linux-input+bounces-8302-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A029DBABA
	for <lists+linux-input@lfdr.de>; Thu, 28 Nov 2024 16:41:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0078816308E
	for <lists+linux-input@lfdr.de>; Thu, 28 Nov 2024 15:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E4811BD9DA;
	Thu, 28 Nov 2024 15:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oW241e86"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047C41BD9D5;
	Thu, 28 Nov 2024 15:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732808449; cv=none; b=OBypYL35MRHmtANVmjatCWi9OvDcAvdGvzcQwkLIOOofPmrAQzHKzE2RpZIvLU5g9DrJt5a434a1v8os5tHiG+bnfP5DjA+4zt95Dz11QbzliMjIiCrRhoI48uaErbSkfYHoMXaNL865vxLDyK+HNncgBCJaEtniNNlfd8/TsGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732808449; c=relaxed/simple;
	bh=FvsG4S29AmRQFwVZB5AZdbjLZxe+ZC4cqXNR1PznjAA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=I0NDN8T8+7F76UfOf328nqCpF0VTX1xlw81w/9pXXrkXttml0GwMlj23BxCmQBiTB6idTPyX88+qKJYt1em/yfr3JyOOqpfyQ7vjf8qpJreJKqbYiiwq6F6B0g7Mf0G1olDwhcndDykAcfqJp+GoBo6gX36tKIkZzff6OxWrieQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oW241e86; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B9DAC4CED2;
	Thu, 28 Nov 2024 15:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732808448;
	bh=FvsG4S29AmRQFwVZB5AZdbjLZxe+ZC4cqXNR1PznjAA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oW241e865krrrG5SVuHX9NX8VC3uzB1MzuZwRhrfielnRJYIDAZIPZ8Kp/8EF70Ko
	 i6iXF3wHYhsJ3i62YyM7fMFfzGd4ZGEpfHjQjVNDxut9hWKMBlXNdmgXRjH+gcsw7V
	 u7dLGWIaRKkRxMsHn3G3dUC2DD0MW3HSiNxBSlarriFw4wg+fKhpxh//ReOQjCjJpR
	 8y1fmaRl0RO6Wg20R80BxYP6et6BUsEHrDXNprARh7l4S7/4YyJJjGe+GE+UWjW0Lr
	 ydKMpzIEUAfLK+17Mk5Bhf+awcjeRQpiFemP4p/pyR3FNvQrlw/1IndzojsYrZVefh
	 5CSq+jorGsv/w==
From: Benjamin Tissoires <bentiss@kernel.org>
To: ping.cheng@wacom.com, jason.gerecke@wacom.com, jikos@kernel.org, 
 WangYuli <wangyuli@uniontech.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 guanwentao@uniontech.com, zhanjun@uniontech.com, 
 Zhenxing Chen <chenzhenxing@uniontech.com>, Xu Rao <raoxu@uniontech.com>, 
 Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>
In-Reply-To: <B31757FE8E1544CF+20241125052616.18261-1-wangyuli@uniontech.com>
References: <B31757FE8E1544CF+20241125052616.18261-1-wangyuli@uniontech.com>
Subject: Re: [PATCH] HID: wacom: fix when get product name maybe null
 pointer
Message-Id: <173280844631.2348538.12711662078569266184.b4-ty@kernel.org>
Date: Thu, 28 Nov 2024 16:40:46 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1

On Mon, 25 Nov 2024 13:26:16 +0800, WangYuli wrote:
> Due to incorrect dev->product reporting by certain devices, null
> pointer dereferences occur when dev->product is empty, leading to
> potential system crashes.
> 
> This issue was found on EXCELSIOR DL37-D05 device with
> Loongson-LS3A6000-7A2000-DL37 motherboard.
> 
> [...]

Applied to hid/hid.git (for-6.13/upstream-fixes), thanks!

[1/1] HID: wacom: fix when get product name maybe null pointer
      https://git.kernel.org/hid/hid/c/59548215b76b

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


