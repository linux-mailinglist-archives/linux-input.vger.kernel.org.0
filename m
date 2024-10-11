Return-Path: <linux-input+bounces-7358-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC2999A27E
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2024 13:12:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 035C41F285AA
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2024 11:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 938E720C495;
	Fri, 11 Oct 2024 11:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PnPCyOrO"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A25C17D2;
	Fri, 11 Oct 2024 11:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728645123; cv=none; b=JqxRWbx1VedsE7k9lFd928ZcMWVUBjWln61xVD44gTfo39ga50OFhUb0lO9FI2CwnWuU78DWSW6Ua4Lh+jWgGD1o7RjPYUioH2zVUcAbViqZwR4X6hNPDNDYxpktFSEjCUGwqdoyel2SPi/T9sBpzrwlW5u6M+Ne/ys2+ZmgEgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728645123; c=relaxed/simple;
	bh=DEmYEmYU3NnZlSQYYji4FxCI1BKEZ732GjLFqAgUjQQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=grOm0i7FrpEzZ0TWMZ4WRuBndmgzNjLauF4qCx7TfFOGyTkDl3rMXgQxYCXo7TNyGh2l4NcoveVmkq1K9W0fXHg5tcbSuRjVHN3bCnWb+GeQETthL4YnBd08R1gCP+Th3pL/lMU7JAL6sbwabQRpNmQ0nxJrfUVk+D8vkv/tSFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PnPCyOrO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AB60C4CEC3;
	Fri, 11 Oct 2024 11:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728645123;
	bh=DEmYEmYU3NnZlSQYYji4FxCI1BKEZ732GjLFqAgUjQQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PnPCyOrOcNlVfCcl+yBn1DnsDzxq5DNp7V+JXEOqdVd9PKr65su8mwN/GankW06px
	 isYnqYNjSN1PscycuiXb9SedWI8D0iZKhySh+fBKoa99lyA64a2mu5kRPj0eH7jpaF
	 Q7tfLyRTa/nXXgYOvRxbNlL0veRnuw4BPI0trr8ISGohnKyPbKgc7O7DoOKfQLEUbF
	 t9iM1soMse1vv7jBgnQhNg4OvAPlXGwJhcXy9OwLWTLXSBNJgF1Jzcz9Xcc4KQbOSK
	 Io59X3Xpp1c+ispeXa5sdyaFeXgljJmVmleE6BIndL34EJk5E2BcmOUyZCEU49mrph
	 ZSVEu98yWjj7g==
Date: Fri, 11 Oct 2024 13:12:00 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
cc: linux-input@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>, 
    Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] HID: corsair-void: Add Corsair Void headset family
 driver
In-Reply-To: <20241008233030.395126-3-stuart.a.hayhurst@gmail.com>
Message-ID: <nycvar.YFH.7.76.2410111311431.20286@cbobk.fhfr.pm>
References: <20241008233030.395126-3-stuart.a.hayhurst@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 9 Oct 2024, Stuart Hayhurst wrote:

> Introduce a driver for the Corsair Void family of headsets, supporting:
>  - Battery reporting (power_supply)
>  - Sidetone setting support
>  - Physical microphone location reporting
>  - Headset and receiver firmware version reporting
>  - Built-in alert triggering
>  - USB wireless_status
> 
> Tested with a Void Pro Wireless, Void Elite Wireless and a Void Elite Wired
> 
> Signed-off-by: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
> ---
> 
> v4 -> v5:
>  - Changed kernel version in sysfs docs to 6.13
>  - Use CONFIG_HID_CORSAIR instead of CONFIG_HID_CORSAIR_VOID
> 
> v3 -> v4:
>  - Added missing <linux/device.h> include
>  - Added missing newline, fix indent
>  - Use hid_hw_raw_request return code directly for wireless sidetone
>  - Use battery status enum for remaining values
>  - Use of devm_kasprintf() to create battery string
>  - Moved corsair_void_request_status error reporting to callers
>  - Simplified corsair_void_request_status
>  - Removed battery_struct_size, use sizeof(*battery_data) instead
>  - Removed unnecessary curly brackets in send_alert_store
> 
> v2 -> v3:
>  - Use __free(kfree) helper to free allocations
>  - Combined similar condition checks
>  - Check power_supply was created successfully before saving it
>  - Removed explicit initialisation of return value in corsair_void_probe
>  - Use preferred syntax for drvdata's struct allocation size
>  - Removed named success exit point from driver probe
>  - Removed unused driver probe exit point
> 
> v1 -> v2:
>  - Added a module author email address
>  - Removed unused variable (psy_cfg)
>  - Corrected status request buffer size from 12 bytes to 2 bytes
>  - Use enums for battery status
>  - Use kmalloc instead of kzalloc where applicable
>  - Use __le16 type for cpu_to_le16
>  - Use DEVICE_ATTR_RO and DEVICE_ATTR_WO to create attributes
>  - Simplified corsair_void_set_sidetone_wired
>  - Cleaned up patch description
> 
>  .../ABI/testing/sysfs-driver-hid-corsair-void |  38 +
>  drivers/hid/Kconfig                           |   3 +
>  drivers/hid/Makefile                          |   2 +-
>  drivers/hid/hid-corsair-void.c                | 829 ++++++++++++++++++
>  4 files changed, 871 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-hid-corsair-void
>  create mode 100644 drivers/hid/hid-corsair-void.c

Applied to hid.git#for-6.13/corsair. Thanks,

-- 
Jiri Kosina
SUSE Labs


