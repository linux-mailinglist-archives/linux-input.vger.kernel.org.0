Return-Path: <linux-input+bounces-13946-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2180B227CF
	for <lists+linux-input@lfdr.de>; Tue, 12 Aug 2025 15:09:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 724415680A0
	for <lists+linux-input@lfdr.de>; Tue, 12 Aug 2025 13:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB532285067;
	Tue, 12 Aug 2025 12:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hlFkIb9D"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BC0285057
	for <linux-input@vger.kernel.org>; Tue, 12 Aug 2025 12:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755003437; cv=none; b=L8C9Sx1DpsAgPjDzqnhhPPV7j0f3RqcRPi8pPPW/8XiltS/Qqz9gcz31H8uH4LOtr32Ft8IyO1yPFZyAQ9Hw/LBVFRVAtbiFOjSyq2OkA4sLCWLomhomPhpr5Icm4JuSvJxoE8VGJbubytAtQV4pvI8Z08vxjQ6dlVFByUTbp1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755003437; c=relaxed/simple;
	bh=aUdC0NtfbrUDLcHzxpT+vCf0SuyRkQcccKUVbAgTfFs=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=FgZcDERgkouRc8d+q0BiEs583s/oj3x06OVL0e1o7uy0jrg1PqJQdorUnqNoH7Em8G3XsyMLPusmCdk1hlodwDscKe4I0UkEMQbV0WblZNtKIVWwC23kNseo6DFEx0zHF2DWsh4EhYmKyPGnCBepM/51mwG4i4okoJq7FBq0xVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hlFkIb9D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD991C4CEFF;
	Tue, 12 Aug 2025 12:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755003437;
	bh=aUdC0NtfbrUDLcHzxpT+vCf0SuyRkQcccKUVbAgTfFs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hlFkIb9Dl2VrzCMlQiXCwujr5D0DBcJ5Wn4v7690cKQ7VmP6Igqa0OriQh9qgObeZ
	 AUPGqHyvMtvWTxggI0+/Ur9k6FmRRJU9AqCsrBsCdmL6ZfUpxxK1K2WTyYedsA51Q1
	 zjxaOOCXnz7zMAUv3MrzUBl299fPxq7Kk2N1lLdeEgiNbQWDCzsGLIC7T9kJo8LzRR
	 yl9qR7+bnVhFYoxw0fSBFeGjuGCxtowbpEb/79vIYZuZj+7AwMA8Vn9Rg46Rm4ksUX
	 DoT01E8Bhe+v1Ea9e4tWZx15ARC+TeGUBH6zOVAQeZM/9jW8VqbIZ9RTFmTNuAmEGF
	 Dd3ARYRfNW3Mg==
Date: Tue, 12 Aug 2025 14:57:14 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Ping Cheng <pinglinux@gmail.com>
cc: linux-input@vger.kernel.org, bentiss@kernel.org, 
    Ping Cheng <ping.cheng@wacom.com>
Subject: Re: [PATCH] HID: Wacom: Add a new Art Pen
In-Reply-To: <20250811054030.18331-1-ping.cheng@wacom.com>
Message-ID: <r4p8138s-2156-9219-011s-q91162rsnq32@xreary.bet>
References: <20250811054030.18331-1-ping.cheng@wacom.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 10 Aug 2025, Ping Cheng wrote:

> diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
> index 955b39d22524..9b2c710f8da1 100644
> --- a/drivers/hid/wacom_wac.c
> +++ b/drivers/hid/wacom_wac.c
> @@ -684,6 +684,7 @@ static bool wacom_is_art_pen(int tool_id)
>  	case 0x885:	/* Intuos3 Marker Pen */
>  	case 0x804:	/* Intuos4/5 13HD/24HD Marker Pen */
>  	case 0x10804:	/* Intuos4/5 13HD/24HD Art Pen */
> +	case 0x204:     /* Art Pen 2 */
>  		is_art_pen = true;
>  		break;

Applied to hid.git#for-6.17/upstream-fixes, thanks.

-- 
Jiri Kosina
SUSE Labs


