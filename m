Return-Path: <linux-input+bounces-15835-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D4526C25BF8
	for <lists+linux-input@lfdr.de>; Fri, 31 Oct 2025 16:06:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 295E21B27423
	for <lists+linux-input@lfdr.de>; Fri, 31 Oct 2025 14:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03D5F192D8A;
	Fri, 31 Oct 2025 14:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uiUw6zJg"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25992191F92
	for <linux-input@vger.kernel.org>; Fri, 31 Oct 2025 14:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761922056; cv=none; b=D7Yh56DYPQYT+Xae4oDEBqRG4pn/0LRWtaCM+QE9wDO0FCNCJ7neWlt+nU6lGyzfmpaRs9hHfjV2bUBVjjAQa3WAyQlsy0qKwUmmNMbDzrKTmiPAZrKvCJAe3OTB1mbStiWKk2F1Fh5tlWVOvbIiBKixabLBwiqgPyWT8TI7DsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761922056; c=relaxed/simple;
	bh=keTDo4wd+uLXRZtLBDUeDszWDg5XfY4XiYj6Ff5ymUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K74xEz0WW0Zkn7SezCAOzyqqGZP5tE+3Qij8TPy775Q6tu7lauxCzx0cQERxLBmKIjmzYrN/h7cF3FYA3wjk0IzlSeVMAVkycsDFodoYHS6pQpyft48pt3lyDw/C6UHmzVmyfgWTs+DpGiYcKTVfkAAVkvlyazWjitl+Qs6jXLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uiUw6zJg; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-63c44ea68f6so11564a12.0
        for <linux-input@vger.kernel.org>; Fri, 31 Oct 2025 07:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761922053; x=1762526853; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=keTDo4wd+uLXRZtLBDUeDszWDg5XfY4XiYj6Ff5ymUA=;
        b=uiUw6zJgfElvtRVxUSmhcQBl3mtW4zVX7b2Op5S0RawmVrODx8GXZszcpvukVtgOUk
         O5ObdIDxgPyMcdNGBCUR10IHOwYHo32TH7zmn1X+u9jqgJ+mkvW8CuCKh9GSVaC9mQHN
         Wx0qO4gcBkfZRMkKZ+0gsXa5KUc97O5Z3LdtzvmFe3g20NlzCvy9RmuMmws0g5YFvWVF
         tr5kcfC3CafKuQZKATX3kciOOnywHYq7jtTDydCCuPLm+d8x9UYLps2Kr1ozwu3i2rDZ
         Om+W14T7yI+9ZpyLXzmSn3vx1JFJU10pmOg/w5EEXE/M63LbH6fpwrccplDd9Av9+OJo
         mt+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761922053; x=1762526853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=keTDo4wd+uLXRZtLBDUeDszWDg5XfY4XiYj6Ff5ymUA=;
        b=MUwG1ASH+fKGMfHlIsqlElpI00P8iq1OFfebkkgNZlasVCrL1ub7p7kqkaf44VSk/w
         9p1zQ49g2SmrHMoDFwaUfRp1uj4CoEx5PvHGUy1+DJvFSt16rUlujsWabDu4WvvswM/y
         Phg8WrR+dfpPWWcau2j9BTzpKjwKREScKbVH9Ge20a/RGREKm8pdB4nWABivVBem+Xz8
         5JeyLhqGVU+FVCCr4bd0K7vGquMm3Z4oIBHuRYplIGyj6+Kl21KAN7NwaAYqS9m4qR1k
         bG8YMpWmnvuQPGvLhg8LGrh1HGyteltTaisvatxjw6TQmbTGmhbYCNymZymAjjtXlPin
         AH8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVkkmD3BATVI9WMN4CG/75Bl574tUPk18eS71B16XWJPWCPNUVhxZcIY9X8ZRtxzrqBfU06kIGm3Ss5Nw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuaaqwRS1bHyS6EcYetQwbk6AMPHuElU6o5QHTROE8do1YwMlO
	D7wFIukg2m3eIExDmtmJRov//8pV8dCR5nvWLe4VYFXtLbEEfHOOadNB4APHb4U57/UhWtGcWLV
	ykUycvbMgXip3iDxsOnosi/LCgVSZGIpLCD7Xd12t
X-Gm-Gg: ASbGnct/I0kGrtxEAykFAXA33VJ4vmLnd/TtY15OFQY24NKVEAaUkCIp9IdXSXB0To3
	Hu4Ey6W9AzsVn0P6/wM8FYIl9cW0xQmf7w5a8xdooLF0CdG/9/mDsHkcAZx75nz+S/ZbuNWH9x2
	HP5d/mIJPiPZKT8c5+UdZAbtT0m+0rs6UBtI66jkfetUnIPKeRFfATxEL9/lMelWQhqyE9bYfoK
	/ORpQIBahjfCwfS7aM5LBDIKjVIRdKRUC04uy8vp+AFzAokgvg38Dh0ndzihGAkmdfqYV/jS9Zv
	v7TKemuFcwOXkbtgYA==
X-Google-Smtp-Source: AGHT+IERFvy90M7zxahE21txS8vs4Zs9t1PXMUeP7hYYZsfECtrYRnnAgJ9T+vAcxfTVPabKG9WE6J27TuWha4094VI=
X-Received: by 2002:a05:6402:564a:b0:640:8f9c:af3a with SMTP id
 4fb4d7f45d1cf-6408f9cc0e9mr5999a12.6.1761922053142; Fri, 31 Oct 2025 07:47:33
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251030160643.3775606-1-superm1@kernel.org> <s0qn1098-s856-1942-48q7-n3691sn109qs@xreary.bet>
 <17f02b01-c71e-4e2e-9e91-757731f3fc2e@kernel.org>
In-Reply-To: <17f02b01-c71e-4e2e-9e91-757731f3fc2e@kernel.org>
From: Dmitry Torokhov <dtor@google.com>
Date: Fri, 31 Oct 2025 07:47:15 -0700
X-Gm-Features: AWmQ_blj9DlgwLtyiHRBeXRDTVHk9MSbpZ7oivnrmPGrEjmn_nFYhaXj_VHoYdg
Message-ID: <CAE_wzQ_YvCh8a83mm3QG7LwMWo2CKEAMvRS7+CpJcq1r7MEBZA@mail.gmail.com>
Subject: Re: [PATCH] HID: hid-input: Extend Elan ignore battery quirk to USB
To: Hans de Goede <hansg@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, "Mario Limonciello (AMD)" <superm1@kernel.org>, mario.limonciello@amd.com, 
	bentiss@kernel.org, =?UTF-8?Q?Andr=C3=A9_Barata?= <andretiagob@protonmail.com>, 
	linux-input@vger.kernel.org, Kenneth Albanowski <kenalba@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Fri, Oct 31, 2025 at 2:13=E2=80=AFAM Hans de Goede <hansg@kernel.org> wr=
ote:
>
> Hi Jiri,
>
> On 31-Oct-25 10:07 AM, Jiri Kosina wrote:
> > On Thu, 30 Oct 2025, Mario Limonciello (AMD) wrote:
> >
> >> USB Elan devices have the same problem as the I2C ones with a fake
> >> battery device showing up.
> >>
> >> Reviewed-by: Hans de Goede <hansg@kernel.org>
> >> Reported-by: Andr=C3=A9 Barata <andretiagob@protonmail.com>
> >> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D220722
> >> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> >
> > Now applied.
> >
> > We'll have to come up with something more sophisticated once/if Elan ev=
er
> > starts producing devices with real battery ...
>
> Actually the provided HID battery is intended to be for
> when a stylus is used and to report the stylus battery
> values then.
>
> There is an email thread somewhere with some of the ChromeOS folks
> talking about dropping the ELAN quirk for I2C touchscreens and
> indeed replacing it with something more sophisticated. IIRC
> the ChromeOS folks mentioned they would work on / provide patches.
>
> +To: Dmitry, Dmitry do you have any input on the ChromeOs issue ?

+Kenneth Albanowski has been wrangling with support of Elan and other
vendor styli, I'll let him comment.

>
> In the mean time I do believe these quirks are the lesser of
> 2 evils. Most people don't have a stylus (which is typically not
> bundled with these devices) and even if people have a stylus
> not having battery reporting for that is less of a problem then
> the false positive low-battery *notifications* which e.g. GNOME
> shows due to the battery reporting 0% (rather then not present)
> when there is no stylus.

Thanks,
Dmitry

