Return-Path: <linux-input+bounces-5014-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DB792FEA8
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 18:35:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5654D1F22B07
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 16:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06712176AA1;
	Fri, 12 Jul 2024 16:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LlrfcHaL"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FE9176259;
	Fri, 12 Jul 2024 16:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720802125; cv=none; b=ghr4782BTqVcmx2E331hqjgT7+/+obovGLpRwyt3KsoMSuu8wpxp7cmDJcAZRyBniBZgMZw+Eo2T1bo3eetBdNxAbbdwL/rmnXr6fprB5zkbjS4ykHPDu1aGemzyByWRTD3JB5PomgNO1GF/Bgs4YrV4urx55En7XC+/rwR6gYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720802125; c=relaxed/simple;
	bh=wJLC4jiWZHz6PeNBrhCS7RadStX60mh/Po1K8TlDWWE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qDZ7GDEI2DOKxlCHbXZlmxdhn+Ic4Z/76PR5zxomAJrvzG0PKuyyIKikjUepj4Zuyl+ebNwIYrSs282BZ6fBGUa6ozsQILWel62rveJhVw6nTd9IHSYn6QjHT2K6P7LualAIvzy/aTqjXEvGekIYqQEYqKj3IUlgJ2cxsN5w8XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LlrfcHaL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D198C4AF07;
	Fri, 12 Jul 2024 16:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720802125;
	bh=wJLC4jiWZHz6PeNBrhCS7RadStX60mh/Po1K8TlDWWE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LlrfcHaLGNxUqgjx/qpS6l7j+Ul6HE2DWdJPT49tw1JW3ny7zyET5Y8ekL7Tmbewb
	 1dnB+fIWQ/THtICRyyPFU4gxqf70p7TYbCliVhoS694lsv1m2nzFDgLwp5pzn1kV9q
	 LbN7lw5WNfAphaOZKA5TAl+Nf9crRWH9FMmG3EJqmrmv6O7NpgoYYWfOYRs77VuK6M
	 DE7fh+G/0HDlbQAo7b7dk7ZUbrSX+L+lw//9/Yp9UCGn8EJf1wD/T3ll1NlstQydaU
	 v8AV+J1eyJmlDqtJmtWJERWNw1ayAEA9NhMbi9uMXap1hneIdrmF9OrcLaxE3hmd7r
	 ozeDFdHSXSC+g==
From: Benjamin Tissoires <bentiss@kernel.org>
To: jikos@kernel.org, Thorsten Blum <thorsten.blum@toblux.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240705045458.65108-2-thorsten.blum@toblux.com>
References: <20240705045458.65108-2-thorsten.blum@toblux.com>
Subject: Re: [PATCH] HID: hid-steam: Fix typo in goto label
Message-Id: <172080212436.1416360.6914195041158653366.b4-ty@kernel.org>
Date: Fri, 12 Jul 2024 18:35:24 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0

On Fri, 05 Jul 2024 06:54:59 +0200, Thorsten Blum wrote:
> s/stream/steam/
> 
> 

Applied to hid/hid.git (for-6.11/trivial), thanks!

[1/1] HID: hid-steam: Fix typo in goto label
      https://git.kernel.org/hid/hid/c/8a25418ba65a

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


