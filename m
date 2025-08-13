Return-Path: <linux-input+bounces-13969-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BE8B248DD
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 13:53:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F29E1897FEF
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 11:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B63832FAC1A;
	Wed, 13 Aug 2025 11:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tzfVHWRT"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1E22FAC0B;
	Wed, 13 Aug 2025 11:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755086020; cv=none; b=Kj1BqNAvG+2rKcoPPkUJENYtLTFb1BX1h2HVhinkwGBJ8/pOhKn09aS4k0JdGcJ1oUTXdkQKyS1JetFJkhVtGZh4HJnWqUBJTphygq3YQz6hWVpetO/YFwvsu+koJ9Bs8mhZIa4q1K8C/RhJJ3Bx0GOgOiyqscGvAx9UUqIePEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755086020; c=relaxed/simple;
	bh=99v3Uwoa/nOwJ1hZoHDKKGH9HyS5tXk1KKaE58BxJAE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SzpUcRZ4SBxAj5bQ9dvBRQ86ZvGlFcRK7hLJ29Jg1Kw25TWPdyU1XfXu1VlqAvwZvSHCPsJgQNP8eYHcvbd0qI7IpsdMtim2d6i2HZ1Bi9yL8h16lhR0YGKcfvU8LkvFh8t/adG/TYhydlrvXxyMkpt5t0K2TvA2NwI+ugyjV+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tzfVHWRT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 508F2C4CEF5;
	Wed, 13 Aug 2025 11:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755086019;
	bh=99v3Uwoa/nOwJ1hZoHDKKGH9HyS5tXk1KKaE58BxJAE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tzfVHWRTIjwki9AmMkTJnGUsgE9HZOKt+TtVoK09Nsgwpuqh6rc1KIS83QBcrhRDh
	 qXiO1tQSolkA9S63vjuRPHSnHdVY0d8ju8sOSDMOwHOv5h51GiradBkbh1C5RpxCXP
	 SsZ3dNOjbYDhDO/81z5edEkdd89l+pgPtRo5gkQybngVFy42Be8Iw2Pjss7E0ATqbR
	 dN+6/gzPAMbZgfdTMGBFOAqvLOc24gD5GB9qLi5ckDQnJwQeBg9SARhnxdT3YtFXQ7
	 D1adyhMHba20PRBk/dofCQ2Mz+4pokFHt+VK4YTm94txKr4niiW6vXYhl492VMmaDn
	 qXJZzlF5JCpnQ==
From: Benjamin Tissoires <bentiss@kernel.org>
To: Jiri Kosina <jikos@kernel.org>, Minjong Kim <minbell.kim@samsung.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250813-hid-ntrig-page-fault-fix-v2-1-f98581f35106@samsung.com>
References: <CGME20250813103051epcas1p39a9dacf48770020ca234e0c648bb01d2@epcas1p3.samsung.com>
 <20250813-hid-ntrig-page-fault-fix-v2-1-f98581f35106@samsung.com>
Subject: Re: [PATCH v2] HID: hid-ntrig: fix unable to handle page fault in
 ntrig_report_version()
Message-Id: <175508601806.12409.17351034009690656147.b4-ty@kernel.org>
Date: Wed, 13 Aug 2025 13:53:38 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Wed, 13 Aug 2025 19:30:22 +0900, Minjong Kim wrote:
> in ntrig_report_version(), hdev parameter passed from hid_probe().
> sending descriptor to /dev/uhid can make hdev->dev.parent->parent to null
> if hdev->dev.parent->parent is null, usb_dev has
> invalid address(0xffffffffffffff58) that hid_to_usb_dev(hdev) returned
> when usb_rcvctrlpipe() use usb_dev,it trigger
> page fault error for address(0xffffffffffffff58)
> 
> [...]

Applied to hid/hid.git (for-6.17/upstream-fixes), thanks!

[1/1] HID: hid-ntrig: fix unable to handle page fault in ntrig_report_version()
      https://git.kernel.org/hid/hid/c/185c926283da

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


