Return-Path: <linux-input+bounces-4158-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BEC8FDFC1
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 09:30:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B29EF28482E
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 07:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45F726BFD2;
	Thu,  6 Jun 2024 07:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W4JH+sm3"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E37838DD2;
	Thu,  6 Jun 2024 07:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717659022; cv=none; b=ny0eU8LfjZbgTv0X4RbJ7smjM/Ak3ZEYrc9jmoxozkt5aEVWLmlzDO9oqe/UAyW8NrI5/AqycZxWdGMYUmhRV1S4XqjnyTXlBokCCxD5k5FI2lyXPhE72ZxDtQ+yEm6+8GJbOJvf4iEtpgS6O/4QY8GK+4hGc05v/xxuIeQ+aY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717659022; c=relaxed/simple;
	bh=74LOqVmO34urgp8Dqx2F/kyC5P65cGlJie5zdB/jLY4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DusqsryjaStydk+WllF6gDiG95FecH/bxjHz9Wd8joOphdmONrYqaJTmzz8bjNYankrl7bRv1hGjH64IIrr0m/0zqb26IqKRdtdwvqcLzRrb251hVWneeBCbVbV11MvezzL64GgrP3JC4Ffq/VzfoZVphczL3kE5AqZtHek7JyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W4JH+sm3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCC31C4AF07;
	Thu,  6 Jun 2024 07:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717659021;
	bh=74LOqVmO34urgp8Dqx2F/kyC5P65cGlJie5zdB/jLY4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=W4JH+sm3tDsbKfd1dwz/V3oKUTAbHPa2oqHw3OeYSnq3AN763BjyACEy7HLCPXBam
	 W5MmoCVlc20SmDeEobSrIKDlEHvPrz0VwI11YbQDVxg6ZaXczD3dsjzyUG7CX9Yylt
	 buG63sDmyYb3I+kJbWEbGFtKXuCx0SIQVC+yKhe1ksiCRVTq+AvXLs5dWDbnqxAUOI
	 m8qkpmCAvEMU8l7cNAzoT9txhqMhYqdyaO9wuwVi98zypYxWUouD55jzN+NqDquqEu
	 GvpSAFYIDKVUfQWeDfOYk+gK5E7jBH3MT67U8fFLVwK4ugMrUc6hkb1yAD0U+Z3aSb
	 aFC1vEz/cN2bg==
From: Benjamin Tissoires <bentiss@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Danny Kaehn <danny.kaehn@plexus.com>
Cc: Jiri Kosina <jikos@kernel.org>, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Ethan Twardy <ethan.twardy@plexus.com>
In-Reply-To: <20240605-cp2112-dt-v11-0-d55f0f945a62@plexus.com>
References: <20240605-cp2112-dt-v11-0-d55f0f945a62@plexus.com>
Subject: Re: (subset) [PATCH v11 0/4] Firmware Support for USB-HID Devices
 and CP2112
Message-Id: <171765901954.2911407.14288814207102579480.b4-ty@kernel.org>
Date: Thu, 06 Jun 2024 09:30:19 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4

On Wed, 05 Jun 2024 18:12:43 -0500, Danny Kaehn wrote:
> This patchset allows USB-HID devices to have Firmware bindings through sharing
> the USB fwnode with the HID driver, and adds such a binding and driver
> implementation for the CP2112 USB to SMBus Bridge (which necessitated the
> USB-HID change). This change allows a CP2112 permanently attached in hardware to
> be described in DT and ACPI and interoperate with other drivers.
> 
> Changes in v11:
> - Eliminate 'gpio' subnode for DT and ACPI for the CP2112 per comment
>     from Rob H.
> - Edit hid-cp2112.c to match for ACPI index and fall back to matching by
>     name (instead of the other way around)
> - Separate CP2112 I2C bus speed configuration into a separate patch
> 
> [...]

Applied to hid/hid.git (for-6.11/core), thanks!

[2/4] HID: usbhid: Share USB device firmware node with child HID device
      https://git.kernel.org/hid/hid/c/b81881b9c10e

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


