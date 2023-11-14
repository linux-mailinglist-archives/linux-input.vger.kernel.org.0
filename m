Return-Path: <linux-input+bounces-54-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D427EB21E
	for <lists+linux-input@lfdr.de>; Tue, 14 Nov 2023 15:35:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A367A1F248C5
	for <lists+linux-input@lfdr.de>; Tue, 14 Nov 2023 14:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B721D4122C;
	Tue, 14 Nov 2023 14:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LR/i8pVl"
X-Original-To: linux-input@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6443FB13
	for <linux-input@vger.kernel.org>; Tue, 14 Nov 2023 14:35:22 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60D64129
	for <linux-input@vger.kernel.org>; Tue, 14 Nov 2023 06:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699972520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U3F2j0JiuR8XZ8evNWA/bI+vEdCE1IIEmzFEJwB5MjA=;
	b=LR/i8pVlKHTKzkmrP5jnvrCeKAJJafcgZAwgLlLbolBV1nyXSs2ocyumy0/+Nii7YqX5kw
	C76GqTEjNNtrwrk3ll/+xXnVP9Fbu5LtbBzNcYYBZ47w4FFDtYMEgo3/v/ySWiBrO7O8qE
	is8gGi+TkdMD3Ikjk6WK6b4qJ/RDdd4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-312-3if_r8ahMj-kNDmaeat4xg-1; Tue, 14 Nov 2023 09:35:19 -0500
X-MC-Unique: 3if_r8ahMj-kNDmaeat4xg-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5411a36a37fso6601967a12.0
        for <linux-input@vger.kernel.org>; Tue, 14 Nov 2023 06:35:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699972517; x=1700577317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U3F2j0JiuR8XZ8evNWA/bI+vEdCE1IIEmzFEJwB5MjA=;
        b=bf9oAIxJCT3At24ORFyOeBD4ZTttWGii8S8TWwjBr1lrxTW22PUAF3RVGuAqMGoZ6q
         tT6HFIZSofzx/HbKqvQTChToKxoMrPZDj5H5Y3SMGrlfZlkWE5QqcyZc71S0qkFuLPyM
         V7Qc8CovbekrmlC4kzuGMsboGNvxNBMx1dbexBerq8vPW6ToSpOF7B+GJtRdPEp1h7ig
         aw4FCiaCVLaDpNbWWWk2IeUUSB+gvz3v8gGCOhs591kMN4Q9U/QugIiX7as6wviWO08L
         +dQuJUJ5HxxwakV/Dbmnp8b7EPoUBPDUAmrC8m5l1V0VTzGp/UerQvEG+NFzXAdFKVjH
         HS9w==
X-Gm-Message-State: AOJu0YzhZM3kTO5CSpysLQUAJ38sfwsaFnoe+6zDvuIXJF9DrbKdBnUd
	lkXzwzhtmS8Yp6ob+YROUfwhJhs/6H4wl0aLcIY8h0bTr5Q7T1+0/NmzthnRnzoQKibsD/JHCQ6
	csGviApe+phhlbpkGhvAbXi+bCkqQYJPHXSBK4uBD2oGb7enD0Q==
X-Received: by 2002:a05:6402:27cb:b0:53e:1207:5b69 with SMTP id c11-20020a05640227cb00b0053e12075b69mr2664431ede.10.1699972517204;
        Tue, 14 Nov 2023 06:35:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFdSryw7raoU9ySotrmC5FMNKbu0UjsMk7IFkmWmdlR/d/2dPMxtfYsvx9umGin7g5Olj8xHSFqU1l5I2UkuBs=
X-Received: by 2002:a05:6402:27cb:b0:53e:1207:5b69 with SMTP id
 c11-20020a05640227cb00b0053e12075b69mr2664419ede.10.1699972516924; Tue, 14
 Nov 2023 06:35:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <nycvar.YFH.7.76.2311012033290.29220@cbobk.fhfr.pm>
 <ZUtTpKyP0oxWhnn8@fedora> <CAO-hwJLjtjdr2gtrOWJFPZ-38YzKB8XfhDKWf_2jUPeiaP3EcA@mail.gmail.com>
 <CAO-hwJKNcwcDGEh33NZq4kSYtoxZzg9M2nzE_hVDYNFgA4g_dg@mail.gmail.com>
 <_DEF7tHL1p_ExY7GJlJvT5gRA7ZvNnVMJuURb8_WCV-0fbYXkLN2p5zHloi6wiJPNzGEjFAkq2sjbCU633_eNF_cGm0rAbmCOOIOfwe1jWo=@protonmail.com>
 <CAO-hwJ+zm=R7NwrALaLVmfPDtMNXpj0eoQgLkiS1wa6wd+hu+A@mail.gmail.com>
 <CAO-hwJKJW5jGDdaaS8eB7kcLQUvWO_1XkOzJG4HAcaRzw1cGnQ@mail.gmail.com>
 <7wmtNlKuYResf5cFQ7M2QTalzIUtw0I6ohvPcz69Jo1c8flezyIlnJu1IwAgXhJ-u0NlRL3IV7HnL0Kza6fVBqd7X7jhc-Z6QCi3oqHEvpY=@protonmail.com>
 <CAO-hwJJ+nx72_TPfxcWRPBDZdDaPrO5yMNH4Y_mj6ej651Mesw@mail.gmail.com> <nFHw6XePiH5p60JsbQSbssRkiuABiTiR_n5fIYFZjPgkV3ObjjZuwTC84BJ_1vXYVufPbG3UvZ1L7ODSrrGlq9CrI7BTKhsV5QeAQoakV18=@protonmail.com>
In-Reply-To: <nFHw6XePiH5p60JsbQSbssRkiuABiTiR_n5fIYFZjPgkV3ObjjZuwTC84BJ_1vXYVufPbG3UvZ1L7ODSrrGlq9CrI7BTKhsV5QeAQoakV18=@protonmail.com>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Tue, 14 Nov 2023 15:35:04 +0100
Message-ID: <CAO-hwJ+jwmTE-v7FsPi3f70mB8SqUha7Ek9DtptZ0auiFpGM7w@mail.gmail.com>
Subject: Re: Requesting your attention and expertise regarding a Tablet/Kernel issue
To: David Revoy <davidrevoy@protonmail.com>
Cc: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>, 
	Eric GOUYER <folays@gmail.com>, Illia Ostapyshyn <ostapyshyn@sra.uni-hannover.de>, jkosina@suse.cz, 
	jason.gerecke@wacom.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

On Mon, Nov 13, 2023 at 11:08=E2=80=AFPM David Revoy <davidrevoy@protonmail=
.com> wrote:
>
> Hi Benjamin,
>
> > Here is a little bit of history of why you were encountering this bug [=
...]
>
> Many thanks for all the details you wrote about the bug, I found
> your email so interesting that I couldn't resist to copy/paste it
> on my blog[1].

Heh, glad you found it interesting. Too bad it was tough to understand :)

>
> > And that's exactly what happened in your case David. Which is why I'm
> > so happy (also because I fixed the tools from an author I like and
> > already had the books at home :-P):
>
> Please send me an email in private with your adress; I'll be happy to
> send you an original drawing. That will be my way to thank you :-)

Oh, that would be wonderful. Many thanks.
I'll send a separate email.

>
> > Could you please once again attach the hid-recorder of the Pro 24
> > while doing the following sequence:
> > - touch with the tip of the stylus the tablet
> > - while touching, press the upper button (the problematic one)
> > - still while touching, release the button
> > - remove the stylus
>
> Sure, you'll find the action (repeated three times) recorded here [2]

Thanks a lot. However, I realized this morning 2 issues (sorry):
- you made the recording while the HID-BPF program was attached, which
is now obvious that anyone would do that. But the program sometimes
discards events, so I am not sure now if sometimes the device is not
sending the spurious events, or if the filter was acting correctly.
(Note to self, next time, while in the testing phase, do not blindly
discard the events, but remap them to an ignored report)
- that device is really "interesting" in how it behaves with the
eraser mode emulation: when you press the second button while touching
the pen, we get a spurious release of the touch event... And this
leads me to think that I'm not sure about all of the transitions we
can have with buttons :(

TL;DR: there is still work to do for me and for you if you still agree
to send me more traces.

>
> > you could also give a test of the artifacts of job 51469284[3].
> >
> > The points to check are:
> > - if you right click while touching the surface, do you still get only
> > a right click or some weird glitches in addition to it?
> > - if you right click while not touching (hovering), no glitches?
>
> I tested. It's a bit hard to tell if it causes glitches or if the
> behavior is normal or not. I'm not using the right-click this way.
> I always use it in "hover mode". With artifact or without, the
> behavior is while the tip is pressed, the right-click quickly
> 'disapear' but it is probably normal because I test on contextual
> menu and clicking somewhere else makes this type of menu disapear.

AFAICT you used the artifacts from job 51469284. Which is good. But as
I mentioned above, the tablet is sending a spurious event I haven't
anticipated, which results in a left click (well release/click) from
the host point of view. And that very well explains the disappearance
of the right-click menu.

>
> I hope this will help,

It does, but there are glitches that I'd like to fix. I need to iron
out the bpf filter for those use cases. I rewrote the tests today to
take those into account (assuming I understand the HW enough) and I
think they are better now.

But I would also totally understand that you had enough debugging and
you would rather focus on using the tablets, instead of debugging
them. In which case, someone else from the community might help me.

Cheers,
Benjamin


> Cheers,
>
> David
>
> [1] https://www.davidrevoy.com/article1002/how-a-kernel-developer-made-my=
-styluses-work-again
> [2] https://www.peppercarrot.com/extras/mailing-list/hid-records/XPPEN-Ar=
tist-24-Pro/XPPEN-Artist-24-Pro_pen_tip-contact-and-action-press-release-up=
per-stylus-button-x3.txt
>


