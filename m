Return-Path: <linux-input+bounces-12798-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22690AD45D3
	for <lists+linux-input@lfdr.de>; Wed, 11 Jun 2025 00:22:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DECC189C3ED
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 22:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AEDD28AAF8;
	Tue, 10 Jun 2025 22:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S1+h5nnS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9896F289E3A;
	Tue, 10 Jun 2025 22:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749594121; cv=none; b=KfZqOd1lSCf2qkAKMmU5+vHKzQjjekYWrSxhOnqHaLE4rAgaVzLFtF5sgch+jNL4PwsVLytFep6gyIfBsS7/FkTkniD7QIGL2RM8mUxXfGjrt0t82AZdTH1iQmuXp/2TI2ItZaz3mkulX2VX2Z9yw8ZPNEUuX8XSj+FGzvPHCxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749594121; c=relaxed/simple;
	bh=+553V+xoY2utUtdrJC+CzdmLwVcBCLqqGFmM93WOhLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XlmA43bGbzR2ACHVDgmvEPDR3GStlvIY9w9xq4V2Hsfl/84hat4CjmI6T0/bWQRe2/MmtrvyyrtqysNyzJ5NHPo8mvExA5zSEb0Mv8HQDauT6kJChr3xQ0re/s/Pq9O3wTlzXHBKq3dBsEIhbpdxq94Rz4HJzeHQsISW7ca30iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S1+h5nnS; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6084dfb4cd5so266950a12.0;
        Tue, 10 Jun 2025 15:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749594118; x=1750198918; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LsWM7R9N9mCXSlQ8uRE3uxK724s10V+ald6NFxfWTt8=;
        b=S1+h5nnSB6odCG3lHDUXFSvNAImw9PwKZ9wHpZIjPHTRpW2J4yKf8xHovcYxI8JBhs
         EdC4vZ5ld1ReJWUx1GCiB2p+9ARgQ+N3dsXkUvwL9DvnSw7bGfZgqSFfjJ32lVzIuH0T
         oCx1dlrKLaYTn2rARUGRY1vfQLw9gn1NbEZxVefJEpAKhZ7vKoP8BVOoDfP3OhRxxOJe
         vL8kdvfDKeJCS/H1LnwrZREtCSbSBiOfBByP4vRQSKCiMCcM+pvwPMoCikIrkA3fxn0H
         4mTBEsDXhRsRhkSIFPmaYzJo+NVQtEVy2Q9BY4ECYfg0wwOvXYnSrTXKjrtdR7m1p1Gr
         VTXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749594118; x=1750198918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LsWM7R9N9mCXSlQ8uRE3uxK724s10V+ald6NFxfWTt8=;
        b=YNjWZ55f883yG5qxLunRV6qTX2RipiKCTSCx8/FLw536eBQM5NfSaHD9ArjWSOpSLJ
         CkXzcAn5jXIh5vE5f1W+YajA4Tj9sANg4By8l2PVpiWfe8E3rFQtWFQKJ+YozNbetO/2
         vn1unif3e0tj+gkayT6IgPdNAiC/BUmUkVGwr5LPDzf2EHsQlufwOTpbl0UwIVPobreh
         4P2+qTE9kRV2w+Ssg04D/+7qnRsMJjl0QJCco2kGs8/PIBEPid0k4fAlIcnhAR+N671h
         OCrvly/mw5I/zOxzcYH20TiQs5mVp6T2BdrSu/iUw6rjAEpxrzXxDXx8pRTUDlVI3tVn
         u02g==
X-Forwarded-Encrypted: i=1; AJvYcCUvi6WxxHARXK8dWR5hp8zxYI5l6U9vA3gq06C/HihoOGCwGBwQbogOZVtx7QdSriMSThLNaTqDHsGCG9/3@vger.kernel.org, AJvYcCVO/lQbRKoplHPyNOLuW7NlrlY/L7yk6eFoKCwHTATSfwXnlzYnpiiLPATYRhfM62HxhoA8stHEb0I3UA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0aEFQI4h4eCShTA8JNzrikksjdd0Bj3HjttzoaxGM6cm4MOYw
	9V0w/GnObOvI75w8vMacgajfN5ynp/Ux/mnkEvRewqIeFtXkPRCqZvldJAiBMQarqYk3LzLNjV8
	rM+HztociaCRwjCZbUc9SihovOV0TmPc=
X-Gm-Gg: ASbGncvvw6jViq+4/C58TWIjPZ+7IQoaq7SXWEScN34Fzz9rhxPyhGQZqzM+yw6OrhA
	fet98y9KZiHYvrQu4+EjeF83RTTgdE5ayJlxLf5saCHRhIChiamXo3SQxpUhIN5bSShQ4uxdyJb
	FMBNPlDrJnuqQeHiBnzYg+16jv11xRCImJBpCuFwOoSTnIUbNqmK5D3eNTX3hQjH+UDjXgxxbae
	1FM
X-Google-Smtp-Source: AGHT+IG/XyKTAwGibTRqiHQ80CFFUAnjYB6aSemo76CEMJrU/vKOsBRveiisA9z6MjPmp/LTCfWAXZT9yI8NYsxmjmE=
X-Received: by 2002:a17:907:86ab:b0:ad8:91e4:a92b with SMTP id
 a640c23a62f3a-ade89a8063cmr87430266b.30.1749594117601; Tue, 10 Jun 2025
 15:21:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aCrx1iRQ-9tXiyJp@x1.ze-it.at> <p4917005-n9n1-0577-q49n-o9639pos5o44@xreary.bet>
In-Reply-To: <p4917005-n9n1-0577-q49n-o9639pos5o44@xreary.bet>
From: Ping Cheng <pinglinux@gmail.com>
Date: Tue, 10 Jun 2025 15:21:45 -0700
X-Gm-Features: AX0GCFsgA2-aXLRhJmZcRk8weoROzVMe8LB0jEUBribSAZZ-z_7aW3To_hULe9Y
Message-ID: <CAF8JNhKjXH+zD6-b=ym+Y8SPwPEUdUu+r8k25FBefYg+aEi6JQ@mail.gmail.com>
Subject: Re: [PATCH] HID: wacom: fix crash in wacom_aes_battery_handler()
To: Jiri Kosina <jikos@kernel.org>, stable@kernel.org
Cc: Thomas Zeitlhofer <thomas.zeitlhofer+lkml@ze-it.at>, 
	Jason Gerecke <jason.gerecke@wacom.com>, Benjamin Tissoires <bentiss@kernel.org>, 
	Josh Dickens <joshua.dickens@wacom.com>, Tatsunosuke Tobita <tatsunosuke.wacom@gmail.com>, 
	Aaron Skomra <aaron.skomra@wacom.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 12:21=E2=80=AFPM Jiri Kosina <jikos@kernel.org> wro=
te:
>
> On Mon, 19 May 2025, Thomas Zeitlhofer wrote:
>
> > Commit fd2a9b29dc9c ("HID: wacom: Remove AES power_supply after extende=
d
> > inactivity") introduced wacom_aes_battery_handler() which is scheduled
> > as a delayed work (aes_battery_work).
> >
> > In wacom_remove(), aes_battery_work is not canceled. Consequently, if
> > the device is removed while aes_battery_work is still pending, then har=
d
> > crashes or "Oops: general protection fault..." are experienced when
> > wacom_aes_battery_handler() is finally called. E.g., this happens with
> > built-in USB devices after resume from hibernate when aes_battery_work
> > was still pending at the time of hibernation.
> >
> > So, take care to cancel aes_battery_work in wacom_remove().
> >
> > Fixes: fd2a9b29dc9c ("HID: wacom: Remove AES power_supply after extende=
d inactivity")
> > Signed-off-by: Thomas Zeitlhofer <thomas.zeitlhofer+lkml@ze-it.at>

Acked-by: Ping Cheng <ping.cheng@wacom.com>

Thank you, Thomas, for the patch. Your support is greatly appreciated!

> This looks good to me, and I am planning to push it to Linus through
> for-6.16/upstream-fixes.
>
> Jason, Ping, any chance you could give your Ack to this one before I do
> so, please?

The patch looks reasonable to me, too. My Acked-by is added above.

Thank you, both of you!
Ping

>
> Thanks.
>
> > ---
> >  drivers/hid/wacom_sys.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
> > index eaf099b2efdb..e74c1a4c5b61 100644
> > --- a/drivers/hid/wacom_sys.c
> > +++ b/drivers/hid/wacom_sys.c
> > @@ -2901,6 +2901,7 @@ static void wacom_remove(struct hid_device *hdev)
> >       hid_hw_stop(hdev);
> >
> >       cancel_delayed_work_sync(&wacom->init_work);
> > +     cancel_delayed_work_sync(&wacom->aes_battery_work);
> >       cancel_work_sync(&wacom->wireless_work);
> >       cancel_work_sync(&wacom->battery_work);
> >       cancel_work_sync(&wacom->remote_work);
> > --
> > 2.39.5
> >
>
> --
> Jiri Kosina
> SUSE Labs
>
>

