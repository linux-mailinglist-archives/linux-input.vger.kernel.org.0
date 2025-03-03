Return-Path: <linux-input+bounces-10498-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4104A4C60B
	for <lists+linux-input@lfdr.de>; Mon,  3 Mar 2025 17:04:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95739171825
	for <lists+linux-input@lfdr.de>; Mon,  3 Mar 2025 16:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63E4021ADB2;
	Mon,  3 Mar 2025 16:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="G6zQRxWr"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AD4218AA5
	for <linux-input@vger.kernel.org>; Mon,  3 Mar 2025 16:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741017758; cv=none; b=Ps8/rnhyKDLurBA7mfgsOaUw0rT5t63oxG3ZHRwp0pMiVgdSKbLwEWDufjFl9UellObU2xSSl+kPd4eaYDMJfPSphf1H9KNVjwHMHkZKrCkkIqizzSrO7yMuuKkUtxqNcDHHKE46kzZc7m4xs6Lr6teAlJCS0UKgUE6/h4RZP4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741017758; c=relaxed/simple;
	bh=f3z1YJDae+7qKzu1a/ULS1y8fv2jKayJhoYaJjgj1Lw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JkfTY7oDQSgFZ7dePIKPnq+TCLpozJd3DtF+NltMv8OAqs10vU6XZlP8Pa0WsfdDs+wuyAuslD8ngAkGeXsxTrPN/+PsQD784CQg/zECWnPp7ZyKftvwfXeRxHOvpjZGP2ZdytfsVmMWhtoYkHmegX6jrfibimD726GNnOoXC9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=G6zQRxWr; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6e895f3365aso36833786d6.0
        for <linux-input@vger.kernel.org>; Mon, 03 Mar 2025 08:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1741017754; x=1741622554; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j0kf09Xt7w2q49Ub1BV7dNTILamWt8grEXO5Ja6in+c=;
        b=G6zQRxWrNMhTkxwZBqgMdPht5fUcUaayMq50TzI7kuwgCrW5voPoi9QHBl+fojC0xP
         ceiDEiw3v/wVl31JD9/6Sv8WYjJOapEJ7uVw3yCj5RaCHkXDHAqVdQOlPqOKZVvk/+3N
         vXjaQPFQ1/tchjgTBvNkxE8IJRVa7a8YLpi2L0HM03nk76aF1bag13c/+f/SjIuzFAx4
         OWHdVWr3mIchCDbvFpU/Q3tiAITjYTlkcvQGkJwJxEyNYufZ5mWUBfjSHEJBFI3xJgur
         6+zP5M9mUR27gfq9BF4ncYUKI4sUVuIkhPKh00Zi5RdDyOUdvQb/kBtoYSBlGpsiREgH
         2WrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741017754; x=1741622554;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j0kf09Xt7w2q49Ub1BV7dNTILamWt8grEXO5Ja6in+c=;
        b=HF1SemD/4jr8fX+5+kLgPKoV/uhepLdBE+4h7gmg00yiemaY1TNw8QTEi6X2kzRIaA
         rCumiZ0Y+z7RyYYIiDEUJ+8zLkiJ1ixy4mgMfWESZ5AkP72gmHMBPubwJJiKQbz2asrC
         EzcgPq4yK1D38n9y9HavG06LMlhU+Iwb1fi7Itx4bXO5LG0/j2lruWq2ZEtsIaDt6qEs
         yLGJwXywTYQemWczbU+8f+VLDnUA4BgyDZG/NPzkSxvnzUfgtyHojxv0Rg4WMAzRsRmU
         BNj8UKLr2wIncw5XrYjspJ5w948a4+w+gf+Z9Z1LtrDLp/D9SeUeNh+ozG7UpJI2yV/L
         TDLg==
X-Forwarded-Encrypted: i=1; AJvYcCWBo/RlwsTnvfspjubnRAJHYiynlAq5JO3hnulsZEN/0V26EHuEe21TqXAqq8RzsyF38c6hte6jK97ERQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxM0t7JS4W8MUod+dMYkmVisz4aEYfK3OfeMNSKjQknQzFTeU4t
	pFSqrdFCbu0WmI+XuC8oMvAPKsQhjpgZxlgixyszogvRhj+X4x7VTPLbZR4uCw==
X-Gm-Gg: ASbGncs/Fhp4+NJHF32SJKluPL/G6DZ3uId6zuOdqeggMZOUdrayueAKl0GiH19Ur5K
	zLn6RWp1AR89br00BX4STPfKvDGyzqeFGL/zpZXUryrY03Y++dQTUiv7Le5mjcRFC9mWt+iI5JB
	jw3SiE5mRBZTyj+51/qCUKFHTjfi6S/sweQLlrXuF+ONhPsj3Fhjkrc45esMK+UPF57RPoGNPcK
	wecw59If+FSGKObW9M+14g4yuPVAWeNu3Drsnz3Qk8Xb2ApU3L3dBmPw3ZUjoLLbgoXpdoXLwE5
	yXVqhAf/yxelY4nfMYm8xToKJtmFAC9Tw8PewLeuXj1I0vo5CY7z+bYVX+Xvx0Y=
X-Google-Smtp-Source: AGHT+IGftmtJ1H46cLxhxWAbdbWJGM0W0W4u3xExTd+O5te0WpEQdDeILfCXfX/nJATaCR1Ljm0czw==
X-Received: by 2002:a05:6214:da8:b0:6e8:96f4:73a with SMTP id 6a1803df08f44-6e8a0d3901dmr235750906d6.19.1741017754321;
        Mon, 03 Mar 2025 08:02:34 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e8976ccba1sm54361766d6.90.2025.03.03.08.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 08:02:33 -0800 (PST)
Date: Mon, 3 Mar 2025 11:02:31 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Strforexc yn <strforexc@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
	linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] UBSAN: Array-Index-Out-of-Bounds in usbhid_parse (HID) on
 6.14.0-rc4
Message-ID: <21b63d7e-5141-426b-af06-9465609e2ca2@rowland.harvard.edu>
References: <CA+HokZreT4LYLbru4cc0iU4jKkdf40YnVunaGX0hFV2GAnnuEg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+HokZreT4LYLbru4cc0iU4jKkdf40YnVunaGX0hFV2GAnnuEg@mail.gmail.com>

On Mon, Mar 03, 2025 at 04:52:33PM +0800, Strforexc yn wrote:
> Dear Maintainers, When using our customized Syzkaller to fuzz the
> latest Linux kernel, the following crash was triggered.
> 
> Kernel commit: v6.14-rc4 (Commits on Feb 24, 2025)
> Kernel Config : https://github.com/Strforexc/LinuxKernelbug/blob/main/.config
> Kernel Log:  https://github.com/Strforexc/LinuxKernelbug/blob/main/array-index-out-of-bounds_usbhid_parse/log0
> Reproduce C: https://github.com/Strforexc/LinuxKernelbug/blob/main/array-index-out-of-bounds_usbhid_parse/repro.cprog
> 
> I’ve encountered a UBSAN-reported array-index-out-of-bounds issue in
> the USB HID driver on Linux 6.14.0-rc4 during device probing, likely
> triggered by a malformed USB descriptor. Here are the details:
> 
> UBSAN detects an out-of-bounds access at
> drivers/hid/usbhid/hid-core.c:1025:18 in usbhid_parse, where index 1
> exceeds the bounds of hid_class_descriptor [1] in struct
> hid_descriptor. This occurs when parsing a HID device descriptor
> during USB probing.
> 
> Location: The fault occurs in a loop: for (n = 0; n < num_descriptors;
> n++) if (hdesc->desc[n].bDescriptorType == HID_DT_REPORT), accessing
> hdesc->desc[n].
> 
> Cause: struct hid_descriptor defines desc as a fixed-size array [1],
> but the loop iterates up to num_descriptors (based on
> hdesc->bNumDescriptors). UBSAN flags n=1 as out-of-bounds, though the
> underlying descriptor buffer may be larger.
> 
> Context: Preceded by a USB descriptor error (-22), suggesting a
> malformed HID device (likely Syzkaller-crafted), triggering the loop
> with bNumDescriptors > 1.
> 
> Impact: No immediate crash, but a code hygiene issue flagged by UBSAN.
> Runtime safety depends on descriptor buffer allocation, but it’s a
> potential source of confusion or future bugs.
> 
> Could HID maintainers investigate? Suggested fixes:
> 1. Use a flexible array member (desc[]) in struct hid_descriptor and
> adjust parsing to rely on runtime buffer size.
> 2. Add stricter validation of hdesc->bNumDescriptors against bLength
> to reject malformed descriptors earlier.
> 
> Our knowledge of the kernel is somewhat limited, and we'd appreciate
> it if you could determine if there is such an issue. If this issue
> doesn't have an impact, please ignore it ☺.
> If you fix this issue, please add the following tag to the commit:
> Reported-by: Zhizhuo Tang <strforexctzzchange@foxmail.com>, Jianzhou
> Zhao <xnxc22xnxc22@qq.com>, Haoran Liu <cherest_san@163.com>

Have you seen this patch or tried to test it?

https://lore.kernel.org/linux-usb/20250131151600.410242-1-n.zhandarovich@fintech.ru/

Alan Stern

