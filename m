Return-Path: <linux-input+bounces-7062-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F53A98FEF4
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 10:35:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB2A51F228B3
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 08:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36F391386B3;
	Fri,  4 Oct 2024 08:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hRee1zwS"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7B11802E;
	Fri,  4 Oct 2024 08:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728030921; cv=none; b=odrDSPMBvrC7lQ4ykaLIobDifTAfsQynePMoGeqz/TDl8D9v72FI6FUFOHpLqLvwu05Wy+yRcln/bhHERNTLA/CbbWieVwFAgFn1Ev1Umv0hpCU3a0hkqFnmimppbL06RywGhr54cbR2O68kXYBi6h2uirDDnnkZNROGAUWMvVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728030921; c=relaxed/simple;
	bh=M5ZwUNljIkai053LktHaBXeerYPWNDZl+TtVRT2IcYU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EBFDJIvmrW193vHw2OoeFxBduuccP48Hc2yUL1YoXWEODWSsVoOxFAmOKM5B83efmbjVV3bh5psN24DRq0OsmnUi2hYr51/qKfqQRqAfaWXYKVTQGhNcdgkhR5x6sKgZNZ6ISHNwtVfqrEDIsi63RrSLxCugajvHThHbGomMbvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hRee1zwS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E0D1C4CEC6;
	Fri,  4 Oct 2024 08:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728030919;
	bh=M5ZwUNljIkai053LktHaBXeerYPWNDZl+TtVRT2IcYU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hRee1zwSNgKFDpqVx8AKRY5Izzhv5O7qeiSaDzYSpNAoOKKJk7chm0w8h31Remj4S
	 3uTQRzk7RmRGaK902hiFxIV7m2nl5m7qalremqtawlY5h29EU6qvCfbfnCiSl/u5rK
	 W5FX4qQQmLDrEtzNblHI6TXldVdllyDpNT3K6oU8N9l4PTsYtdRyAv5Up+K7PrBYo4
	 R9E5zEaYih/I8YMLucOykUjue1roHPDCwEKGUXLuF6uCUpTN6UyybWFJKZUicfdsav
	 nnonGhwU7ZsCunaSjJpz8R5qn8h70zBFiLt4tFq1c0Jj78z+S/OSLbCt0q91QP3rqz
	 fM2X5wXDmxtsQ==
From: Benjamin Tissoires <bentiss@kernel.org>
To: srinivas.pandruvada@linux.intel.com, jikos@kernel.org, 
 SurajSonawane2415 <surajsonawane0215@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241004075944.44932-1-surajsonawane0215@gmail.com>
References: <20241004075944.44932-1-surajsonawane0215@gmail.com>
Subject: Re: [PATCH] hid: intel-ish-hid: Fix uninitialized variable 'rv' in
 ish_fw_xfer_direct_dma
Message-Id: <172803091828.265218.4350721445359526557.b4-ty@kernel.org>
Date: Fri, 04 Oct 2024 10:35:18 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1

On Fri, 04 Oct 2024 13:29:44 +0530, SurajSonawane2415 wrote:
> Fix the uninitialized symbol 'rv' in the function ish_fw_xfer_direct_dma
> to resolve the following warning from the smatch tool:
> drivers/hid/intel-ish-hid/ishtp-fw-loader.c:714 ish_fw_xfer_direct_dma()
> error: uninitialized symbol 'rv'.
> Initialize 'rv' to 0 to prevent undefined behavior from uninitialized
> access.
> 
> [...]

Applied to hid/hid.git (for-6.12/upstream-fixes), thanks!

[1/1] hid: intel-ish-hid: Fix uninitialized variable 'rv' in ish_fw_xfer_direct_dma
      https://git.kernel.org/hid/hid/c/d41bff05a61f

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


