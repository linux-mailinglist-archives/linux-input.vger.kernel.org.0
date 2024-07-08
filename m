Return-Path: <linux-input+bounces-4896-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEC7929EFD
	for <lists+linux-input@lfdr.de>; Mon,  8 Jul 2024 11:24:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82A8F285313
	for <lists+linux-input@lfdr.de>; Mon,  8 Jul 2024 09:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45BAB558BA;
	Mon,  8 Jul 2024 09:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EqHjsNTS"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCE73D0AD;
	Mon,  8 Jul 2024 09:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720430643; cv=none; b=lGKMr0pypX3F7zi5TYxTfsSSnN1X2Inbk+lSrHG3ZlckS4CYZMb2qTVpCsJxd5alf9o9XsEkh+cW6mZYQr2T4Avu74vEE6v7MEkSpmMN6B7IjxEaHrxvvD94udXH56S4G5qoNus+UNxvY3ibKE+o2gHRpUcSZ9RE+7pyw8x/SPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720430643; c=relaxed/simple;
	bh=nTynzleANp1b5PUBbvg0geeK7VnuU+V2yh/HYTvcZAk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=F2+TEjzXpzBJOYC96GrhOV2uQpwHAYJgKLxwGqqDtliiaZK3mbDtx60Xx0ktraaJ82+ER1lbKVklhjMgQAXflng/9iQNI6sBRVDwKNnd4G5RGshhGaRScFI7P1obEK1GW+cfI/ugirKFRUw5EbxrMMSzkD439i9wi/MNKnRG0CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EqHjsNTS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1415C4AF0C;
	Mon,  8 Jul 2024 09:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720430642;
	bh=nTynzleANp1b5PUBbvg0geeK7VnuU+V2yh/HYTvcZAk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EqHjsNTSZ5zqJhUNjXehRt9Dqfb6TRUJi5pCsm+2vdOZhZ7Gmdid7jM9GhqhgbWNd
	 ZNixcoxSW8HEjwA52lKn6F1lJhSNde11sW+0jH6tDCW3hQbUd3G/rZQpXEXaudTo9q
	 rw2zpVlqHOtJtLJMkKA6emAdINSDZZMbzPDrIwM8TppvdKbkc+uarkA6znFCKJKL+Y
	 2fQx+WUDJJFsU7S8b+SBTM89nlF2rkJFJ8qYKGIyGEB1TFWA6r9Dmj1oK8epkZ4HHI
	 TEmTUBljr2n9L/J6amxFntKKECugZEhHelnznoS/8vMmUyScm3t1iEZol1X/aKWdYx
	 r9vmki02w2Odg==
From: Benjamin Tissoires <bentiss@kernel.org>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240705-for-6-11-bpf-v1-1-1960e3165c9e@kernel.org>
References: <20240705-for-6-11-bpf-v1-1-1960e3165c9e@kernel.org>
Subject: Re: [PATCH] HID: samples: fix the 2 struct_ops definitions
Message-Id: <172043064147.298354.6203971743384650152.b4-ty@kernel.org>
Date: Mon, 08 Jul 2024 11:24:01 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0

On Fri, 05 Jul 2024 14:09:25 +0200, Benjamin Tissoires wrote:
> Turns out that this is not compiling anymore because the hid_bpf_ops
> struct_ops definition had a change during the revisions.
> 
> 

Applied to hid/hid.git (for-6.11/bpf), thanks!

[1/1] HID: samples: fix the 2 struct_ops definitions
      https://git.kernel.org/hid/hid/c/b35e0dc548aa

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


