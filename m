Return-Path: <linux-input+bounces-5012-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DCE92FE7C
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 18:28:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8A7B281810
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 16:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40325175560;
	Fri, 12 Jul 2024 16:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SUFX0D98"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DDE173345;
	Fri, 12 Jul 2024 16:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720801711; cv=none; b=lm53OvJ3n/iYvoXULFtoTzcaKx0hRuu9LNFMyWlQacfKE3nqu7lCurQTKtytm94dx/EbY5davjygyn9g1O3NS1wvo5QUohgvgzTG/r+6RA7ZIbRoCV/cry0djXDb4VkKfUHrhuRd1udYLxrjnriPu4XTS1FHZ/FxYwVpuPtC0rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720801711; c=relaxed/simple;
	bh=p/XRIOJDBo7gdVbB36+ebgQz202YenpMwkGhPPLgx7g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ayxxaXzY860BH0sKi7paAWuR5l75hnEA0d5POvk4qkKH04LYxYZuZeUsTP08WZKZs6c6K2fGPMyWjmb2T7qkqsko/t50UtKnQekF2w0AXhN5fi04anCKCvMCrmBVy0ngjLQiCfOSGUFzxqaIUMqFEQP9emd3NxUFzPagfxZ0K6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SUFX0D98; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0CDDC32782;
	Fri, 12 Jul 2024 16:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720801710;
	bh=p/XRIOJDBo7gdVbB36+ebgQz202YenpMwkGhPPLgx7g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SUFX0D9832ulzQJ6/UIxd9oKqzfwUvJvxxmXTZ5vJLIH5A8cAvGTbLMj8tHb+xjPR
	 w/ubVp1zPZanVOHzCsqQQ1gh//a6jwDTLU2HpFxJo7Y4rqyq9ExphA01QRGbi5V41N
	 ubE8FDMaz88ea6DGGkcEjAzv3fSakLDxB9tOMWezf7yp/1CKXecenRmoP/h4OLEzhl
	 omw2N+VYdwLT6PKGX4DIioK+8s/dBiEgiP//zuzTkXIBewQAhITcCZMAIJiaca1g6c
	 6HOJSiRFO58owFrBhSOFPw7VaLxw9I3G7bAT9PgwPQgb2YbGzfVfRVfZlYSV8TD+1p
	 sUpj3nb3SfEmg==
From: Benjamin Tissoires <bentiss@kernel.org>
To: Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org, 
 Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240711083513.282724-1-colin.i.king@gmail.com>
References: <20240711083513.282724-1-colin.i.king@gmail.com>
Subject: Re: [PATCH] HID: Fix spelling mistakes "Kensigton" -> "Kensington"
Message-Id: <172080170934.1413001.1147650564619529825.b4-ty@kernel.org>
Date: Fri, 12 Jul 2024 18:28:29 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0

On Thu, 11 Jul 2024 09:35:13 +0100, Colin Ian King wrote:
> There are spelling mistakes in a comment and in the module description.
> Fix these.
> 
> 

Applied to hid/hid.git (for-6.11/module-description), thanks!

[1/1] HID: Fix spelling mistakes "Kensigton" -> "Kensington"
      https://git.kernel.org/hid/hid/c/523e6f4f50fc

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


