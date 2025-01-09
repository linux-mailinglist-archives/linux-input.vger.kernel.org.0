Return-Path: <linux-input+bounces-9103-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8345A0711A
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 10:14:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 104463A64B7
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 09:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F166221506F;
	Thu,  9 Jan 2025 09:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k65ZYYID"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E392144B4;
	Thu,  9 Jan 2025 09:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736414078; cv=none; b=Pd3tzEi+NB/jyVgXVu0iFhhdtNN7+70F8RVgR4FM1VGC95h+B/+cXClcpr2oVS1+HmC1uDz9l6dwgC2GemrwVS1pbE6xIKC7BiHoYATypw6WkLi92gHIkaAHlFoDYHiXTzDsUMLVH8xxh9rD3n+tXlKDHzB+1tNM0W9/ifjy4DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736414078; c=relaxed/simple;
	bh=2HNgAKFmKo7yf2l5LKA8MUvfyeXVrje4RSSD4LqOP9M=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Wvcmf50hZ74/bRdoiGQCF4QVIe454Uh5EfiGSMMEM5pZelf1qfO59+A6MnO1Ocngv1ILcwaZ6iXLlag9nfc3oLIwT4zovFx80MXvTqFGkxRfVZq+e/jyk15tZ0IZMp1+UuQqFtDzjelBlow5PzqKhe1b7vPYftsKF1HPysV5xH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k65ZYYID; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2D43C4CED2;
	Thu,  9 Jan 2025 09:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736414078;
	bh=2HNgAKFmKo7yf2l5LKA8MUvfyeXVrje4RSSD4LqOP9M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=k65ZYYIDeqaxarLbBRosNVmZCsAa5y3McirAJ8g/C+ZL10xlfgQtxknasylU/upQV
	 b8ZzebvELG8jibqUqHY33rUPTAN6CoL/yJCin/sUZhL5BTvOGrp8qAwkwFKJU/5fWk
	 F4pifiqmU+h5tFbTO3d3IznhQI9T0ZXSSa7DjIrSTcQQko4kRVP0AzMH8Dm5h1vqv/
	 sJFgSDH7gzVW/wYp4p+t+ulEwUpEZjc8jkQ9G+BPIWpSqP9Z7S3k7XPjIPZPRou4vE
	 N4MMl3CceZQGr0aZMhXDt2D1+lMS4rq8S/Iv67A8O4TseHBJ8m995Gz7CDr1PRZPrh
	 ZVMf6A/+76pSg==
Date: Thu, 9 Jan 2025 10:14:35 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Even Xu <even.xu@intel.com>
cc: bentiss@kernel.org, corbet@lwn.net, bagasdotme@gmail.com, 
    aaron.ma@canonical.com, rdunlap@infradead.org, mpearson-lenovo@squebb.ca, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
    linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 00/22] Add Intel Touch Host Controller drivers
In-Reply-To: <20250106023151.3011329-1-even.xu@intel.com>
Message-ID: <830920o1-p118-5oq5-po4o-905n04949ro7@xreary.bet>
References: <20250106023151.3011329-1-even.xu@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 6 Jan 2025, Even Xu wrote:

> Intel Touch Host Controller (THC) is a new high performance input IP
> which can benefit HID device's data transaction, such as touch screen,
> touch pad, stylus.
> 
> THC IP now evoluates to V4, it can support 3 different modes: IPTS,
> HIDSPI and HIDI2C. Here are upgrade history:
> - THC v1, for TGL/LKF, supports intel private IPTS (Intel Precise Touch
>   and Stylus) protocol ( IPTS mode)
> - THC v2, for ADL, adds industrial standard HID over SPI protocol
>   support (HIDSPI mode)
> - THC v3, for MTL, enhances HID over SPI mode
> - THC v4, for LNL, adds inudstrial standard HID over I2C protocol
>   support (HIDI2C mode) 
> 
> Linux Surface community (https://github.com/linux-surface) already
> implemented IPTS mode. These patch series provides THC HIDSPI mode and
> THC HIDI2C mode support on Linux.
> 
> These patch series includes:
> 1. Document for THC hardware and software introduction.
> 2. Intel THC Hardware layer driver which provides control interfaces
>    for protocol layer.
> 3. Intel QuickSPI (R) driver working as a HIDSPI device driver which
>    implements HID over SPI protocol and flow.
> 4. Intel QuickI2C (R) driver working as a HIDI2C device driver which
>    implements HID over I2C protocol and flow.
> 
> Change logs:
> v4:
> - Minor fix in documents
> - Typo fixes in patch 6 & patch 7 commit descriptions
> 
> v3:
> - Change tables in documents from literal block to table format
> - Change symbol namespace to string literal according to patch:
>   commit cdd30ebb1b9f ("module: Convert symbol namespace to string literal")
> - Refine Kconfig description
> - Enhance Quickspi and Quicki2c driver by clearing THC hardware internal
>   state before doing initialization to avoid BIOS impacts.
> - A fix in Quicki2c driver when does set_report
> 
> v2:
> - Fix document format issues
> - Add THC device IDs for Intel Panther Lake (PTL) platform
> 
> Even Xu (13):
>   HID: THC: Add documentation
>   HID: intel-thc-hid: intel-thc: Add THC DMA interfaces
>   HID: intel-thc-hid: intel-thc: Add THC I2C config interfaces
>   HID: intel-thc-hid: intel-quickspi: Add THC QuickSPI driver hid layer
>   HID: intel-thc-hid: intel-quickspi: Add THC QuickSPI ACPI interfaces
>   HID: intel-thc-hid: intel-quickspi: Add HIDSPI protocol implementation
>   HID: intel-thc-hid: intel-quickspi: Add PM implementation
>   HID: intel-thc-hid: intel-quicki2c: Add THC QuickI2C driver skeleton
>   HID: intel-thc-hid: intel-quicki2c: Add THC QuickI2C driver hid layer
>   HID: intel-thc-hid: intel-quicki2c: Add THC QuickI2C ACPI interfaces
>   HID: intel-thc-hid: intel-quicki2c: Add HIDI2C protocol implementation
>   HID: intel-thc-hid: intel-quicki2c: Complete THC QuickI2C driver
>   HID: intel-thc-hid: intel-quicki2c: Add PM implementation
> 
> Xinpeng Sun (9):
>   HID: intel-thc-hid: Add basic THC driver skeleton
>   HID: intel-thc-hid: intel-thc: Add THC registers definition
>   HID: intel-thc-hid: intel-thc: Add THC PIO operation APIs
>   HID: intel-thc-hid: intel-thc: Add APIs for interrupt
>   HID: intel-thc-hid: intel-thc: Add THC LTR interfaces
>   HID: intel-thc-hid: intel-thc: Add THC interrupt handler
>   HID: intel-thc-hid: intel-thc: Add THC SPI config interfaces
>   HID: intel-thc-hid: intel-quickspi: Add THC QuickSPI driver skeleton
>   HID: intel-thc-hid: intel-quickspi: Complete THC QuickSPI driver

Now queued in hid.git#for-6.14/intel-thc.

Thanks,

-- 
Jiri Kosina
SUSE Labs


