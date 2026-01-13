Return-Path: <linux-input+bounces-17059-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC1AD1A70A
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 17:56:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 624B73010BC4
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 16:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3972E34DCFD;
	Tue, 13 Jan 2026 16:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cyEuYv4Z"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1EA1B3925
	for <linux-input@vger.kernel.org>; Tue, 13 Jan 2026 16:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768323409; cv=none; b=b3qKs0vRGtxCpVv5KcvfnyTgdrvg02MZEB98xock+JG1wbIgcOlB9jT9uzDaUjw9JyIcCHSefvk/huaQjr6uWnFjTu1pCcqxIDqxuWOoQc4KNfRGJkewcSidl6TM38WfRn3cMqjkorkJvpDFIw3UNUns9AuyyrzpR1Rpjp6KzJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768323409; c=relaxed/simple;
	bh=7Hrw2+r2W07R3kZT/TTLyPrhYlOlSv2ggZ5P/EUUXmI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=We3wH9GKDhVAUHr6WMwluCu6LVDuBM3smbhRzry2J5oO8P0zPyBNLuwo74CAuqCguWcWU4rLrTqVzL20YUHIieFVuDC+vSVBlzbzC45OPSjW2q+rf+pULGSxWa7bWL8jSbO6+XdTxHw3bc4kXnu3X6NLdDU91v2OJVwUac46Wjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cyEuYv4Z; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47d3ffa5f33so35428055e9.2
        for <linux-input@vger.kernel.org>; Tue, 13 Jan 2026 08:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768323406; x=1768928206; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=psrFyzGWuguAJOxv+jmQrUYZB9YxdcHUz47oeFRioBY=;
        b=cyEuYv4ZAL/GuIcnmBWatzaEEUdeBo+1xq4JxgOIsVbpO/2uOGiz6ob4JWX6Nw/Cqd
         2wg1vaZDzSjbHkqzNRqAjVyE/7L/2MAQ065uLHmVISvyxLvwuxJGzUiCCJ01ZsVapOOh
         WGnpmvIQWa5RSG7SUUPNFuHMo8gX6OILWIDSHSSqM06mI5MikpezrfKVL+kotCNvviVr
         uncHqI3jNzgUN2Bdsa0qhoz/zVwjwqNq/1kLPSWhI71zncdwaEfcsBrKu6Ujqnq95+gl
         tf5oCyjoHcCh7A404RJK7piYqtceGHAITzDxOXttrIQcxNyfmkLWl7Dy0GShNMxWaBIe
         wt0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768323406; x=1768928206;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=psrFyzGWuguAJOxv+jmQrUYZB9YxdcHUz47oeFRioBY=;
        b=a481EQn0mikNKhI1VDIB4QKibJAieptCXSqgEDq6DULhQoZHzKUPN/4SSPcVtT5pVB
         xRNi7i0pjirM71IInq1vKJTc9rdH1WIgyg4eCKAdCgwIyyYfpRy2uOrfdZxdZz7bXDP+
         z8SAFHOE2KRXCDY+YxdE69A+oKetq3xBFWIBdLHw/NSDqgBKEmMpq4GF9yf8b9D+JR3b
         zNcKDL2wkT8Q98+GULqr0Cmf9BKInoIKzyf2C+/+4z4+ZSO3pwNnQ8bwqa+EBsL3QnGP
         eosiKZQ5AMtS0yX/5MIlEZsAqUHpO4TunPXn7NhQmwoaMDFK76YWbtxofozu9IREyeqE
         9k2g==
X-Forwarded-Encrypted: i=1; AJvYcCXcfTYPkj7Njp8F1M/2wyg5TlmCthifRB1GgfwLG1918ueD7JNuUfjiVmAMoiwatIAh9mTEqcuBD9H8cw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWdUCfJ3/N2+oEuanylE2vzuR6BkxQ/3RBYrZwn9j+j7MIBs+C
	dkqUwj7PQINgIJWJ+v4R3/aASCdSf1eztEfL2tBPpdQTPFwYwctmnrKF
X-Gm-Gg: AY/fxX6JNpqxOYzCiZ4bGIJMPV39aegOAsN+C+VBpjEFwX2Xbj9Fg0OFbvlY1j4kn9E
	VcVpPpAC5+UNoJU38t/M/cmL01BeTIi904ZFWAt/syDNJe6gZBJuucXNgGVLj4t/El07bv8kpIR
	TQWzo7Ba8df1g25Qg9b6cmxnCzWS77vdIDMrsUc7niJx8kSdd0/BYke4ASBEYQitGO/EAM6yrOl
	Qe1Frp0Xk/kxdtzMwLmJ0JVQQNZymniE0jdorxUXM+ZXopVschGTw+etJBn3YfJl0kHfLJr4Ivc
	OXwmRMqRkmD7iZeJq7oFPDzOgpapy4MiSGn+GEav+uoRYOMBSymVGFt9hxHbJhUyIQsNvlS+535
	r4FGTkCn69Qa1MYIUhObv1AQyvCgq/Vtizu2AHubaFEjzVsPVJG1vkyHGGpN8Rj923GXA9f3usq
	y4kmm/lv6+G5EX2eOYRnI=
X-Google-Smtp-Source: AGHT+IGD1M0UTWS8UrJ/c4O2hvE+wkNYVLNoozJBRbK64xfMz/HYjqrKzncFlS/SbFNpX/ApUzudJg==
X-Received: by 2002:a05:600c:8712:b0:47e:d70d:cbf7 with SMTP id 5b1f17b1804b1-47ed70dcc36mr54439275e9.8.1768323405661;
        Tue, 13 Jan 2026 08:56:45 -0800 (PST)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ec5d95edbsm201567425e9.3.2026.01.13.08.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 08:56:45 -0800 (PST)
Message-ID: <fdc6ca83e326e2438c420f7c1571c0e49fd3741b.camel@gmail.com>
Subject: Re: [PATCH] Input: adp5589: remove a leftover header file
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Vladimir Zapolskiy <vz@mleia.com>, Dmitry Torokhov
	 <dmitry.torokhov@gmail.com>
Cc: Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Laurent Pinchart
	 <laurent.pinchart@ideasonboard.com>, "Signed-off-by : Lee Jones"
	 <lee@kernel.org>, linux-input@vger.kernel.org
Date: Tue, 13 Jan 2026 16:57:28 +0000
In-Reply-To: <20260113151140.3843753-1-vz@mleia.com>
References: <20260113151140.3843753-1-vz@mleia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-01-13 at 17:11 +0200, Vladimir Zapolskiy wrote:
> In commit 3bdbd0858df6 ("Input: adp5589: remove the driver") the last use=
r
> of include/linux/input/adp5589.h was removed along with the whole driver,
> thus the header file can be also removed.
>=20
> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
> ---

Thanks!

Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>

> =C2=A0include/linux/input/adp5589.h | 180 -------------------------------=
---
> =C2=A01 file changed, 180 deletions(-)
> =C2=A0delete mode 100644 include/linux/input/adp5589.h
>=20
> diff --git a/include/linux/input/adp5589.h b/include/linux/input/adp5589.=
h
> deleted file mode 100644
> index 0e4742c8c81e..000000000000
> --- a/include/linux/input/adp5589.h
> +++ /dev/null
> @@ -1,180 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - * Analog Devices ADP5589/ADP5585 I/O Expander and QWERTY Keypad Control=
ler
> - *
> - * Copyright 2010-2011 Analog Devices Inc.
> - */
> -
> -#ifndef _ADP5589_H
> -#define _ADP5589_H
> -
> -/*
> - * ADP5589 specific GPI and Keymap defines
> - */
> -
> -#define ADP5589_KEYMAPSIZE	88
> -
> -#define ADP5589_GPI_PIN_ROW0 97
> -#define ADP5589_GPI_PIN_ROW1 98
> -#define ADP5589_GPI_PIN_ROW2 99
> -#define ADP5589_GPI_PIN_ROW3 100
> -#define ADP5589_GPI_PIN_ROW4 101
> -#define ADP5589_GPI_PIN_ROW5 102
> -#define ADP5589_GPI_PIN_ROW6 103
> -#define ADP5589_GPI_PIN_ROW7 104
> -#define ADP5589_GPI_PIN_COL0 105
> -#define ADP5589_GPI_PIN_COL1 106
> -#define ADP5589_GPI_PIN_COL2 107
> -#define ADP5589_GPI_PIN_COL3 108
> -#define ADP5589_GPI_PIN_COL4 109
> -#define ADP5589_GPI_PIN_COL5 110
> -#define ADP5589_GPI_PIN_COL6 111
> -#define ADP5589_GPI_PIN_COL7 112
> -#define ADP5589_GPI_PIN_COL8 113
> -#define ADP5589_GPI_PIN_COL9 114
> -#define ADP5589_GPI_PIN_COL10 115
> -#define GPI_LOGIC1 116
> -#define GPI_LOGIC2 117
> -
> -#define ADP5589_GPI_PIN_ROW_BASE ADP5589_GPI_PIN_ROW0
> -#define ADP5589_GPI_PIN_ROW_END ADP5589_GPI_PIN_ROW7
> -#define ADP5589_GPI_PIN_COL_BASE ADP5589_GPI_PIN_COL0
> -#define ADP5589_GPI_PIN_COL_END ADP5589_GPI_PIN_COL10
> -
> -#define ADP5589_GPI_PIN_BASE ADP5589_GPI_PIN_ROW_BASE
> -#define ADP5589_GPI_PIN_END ADP5589_GPI_PIN_COL_END
> -
> -#define ADP5589_GPIMAPSIZE_MAX (ADP5589_GPI_PIN_END - ADP5589_GPI_PIN_BA=
SE + 1)
> -
> -/*
> - * ADP5585 specific GPI and Keymap defines
> - */
> -
> -#define ADP5585_KEYMAPSIZE	30
> -
> -#define ADP5585_GPI_PIN_ROW0 37
> -#define ADP5585_GPI_PIN_ROW1 38
> -#define ADP5585_GPI_PIN_ROW2 39
> -#define ADP5585_GPI_PIN_ROW3 40
> -#define ADP5585_GPI_PIN_ROW4 41
> -#define ADP5585_GPI_PIN_ROW5 42
> -#define ADP5585_GPI_PIN_COL0 43
> -#define ADP5585_GPI_PIN_COL1 44
> -#define ADP5585_GPI_PIN_COL2 45
> -#define ADP5585_GPI_PIN_COL3 46
> -#define ADP5585_GPI_PIN_COL4 47
> -#define GPI_LOGIC 48
> -
> -#define ADP5585_GPI_PIN_ROW_BASE ADP5585_GPI_PIN_ROW0
> -#define ADP5585_GPI_PIN_ROW_END ADP5585_GPI_PIN_ROW5
> -#define ADP5585_GPI_PIN_COL_BASE ADP5585_GPI_PIN_COL0
> -#define ADP5585_GPI_PIN_COL_END ADP5585_GPI_PIN_COL4
> -
> -#define ADP5585_GPI_PIN_BASE ADP5585_GPI_PIN_ROW_BASE
> -#define ADP5585_GPI_PIN_END ADP5585_GPI_PIN_COL_END
> -
> -#define ADP5585_GPIMAPSIZE_MAX (ADP5585_GPI_PIN_END - ADP5585_GPI_PIN_BA=
SE + 1)
> -
> -struct adp5589_gpi_map {
> -	unsigned short pin;
> -	unsigned short sw_evt;
> -};
> -
> -/* scan_cycle_time */
> -#define ADP5589_SCAN_CYCLE_10ms		0
> -#define ADP5589_SCAN_CYCLE_20ms		1
> -#define ADP5589_SCAN_CYCLE_30ms		2
> -#define ADP5589_SCAN_CYCLE_40ms		3
> -
> -/* RESET_CFG */
> -#define RESET_PULSE_WIDTH_500us		0
> -#define RESET_PULSE_WIDTH_1ms		1
> -#define RESET_PULSE_WIDTH_2ms		2
> -#define RESET_PULSE_WIDTH_10ms		3
> -
> -#define RESET_TRIG_TIME_0ms		(0 << 2)
> -#define RESET_TRIG_TIME_1000ms		(1 << 2)
> -#define RESET_TRIG_TIME_1500ms		(2 << 2)
> -#define RESET_TRIG_TIME_2000ms		(3 << 2)
> -#define RESET_TRIG_TIME_2500ms		(4 << 2)
> -#define RESET_TRIG_TIME_3000ms		(5 << 2)
> -#define RESET_TRIG_TIME_3500ms		(6 << 2)
> -#define RESET_TRIG_TIME_4000ms		(7 << 2)
> -
> -#define RESET_PASSTHRU_EN		(1 << 5)
> -#define RESET1_POL_HIGH			(1 << 6)
> -#define RESET1_POL_LOW			(0 << 6)
> -#define RESET2_POL_HIGH			(1 << 7)
> -#define RESET2_POL_LOW			(0 << 7)
> -
> -/* ADP5589 Mask Bits:
> - * C C C C C C C C C C C | R R R R R R R R
> - * 1 9 8 7 6 5 4 3 2 1 0 | 7 6 5 4 3 2 1 0
> - * 0
> - * ---------------- BIT ------------------
> - * 1 1 1 1 1 1 1 1 1 0 0 | 0 0 0 0 0 0 0 0
> - * 8 7 6 5 4 3 2 1 0 9 8 | 7 6 5 4 3 2 1 0
> - */
> -
> -#define ADP_ROW(x)	(1 << (x))
> -#define ADP_COL(x)	(1 << (x + 8))
> -#define ADP5589_ROW_MASK		0xFF
> -#define ADP5589_COL_MASK		0xFF
> -#define ADP5589_COL_SHIFT		8
> -#define ADP5589_MAX_ROW_NUM		7
> -#define ADP5589_MAX_COL_NUM		10
> -
> -/* ADP5585 Mask Bits:
> - * C C C C C | R R R R R R
> - * 4 3 2 1 0 | 5 4 3 2 1 0
> - *
> - * ---- BIT -- -----------
> - * 1 0 0 0 0 | 0 0 0 0 0 0
> - * 0 9 8 7 6 | 5 4 3 2 1 0
> - */
> -
> -#define ADP5585_ROW_MASK		0x3F
> -#define ADP5585_COL_MASK		0x1F
> -#define ADP5585_ROW_SHIFT		0
> -#define ADP5585_COL_SHIFT		6
> -#define ADP5585_MAX_ROW_NUM		5
> -#define ADP5585_MAX_COL_NUM		4
> -
> -#define ADP5585_ROW(x)	(1 << ((x) & ADP5585_ROW_MASK))
> -#define ADP5585_COL(x)	(1 << (((x) & ADP5585_COL_MASK) + ADP5585_COL_SHI=
FT))
> -
> -/* Put one of these structures in i2c_board_info platform_data */
> -
> -struct adp5589_kpad_platform_data {
> -	unsigned keypad_en_mask;	/* Keypad (Rows/Columns) enable mask */
> -	const unsigned short *keymap;	/* Pointer to keymap */
> -	unsigned short keymapsize;	/* Keymap size */
> -	bool repeat;			/* Enable key repeat */
> -	bool en_keylock;		/* Enable key lock feature (ADP5589 only)*/
> -	unsigned char unlock_key1;	/* Unlock Key 1 (ADP5589 only) */
> -	unsigned char unlock_key2;	/* Unlock Key 2 (ADP5589 only) */
> -	unsigned char unlock_timer;	/* Time in seconds [0..7] between the two u=
nlock keys
> 0=3Ddisable (ADP5589 only) */
> -	unsigned char scan_cycle_time;	/* Time between consecutive scan cycles =
*/
> -	unsigned char reset_cfg;	/* Reset config */
> -	unsigned short reset1_key_1;	/* Reset Key 1 */
> -	unsigned short reset1_key_2;	/* Reset Key 2 */
> -	unsigned short reset1_key_3;	/* Reset Key 3 */
> -	unsigned short reset2_key_1;	/* Reset Key 1 */
> -	unsigned short reset2_key_2;	/* Reset Key 2 */
> -	unsigned debounce_dis_mask;	/* Disable debounce mask */
> -	unsigned pull_dis_mask;		/* Disable all pull resistors mask */
> -	unsigned pullup_en_100k;	/* Pull-Up 100k Enable Mask */
> -	unsigned pullup_en_300k;	/* Pull-Up 300k Enable Mask */
> -	unsigned pulldown_en_300k;	/* Pull-Down 300k Enable Mask */
> -	const struct adp5589_gpi_map *gpimap;
> -	unsigned short gpimapsize;
> -	const struct adp5589_gpio_platform_data *gpio_data;
> -};
> -
> -struct i2c_client; /* forward declaration */
> -
> -struct adp5589_gpio_platform_data {
> -	int	gpio_start;	/* GPIO Chip base # */
> -};
> -
> -#endif

