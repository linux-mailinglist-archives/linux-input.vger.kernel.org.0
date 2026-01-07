Return-Path: <linux-input+bounces-16854-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E62D001C2
	for <lists+linux-input@lfdr.de>; Wed, 07 Jan 2026 22:13:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D7EB6308FEA8
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 21:10:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F1C02D8762;
	Wed,  7 Jan 2026 21:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mmqzghXu"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679CE2D23A6;
	Wed,  7 Jan 2026 21:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767819849; cv=none; b=Rt2z2pWYNCyPt0dznbD6jT8wu7GV5I6NupuQxHMLBrRXf2/vu+41NDKjCGPAiPmqO8daM4QXN0f5gBuYVsA1O4yePpFobh4ANDITqgYChsyN2cidLc1nsavwxvGWwHDeJ23y2fXnIilHM5MM7jVmwOZheEGo5xbxRrSHSzx2hG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767819849; c=relaxed/simple;
	bh=gPSEOFh4KAF4JX+ndRtnXrs0NmlBPwCAhytXRpP2rMc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=i8oJClV4unHvh8I4lnqFngcCvmqPwdY2e2NqHFvxM2tvxCRmDMctx7V1VzE5FrBjAqi0WsKMjiq4nbTUT9nVuLIwmXXRG1nZATzO5gl4lR+vPfkhBPdWdDFvUlfgaNucH8ChMFTjjtfs2hXD+XKcgT3DUKltJ5Xh53FOk0B1Vc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mmqzghXu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08A0EC4CEF1;
	Wed,  7 Jan 2026 21:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767819848;
	bh=gPSEOFh4KAF4JX+ndRtnXrs0NmlBPwCAhytXRpP2rMc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mmqzghXu8L6DIiIfdDc2RS5Bd4qqHP6kba18MsqUJau1LaiqvjqvwIEVYGGwDfUcr
	 +eE166HsGq2zAuq6JX6MXk4B2ONCgSnkuajyErF1vwRIRpE0XF6nrSlE1+L79fKn2X
	 JxBIiT2bhOPVABuRiGt55wENjWTPVlg+pRVY1TAlICrTANficDDWic6pqKM8Qa/BkB
	 MrMjBr2aN+I9121/yNlGTySj4VFXGdxwGxFqbu56RYceNiMxOIuHCxgjzM6eaHRNlx
	 8JH0GqqITfBptojX2ca89SNRUHjpjTbo3gcNDBYOSQOxz5GCK66CJbG+1Zcp3jCTF7
	 ESWI0VUFABIgg==
Date: Wed, 7 Jan 2026 22:04:05 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Even Xu <even.xu@intel.com>
cc: bentiss@kernel.org, srinivas.pandruvada@linux.intel.com, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] Add output report support for QuickI2C driver
In-Reply-To: <20251209075215.1535371-1-even.xu@intel.com>
Message-ID: <45317161-55oq-1947-7093-4r427860891o@xreary.bet>
References: <20251209075215.1535371-1-even.xu@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 9 Dec 2025, Even Xu wrote:

> This patch serial adds support for HID output reports in the Quicki2c
> driver by implementing the output_report callback in the HID low-level
> driver interface.
> 
> This change introduces:
> - Refine QuickI2C driver to use size_t for all length-related variables
> - Enhance the quicki2c_init_write_buf() function by adding support for
>   writing to the output register based on the content being written
> - Add quicki2c_hid_output_report() and quicki2c_output_report() function
>   that processe the HID output reports request
> 
> This enables proper communication with HID devices that require output
> report functionality, such as setting device configuration or updating
> device firmware.

Now queued in hid.git#for-6.20/intel-thc, thanks.

-- 
Jiri Kosina
SUSE Labs


