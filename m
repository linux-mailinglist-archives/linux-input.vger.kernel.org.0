Return-Path: <linux-input+bounces-8108-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6999A9CD53D
	for <lists+linux-input@lfdr.de>; Fri, 15 Nov 2024 03:00:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DFF52838F7
	for <lists+linux-input@lfdr.de>; Fri, 15 Nov 2024 02:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E4A131E2D;
	Fri, 15 Nov 2024 02:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GPgXLXJ/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C8D126BFF
	for <linux-input@vger.kernel.org>; Fri, 15 Nov 2024 02:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731636041; cv=none; b=N/pYJWOY4PYV9J7WsSSEaiUpWZWUmJv1ab6fZh29CF80/jK+VVjyugtxSVzBM6yEFJtSJ9qmAddUF4TdHJSD/7oIY0hNB2EEqQ9bigxhCD/ynBTe1ly3VeM9tGqFxy3e+GJe6K9Z/7Maj9DWVgQFbWKUVNV+5Mr7IjcD7V4I72E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731636041; c=relaxed/simple;
	bh=8XqDm3r3xqEX+2m/eJ9I4L27+CMs/ozp+uc2MFTBTzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sFp8iu3WwHq+Ma5Dg9yV03fVJvVDz8SRkEiNXxv0pMwlXxUkgJq1MlwF7TD3AyvFRxlUrJ4fa8i1yBBN1IllUjo6KlivxywWJRXI8Kquk5GBhvZsTaOO+pExgDQAObXIHdnlgfL6AR8v8DG5p8QjLBG4TY81qpGm1k86QjkkgWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GPgXLXJ/; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2e2e6a1042dso1066434a91.2
        for <linux-input@vger.kernel.org>; Thu, 14 Nov 2024 18:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731636039; x=1732240839; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o1bbWBO4Tjg77vVhYKNItbdgqWT3HOEVN5Vj1lxh53U=;
        b=GPgXLXJ/C9GCy1AS6yYk4XWJwXpp1BcqOqtuhH8tFXecQRHcokILBgCO5mMN7jA8IO
         1tzvyBQBMZURivIGcT1uArRNpK0NoTzlB/oYWzE44yrJ2HWBesuBr1rqu93XNNH9o++n
         1zsf+WTLi28w8Jmen88ygdC0zdpLKLyfL08i5TG/mpMA727k/SIWW4bf5m+VwysDKNhY
         co9tTrc9I2LzXwm0WJy3aU8OEpZ/KOwOFiMjTLRuGgsONJvrr4ABSbjNWCeJbNyku9Nc
         P6HrihJr9f508C8GCJbVQSH2jWNhT35/CwuRqhVG2pDa0FiDNR+pxCAkTbISGGK2rXNZ
         iE/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731636039; x=1732240839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o1bbWBO4Tjg77vVhYKNItbdgqWT3HOEVN5Vj1lxh53U=;
        b=fLcEL6/tian4iGhbswekfSDiqygClglUOAweWizclMoOwJpVolakT7yyb9xLWoGgkW
         /GgaKXjPQWeOYzWUie1Ed+DD2XQKBLcNg287nTIbswhF1MnZZNL5yqAWCrvPRX/jrXVq
         sRf/mYy0OYwbxbgfy1rnIP8bYGd2PyBy3HNdkjvhqdcq+cULhiRza6773fBSsR228EX1
         yAK4vkbYj5BIXDg0euiiIeTNT9Bjx3aM0mfUt7vXK5vBus9yrlvik0jT32GIZdB0BD/f
         jHmlvosD7SGmbGnY1ybGbpXp6piqqipzQsho73RgCteYMcwEbTUvC+79lZBQuCMNp9lT
         HCCg==
X-Gm-Message-State: AOJu0YwH6XcMkXXt4gJSmZOKGVuxTB50tEmmZPwDK41XY1WQ3ZfQdjUz
	kZLf/qZZ7XcNblQz8RyEdGgm5tqbJcb3VOnIbuiJgtd9Esyem1U4rvdszXmh
X-Google-Smtp-Source: AGHT+IHMzsxVDjNeudWCCpWtPPGx6TgbwEbLx5C3vtlBBK/n8mbbtfqarZfutwtWZ9/bP9F71YTzvA==
X-Received: by 2002:a17:90b:3a81:b0:2e2:d33b:cc with SMTP id 98e67ed59e1d1-2ea154fc4b0mr1199665a91.21.1731636039012;
        Thu, 14 Nov 2024 18:00:39 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:82bb:de58:4fde:fc46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0dc32a1sm2910845ad.37.2024.11.14.18.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 18:00:38 -0800 (PST)
Date: Thu, 14 Nov 2024 18:00:35 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: luyuantao01 <luyuantao01@163.com>
Cc: linux-input@vger.kernel.org, luyuantao <luyuantao@kylinos.cn>
Subject: Re: [PATCH v2] Input: i8042 - Fix keyboard failure caused by S3
 mouse wakeup
Message-ID: <ZzarQ8uhbqU0Vk1q@google.com>
References: <20241109094842.1436-1-luyuantao01@163.com>
 <20241114021310.9-1-luyuantao01@163.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114021310.9-1-luyuantao01@163.com>

Hi luyuantao,

On Thu, Nov 14, 2024 at 10:13:10AM +0800, luyuantao01 wrote:
> From: luyuantao <luyuantao@kylinos.cn>
> 
> Hi Dmitry 
> I'm sorry for the inconvenience caused to you. After reproducing the 
> problem and conducting a thorough analysis, I found that the previous 
> patch description was incorrect. Therefore, resubmit the patch
> 
> There is an i8402 keyboard and mouse device on the
> ThinkPad P15 laptop.When conducting a wakeup
> test on S3, it was found that:
> 
> 1. Using the keyboard directly can wake up S3.
> 2. The system failed to wake up using the mouse button first,
> and when using the keyboard to wake up again, the system
> cannot be woken up and can only be shut down by pressing
> the power button.
> 
> This issue is that i8042_start() only enables wakeup for the
> keyboard. During the i8042_pm_suspend() phase, the aux device
> will not enable irq wakeup. However, when suspend_device_irqs()
> traversing irq without wakeup capability, __disable_irq() did
> not truly disable aux interrupts, only setting the IRQS_SUSPEND
> flag, resulting in aux interrupts still being generated.
> 
> When an interrupt is triggered, irqd_irq_isabled returns the
> true execution mask irq. The mask_iopic_irq callback function
> of the IR-IO-APIC chip will disable all IRQ pins, resulting
> in keyboard interrupts being disabled and no longer responding

So this sounds like a bug in the irqchip implementation that is does not
properly handle interrupts that are wakeup capable but not enabled for
the interrupt because of policy.

The i8042 driver correctly marks both KBD and AUX interrupts as capable
of waking up the system but only enables KBD as a wakeup source for
suspend-to-idle case. If a different policy is desired on a system it
can be adjusted form userspace vis sysfs.

Thanks.

-- 
Dmitry

