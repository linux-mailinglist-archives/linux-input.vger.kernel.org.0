Return-Path: <linux-input+bounces-14760-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF98B590AC
	for <lists+linux-input@lfdr.de>; Tue, 16 Sep 2025 10:31:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 661867B1ECC
	for <lists+linux-input@lfdr.de>; Tue, 16 Sep 2025 08:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6F8C2EA151;
	Tue, 16 Sep 2025 08:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BHthK73M"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8347428C87C
	for <linux-input@vger.kernel.org>; Tue, 16 Sep 2025 08:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758011184; cv=none; b=Vp5A7eY62I7RAOAI6QnKTGnMRsoIOVMXjkPiQ2jsC4TeQoX1b7lee5+mxqqpJeHC0oWp7SfMpAzMX8Jg0KxeuXst6luv4GfcAQ4WQgE44MJB0zSH4PK+JY7l2KSElr7nfTlWROq5uXvGYUC5wOHwNAxzOHxdDpfWQqOnExa6hyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758011184; c=relaxed/simple;
	bh=xraogbFRazv7hd2GeloUiTxouki60TZkG2i4S4yMfqg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=G0rWBacvGxwa5+U/p8/EKhBf6IGlHLLuOwy7bAhEHFk87oy2/E9yC74CcxNm4qgv1X8htTpCwjvlg9Gy0mny2SCzL3VMjGysI1Y9jIJn5FddOFmdmOJjb6BWFv431dAhRVaS6N9lyiB4fxE2/IuQpFbPxKYwQp0ZqShqrNLYYmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BHthK73M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EDE1C4CEF7;
	Tue, 16 Sep 2025 08:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758011184;
	bh=xraogbFRazv7hd2GeloUiTxouki60TZkG2i4S4yMfqg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BHthK73MnuwS/JCikREf1K9XjdjtNpbKYVPyUlDT72D0wHIJ0e899USoBbVoE03w8
	 QTpnXO61dejpxPfyd7OJwfpzha8aKdJXuD2wM4a3Y2JusCmpGwFAsIG9sg6A/oSG7j
	 14uA8hh+KuW6IH+HSRIt7JBg/dLuYyuTDS1gZEOXsjq8obYfvqeZSDWJnpEfFcND1k
	 0LZaebidk7J0vcLc9TAuikznJyVSThiZ8cUO6StgwuOIBiJdXog+h1DLLVwliGgQTd
	 rMPQIs4spSIUvzI4TdjjnyvyLpDlGFqhbJIgh0GC0L9XbiuJMcuwbvKKtc+b6Aycmz
	 xAdRsN5rWjK8A==
From: Benjamin Tissoires <bentiss@kernel.org>
To: mario.limonciello@amd.com, jikos@kernel.org, 
 "Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: linux-input@vger.kernel.org
In-Reply-To: <20250909110012.1218226-1-superm1@kernel.org>
References: <20250909110012.1218226-1-superm1@kernel.org>
Subject: Re: [PATCH] HID: i2c-hid: Resolve touchpad issues on Dell systems
 during S4
Message-Id: <175801118298.2663149.17961136162888654791.b4-ty@kernel.org>
Date: Tue, 16 Sep 2025 10:26:22 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Tue, 09 Sep 2025 06:00:06 -0500, Mario Limonciello (AMD) wrote:
> Dell systems utilize an EC-based touchpad emulation when the ACPI
> touchpad _DSM is not invoked. This emulation acts as a secondary
> master on the I2C bus, designed for scenarios where the I2C touchpad
> driver is absent, such as in BIOS menus. Typically, loading the
> i2c-hid module triggers the _DSM at initialization, disabling the
> EC-based emulation.
> 
> [...]

Applied to hid/hid.git (for-6.18/i2c-hid), thanks!

[1/1] HID: i2c-hid: Resolve touchpad issues on Dell systems during S4
      https://git.kernel.org/hid/hid/c/7d62beb102d6

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


