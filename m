Return-Path: <linux-input+bounces-16171-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CF81CC68125
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 08:52:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 99F41358C91
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 07:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD5DE301485;
	Tue, 18 Nov 2025 07:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JdpKiCjO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B962286D7B
	for <linux-input@vger.kernel.org>; Tue, 18 Nov 2025 07:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763451787; cv=none; b=k7HG41VUUtWc2LqXYGbNNRKxaUIqCVkqmN1ecoaVV42r8KARZF/0rIfWHboVgwl9oh5mUQuek8ykOHf5PSfs9fJDYiOQaNcJmhtNTJNLtys85iF2nAC8I/9P0tGwhIWoEIZA8aEIoLG468mvcpYp1vL8fAUSlHWfmgNcTkddVDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763451787; c=relaxed/simple;
	bh=lrFX+d08EUG5B3Aup3jFMbRYuzH7xfJVbFNNpqxBMxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IPpm6xeKCCsOU0dOvuhbdPCFtCUXfgvBbYjqzYZGIbtuiy6IE6yEvfY56SaCXhGh/eiN0MN09p1zxJ2tc8X5C5aQPbnZXxIhO2Qxe6j3BR7xYrfLk+tGCfMon7mPriMVDaVAmsMsh7FnpAZ4nflO+2zUoUBBsMCqITwUKrIgNDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JdpKiCjO; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7ba55660769so3428162b3a.1
        for <linux-input@vger.kernel.org>; Mon, 17 Nov 2025 23:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763451786; x=1764056586; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F/GE5NqjzKsgW3JFC6LcYEU3qsh5SqbdiOp7/No9t4c=;
        b=JdpKiCjOMn0XO1tQ+5lzBk6NVhQToJs3fZgaMgIv1EjbSg+uDjt07G6mjDWurtaKzz
         4Y6oi7m+hR+MGLxEWwyBKQRNBzJJbUCK2ToMvmBxECVc3icx6eX+lujn+zEEpQ+WZcG7
         pc2jAeg/4zq+i1yAt0PGt87jxAnBu5IK/A2LS0FZncolsPhkAQbHWU4rLypYa2zq+Xq7
         wjeHou0Z1UYzrVhddEboos8AnQodqDpxqCEGO4jVCCD1NsXtOBjoVpQrOIZMgqb1w71A
         f2ISubYHJnmN1vT78Gx1JBJMcc5M1COqWhamUNOK4PL01ivb0b4L9aM3XeRqpQxgMeIy
         WoIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763451786; x=1764056586;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F/GE5NqjzKsgW3JFC6LcYEU3qsh5SqbdiOp7/No9t4c=;
        b=jhDdgwv0ECSPweaykhwZky1XoxDObzLZxdDJgeYgoMp9s2TEePABrVN2lB7H97q0aE
         BOt0DLyKj6aYmrAi1qQmtPicqBXUs/Ge1SeIuGFoIbW8S6eFxW95e7lS18It1XdaUJ0X
         BlJVJXhoPsWROtlTcqSIhZqde3Y85kc9jA/FOKY4T9GSMKn4fhNY5sJojxmKMbLQorzG
         YLJWQwn5pdBgIVukF0hXTkZH4qcXdFGD9WmJrRCP/7j/XlKvFsy0yO5iTN6iHxjiiojR
         37rguqibANphnu31roUHAjdmg3Yi2BnE97SshOsAUxUHlN30Y+mz/pKwuqpWNvjT8093
         q+CA==
X-Forwarded-Encrypted: i=1; AJvYcCWshAz6VSjaEklXNStAkI8Vpg1MVTQWoK8Y2JYtyKYlDaKc+GYKap4WxOG60miZpuINcdh02VTVexLnlA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx51ptCNge8GL4BmW8XRoEijvL30gbhfMBCuS90uSAc4nSulZO
	cXUI6VhvOKzfml7nHaD77btoDy0PzTMPSL60RcWe2+0T3s3sXFOlq7SW
X-Gm-Gg: ASbGncsXAXIpRCS28CJEWJx9hmQwSJ/tIy2nkVPSSmjhJoWVn1m3lHPg1VQ8wC34S6m
	9vPw8HgV2/CEPlF0fmr972oX0BvTJIGSy7EjyOugFDAq6r4sOYDkrRHsIMpqstnfm36ItEFjv/p
	zu2IF+sHGu3z4ppOWa0DgbexGSL9e3ADkjwTNomHUoPYf47rhASoNN/kGan+EYRDF5U5a68qqES
	Ukd+/2LthfgMXDDplovUILgtXn8j83CIFfzVXqPMk5T3zP6MxU0ko4noZhPi4RgINz/iJUrogKX
	Q8jiivNdWQJ4dYqQ0i89QSX6lR9aRWSx0/Y+1JGWlXbhaee9KS9uf2ZvvofJmyjqyYETb+hxIyZ
	WFloWQLBs+W+RJRBLeNVsJXRabnkeb20NegxBP9yNGmrDrNFUgp0h/NjbE/dx6PEqk6XfCo8fXW
	rVrf0/hzl6vH9f6/KqcyYVON9OUm0oBQM94nLIlRB0R2ix5ZFSkySx
X-Google-Smtp-Source: AGHT+IHen7a0TGPK2z1j/M3oyhAbEkpHcenUK4MUve+LcCsBvI0qKQ7IUdWvUPGNhjgU/blUEQJhkw==
X-Received: by 2002:a05:7022:6199:b0:11a:51a8:eca with SMTP id a92af1059eb24-11b40fb021amr7977812c88.18.1763451785537;
        Mon, 17 Nov 2025 23:43:05 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:a011:6b85:c55d:d1f5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11bf23d6967sm22399928c88.3.2025.11.17.23.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 23:43:05 -0800 (PST)
Date: Mon, 17 Nov 2025 23:43:02 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: 2724853925@qq.com
Cc: Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] input: touchscreen: Add ilitek touchscreen driver support
Message-ID: <ubrqzvmzwltmdg2wogy4ag7yjzhfvg3f5cygfbcznrt6a5zpw4@cmuhdjcwzezn>
References: <tencent_995E6FC62EDBC1EED14E6052847F270F6406@qq.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_995E6FC62EDBC1EED14E6052847F270F6406@qq.com>

Hi,

On Sun, Nov 16, 2025 at 09:49:24PM +0800, 2724853925@qq.com wrote:
> +/* i2c clock rate for rk3288 */
> +#if ILITEK_PLAT == ILITEK_PLAT_ROCKCHIP && \
> +	KERNEL_VERSION(4, 0, 0) > LINUX_VERSION_CODE
> +#define SCL_RATE(rate)	.scl_rate = (rate),
> +#else
> +#define SCL_RATE(rate)
> +#endif
> +
> +/* netlink */
> +#if KERNEL_VERSION(3, 6, 0) <= LINUX_VERSION_CODE
> +#define NETLINK_KERNEL_CFG_DECLARE(cfg, func)	\
> +	struct netlink_kernel_cfg cfg = {	\
> +		.groups = 0,			\
> +		.input = func,			\
> +	}
> +#if KERNEL_VERSION(3, 7, 0) <= LINUX_VERSION_CODE
> +#define NETLINK_KERNEL_CREATE(unit, cfg_ptr, func)	\
> +	netlink_kernel_create(&init_net, (unit), (cfg_ptr))
> +#else
> +#define NETLINK_KERNEL_CREATE(unit, cfg_ptr, func)	\
> +	netlink_kernel_create(&init_net, (unit), THIS_MODULE, (cfg_ptr))
> +#endif
> +#else
> +#define NETLINK_KERNEL_CFG_DECLARE(cfg, func)
> +#define NETLINK_KERNEL_CREATE(unit, cfg_ptr, func)	\
> +	netlink_kernel_create(&init_net, (unit), 0, (func), NULL, THIS_MODULE)
> +#endif
> +
> +/* input_dev */
> +#if KERNEL_VERSION(3, 7, 0) <= LINUX_VERSION_CODE
> +#define INPUT_MT_INIT_SLOTS(dev, num)	\
> +		input_mt_init_slots((dev), (num), INPUT_MT_DIRECT)
> +#else
> +#define INPUT_MT_INIT_SLOTS(dev, num)	input_mt_init_slots((dev), (num))
> +#endif
> +
> +/* file_operations ioctl */
> +#if KERNEL_VERSION(2, 6, 36) <= LINUX_VERSION_CODE
> +#define FOPS_IOCTL	unlocked_ioctl
> +#define FOPS_IOCTL_FUNC(func, cmd, arg) \
> +		long func(struct file *fp, cmd, arg)
> +#else
> +#define FOPS_IOCTL	ioctl
> +#define FOPS_IOCTL_FUNC(func, cmd, arg) \
> +		s32 func(struct inode *np, struct file *fp,	cmd, arg)
> +
> +#endif
> +
> +#if KERNEL_VERSION(6, 3, 0) > LINUX_VERSION_CODE
> +#define I2C_PROBE_FUNC(func, client_arg)	\
> +	int func(client_arg, const struct i2c_device_id *id)
> +#else
> +#define I2C_PROBE_FUNC(func, client_arg)	int func(client_arg)
> +#endif
> +
> +#if KERNEL_VERSION(6, 1, 0) > LINUX_VERSION_CODE
> +#define REMOVE_FUNC(func, client_arg)	int func(client_arg)
> +#define REMOVE_RETURN(val)		({ __typeof__(val) _val = (val); return _val; })
> +#else
> +#define REMOVE_FUNC(func, client_arg)	void func(client_arg)
> +#define REMOVE_RETURN(val)		(val)
> +#endif
> +
> +#if KERNEL_VERSION(6, 4, 0) > LINUX_VERSION_CODE
> +#define CLASS_CREATE(name)	class_create(THIS_MODULE, (name))
> +#else
> +#define CLASS_CREATE(name)	class_create((name))
> +#endif
> +
> +/* procfs */
> +#if KERNEL_VERSION(5, 6, 0) > LINUX_VERSION_CODE
> +#define PROC_FOPS_T	file_operations
> +#define PROC_READ	read
> +#define PROC_WRITE	write
> +#define PROC_IOCTL		FOPS_IOCTL
> +#define PROC_COMPAT_IOCTL	compat_ioctl
> +#define PROC_OPEN	open
> +#define PROC_RELEASE	release
> +#else
> +#define PROC_FOPS_T	proc_ops
> +#define PROC_READ	proc_read
> +#define PROC_WRITE	proc_write
> +#define PROC_IOCTL		proc_ioctl
> +#define PROC_COMPAT_IOCTL	proc_compat_ioctl
> +#define PROC_OPEN	proc_open
> +#define PROC_RELEASE	proc_release
> +#endif

Please prepare the driver properly for the upstream submission. This
means removing compatibility code for older kernel version, adopting to
the new/latest APIs, etc.

Thanks.

-- 
Dmitry

