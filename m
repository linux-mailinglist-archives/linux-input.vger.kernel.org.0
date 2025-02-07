Return-Path: <linux-input+bounces-9834-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F70A2C312
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2025 13:51:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AF2618832A2
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2025 12:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03BBB1DED54;
	Fri,  7 Feb 2025 12:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cfTaJFyw"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED81944E;
	Fri,  7 Feb 2025 12:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738932690; cv=none; b=iSlYgCRrDrvpaN658tUc9TIro2ngOGREJeX8AmsBFvgXVKhyBbBq1rQbWa+Sov0c7c/0yv5M+VMemE5mwyvDapAzvNPJ259jKVz4PlA3zJfd9oNKj+bu8Evu5zpoZ00SN2Lj6dTjjk+WisVyN2enQ67gJ0ud++9h2s5UuEbRS+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738932690; c=relaxed/simple;
	bh=M4IZZLK5uuuYEJ8jRtmP+IPC2DFQI1tfg7xzzDR0wgk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Tjn9BbOolZ3LI4QEETWMkKv5t7c1V1lipa5F81fqzvWMwIo9BhQNTPML0VHwzFDi0p2a0i6XjHOjC6beiNAr0fQImQ1tSbBwJ+Ji7hoPnDliTwWa+S4HwzpIVipq46NSNlq0yGlFNliJI9sgBJ5LEQ2BXe4KsgQ191JPuznq+UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cfTaJFyw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53241C4CED1;
	Fri,  7 Feb 2025 12:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738932690;
	bh=M4IZZLK5uuuYEJ8jRtmP+IPC2DFQI1tfg7xzzDR0wgk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cfTaJFywbkSh9Z5oVdlWpL3WqhChC7srcuFk0WBxO7PIAZm7esAKyeP6xt/jAz8Wd
	 OBGqGuxsA4fgnp3gjSNREUDbiecdiFRokQoWSdW4udysMBhK1Xw/XwEEJ+U3iJI4xy
	 vxR/G/XzAuTVF7Bc1DH4m/xGpt8RyjZrIlSvakjn7Oxydv/lgZM64mpmlzGU5P77Ia
	 LZngj3bwgLPhpHv2A3Fu2DruSwnTTNZoL6yBnPk1IJ1/5o+i6kCLGfiWE7nIeyVwRb
	 IU0jdUPs+dBFBfudkaqh7/zt70KYCoo6HUGOc2BUgGOZcdkK/8iSgWozscMzQAQVHH
	 chc7d5mewFdUA==
Date: Fri, 7 Feb 2025 13:51:27 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Kate Hsuan <hpa@redhat.com>
cc: Hans de Goede <hdegoede@redhat.com>, 
    Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hid: hid-lg-g15: Use standard multicolor LED API
In-Reply-To: <20250131140241.586305-1-hpa@redhat.com>
Message-ID: <10q50q4n-6p07-nn4p-n8r9-167o85661p25@xreary.bet>
References: <20250131140241.586305-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 31 Jan 2025, Kate Hsuan wrote:

> Replace the custom "color" sysfs attribute with the standard multicolor
> LED API.
> 
> This also removes the code for the custom "color" sysfs attribute,
> the "color" sysfs attribute was never documented so hopefully, it is not
> used by anyone.
> 
> If we get complaints, we can re-add the "color" sysfs attribute as
> a compatibility wrapper setting the subleds intensity.
> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> ---
> Changes in v2:
> 1. The commit message was revised with the reviewer's suggestions.
> 2. The incorrect parameters for container_of() were fixed.
> 3. The brightness values were converted by led_mc_calc_color_components().

Applied, thank you.

-- 
Jiri Kosina
SUSE Labs


