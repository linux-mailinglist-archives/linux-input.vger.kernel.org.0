Return-Path: <linux-input+bounces-12780-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF43AD431B
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 21:46:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26A031899BC7
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 19:46:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CEBA2494C2;
	Tue, 10 Jun 2025 19:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WDFPZNsS"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028732327A7;
	Tue, 10 Jun 2025 19:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749584768; cv=none; b=IH6n3yD91kEt+8/17NDnsm1MjQRZ1dRPMG6IFmU8ftIGHWUg3hoZ6c0fipfBNm4Kwckhe5r3pRpsesRuV+woeQcKOuqda3DRuRy9sHPlwQjFo0JL44yLMzif0f3rN8wpQowaPq8sIQkBR46Y6qq0HOVaW4lSOyu+WDd8iMnS9to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749584768; c=relaxed/simple;
	bh=2tbJV9Gl0Cy+7CVOL5WzoNATKtxBsRs6cnubFT/zDWk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HwgotH+W4OFdGBAiKBtycpkNAcSh1XyoUo6j4G3otPf/R5kOYHODdRoDkDCvFX63ftbKRATZA90c6iyZS3vLR3g+ciq+H1+5pDIBSM2+0sPdZOBjcQls3U/epxufkhtH1c8zj8WBzkKSzujM+g83hDKk0cavJMdAtDYn74UTTYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WDFPZNsS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30977C4CEF2;
	Tue, 10 Jun 2025 19:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749584767;
	bh=2tbJV9Gl0Cy+7CVOL5WzoNATKtxBsRs6cnubFT/zDWk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WDFPZNsSsKaXtFYonlPOb2VNgTKg08eMOGUdHIDjC1bm3+kEbG0A3QzukRQivMvgv
	 fGA/WjWlx7Oy3FIEaUCeb8LiGzTSO+kzkkD8fNcvve8mNWiWoq7fIhzGYABXmwNcCR
	 ov3/uROaq0lXqUze/I1LgYrxWTN6M0jfp28C2JM8Nky5mPYsSswoTPHy3GM7AaM3fL
	 Z3LkTgyzylBxH9wZK+d0l6m2wmCb3VME3Y0gbhy1uZ4lc9sScrb5jDVF/X3onodIst
	 VVOwhThEBOnQCgLlVQNJ+FqngJuzpJvlNqiaxYxfnVxUS0Yhl2/2BcXzrd9E41hEZ7
	 cCk2rjI214gNg==
Date: Tue, 10 Jun 2025 21:46:04 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] HID: quirks: Add quirk for 2 Chicony Electronics HP
 5MP Cameras
In-Reply-To: <20250506055015.774509-1-acelan.kao@canonical.com>
Message-ID: <p28nnso5-os1s-52o1-33s4-55058son32no@xreary.bet>
References: <20250506055015.774509-1-acelan.kao@canonical.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 6 May 2025, Chia-Lin Kao (AceLan) wrote:

> The Chicony Electronics HP 5MP Cameras (USB ID 04F2:B824 & 04F2:B82C)
> report a HID sensor interface that is not actually implemented.
> Attempting to access this non-functional sensor via iio_info causes
> system hangs as runtime PM tries to wake up an unresponsive sensor.
> 
> Add these 2 devices to the HID ignore list since the sensor interface is
> non-functional by design and should not be exposed to userspace.
> 
> Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
> ---
> v2. move the quirks to hid_ignore_list[], were misplaced in
>     hid_have_special_driver[]

Now queued in hid.git#for-6.16/upstream-fixes, sorry for the delay.

-- 
Jiri Kosina
SUSE Labs


