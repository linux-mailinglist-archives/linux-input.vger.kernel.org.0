Return-Path: <linux-input+bounces-16639-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9942ECCFFE5
	for <lists+linux-input@lfdr.de>; Fri, 19 Dec 2025 14:13:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30B543094B45
	for <lists+linux-input@lfdr.de>; Fri, 19 Dec 2025 13:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66E4A32AAB4;
	Fri, 19 Dec 2025 13:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aMDKnV9Y"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E5F32AAAD
	for <linux-input@vger.kernel.org>; Fri, 19 Dec 2025 13:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766149568; cv=none; b=ndqURibiXhneV3e4U1/m8/3bFbvNmG0nCXA0v4b8u+kxuttV2c0OsBBZMkx8qU2IXDbgClRoiiD2OSaWz31bfA0BfiDsYM97FiDFMXQFPS8ABulTrGRZxl7X9W+9BveVWFKBarcgDMP7SIMAsPPFTV0nyD0Kpdqf9SaAbFqkOVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766149568; c=relaxed/simple;
	bh=Ryc2ssj/xKTL8SqVNfosso0J6NuzzPxYp734ihp3TGk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mlfZDy8yrnW+SZqv3QnGL60gH1SWzW/fWjkRVuzT2m4x5lROP41BAIh9oCcje9w2Q2n3s4lOUrGoSE6yJEe9OLTymVt78Po4TCO0JWriWYbtnB8JraxbpVBXL1tnAMAAk7Fh018I9Cpp3zg29HOo9khUtnq1fM8C2z7doitEDOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aMDKnV9Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C814EC116D0;
	Fri, 19 Dec 2025 13:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766149565;
	bh=Ryc2ssj/xKTL8SqVNfosso0J6NuzzPxYp734ihp3TGk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aMDKnV9Y4Rsru74014Vc9dL7nrS1R7k5xeibKHMl3bWZcdgMK+a6251EuXjIk7eiQ
	 PtQ6I2jHnSzFqVbZkXx8IdHCJFGKaTJhHOY/78hA/HXQ8P8qAu9IoNWrXyvXfw+5v0
	 Jq9p0EBEHlYX73LXygxAZ1dhGC30irDnLAUktGLuGFfUl/CNq8dIZL1CEiqFSnOpXC
	 DyYsQzr2k9NfZra/IMtvMrNITSyOCqUclgRXQgUBGCUo6IovxiJaoPGeKzjjxKo+ag
	 5ZkVINBP/1Jnir8/qPvCwMg1t74NOCOOAWzV7pWsdoThfhj0tKljXNDobUGF67XRUI
	 Q0QvVPU8Cc0pA==
From: Benjamin Tissoires <bentiss@kernel.org>
To: linux-input@vger.kernel.org, srinivas.pandruvada@linux.intel.com, 
 jikos@kernel.org, Benjamin Tissoires <bentiss@kernel.org>, 
 Zhang Lixu <lixu.zhang@intel.com>
Cc: selina.wang@intel.com, wenji1.yang@intel.com, chee.yau.chan@intel.com
In-Reply-To: <20251212025150.1390294-1-lixu.zhang@intel.com>
References: <20251212025150.1390294-1-lixu.zhang@intel.com>
Subject: Re: [PATCH] HID: intel-ish-hid: Reset enum_devices_done before
 enumeration
Message-Id: <176614956355.1654761.9931110104825422729.b4-ty@kernel.org>
Date: Fri, 19 Dec 2025 14:06:03 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev

On Fri, 12 Dec 2025 10:51:50 +0800, Zhang Lixu wrote:
> Some systems have enabled ISH without any sensors. In this case sending
> HOSTIF_DM_ENUM_DEVICES results in 0 sensors. This triggers ISH hardware
> reset on subsequent enumeration after S3/S4 resume.
> 
> The enum_devices_done flag was not reset before sending the
> HOSTIF_DM_ENUM_DEVICES command. On subsequent enumeration calls (such as
> after S3/S4 resume), this flag retains its previous true value, causing the
> wait loop to be skipped and returning prematurely to hid_ishtp_cl_init().
> If 0 HID devices are found, hid_ishtp_cl_init() skips getting HID device
> descriptors and sets init_done to true. When the delayed enumeration
> response arrives with init_done already true, the driver treats it as a bad
> packet and triggers an ISH hardware reset.
> 
> [...]

Applied to hid/hid.git (for-6.19/upstream-fixes), thanks!

[1/1] HID: intel-ish-hid: Reset enum_devices_done before enumeration
      https://git.kernel.org/hid/hid/c/56e230723e3a

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


