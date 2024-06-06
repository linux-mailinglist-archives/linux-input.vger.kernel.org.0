Return-Path: <linux-input+bounces-4161-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D7B8FE13E
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 10:40:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 716FA1F22821
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 08:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFE6813A418;
	Thu,  6 Jun 2024 08:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="njuesMKs"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB9273477
	for <linux-input@vger.kernel.org>; Thu,  6 Jun 2024 08:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717663237; cv=none; b=KBxgiT/88FHWjKpIBgjJgeGW4BePn5B68pjHR2wYNDOAHZR/c5Jrsxd9fv1Z57Jqtji8jk7iSqVtJvIQnMqEC+0k78RG3QWYvVxCTI0xER1fcvUvBPmhB9Yx0v2Gcf1ziNwLLwp0GWmPjNj6h56EFLbBa0O7HhOS6eAmwGnxsGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717663237; c=relaxed/simple;
	bh=IG//XrqeL3U+5X+x88voDVPZaqaugJ+O7EKLRIr+Xy0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ejrxnnyRW9oxEY7o5kiTB70dpF5C6t0143jWTWV0uAkPwQOEUMmqJPAM7GCPIZi4E605y3yVEuwpllt3ADEvik2fwMZb8FyItAw3NyiixLCCEEqIxr+sUfRZNjrd30Q8RsC1OLWF90sVjRFnfE1+ZnwhnW7SbXHG8QK+le0Ekxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=njuesMKs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80887C4AF0E;
	Thu,  6 Jun 2024 08:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717663237;
	bh=IG//XrqeL3U+5X+x88voDVPZaqaugJ+O7EKLRIr+Xy0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=njuesMKsLUsCjMYIWWHGW1WQPPFVW3CIc8KEyM1XCJl7Wpk6wFWyp8A/RlRP0HcFG
	 bk133Pv4qKik+5xB3nIXVlaQQD3UakjukjeKxzq2CAj7U4qBFgLX7vbRYCHzLAaC37
	 Li4yfIKG35hpgJkOPEYNUZB/CMrZ99H4v2S6zelDJWGn51p2LlSDvXBZeN8pfiL3NZ
	 DQ2iQTIRcmlGb4Rt7QLek+hU/7OBOOua9v2eDhl/3mLSieE1PJ4gF9tI/crGNQKPmm
	 8dN4RJoMUpN88WZYdAoz8uF2PMBOZ4o4+NSvBQEb/4SwxXNY4a65LgQVFYGk1T0wTv
	 0BLV1WAz7lafg==
From: Benjamin Tissoires <bentiss@kernel.org>
To: Jiri Kosina <jikos@kernel.org>, Aseda Aboagye <aaboagye@chromium.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 linux-input@vger.kernel.org
In-Reply-To: <Zl-e97O9nvudco5z@google.com>
References: <Zl-e97O9nvudco5z@google.com>
Subject: Re: [PATCH v4 1/2] input: Add event code for accessibility key
Message-Id: <171766323625.2920183.2008046704535274086.b4-ty@kernel.org>
Date: Thu, 06 Jun 2024 10:40:36 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4

On Tue, 04 Jun 2024 23:10:47 +0000, Aseda Aboagye wrote:
> HUTRR116 added support for a new usage titled "System Accessibility
> Binding" which toggles a system-wide bound accessibility UI or command.
> This commit simply adds a new event code for the usage.
> 
> 

Applied to hid/hid.git (for-6.10/upstream-fixes), thanks!

[1/2] input: Add event code for accessibility key
      https://git.kernel.org/hid/hid/c/8e3aaa9cb320

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


