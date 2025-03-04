Return-Path: <linux-input+bounces-10511-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE65A4D192
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 03:21:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 646C318900F5
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 02:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A15D216B3A1;
	Tue,  4 Mar 2025 02:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ke+IvCu5"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE9F73176;
	Tue,  4 Mar 2025 02:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741054876; cv=none; b=lkXoA7Eau+9dbB8f48BIurCtN+PsHihjuEfj3uZj9F62fpxAhA1l/L/l/miimXjycihtE1d+SRgrk4QDvkjWpMrUIPIbgouDhWXB/rWE9zm1do/0KGyyJ8EOQrJngl4xgfGsIYJJGDYPVPe8VWpL0BDnRIxYhsm9Gyt2zwMCmw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741054876; c=relaxed/simple;
	bh=ZuWhpKBfafzlko5VoBm0InxusUnzyK1yc0cVdV0zhb8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dSXQFBOg370ajMmyHVigP/YgBVfhgckhR92H/NPscGDks3re9igfcqQ5jNURDsndGus9zrCCMbUdH8DMPkkzvJWv8q+0ivDPK+P8YmDz3s0mS8/YVlI5zIiL3AdJKI0kjCHmvLRF7HUjfMKnPgo0CVJNXYfOmRRs3DMvZQy5V28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ke+IvCu5; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2b3680e548aso2560392fac.0;
        Mon, 03 Mar 2025 18:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741054874; x=1741659674; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lj8bz5C28v1nVDmbvRaXozKKkHZsSI2p+fWIWhvMT+Y=;
        b=ke+IvCu5aAO4AAjQve4tbvZmN4dv06Fzs9GoynAF9c9VnXUj2kVqJ6Y7Zeyzzz0yMw
         7xGZ3zpQ4yQNAjul+LwdnksFWTLCjDpZVlf3ksj8Xt9FpocBtS1VQSqfUC3bEdazuoHV
         UMVp3CoVFlcNjpxvXU3/VODR0Q4vlSF2RLRMIiU2kQhlq+qRrbR5DRQyFeoPmkD3CJzD
         abiUhqMGjodjvFFsGIbC2BtVrOLaPC2Q3XUW33r3MPSRcotT4KFWgMpQZntwK1BfDU2b
         ISeyLfUDNLOSs6j4sBzMXbD0nqjLqirLoyZ6XD3U8NnvRV5+NLQffYPrTKm/MKggu7Sv
         4T1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741054874; x=1741659674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lj8bz5C28v1nVDmbvRaXozKKkHZsSI2p+fWIWhvMT+Y=;
        b=r4eba9d90d5rGu1VNYDzfErDLOU6FC3S9+x/zlgt8rRbyD0zLyNrtsfCc215FbbAje
         LwRWqbHHLgb/gWIy30qCDFXndU7knPLXb4bpu9ZnEQ/EbUf7idK8MRmUqQ2ePah6AIRS
         z/zVH+oz3/ArapM0JczCvuYrMNcJGKfV5iIbzAmZ2BUXFz9IV/abuaLUQ2xE2RM1WEGt
         0B58QdH14uG5RUiPQ133/DEPNBBrnbfr95KMTWuPP5sPE25vVVejlMKSum+C8//QMYWz
         yXtYq+bFk28RkMSFklsbFVFmUTTurVLZLrW8GAWwxHduiD/WHmJDzrK+yMRqu12BMlZZ
         fDvA==
X-Forwarded-Encrypted: i=1; AJvYcCUQLcfQ2wjWIS6n7D/Qs8SdzWBs1pqTjnq8lcbWrQt0GbwbZDfLMaHiacHrsZr3WCsCW618Kuf3mr828A==@vger.kernel.org, AJvYcCWAlziLXUVztjbjQy85il58zwcuyijerx/iHbu5PDDfsLOjna1/8d5r71hkmM9FuMLQ5f0RL0Q92f52NgP6@vger.kernel.org, AJvYcCWtfAGRJScCcI84Oq6NWJDdiiMIZ7fxWS7kaLCZJofAvOBJ7CLunavQfVN12A4CDyQo9gtKfkAFECDv@vger.kernel.org
X-Gm-Message-State: AOJu0YyuX1H9SgDEOaiHSsNGYOSy/DpyOtXgiaPGXdNE1D9GxyrabvQu
	KecTz+bOZYVX2PWbxawm+aDQj6ivdDHDNOZBCqScKJoTaEbGGlI/Osh0stB/8SFpmMHG54mUgP+
	Esen0Wy2NmvYmvcvztSgKBMTHlK0=
X-Gm-Gg: ASbGncs20kDGx+jaelEbuUrSwG/to+UsoSHVlJqJM8gN8eEn79hPg8kAOGQ+3DFeb7B
	uhu/T0O7nWYlg2cKryzekX4F+eAGtNiNmIqIf+kNDfqhkYpTRfnru60t528BScBFi5ZarHNfxaj
	/Wo9GkVMWXfmjy2z6Y31DM58lLQg==
X-Google-Smtp-Source: AGHT+IFIvMPj92nkRMiKofXvYoLlSSKfT/hdGxlfkBltaDCZGhjXy91tvu8kQE/3iVj4S8wIQBkTU/jMLezAwa9I1Bk=
X-Received: by 2002:a05:6870:3c89:b0:2bd:2ff2:95b0 with SMTP id
 586e51a60fabf-2c1f79fed32mr1067178fac.12.1741054873756; Mon, 03 Mar 2025
 18:21:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+HokZreT4LYLbru4cc0iU4jKkdf40YnVunaGX0hFV2GAnnuEg@mail.gmail.com>
 <21b63d7e-5141-426b-af06-9465609e2ca2@rowland.harvard.edu>
In-Reply-To: <21b63d7e-5141-426b-af06-9465609e2ca2@rowland.harvard.edu>
From: Strforexc yn <strforexc@gmail.com>
Date: Tue, 4 Mar 2025 10:21:03 +0800
X-Gm-Features: AQ5f1JpbqmSXPOmM6RUX3arotmvwI23bylBxXTWohHU7CCpjjUnHe2wqppRpJaw
Message-ID: <CA+HokZrYvNhfGQ7Kf+smO1EzrX2Fvtqm92cEnE0M534kXZKHjA@mail.gmail.com>
Subject: Re: [BUG] UBSAN: Array-Index-Out-of-Bounds in usbhid_parse (HID) on 6.14.0-rc4
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Nikita Zhandarovich <n.zhandarovich@fintech.ru>, linux-usb@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I hadn=E2=80=99t come across this patch earlier=E2=80=94thanks for sharing =
it! After
reviewing it, I can see that it addresses the UBSAN
array-index-out-of-bounds issue

Alan Stern <stern@rowland.harvard.edu> =E4=BA=8E2025=E5=B9=B43=E6=9C=884=E6=
=97=A5=E5=91=A8=E4=BA=8C 00:02=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Mar 03, 2025 at 04:52:33PM +0800, Strforexc yn wrote:
> > Dear Maintainers, When using our customized Syzkaller to fuzz the
> > latest Linux kernel, the following crash was triggered.
> >
> > Kernel commit: v6.14-rc4 (Commits on Feb 24, 2025)
> > Kernel Config : https://github.com/Strforexc/LinuxKernelbug/blob/main/.=
config
> > Kernel Log:  https://github.com/Strforexc/LinuxKernelbug/blob/main/arra=
y-index-out-of-bounds_usbhid_parse/log0
> > Reproduce C: https://github.com/Strforexc/LinuxKernelbug/blob/main/arra=
y-index-out-of-bounds_usbhid_parse/repro.cprog
> >
> > I=E2=80=99ve encountered a UBSAN-reported array-index-out-of-bounds iss=
ue in
> > the USB HID driver on Linux 6.14.0-rc4 during device probing, likely
> > triggered by a malformed USB descriptor. Here are the details:
> >
> > UBSAN detects an out-of-bounds access at
> > drivers/hid/usbhid/hid-core.c:1025:18 in usbhid_parse, where index 1
> > exceeds the bounds of hid_class_descriptor [1] in struct
> > hid_descriptor. This occurs when parsing a HID device descriptor
> > during USB probing.
> >
> > Location: The fault occurs in a loop: for (n =3D 0; n < num_descriptors=
;
> > n++) if (hdesc->desc[n].bDescriptorType =3D=3D HID_DT_REPORT), accessin=
g
> > hdesc->desc[n].
> >
> > Cause: struct hid_descriptor defines desc as a fixed-size array [1],
> > but the loop iterates up to num_descriptors (based on
> > hdesc->bNumDescriptors). UBSAN flags n=3D1 as out-of-bounds, though the
> > underlying descriptor buffer may be larger.
> >
> > Context: Preceded by a USB descriptor error (-22), suggesting a
> > malformed HID device (likely Syzkaller-crafted), triggering the loop
> > with bNumDescriptors > 1.
> >
> > Impact: No immediate crash, but a code hygiene issue flagged by UBSAN.
> > Runtime safety depends on descriptor buffer allocation, but it=E2=80=99=
s a
> > potential source of confusion or future bugs.
> >
> > Could HID maintainers investigate? Suggested fixes:
> > 1. Use a flexible array member (desc[]) in struct hid_descriptor and
> > adjust parsing to rely on runtime buffer size.
> > 2. Add stricter validation of hdesc->bNumDescriptors against bLength
> > to reject malformed descriptors earlier.
> >
> > Our knowledge of the kernel is somewhat limited, and we'd appreciate
> > it if you could determine if there is such an issue. If this issue
> > doesn't have an impact, please ignore it =E2=98=BA.
> > If you fix this issue, please add the following tag to the commit:
> > Reported-by: Zhizhuo Tang <strforexctzzchange@foxmail.com>, Jianzhou
> > Zhao <xnxc22xnxc22@qq.com>, Haoran Liu <cherest_san@163.com>
>
> Have you seen this patch or tried to test it?
>
> https://lore.kernel.org/linux-usb/20250131151600.410242-1-n.zhandarovich@=
fintech.ru/
>
> Alan Stern

