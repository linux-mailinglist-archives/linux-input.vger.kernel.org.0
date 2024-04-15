Return-Path: <linux-input+bounces-3016-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A618A4EFE
	for <lists+linux-input@lfdr.de>; Mon, 15 Apr 2024 14:27:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E6551F219A3
	for <lists+linux-input@lfdr.de>; Mon, 15 Apr 2024 12:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B51E6A34F;
	Mon, 15 Apr 2024 12:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4s/Tua9d"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED90679E2
	for <linux-input@vger.kernel.org>; Mon, 15 Apr 2024 12:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713184021; cv=none; b=OU0XZ6JZMOG3QoFiE/vJQAYu5pUvjt0WT7QwLW4FzTE/vVko13vKbjg/8oqG0HVmHGovlhzAvQt7nEIlHDD43H4VgvzCyvBdLdtp7H/MOxlI5X7JQa7dHWeTBckncKjErTWRnG+trCVPDFVcvSKTJT6qXgx03aaq3syUVRUZwQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713184021; c=relaxed/simple;
	bh=H3v2/ReapnsmNml+xCOsOS5et4IKx39hTGT1CULoscU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SURzdFtXFTxE7BK6gKhgSo2VP3qPUKGhRR0Uq00y6Ifg6iakLi+lLJaRdmLFKltZ1iAxtSscH6ERyn4CuSJhPuI7wtkNDDINdepU30Bz5hEQjo+1MZW14GtrvQfBdfS4Iuqka6/YPCKUs3FM6wYn70Ki7AMbIz+wY2AkIOxTUh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4s/Tua9d; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-346406a5fb9so2424779f8f.1
        for <linux-input@vger.kernel.org>; Mon, 15 Apr 2024 05:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713184018; x=1713788818; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H3v2/ReapnsmNml+xCOsOS5et4IKx39hTGT1CULoscU=;
        b=4s/Tua9davglGUd6BIaZ4hRfUhb2Q8emwfPQ7U0CsGdUoWfyzSLV6K3mDmwkVYQHZV
         be9JzTcE02Mr9G4ab3PO7DQ21nZb2voji1LH6VgQIBi0qoVCetbHX5Ysw5X8L1zFn0lg
         sQ+oxnDOv0WLy4QCBELLnx0mFYQ+O3kxfFc8Okla7kBbyiypLWoad/YWmSZai5mKXIaw
         NF0tsgc6D3oEIBau1t2ubx/2ibS4T5nXwm+vQ9BHav1cnF09ouyHLfv+gcpGzmV/iVqn
         3U+kwHNwncxsdj+l/BChNTN0AZRbjPf0qMxccYv/QYUAaiIKSKwhza35MRzcUdwOWufe
         OzVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713184018; x=1713788818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H3v2/ReapnsmNml+xCOsOS5et4IKx39hTGT1CULoscU=;
        b=tml5EwsrtyhmgpGerAAI9Nffiew+DzIzG+qkRGEspdR5JfKjyn8f//kgZkzWu+ZdKq
         eY9PifB4T1DUC5g+iQIQRxKH9/OigDKM9DqDu9JiR/19qpUJwTsxGlC/iv2pbDKG259F
         e6XvvRN+b+vw4/wsNC+gy7NzxdQJM90Ttt/H9AxVIQu+XqhAKxC2I8+eV+6SI6kwaYkO
         9GXCoj//11helZenGVQbimf07CPlEgz8xCwkS3f8lYU/XewF8KGg+8uxcGvgQzL1fURP
         n5SPn6cquFS7IoPH5qa5cBmQkd3OAzh8F4MZaJqqqqC2GIiu+Ylwkslm+cWxIElfb1ii
         pmug==
X-Forwarded-Encrypted: i=1; AJvYcCUUzYf/UL5ysnieBCYGIJ0sIT0uZbfLxrGoAq0HKnxhQWU6RmpbgAnBHqjyMBbq8YBpYJRMmRS6EhF12kv0Gvd0SCv187Qy7iMNmPU=
X-Gm-Message-State: AOJu0Yyrq+/7ywzXVpPZ9ZKy+fEwHj0MfFs73AK/uT4JHBUDBFm0JtLv
	oVWpKyY6uAY2DFhZ+4s64E5Iiu9qsmx+ViP2NMHGY5+kizKW2tsfC3QwlPcq86D4gI41w7LOvIe
	ZlZFth/cwajKLQu5ZFh5qH00PZ+z3oLGdElNv
X-Google-Smtp-Source: AGHT+IFaibIqPDxTO2LJZsoYs8XUoZ+VFKYIrPYzpFUp7F7R7pKmY9+rwP5DiSUnta6xQu5bilhZ3NINkrrh/LeliLo=
X-Received: by 2002:a5d:4d12:0:b0:346:c746:28a4 with SMTP id
 z18-20020a5d4d12000000b00346c74628a4mr6584761wrt.49.1713184018213; Mon, 15
 Apr 2024 05:26:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240405102436.3479210-1-lma@chromium.org> <ZhOccGFkTFkUkRUI@hovoldconsulting.com>
 <CAE5UKNqufWZfKLAXLcpBYKQpJEVt6jPD4Xtr=Nesh34VkNOETg@mail.gmail.com>
 <ZhVix-HJrqQbiPrB@hovoldconsulting.com> <CAE5UKNp3uS9cqDbQjcP3SbfxVi3wPFG4LtP6z=WU_V+M9x6LtQ@mail.gmail.com>
 <ZhzuoWgA88CeenMC@hovoldconsulting.com>
In-Reply-To: <ZhzuoWgA88CeenMC@hovoldconsulting.com>
From: Radoslaw Biernacki <biernacki@google.com>
Date: Mon, 15 Apr 2024 14:26:42 +0200
Message-ID: <CAM4=RnLQRPmYDt_c+dpsia4WFZVA1vukXa35a0Uupu7jMZxtVQ@mail.gmail.com>
Subject: Re: [PATCH v2] HID: i2c-hid: wait for i2c touchpad deep-sleep to
 power-up transition
To: Johan Hovold <johan@kernel.org>
Cc: =?UTF-8?Q?=C5=81ukasz_Majczak?= <lma@chromium.org>, 
	Jiri Kosina <jikos@kernel.org>, Dmitry Torokhov <dtor@chromium.org>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, Douglas Anderson <dianders@chromium.org>, 
	Hans de Goede <hdegoede@redhat.com>, Maxime Ripard <mripard@kernel.org>, 
	Kai-Heng Feng <kai.heng.feng@canonical.com>, Johan Hovold <johan+linaro@kernel.org>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Radoslaw Biernacki <rad@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Johan,

On Mon, Apr 15, 2024 at 11:08=E2=80=AFAM Johan Hovold <johan@kernel.org> wr=
ote:
>
> On Thu, Apr 11, 2024 at 04:23:27PM +0200, =C5=81ukasz Majczak wrote:
> > > Sure, but what about other transactions that are initiated by the hos=
t
> > > (e.g. SET_POWER)?
> > >
> > Somehow it is problematic only on reboot and works just fine on
> > suspend/resume and
> > set_power.
> > I will dig more and try to find out what the difference is.
>
> Sounds like it may be related to the i2c_hid_set_power() on shutdown()
> then as Kai-Heng pointed out.
>
> That function already handles a similar retry for I2C_HID_PWR_ON during
> resume.
>
> > > Perhaps this hack at probe is enough for your use case, but is an
> > > incomplete hack and at a minimum you'd need to add a comment explaini=
ng
> > > why it is there.
> > >
> > You mean a comment in the code ?
>
> Yes, if this turns out to be needed then there should be a comment
> explaining why it is there (and currently also as the delays you used
> seem specific for your particular platform).
>
> But hopefully you can find a generic solution to this.

Yes, we might need a more generic solution though it is not yet clear
for us which would be the cleanest one.
As I wrote in the reply to Kenny, the design back in the day was made
to use events rather than
level driven IO line, to drive the power state of the device.
Consequence is we need to request
a low power state before the kernel goes down as there is no guarantee
the kernel will wake up soon
(prevent battery power leak). This event/level logic problem (event
design for level type problem).

Let us get back to you with more info as we look deeper into some
newly found power sequence limitations
of the second I2C node on this device.

>
> Johan

