Return-Path: <linux-input+bounces-231-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 031CA7F7A40
	for <lists+linux-input@lfdr.de>; Fri, 24 Nov 2023 18:18:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B28C42815A8
	for <lists+linux-input@lfdr.de>; Fri, 24 Nov 2023 17:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46261381BE;
	Fri, 24 Nov 2023 17:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KBumr2go"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79FFB19A8
	for <linux-input@vger.kernel.org>; Fri, 24 Nov 2023 09:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700846327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SHbzOtA4hzteJQDcB8FFU+7O7arSeNmceXHgvsMd7BI=;
	b=KBumr2go4r5EemLzBESrTW7BecCpbtYC3DNpDumnfB7frrq+NuilGOBJCFW5xM+9CmZFeN
	+yvbSDNIXsKSW/wLWwixVMPGgqXAS4ypS/u4+wIFz51pi7yblyE1XeydwrTuTngq636SLB
	ma/lTwqhihyaJ1TKF8rX4uIRfAcTiAU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-n9fWAlgaOya1UNx7RxOvzw-1; Fri, 24 Nov 2023 12:18:45 -0500
X-MC-Unique: n9fWAlgaOya1UNx7RxOvzw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a01e91673ecso146840466b.1
        for <linux-input@vger.kernel.org>; Fri, 24 Nov 2023 09:18:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700846324; x=1701451124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SHbzOtA4hzteJQDcB8FFU+7O7arSeNmceXHgvsMd7BI=;
        b=AgKIoqzcloQOGasypAaNLZ0cgd/hnF52WeqoIhs6pEnLVu55eXHjqn+3ome2gOf908
         idOKvsBUgpVrWrburSFL7wBMF+BUwP/j3MfAr8iWGB0ymwXV9erVvZEhdZVFbeHXITcr
         dZ5FP5R/8Q9E2n42jibdkl9//+xjGzlBzMjrBSYTRXJqaJf2iSh8HCUP4QnFIw29h9ps
         Fhi1ZRB2aK7jbkYkt7h0b8rCTX8sQQiUNzxHpAyG7aoNf6ll/K6cuBTUnlY5WIqUWlYw
         60IN/xc3s9KQcIUT/vGtetJJSwvXwOj0ueB0KwwjiLwQ7SwlUy08ukNO4/cpjzesvanH
         0xAQ==
X-Gm-Message-State: AOJu0YxwazYm/4NvBsNukja16hLZ9+YmjZpaEgNw1LTkCg4nVvWd6d5z
	mB/LmP23s20O2b4EmLqc1QqtR3IwKghJOy9sjdTkzzXKkG0OsQzNSpyTmToOmC3NiJNWbJahquH
	OwcHaT9CA8xWhethqBoI/OrP2O/bO+MVFmZU9re8=
X-Received: by 2002:a17:907:b00a:b0:9fe:5afc:bd3e with SMTP id fu10-20020a170907b00a00b009fe5afcbd3emr2306084ejc.22.1700846324377;
        Fri, 24 Nov 2023 09:18:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0BQ9ZSpmBE+CVwJFWzPye++8Z1ZHU4yOXjYYGEwtuxkE958vjctmeNuZA99dXe4VUxWBl2CoTRLdtdTAS6Lc=
X-Received: by 2002:a17:907:b00a:b0:9fe:5afc:bd3e with SMTP id
 fu10-20020a170907b00a00b009fe5afcbd3emr2306074ejc.22.1700846324107; Fri, 24
 Nov 2023 09:18:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <nycvar.YFH.7.76.2311012033290.29220@cbobk.fhfr.pm>
 <_DEF7tHL1p_ExY7GJlJvT5gRA7ZvNnVMJuURb8_WCV-0fbYXkLN2p5zHloi6wiJPNzGEjFAkq2sjbCU633_eNF_cGm0rAbmCOOIOfwe1jWo=@protonmail.com>
 <CAO-hwJ+zm=R7NwrALaLVmfPDtMNXpj0eoQgLkiS1wa6wd+hu+A@mail.gmail.com>
 <CAO-hwJKJW5jGDdaaS8eB7kcLQUvWO_1XkOzJG4HAcaRzw1cGnQ@mail.gmail.com>
 <7wmtNlKuYResf5cFQ7M2QTalzIUtw0I6ohvPcz69Jo1c8flezyIlnJu1IwAgXhJ-u0NlRL3IV7HnL0Kza6fVBqd7X7jhc-Z6QCi3oqHEvpY=@protonmail.com>
 <CAO-hwJJ+nx72_TPfxcWRPBDZdDaPrO5yMNH4Y_mj6ej651Mesw@mail.gmail.com>
 <nFHw6XePiH5p60JsbQSbssRkiuABiTiR_n5fIYFZjPgkV3ObjjZuwTC84BJ_1vXYVufPbG3UvZ1L7ODSrrGlq9CrI7BTKhsV5QeAQoakV18=@protonmail.com>
 <CAO-hwJ+jwmTE-v7FsPi3f70mB8SqUha7Ek9DtptZ0auiFpGM7w@mail.gmail.com>
 <CAO-hwJJoCp0_kxf_HHN9n9EWy9YDSY4rP8ysYNrNg2xTUYtKEQ@mail.gmail.com> <evHI05gyKuWwynY1WdyVvXqKPUaPE8W34cc3tFfp9FWh94TWfA9FWfHun7AAscF9lqfbiYsLKGC7kTSZ9xWNZg88-PTpbGTLcFMc9D3P2HE=@protonmail.com>
In-Reply-To: <evHI05gyKuWwynY1WdyVvXqKPUaPE8W34cc3tFfp9FWh94TWfA9FWfHun7AAscF9lqfbiYsLKGC7kTSZ9xWNZg88-PTpbGTLcFMc9D3P2HE=@protonmail.com>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Fri, 24 Nov 2023 18:18:31 +0100
Message-ID: <CAO-hwJLinACPsk=mEHrEz_YJroknmm=9PcX8byHiqEDxqOConQ@mail.gmail.com>
Subject: Re: Requesting your attention and expertise regarding a Tablet/Kernel issue
To: David Revoy <davidrevoy@protonmail.com>
Cc: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>, 
	Eric GOUYER <folays@gmail.com>, Illia Ostapyshyn <ostapyshyn@sra.uni-hannover.de>, jkosina@suse.cz, 
	jason.gerecke@wacom.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

On Thu, Nov 23, 2023 at 11:12=E2=80=AFPM David Revoy <davidrevoy@protonmail=
.com> wrote:
>
> Hi Benjamin,
>
> Sorry for late reply.
>
> > So it would be nice if you could try the artifacts of job 51600738[4].
> > Again, download them (udev-hid-bpf_0.1.0-4-g5ab02ec.tar.xz), unpack,
> > sudo ./install --verbose, then unplug/replug the artist Pro 24.
>
> Ok, the main change I experienced after installing is xsetwacom
> listing the ID name of the device with twice the name Stylus on
> "UGTABLET 24 inch PenDisplay Stylus stylus". Before it was only
> "UGTABLET 24 inch PenDisplay stylus".
>
> $ xsetwacom --list
> UGTABLET 24 inch PenDisplay Stylus stylus       id: 10  type: STYLUS
>
> Not a big deal, but I thought it was worth to mention it.

Oh, this might be because I added a debug device. Given that there are
2 devices on the HID node, then one is tagged as Stylus by the kernel.
Nothing to worry about.

>
> > Then, I'll need the following sequence (ideally repeated twice or
> > three times, given that your last record show a slight difference in
> > the first and second attempt):
> >
> > - outside of the proximity of the sensor, press the upper button
> > - approach the stylus to the surface keeping the upper button pressed
> > - touch the surface with the tip while holding the upper button pressed
> > - release the upper button while keeping the tip pressed (like previous=
ly)
> > - press once again the upper button while keeping the tip touching the
> > surface (like previously)
> > - lift of the pen, keeping the upper button pressed, and still in
> > range of the sensor
> > - remove the pen from the proximity of the sensor entirely (move away
> > 20 cm or so), while still keeping the upper button pressed
> >
> > It's actually longer to describe than to execute :)
> >
>
> Thank you for the detailed steps. True, it makes sens once
> practising it. I made the gesture three time on:
>
> https://www.peppercarrot.com/extras/mailing-list/hid-records/XPPEN-Artist=
-24-Pro/2023-11-23_XPPEN-Artist-24-Pro_pen_tip-contact-and-press-release-up=
per-stylus-button-while-pressed-x3.txt

Thanks a lot. And of course this device doesn't react in the way I expected=
 :)

Transitions from/to the tip touching the surface while the second
button is pressed are normal, there are no extra events...

But this also showed that the previous filter was better when pressing
the upper button while touching the tip on the surface, because now we
get another spurious event that was filtered before (and because it
was filtered, I thought it was not there).

Anyway, I couldn't rewrite the filter today, but I'll work on it next
week for sure.

>
> > But I would also totally understand that you had enough debugging and
> > you would rather focus on using the tablets, instead of debugging
> > them. In which case, someone else from the community might help me.
>
> No problem for continue testing, I'm around! Thank you again
> for improving the behavior of the tablets.
>

great!

Cheers,
Benjamin


> Cheers,
> David
>


