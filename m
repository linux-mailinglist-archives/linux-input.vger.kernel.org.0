Return-Path: <linux-input+bounces-374-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4A9800EBB
	for <lists+linux-input@lfdr.de>; Fri,  1 Dec 2023 16:42:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 288382819E7
	for <lists+linux-input@lfdr.de>; Fri,  1 Dec 2023 15:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D93CF125D7;
	Fri,  1 Dec 2023 15:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JNaWnjBR"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B972219E
	for <linux-input@vger.kernel.org>; Fri,  1 Dec 2023 07:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701445323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wsIEpjlYbbE94w6VuoJGauTiAJ6LkCQfz+kZ/LREei0=;
	b=JNaWnjBRzruqlm+G+7ir/V7ka08C4Lu7DB720P8BrQe93rQK8sWxwNVg33pUuvzTWia4Bh
	OzG3mKokKSgIxw9AnFSu5kpFZTKWEnQqkVreW1hFG+3y+6sFNRiHZu7Tr0QiPRY7d6asgX
	6q4S327rlAn7A7VIFrUucJy3FGbhHRY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-TvONXFy3M5qRzas0KU2Yrw-1; Fri, 01 Dec 2023 10:42:02 -0500
X-MC-Unique: TvONXFy3M5qRzas0KU2Yrw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a04b426b3c0so505831366b.0
        for <linux-input@vger.kernel.org>; Fri, 01 Dec 2023 07:42:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701445321; x=1702050121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wsIEpjlYbbE94w6VuoJGauTiAJ6LkCQfz+kZ/LREei0=;
        b=bDvief8JzB6gIobDpmCpEblA06Sx/GMS/YkjT4AAqvaBTrUBBY6pYAYWF4jHxlKafn
         BWBba6RZWfhELD3AhKkzWrtNx6AN8kQNJS7jpL9ywfxN3SCJEyIAVuAEkDIqxP0xZcdg
         iTKOE6disc/uj+03nUMMc2I/QCLmBNLVgCAfKug5iSJJdr63qx1kxjKbzD+GByOcd9b6
         n2xzHboMxFkCnpHJnRhvNn1cvn3r2CFKi2zz+aKHnB33h8nB+6Uo5/PbaQ+MlF7HQsgz
         oGvXl5stX4Ee3zsMWE6x/J9oSxx6QxUzKzTzxfynUeTDsYUTTu5YmEkVhOscD9D6wVvJ
         VErQ==
X-Gm-Message-State: AOJu0Yypn8KkRIvqjiIZ0+eyx1cuDORMoBHfppF938s4geL8hbXXQ16m
	OWZi8F4+M9JnAAf13m4N20Zuf7FbQ+gmMU1LFDtaZ1E6dYLg1Dtgc7zNRq2CVWuh6Dl94fQYaS9
	+bhOna2f7oKzLcLxPP7KoJwUT2NlqpI+juRwfoG8=
X-Received: by 2002:a17:907:1591:b0:9f2:859f:713e with SMTP id cf17-20020a170907159100b009f2859f713emr1489849ejc.3.1701445321237;
        Fri, 01 Dec 2023 07:42:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIuEu5QiiqKe3sttIDRA1lfIbTqvxkhoWEKiS8eBtm7d8yrE2lIINNREgPDH4mNUBS/lH2J5lUp4pUSMUTsMs=
X-Received: by 2002:a17:907:1591:b0:9f2:859f:713e with SMTP id
 cf17-20020a170907159100b009f2859f713emr1489835ejc.3.1701445320926; Fri, 01
 Dec 2023 07:42:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <nycvar.YFH.7.76.2311012033290.29220@cbobk.fhfr.pm>
 <7wmtNlKuYResf5cFQ7M2QTalzIUtw0I6ohvPcz69Jo1c8flezyIlnJu1IwAgXhJ-u0NlRL3IV7HnL0Kza6fVBqd7X7jhc-Z6QCi3oqHEvpY=@protonmail.com>
 <CAO-hwJJ+nx72_TPfxcWRPBDZdDaPrO5yMNH4Y_mj6ej651Mesw@mail.gmail.com>
 <nFHw6XePiH5p60JsbQSbssRkiuABiTiR_n5fIYFZjPgkV3ObjjZuwTC84BJ_1vXYVufPbG3UvZ1L7ODSrrGlq9CrI7BTKhsV5QeAQoakV18=@protonmail.com>
 <CAO-hwJ+jwmTE-v7FsPi3f70mB8SqUha7Ek9DtptZ0auiFpGM7w@mail.gmail.com>
 <CAO-hwJJoCp0_kxf_HHN9n9EWy9YDSY4rP8ysYNrNg2xTUYtKEQ@mail.gmail.com>
 <evHI05gyKuWwynY1WdyVvXqKPUaPE8W34cc3tFfp9FWh94TWfA9FWfHun7AAscF9lqfbiYsLKGC7kTSZ9xWNZg88-PTpbGTLcFMc9D3P2HE=@protonmail.com>
 <CAO-hwJLinACPsk=mEHrEz_YJroknmm=9PcX8byHiqEDxqOConQ@mail.gmail.com>
 <CAO-hwJKnH=Brhq7Jv020qQLROarvFiewnRb__0ZF9WVqDuqxLQ@mail.gmail.com> <xG1_-ipfam98DC9VwbLcH9Rnvu8MbVw9-fWMLHN4hKquTDdAL-nFDpLcf5ZsMQDD1WBnT39Uqtopi42ZWjrKfdzv8D-iMJZgRNln_W5VE3M=@protonmail.com>
In-Reply-To: <xG1_-ipfam98DC9VwbLcH9Rnvu8MbVw9-fWMLHN4hKquTDdAL-nFDpLcf5ZsMQDD1WBnT39Uqtopi42ZWjrKfdzv8D-iMJZgRNln_W5VE3M=@protonmail.com>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Fri, 1 Dec 2023 16:41:48 +0100
Message-ID: <CAO-hwJ+sj8r36eq9hhQLhPKQ48YV4yzsuz0vPgjmQ5u-9DVNdg@mail.gmail.com>
Subject: Re: Requesting your attention and expertise regarding a Tablet/Kernel issue
To: David Revoy <davidrevoy@protonmail.com>
Cc: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>, 
	Eric GOUYER <folays@gmail.com>, Illia Ostapyshyn <ostapyshyn@sra.uni-hannover.de>, jkosina@suse.cz, 
	jason.gerecke@wacom.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

On Thu, Nov 30, 2023 at 11:25=E2=80=AFPM David Revoy <davidrevoy@protonmail=
.com> wrote:
>
> Hi Benjamin,
>
> > I've updated the HID-BPF filter, and you can find it in the latest pipe=
line[0].
> > I've removed the extra "Stylus" and you should have a better
> > experience with the upper button now.
> > [0] https://gitlab.freedesktop.org/libevdev/udev-hid-bpf/-/jobs/5214827=
4
>
> Thanks for the update!
>
> > I think we are done with the XP-Pen Pro 24. But now I wonder if the
> > Pro 16 (gen2) doesn't also have those glitches.
> > Could you send me the same debug sequence as the last time
> > (transitions from/to touching the surface while holding the upper
> > button) but on the 16 now?
>
> Sure, here is the same action, three time but now on the Pro 16 (Gen2):
> https://www.peppercarrot.com/extras/mailing-list/hid-records/XPPEN-Artist=
-16-Pro-Gen2/2023-11-30_XPPEN-Artist-16-Pro-Gen2_pen_tip-contact-and-press-=
release-upper-stylus-button-while-pressed-x3.txt

Thanks a lot.

And the good news is that we get correct events all the time, so
nothing more to fix here. The current filter is doing a good job
already :)

>
> Have a good end of week,
> David.

Cheers,
Benjamin

>


