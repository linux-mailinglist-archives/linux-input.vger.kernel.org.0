Return-Path: <linux-input+bounces-9932-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D96F0A3039A
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 07:31:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BC003A5306
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 06:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFE701D5AD4;
	Tue, 11 Feb 2025 06:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DjrvFECO"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C22433BE;
	Tue, 11 Feb 2025 06:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739255458; cv=none; b=VbrIr1Ik6bkAGLPt8HzmRKFLCYaqtssa+P8My33z/cgfyto+1sHVp+8OgdF96/WHdL38BtM9YXdFrVVhlxrHkw9/LXJ8/eiSniOU5H970zafooCpZS8k9SATVHvrnFf4sbcBV7KqjtSQTbG6mT6jgiVwGsf18fcbw9riSLAifrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739255458; c=relaxed/simple;
	bh=ZGG7+du04YZVtWmPmTi4fmIhDDme98tK/bdjRcq3DlI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=n22Ua89tVFw83s8IhBbqlgoTYU8zcivnn10qPBjvkzFGvFkOmUyyU4SxZAAZflbX6cliTCktTI2rvHaKsLUo3OlRQoZlBP05g70t3Nuhu9HKnDdbTtNuax86qICmL6aDLVOTctFP8gE3PVixsdBVWsMw5/lvGfjEIelnmTzkHLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DjrvFECO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0F30C4CEDD;
	Tue, 11 Feb 2025 06:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739255458;
	bh=ZGG7+du04YZVtWmPmTi4fmIhDDme98tK/bdjRcq3DlI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DjrvFECOLRdpTloSOx1Rc1IdpQTWpn4zpAxtnYJ6XnpFnTORF6F97wwhRutV+kiZ+
	 4SXqU+oHte/W95L5IaFPhhZOhdLVPX5Dp/B86cDmlYQzWhRpnAT+5X51M1g/5G5y70
	 9Wg8gYiMZORqLJ+xWFO5sPKmnhgWXSdFBfzkcuwHynfM8zpZxN+A9Ti789V5wQkMka
	 iw0PnUeOu3ZfhemgU8NO8lrsRpXjxvuSMwQlx9LCRC18fFeEYkvtM3VrYWyt919bhI
	 7uryzA69fbeWAFA6aRdL1FAkPelkdo89JeDOl7/3DRjYc609muTcTlJ4+0JBTxRXZJ
	 aBO7SZ4zjZ2XQ==
Date: Tue, 11 Feb 2025 07:30:55 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Kate Hsuan <hpa@redhat.com>
cc: Hans de Goede <hdegoede@redhat.com>, 
    Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] hid: Kconfig: Add LEDS_CLASS_MULTICOLOR dependency to
 HID_LOGITECH
In-Reply-To: <20250211050240.163015-1-hpa@redhat.com>
Message-ID: <q58263op-297n-255q-npo9-0676o0os9q37@xreary.bet>
References: <20250211050240.163015-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 11 Feb 2025, Kate Hsuan wrote:

> The test bot found an issue with building hid-lg-g15.
> 
> All errors (new ones prefixed by >>):
> 
>    powerpc-linux-ld: drivers/hid/hid-lg-g15.o: in function `lg_g510_kbd_led_write':
> >> drivers/hid/hid-lg-g15.c:241:(.text+0x768): undefined reference to `led_mc_calc_color_components'
>    powerpc-linux-ld: drivers/hid/hid-lg-g15.o: in function `lg_g15_register_led':
> >> drivers/hid/hid-lg-g15.c:686:(.text+0xa9c): undefined reference to `devm_led_classdev_multicolor_register_ext'
> 
> Since multicolor LED APIs manage the keyboard backlight settings of
> hid-lg-g15, the LEDS_CLASS_MULTICOLOR dependency was added to
> HID_LOGITECH.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202502110032.VZ0J024X-lkp@intel.com/
> Signed-off-by: Kate Hsuan <hpa@redhat.com>

I've added

	Fixes: a3a064146c50 ("HID: hid-lg-g15: Use standard multicolor LED API")

make the 'HID:' prefix in shortlog uppercase, and applied.

Thanks,

-- 
Jiri Kosina
SUSE Labs


