Return-Path: <linux-input+bounces-11464-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A3857A77ECF
	for <lists+linux-input@lfdr.de>; Tue,  1 Apr 2025 17:21:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FA563AD141
	for <lists+linux-input@lfdr.de>; Tue,  1 Apr 2025 15:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51C4520AF82;
	Tue,  1 Apr 2025 15:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WSRuq7Zv"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D2F20AF8A;
	Tue,  1 Apr 2025 15:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743520897; cv=none; b=nvkeBFOTqPLeZoWkPVof81rQPUCkGSvBl0DHxQ1pptbxDMbLZmvJhvJtgYO+z8tVl/bG+CCbT86L3/idvGKeC7ld3ETjOrQKUZpYQMx47YfrgH9fyxSPmamyGn5bawDc704JjIUfXi3YkVbN+jY7bZ+kJGhB+YRTxAZTGpGFqMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743520897; c=relaxed/simple;
	bh=sIRQhZzIqzmRIcPFuCpZ9Ja/qcUwmDN9dsr6jwXXmXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KL6K3j+SsdtuIn7KcUmVrOEegWlonZn4L5vkt6dUdWQrvLRCUBFj1zBWf3z2MzxTn2XSSLQ9F4QKVPiEMMI2FwCkA4R9OgMSyUXimL2YSi/0HhSFUFQfchPsR/wSBQ2IolPLPUGiGZ9paNKc+HP2TF5IFyeTS6Cw6B2N94AvdAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WSRuq7Zv; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb1eso1983627a12.0;
        Tue, 01 Apr 2025 08:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743520893; x=1744125693; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9vdWAhVtxc4t45N3JY9/roKwaTMwRmGazfzd4rID6A=;
        b=WSRuq7ZvzoFspN5vnsRxE+iX90Y+iRSAMz7zxPZy2bD1ovfFFIKA4JjYxDTeFQ2DEz
         aSJNjUu2NFmgxerQZ3mhv22341ujVaMw/7S6OGvx4rvYjQnvBtySYrTQcecMtR8BWoce
         69g1j810JBMQNEXajnv2alv/CsqdpXUU8UNiwzQyvId4KQYzaceLU+C2pZF4F0lXz8Ha
         kZ2S+ZyqEojfipYeQFNUYD0ucfQNtpHTIR4sMxvg+0YWnVB3QAtyAOYuMbq6SDyVWgK3
         4S9L3rrcNWiabCUy/5xqlotXEYSlh4u5nGMFDuTXHStuELhzKf3Krwb/HZk0UI3Fj6pD
         bj3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743520893; x=1744125693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o9vdWAhVtxc4t45N3JY9/roKwaTMwRmGazfzd4rID6A=;
        b=GFwop3w38P92ScFVLR/K7+zmIX6mHB6mFI2Qy+zodJaIzJTyXtZxcje7jfdN7L6fFh
         SSFo5yAAmnZh3WD76ZLOSqZgsZifHEZWB/Z1i+WQn3sg1Cd+5ESttnRk8Rhvh5iSyelx
         d8harcRq04g62+0XaKxOKqqiAkukcyw9Jes+WLdysfcANa2j/bPw14U2MQjbHE5A/aYB
         afUqwN9BaHgHQAOvi3LcqY0MN++4E7yWQIB86LruCWgqgCk2a2zMep5Wd3BOWVqp8bmv
         RI9sXA/iNrDWqeVULVHdfl/d+zTZbSRxGQVhh6MOXiCxoLeImDxnO1YcTmyQ7U1idHGB
         WRBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWF55Xz7pMBlZPa7xR4aeiU+SlqwCAL8a4KbG+kxhIrdmTB0zZjmYHkodeRLKHi2+rWm3DM+AyIxz2jeA==@vger.kernel.org, AJvYcCWzpZ+EdXGFzKHNytw4tLy+23wtJBb84IrInKT8SiAkI6AJxRzShV2PL9UN5eIctxRwalZukREEeWGNwrsP@vger.kernel.org
X-Gm-Message-State: AOJu0YwpQXnyGWwIwZutM28CvsLPDRx5RC4S2nJI4krwNMKsOIgNi2WI
	3FJ0qddy+CyNzOAQ14GiUSAWTnba/TN61yCtqS3zPhWYGbACy+aDrlGPIJJiKPEI7S9hj39gQuV
	YK4AsAZ3pefGyGLfhYFungNpkb0t0Vg==
X-Gm-Gg: ASbGncv/aRZi4AGWiZ5QV6mGnjsEB3narT9KIx4rweJHd3RDWBVl5CGop71hy/IaFDy
	veNEdLPp2S1IEL2RK/Z+/mMu1d6YsrdwH/r3MhYwMZa8kGrvLGTB4ijMcHZG6mOulMHvMgUR+cd
	rooGOvXttWaK3E3UpFBL5hpJfErA==
X-Google-Smtp-Source: AGHT+IHcrEZuztN9JJIYLpO9+m9rM1P6Dr7ujZ9CqePg7/71aKf0KdLB/rHVJo7ACRs78VUG5u3nS8AX7QycdC8rRGc=
X-Received: by 2002:a05:6402:3553:b0:5e7:87cd:2479 with SMTP id
 4fb4d7f45d1cf-5f049b60e4dmr341001a12.8.1743520892548; Tue, 01 Apr 2025
 08:21:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250329002042.36967-1-qasdev00@gmail.com>
In-Reply-To: <20250329002042.36967-1-qasdev00@gmail.com>
From: Jason Gerecke <killertofu@gmail.com>
Date: Tue, 1 Apr 2025 08:21:20 -0700
X-Gm-Features: AQ5f1JoG-HTlDbAIW0PJIuLoZtOasIneaMKyvXjAx9YP9p4EPCcMtXMbI3PPbZ8
Message-ID: <CANRwn3RYdgHAc17QPBSNf44uhPp6kEH_GA58zs-Sg1LmE_aW+A@mail.gmail.com>
Subject: Re: [PATCH] HID: wacom: fix memory leak on size mismatch in wacom_wac_queue_flush()
To: Qasim Ijaz <qasdev00@gmail.com>
Cc: ping.cheng@wacom.com, jason.gerecke@wacom.com, jikos@kernel.org, 
	bentiss@kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 28, 2025 at 5:20=E2=80=AFPM Qasim Ijaz <qasdev00@gmail.com> wro=
te:
>
> In wacom_wac_queue_flush() the code allocates zero initialised
> buffer which it uses as a storage buffer for copying data from
> a fifo via kfifo_out(). The kfifo_out() function returns the
> number of elements it has copied. The code checks if the number
> of copied elements does not equal the size of the fifo record,
> if it does not it simply skips the entry and continues to the
> next iteration. However it does not release the storage buffer
> leading to a memory leak.
>
> Fix the memory leak by freeing the buffer on size mismatch.
>
> Fixes: 5e013ad20689 ("HID: wacom: Remove static WACOM_PKGLEN_MAX limit")
> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
> ---
>  drivers/hid/wacom_sys.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
> index 666b7eb0fdfe..3e4f823f8ee8 100644
> --- a/drivers/hid/wacom_sys.c
> +++ b/drivers/hid/wacom_sys.c
> @@ -87,6 +87,7 @@ static void wacom_wac_queue_flush(struct hid_device *hd=
ev,
>                         // to flush seems reasonable enough, however.
>                         hid_warn(hdev, "%s: removed fifo entry with unexp=
ected size\n",
>                                  __func__);
> +                       kfree(buf);
>                         continue;
>                 }
>                 err =3D hid_report_raw_event(hdev, HID_INPUT_REPORT, buf,=
 size, false);
> --
> 2.39.5
>

Patch looks good to me. With or without Markus' comments addressed,

Reviewed-by: Jason Gerecke <jason.gerecke@wacom.com>

Jason (she/they)
---
Now instead of four in the eights place /
you=E2=80=99ve got three, =E2=80=98Cause you added one  /
(That is to say, eight) to the two,     /
But you can=E2=80=99t take seven from three,    /
So you look at the sixty-fours....

