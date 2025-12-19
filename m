Return-Path: <linux-input+bounces-16641-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DF3CD0011
	for <lists+linux-input@lfdr.de>; Fri, 19 Dec 2025 14:15:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E45E130C8833
	for <lists+linux-input@lfdr.de>; Fri, 19 Dec 2025 13:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 711A732AAC3;
	Fri, 19 Dec 2025 13:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SB2v65bx"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A54432AAAE;
	Fri, 19 Dec 2025 13:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766149568; cv=none; b=ZuX3XkUHSfRsGsk1wdozyaQC/pI/LWzLdsd+Zp8elEA9C3M/vSYUfc93a+EgivhF1PbmWGpDZh5lLH/fEM9mNgcqVaqhZNfERDIfB5auZuxbijjW1FzxmhEjyR36YZdgkCznQo+WAYm2RXQ0KFbrVRMS5VtNkUfQzDxL0WkqiWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766149568; c=relaxed/simple;
	bh=lBKKZ17KcwBkoEm+gRHdx9e5yTlCN2Z2TWBsj6KprQg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BOlmDHQBcYhDa2YoVwXSjgb2MYl1UPSllWw4xoUmK9utKOY+ldGKdGc3UmFzngKCxkHmX3gkoeIjYNmze5CcOjFyia9o9FcGD+nzeTtbRk3nwVO9+sRjHNVAfQo65tCil8pZv/xaM04TUHJR8Pe6y5dzoGZaFqD/kZOVCncvZR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SB2v65bx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F95CC113D0;
	Fri, 19 Dec 2025 13:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766149568;
	bh=lBKKZ17KcwBkoEm+gRHdx9e5yTlCN2Z2TWBsj6KprQg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SB2v65bxGQe48SMZ5G9EuYlX6FmjedhvlntRhfygyevGvkrAcaqI3A+kWbmIldmqu
	 9PTQDGdmJD2Ln+ilooZE0fjd3kYo5BR4249AYnKk1lWByVCFLUqM1tfI2Hqa5XI785
	 sH6r1jNwFlzBDDHRfNkBPknyVG7BVrs4IILEQSJK9Ok1B9f1uW7oLLvIrd8Wd/JjCo
	 3QsV5abnMgL8VuIXHn1KA+5/W0d/h0s38MoZ52/ZLfOMbhl0jKpRAMbeXmswW7pkHq
	 vbEdW4IOFrkMynIkHCTCht29uoYIbbY9vhlcm+qY9QlOnXMBCnBQkNDqU9H2IaCsEQ
	 zbkU/ow4qcA5g==
From: Benjamin Tissoires <bentiss@kernel.org>
To: jikos@kernel.org, Even Xu <even.xu@intel.com>
Cc: srinivas.pandruvada@linux.intel.com, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251219011438.2104441-1-even.xu@intel.com>
References: <20251219011438.2104441-1-even.xu@intel.com>
Subject: Re: [PATCH] HID: Intel-thc-hid: Intel-thc: Fix wrong register
 reading
Message-Id: <176614956692.1654761.8104372490843697513.b4-ty@kernel.org>
Date: Fri, 19 Dec 2025 14:06:06 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev

On Fri, 19 Dec 2025 09:14:38 +0800, Even Xu wrote:
> Correct the read register for the setting of max input size and
> interrupt delay.
> 
> 

Applied to hid/hid.git (for-6.19/upstream-fixes), thanks!

[1/1] HID: Intel-thc-hid: Intel-thc: Fix wrong register reading
      https://git.kernel.org/hid/hid/c/f39006965dd3

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


