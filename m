Return-Path: <linux-input+bounces-4151-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDF78FDB67
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 02:24:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8ECD41C218E1
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 00:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48903525E;
	Thu,  6 Jun 2024 00:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ceCEYX9s"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFDA4C7D;
	Thu,  6 Jun 2024 00:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717633449; cv=none; b=g6eL+TiDc8QMVXvfxljpwoMLFVoKPMGOt2HjFESO6o175xOfkJ+APXaO7MNOXx4I9YocAKrYKJdkw2HcEz8c5GYNSdtZuHBoNmV6UrWEcfTbpC8UU5fdXArxTmtftsYNnKkPJBNp9v6vcyZ10QGR3ZPhD+xq+udNTTmDiF4KLWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717633449; c=relaxed/simple;
	bh=zACP1JLsppCuez65YERBmhPkTyiM+safYjy0gPvN8lw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WhULOe8N/cdSiO50tSm/EWE6cEFhsVupHJ919xVDTYBpM9m0XDMwggP2zA3rmc6f/ab/Uxv+fqC0SEkY5pe2FI2TsdHWPHolyonET78eXb9A+0jbL1DW2rMxB/WMqVREbzlyOg8BAfQ5X7Ybw7cgICtL6FOHpoyr66ii8w6Tdh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ceCEYX9s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E618C2BD11;
	Thu,  6 Jun 2024 00:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717633449;
	bh=zACP1JLsppCuez65YERBmhPkTyiM+safYjy0gPvN8lw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ceCEYX9swt6oUdD83N+Dn0TprBelZK0XyzkwqtehmDvOoXjeLtLR5/irNitMobfjC
	 lPaBpB21ox2ddyTDI9tWyWbKAUBROmTSkbGGPAQ0Kra1tSrO1J96mCPunxbDd95mAQ
	 aSi8DEmkrJ0+vZASlQUUmLwXjJwISyMrJKgWh/XNB90PE0KSwPaB1o15CINeZ7/lOf
	 pKj5l/nutEqQX+8O56Nc87f6lL2yugsBnMvl99huwlFBjParNuqoa6yevsLifUouQd
	 KURO0rE5soZExXcqnKUolB/zTvZ+7Ywu8GUQ9vsI3kAsKErG3qEMzi151LEk7Eb9SQ
	 yZjOESCbXnQEw==
Date: Wed, 5 Jun 2024 18:24:06 -0600
From: Rob Herring <robh@kernel.org>
To: Daisuke Nojiri <dnojiri@chromium.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] ARM: dts: cros-ec-keyboard: Add keyboard matrix v3.0
Message-ID: <20240606002406.GA3505320-robh@kernel.org>
References: <20240604005354.2294468-1-dnojiri@chromium.org>
 <20240604230909.2879006-1-dnojiri@chromium.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604230909.2879006-1-dnojiri@chromium.org>

On Tue, Jun 04, 2024 at 04:09:07PM -0700, Daisuke Nojiri wrote:
> Add support for keyboard matrix version 3.0.

What's that?

Subject is wrong. This is not an ARM dts. 'dt-bindings: ' is the prefix.


> 
> Signed-off-by: Daisuke Nojiri <dnojiri@chromium.org>
> Change-Id: I18957556bcd01c74ded84571638de2583dccb93f

Drop Change-Id for upstream.

> ---
>  include/dt-bindings/input/cros-ec-keyboard.h | 104 +++++++++++++++++++
>  1 file changed, 104 insertions(+)
> 
> diff --git a/include/dt-bindings/input/cros-ec-keyboard.h b/include/dt-bindings/input/cros-ec-keyboard.h
> index f0ae03634a96..afc12f6aa642 100644
> --- a/include/dt-bindings/input/cros-ec-keyboard.h
> +++ b/include/dt-bindings/input/cros-ec-keyboard.h
> @@ -100,4 +100,108 @@
>  	MATRIX_KEY(0x07, 0x0b, KEY_UP)		\
>  	MATRIX_KEY(0x07, 0x0c, KEY_LEFT)
>  
> +/* No numpad */
> +#define CROS_TOP_ROW_KEYMAP_V30 \
> +	MATRIX_KEY(0x00, 0x01, KEY_F11)		/* T11 */	\
> +	MATRIX_KEY(0x00, 0x02, KEY_F1)		/* T1 */	\
> +	MATRIX_KEY(0x00, 0x04, KEY_F10)		/* T10 */	\
> +	MATRIX_KEY(0x00, 0x0b, KEY_F14)		/* T14 */	\
> +	MATRIX_KEY(0x00, 0x0c, KEY_F15)		/* T15 */	\
> +	MATRIX_KEY(0x01, 0x02, KEY_F4)		/* T4 */	\
> +	MATRIX_KEY(0x01, 0x04, KEY_F7)		/* T7 */	\
> +	MATRIX_KEY(0x01, 0x05, KEY_F12)		/* T12 */	\
> +	MATRIX_KEY(0x01, 0x09, KEY_F9)		/* T9 */	\
> +	MATRIX_KEY(0x02, 0x02, KEY_F3)		/* T3 */	\
> +	MATRIX_KEY(0x02, 0x04, KEY_F6)		/* T6 */	\
> +	MATRIX_KEY(0x02, 0x0b, KEY_F8)		/* T8 */	\
> +	MATRIX_KEY(0x03, 0x02, KEY_F2)		/* T2 */	\
> +	MATRIX_KEY(0x03, 0x05, KEY_F13)		/* T13 */	\
> +	MATRIX_KEY(0x04, 0x04, KEY_F5)		/* T5 */
> +
> +#define CROS_MAIN_KEYMAP_V30			/* Keycode */	\
> +	MATRIX_KEY(0x00, 0x03, KEY_B)		/* 50 */	\
> +	MATRIX_KEY(0x00, 0x05, KEY_N)		/* 51 */	\
> +	MATRIX_KEY(0x00, 0x06, KEY_RO)		/* 56 (JIS) */	\
> +	MATRIX_KEY(0x00, 0x08, KEY_EQUAL)	/* 13 */	\
> +	MATRIX_KEY(0x00, 0x09, KEY_HOME)	/* 80 (Numpad) */	\
> +	MATRIX_KEY(0x00, 0x0a, KEY_RIGHTALT)	/* 62 */	\
> +	MATRIX_KEY(0x00, 0x10, KEY_FN)		/* 127 */	\
> +								\
> +	MATRIX_KEY(0x01, 0x01, KEY_ESC)		/* 110 */	\
> +	MATRIX_KEY(0x01, 0x03, KEY_G)		/* 35 */	\
> +	MATRIX_KEY(0x01, 0x06, KEY_H)		/* 36 */	\
> +	MATRIX_KEY(0x01, 0x08, KEY_APOSTROPHE)	/* 41 */	\
> +	MATRIX_KEY(0x01, 0x0b, KEY_BACKSPACE)	/* 15 */	\
> +	MATRIX_KEY(0x01, 0x0c, KEY_HENKAN)	/* 65 (JIS) */	\
> +	MATRIX_KEY(0x01, 0x0e, KEY_LEFTCTRL)	/* 58 */	\
> +								\
> +	MATRIX_KEY(0x02, 0x01, KEY_TAB)		/* 16 */	\
> +	MATRIX_KEY(0x02, 0x03, KEY_T)		/* 21 */	\
> +	MATRIX_KEY(0x02, 0x05, KEY_RIGHTBRACE)	/* 28 */	\
> +	MATRIX_KEY(0x02, 0x06, KEY_Y)		/* 22 */	\
> +	MATRIX_KEY(0x02, 0x08, KEY_LEFTBRACE)	/* 27 */	\
> +	MATRIX_KEY(0x02, 0x09, KEY_DELETE)	/* 76 (Numpad) */	\
> +	MATRIX_KEY(0x02, 0x0c, KEY_PAGEUP)	/* 85 (Numpad) */	\
> +	MATRIX_KEY(0x02, 0x011, KEY_YEN)	/* 14 (JIS) */	\
> +								\
> +	MATRIX_KEY(0x03, 0x00, KEY_LEFTMETA)	/* Launcher */	\
> +	MATRIX_KEY(0x03, 0x01, KEY_GRAVE)	/* 1 */	\
> +	MATRIX_KEY(0x03, 0x03, KEY_5)		/* 6 */	\
> +	MATRIX_KEY(0x03, 0x04, KEY_S)		/* 32 */	\
> +	MATRIX_KEY(0x03, 0x06, KEY_MINUS)	/* 12 */	\
> +	MATRIX_KEY(0x03, 0x08, KEY_6)		/* 7 */		\
> +	MATRIX_KEY(0x03, 0x09, KEY_SLEEP)	/* Lock */	\
> +	MATRIX_KEY(0x03, 0x0b, KEY_BACKSLASH)	/* 29 */	\
> +	MATRIX_KEY(0x03, 0x0c, KEY_MUHENKAN)	/* 63 (JIS) */	\
> +	MATRIX_KEY(0x03, 0x0e, KEY_RIGHTCTRL)	/* 64 */	\
> +								\
> +	MATRIX_KEY(0x04, 0x01, KEY_A)		/* 31 */	\
> +	MATRIX_KEY(0x04, 0x02, KEY_D)		/* 33 */	\
> +	MATRIX_KEY(0x04, 0x03, KEY_F)		/* 34 */	\
> +	MATRIX_KEY(0x04, 0x05, KEY_K)		/* 38 */	\
> +	MATRIX_KEY(0x04, 0x06, KEY_J)		/* 37 */	\
> +	MATRIX_KEY(0x04, 0x08, KEY_SEMICOLON)	/* 40 */	\
> +	MATRIX_KEY(0x04, 0x09, KEY_L)		/* 39 */	\
> +	MATRIX_KEY(0x04, 0x0b, KEY_ENTER)	/* 43 */	\
> +	MATRIX_KEY(0x04, 0x0c, KEY_END)		/* 81 (Numpad) */	\
> +								\
> +	MATRIX_KEY(0x05, 0x01, KEY_1)		/* 2 */	\
> +	MATRIX_KEY(0x05, 0x02, KEY_COMMA)	/* 53 */	\
> +	MATRIX_KEY(0x05, 0x03, KEY_DOT)		/* 54 */	\
> +	MATRIX_KEY(0x05, 0x04, KEY_SLASH)	/* 55 */	\
> +	MATRIX_KEY(0x05, 0x05, KEY_C)		/* 48 */	\
> +	MATRIX_KEY(0x05, 0x06, KEY_SPACE)	/* 61 */	\
> +	MATRIX_KEY(0x05, 0x07, KEY_LEFTSHIFT)	/* 44 */	\
> +	MATRIX_KEY(0x05, 0x08, KEY_X)		/* 47 */	\
> +	MATRIX_KEY(0x05, 0x09, KEY_V)		/* 49 */	\
> +	MATRIX_KEY(0x05, 0x0b, KEY_M)		/* 52 */	\
> +	MATRIX_KEY(0x05, 0x0c, KEY_PAGEDOWN)	/* 86 (Numpad) */	\
> +								\
> +	MATRIX_KEY(0x06, 0x01, KEY_Z)		/* 46 */	\
> +	MATRIX_KEY(0x06, 0x02, KEY_3)		/* 4 */		\
> +	MATRIX_KEY(0x06, 0x03, KEY_4)		/* 5 */		\
> +	MATRIX_KEY(0x06, 0x04, KEY_2)		/* 3 */		\
> +	MATRIX_KEY(0x06, 0x05, KEY_8)		/* 9 */		\
> +	MATRIX_KEY(0x06, 0x06, KEY_0)		/* 11 */	\
> +	MATRIX_KEY(0x06, 0x08, KEY_7)		/* 8 */		\
> +	MATRIX_KEY(0x06, 0x09, KEY_9)		/* 10 */	\
> +	MATRIX_KEY(0x06, 0x0b, KEY_DOWN)	/* 84 */	\
> +	MATRIX_KEY(0x06, 0x0c, KEY_RIGHT)	/* 89 */	\
> +	MATRIX_KEY(0x06, 0x0d, KEY_LEFTALT)	/* 60 */	\
> +	MATRIX_KEY(0x06, 0x0f, KEY_ASSISTANT)	/* 128 */	\
> +	MATRIX_KEY(0x06, 0x11, KEY_BACKSLASH)	/* 42 (JIS, ISO) */	\
> +								\
> +	MATRIX_KEY(0x07, 0x01, KEY_U)		/* 23 */	\
> +	MATRIX_KEY(0x07, 0x02, KEY_I)		/* 24 */	\
> +	MATRIX_KEY(0x07, 0x03, KEY_O)		/* 25 */	\
> +	MATRIX_KEY(0x07, 0x04, KEY_P)		/* 26 */	\
> +	MATRIX_KEY(0x07, 0x05, KEY_Q)		/* 17 */	\
> +	MATRIX_KEY(0x07, 0x06, KEY_W)		/* 18 */	\
> +	MATRIX_KEY(0x07, 0x07, KEY_RIGHTSHIFT)	/* 57 */	\
> +	MATRIX_KEY(0x07, 0x08, KEY_E)		/* 19 */	\
> +	MATRIX_KEY(0x07, 0x09, KEY_R)		/* 20 */	\
> +	MATRIX_KEY(0x07, 0x0b, KEY_UP)		/* 83 */	\
> +	MATRIX_KEY(0x07, 0x0c, KEY_LEFT)	/* 79 */	\
> +	MATRIX_KEY(0x07, 0x11, KEY_102ND)	/* 45 (ISO) */
> +
>  #endif /* _CROS_EC_KEYBOARD_H */
> -- 
> 2.45.1.288.g0e0cd299f1-goog
> 

