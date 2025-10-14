Return-Path: <linux-input+bounces-15469-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 76968BD8961
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 11:53:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3C8664E36E1
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 09:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1535629E0E5;
	Tue, 14 Oct 2025 09:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M5gC4FWB"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E555BBE49
	for <linux-input@vger.kernel.org>; Tue, 14 Oct 2025 09:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760435631; cv=none; b=XXfWjN2zbkjoxT4m1KGeSdPuRlR6QgMzSVPjsNUkU4nfFAJhqO31mBMEb7r8WQol8PhqeX/TfpeAYJ7xDseYpdGyOdG5gxYb988legz5NQn9fuUpQWW9M17CoKia2B1L1jj3zwrM4HTz7HtujqJge3N45TpGv1TFZBZOuYd34bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760435631; c=relaxed/simple;
	bh=eh8Oa9UjgL3RXPJLiOhJoxW/qKKpfBUCDDumxrRDoLw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=uiwwcRwxtNw7kPQ3VuDlHxVWZC1S3F47RLglH4JUcOEd8uWus85ZJPc5HoZOUbINa5zN8DcOPVcaOk94pehXTsLoBkxAssfBYrBbOA23jmuDXAEPaTJeGXCds7UpPW5EIB0MkVkcpGSkC+OTiqNg9B+SLTiXsGZMaaEAdtoAxQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M5gC4FWB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 108D7C4CEE7;
	Tue, 14 Oct 2025 09:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760435630;
	bh=eh8Oa9UjgL3RXPJLiOhJoxW/qKKpfBUCDDumxrRDoLw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=M5gC4FWBVWrw5W4+7ChPey040ou/IpJLMpLX7akI1Jhs712L+wATrb6wYWTlIZ58R
	 2Wmu1Qj0vAn7pKbtDWXCNsoYFgEIimzSWIfiaDH2SBw6HcvWUnYmB4w3SThHw9imAf
	 rRYVa2BmK2H6hbGNl5C/BdSiprJYAhpZ+eGbVFykcpEmsk+jvaNwKK7p8Nlp723PKf
	 szsNYNh3JOlv1U1eEw/M9MlZ1crXf/3xUFQXFY/xe0wgGwtYclopYWnugDXnAC9atS
	 +nULMfZ90xEtqLV4ddYxbfkB/RPpJbW8TuYBIOUVl39xZl5j1HPN77YypBWeWFag1I
	 hio4W5ALI+sWw==
Date: Tue, 14 Oct 2025 11:53:47 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
cc: stuart.a.hayhurst@gmail.com, linux-input@vger.kernel.org, 
    bentiss@kernel.org, hadess@hadess.net, lains@riseup.net
Subject: Re: [PATCH] HID: logitech-hidpp: Silence protocol errors on newer
 lightspeed receivers
In-Reply-To: <20251002192324.1991349-1-mavchatz@protonmail.com>
Message-ID: <660n5q17-8647-3174-7qrr-6r46rn443rpo@xreary.bet>
References: <20251002192324.1991349-1-mavchatz@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 2 Oct 2025, Mavroudis Chatzilazaridis wrote:

> When logitech-hidpp tries to communicate with an unreachable device paired
> to a 046d:c547 lightspeed receiver, the following message is printed to the
> console:
> 
> hidpp_root_get_protocol_version: received protocol error 0x08
> 
> This occurs because this receiver returns 0x08 (HIDPP_ERROR_UNKNOWN_DEVICE)
> when a device is unreachable, compared to 0x09 (HIDPP_ERROR_RESOURCE_ERROR)
> that the older receivers return.
> 
> This patch silences this harmless error by treating
> HIDPP_ERROR_UNKNOWN_DEVICE the same as HIDPP_ERROR_RESOURCE_ERROR
> in hidpp_root_get_protocol_version().
> 
> There are other checks for HIDPP_ERROR_RESOURCE_ERROR found in
> battery-related functions, however this receiver does not trigger them when
> the device is disconnected.

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


