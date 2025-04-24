Return-Path: <linux-input+bounces-11971-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A82FA9A9AF
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 12:13:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7AD1189E7EE
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 10:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B2AF21FF26;
	Thu, 24 Apr 2025 10:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fdUgV6QA"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71D51E7640;
	Thu, 24 Apr 2025 10:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745489560; cv=none; b=QR1Cvsr8cqHZLh/UoPLGflOSjivgF0nxFJRfg44ddJkvExXTqnLrqnvkTMO/ZUdLDFHh3+zDs2GEC2CtAGMMovNe2B2FeqegSW8XUBqoZy8uJv70uPhwNiwIXikDI1+KIV8+lGR2Yvuh5iuozq2GNRp9nq0p6z+lNi7/khI+RUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745489560; c=relaxed/simple;
	bh=9R7GEZSiWFBzp6WOTav2bzg4A2sbskOxYeZTOkgia18=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GTEY0lm8YNrIZyuv50ZPTwVB4FbYEcLOOpaVlyfYkFosWR/QX4d5NVQI+uaDb7nSvs/D6D2pi8MP5k0xKlulAg3wm42hi6b/F82C+asQV/qkWRchXXCf0M24FVxCp/P7EK7lchA9E3k+gO1jWFnkW2MkGCqwGfBXyw9kqATOZ9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fdUgV6QA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA8E2C4CEE3;
	Thu, 24 Apr 2025 10:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745489559;
	bh=9R7GEZSiWFBzp6WOTav2bzg4A2sbskOxYeZTOkgia18=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fdUgV6QATmQtuYcmvH9ph5V1yJy41Sz0el4lBghqJ9dbboRo4u9EW8+5yIe/sEq8K
	 o/7P61/XgB6RuhWIw8K6UZbKNn+daOwfY96VZVqYf2ilJe7yKxMRu9gGl1qsRVRsQF
	 ayx0Zl3mbZAmS6EOz5sxPqoxsFuGy3/LF4UfkjYGN4k47Do5tp05GKW7kW6LYMZ0hl
	 A4kcLjT60PQ7SbnBm1gVRXgAlrQe0ryyxAEWCyWe2RiwSq4+NUlp4cITtEdR5iJuHx
	 oRiRlHUUmT+fPzlbsi/jc+XQf7LdXQyDB0J+flAYweXltqPnwsYneyPfHIthw0jz12
	 f37QZIKLAmHkg==
Date: Thu, 24 Apr 2025 12:12:36 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Henry Martin <bsdhenrymartin@gmail.com>
cc: Markus.Elfring@web.de, bentiss@kernel.org, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] HID: uclogic: Add NULL check in
 uclogic_input_configured()
In-Reply-To: <20250401094853.24143-1-bsdhenrymartin@gmail.com>
Message-ID: <p18p143o-p015-5036-16sr-ns479s8p998o@xreary.bet>
References: <a73250f0-8fbd-40a7-b4b6-bc45050c9289@web.de> <20250401094853.24143-1-bsdhenrymartin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 1 Apr 2025, Henry Martin wrote:

> devm_kasprintf() returns NULL when memory allocation fails. Currently,
> uclogic_input_configured() does not check for this case, which results
> in a NULL pointer dereference.
> 
> Add NULL check after devm_kasprintf() to prevent this issue.
> 
> Fixes: dd613a4e45f8 ("HID: uclogic: Correct devm device reference for hidinput input_dev name")
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


