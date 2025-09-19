Return-Path: <linux-input+bounces-14931-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7190B8A3B5
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 17:16:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 116F716238B
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 15:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 482C1314B6F;
	Fri, 19 Sep 2025 15:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cL9WEOos"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CBF253B64;
	Fri, 19 Sep 2025 15:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758294833; cv=none; b=aKzOHm/y7EESb8/5P7VnOk9sRBtHuY8/qaq4qtDQ+3CVXDdbD+PJy0xqW9yeS1Xd9THixLcBOyW35Gs+KSNMEVJh0Jn+xmvYnz5GLHiMBV6+jeL+U7abwyIYNZuHbNewmyrflvsXlgjygdVc2nxOTM8Ov/0wpN6/5HCz4EufXgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758294833; c=relaxed/simple;
	bh=+wr4CPQRQ1uUsxZbkeXx2slfuJ5+/S1Tnmm3Y0GcxdE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fikdATU+PukPjFr4EENhs7+mo035+rZ4yCoGbl1MEl4ErRP2g97SGX/umNmp5phj6YOpFA5TGpvq7DikQqu7C0cks+siew73BMYxcfcM46szUsxMswz9DufRMi3vyv1p6ROqrq9GtKjmiXaNXRyuJR3b940F2msaQM7Um7WSDls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cL9WEOos; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19911C4CEF0;
	Fri, 19 Sep 2025 15:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758294832;
	bh=+wr4CPQRQ1uUsxZbkeXx2slfuJ5+/S1Tnmm3Y0GcxdE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cL9WEOosZCSYJdUoekqdg8rH5z6JToUgRf9xQBTroq8Xus1Vp8vjA8ZMHFVpXFGut
	 ydUEC7Efe4QPqQ/5f2JBmpRw8TfXrcu3pmjSl0c9B7kugSTY1p4HcSVl8YtKUn+3g2
	 JLvl/aVxwtN5qQN/rcWSRxSPd2wTXNQdN4MnNuV1VrKgzoGljltfVe5x4HEm18tehL
	 KHBA9gQPqlAZjWbOLz1VfZZ4LBuvtM87mliQVY1ExacGA1WunkPdrXSQHYl1ZY01Dl
	 TkJqmU5QunWCIaaXnkIllY4Ejd+SPE4zUPe62xUNwpfczqj18r0UYsHukxGYt0JFjF
	 5ziJM4ufPV8BQ==
Date: Fri, 19 Sep 2025 17:13:49 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Xinpeng Sun <xinpeng.sun@intel.com>
cc: bentiss@kernel.org, srinivas.pandruvada@linux.intel.com, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
    even.xu@intel.com, Rui Zhang <rui1.zhang@intel.com>
Subject: Re: [PATCH v3 RESEND] hid: intel-thc-hid: intel-quicki2c: support
 ACPI config for advanced features
In-Reply-To: <20250917015344.1169412-1-xinpeng.sun@intel.com>
Message-ID: <n1sp453o-968r-39r0-621q-556r025587s5@xreary.bet>
References: <20250917015344.1169412-1-xinpeng.sun@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 17 Sep 2025, Xinpeng Sun wrote:

> There is a new BIOS enhancement that adds the capability to configure the
> following two features of I2C subsystem introduced in commit 1ed0b48
> ("Intel-thc: Introduce max input size control") and commit 3f2a921
> ("Intel-thc: Introduce interrupt delay control"):
> - Max input size control
> - Interrupt delay control
> 
> As BIOS is used for the configuration of these two features, change driver
> data usage to indicate hardware capability, and add corresponding ACPI
> configuration support in QuickI2C driver.

Applied to hid.git#for-6.18/intel-thc-hid, thanks.

-- 
Jiri Kosina
SUSE Labs


