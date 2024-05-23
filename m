Return-Path: <linux-input+bounces-3799-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DB18CD8B1
	for <lists+linux-input@lfdr.de>; Thu, 23 May 2024 18:52:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8B38281D14
	for <lists+linux-input@lfdr.de>; Thu, 23 May 2024 16:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B14A517BD9;
	Thu, 23 May 2024 16:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nFO6oHP3"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF40711711
	for <linux-input@vger.kernel.org>; Thu, 23 May 2024 16:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716483119; cv=none; b=QyRqh607BcWd87IfrZn+jLZxaucsUQfs3D8ih0gTB/8PNzv5SLZjw6JlF9i5FKzmorrQh1x4o1yvPf8e9Cx+cT+DXmrDohDFhh4rcNLy5cZQehSQGAW4ADo0cJ+tTSopNbarKUrzSIKiWKekYRVhpcInzdhBoaKbqDEDyvkwHcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716483119; c=relaxed/simple;
	bh=x2qMHxa57NKmIjz+gPfyxDQsDHnKfcTReImkVtzixQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G0pRP0YN5V6WtZxAliX4xtdKfyK9jy+utJwUoD93JlTJflChyBDKWX7hxY9R6K4TL3hBh6KiOcxrdI63xnLJQ3QkSRRAijUjspj6y2D0JExvr7HF/VQjl5XE5kRGeWeQVO2HtaHCvq/EJuKbT5PxOouXU+LQtZl3PblmQrd/m/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nFO6oHP3; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-572c65cea55so4266452a12.0
        for <linux-input@vger.kernel.org>; Thu, 23 May 2024 09:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716483116; x=1717087916; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OzXHO4a2EdRWKR87HNNrhmvvMy7F5ZVbql5FwERDTAs=;
        b=nFO6oHP3NMBjMB6ETA4MrGp0CVIcjSd6/kUV4lMZJ6qw++EHf4gXKjzfZ8qwiReeY+
         qrEp098Eve9hYhU+o5GMnBsPmk1objqSd/+qj856OoA03PXyk91XNmLJZg5wOppQm1xm
         sjNrtIs+lmOlteABSEZVJh+MCus48hFZPr+uAp04N11M8+8khqLGzM/hYPslbbQaI/9m
         l6TpJCyRnZbGJBGGhJX78W/7h7/2W9LlIzRGpckG8SzTsISo50BnGnJ5is/OwhloyxDw
         4NjJVQTFk41FlcJmSOeUHqDqFKAUiq7sa78zivnREs8hpZ9N6x9JCauSXdjm59THpd4V
         T5+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716483116; x=1717087916;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OzXHO4a2EdRWKR87HNNrhmvvMy7F5ZVbql5FwERDTAs=;
        b=uq+h8cGAe6jgDUem95mPSh4xBcvXwbzaH0qE1khE/nBz7svTRYFl9yQGM8+G9U5fHK
         rQRUvD2ZfhJbm2hqIKunHetrEE96KLohaMEbKC4RYcYUZr6x3td7uJtl3U3vdkpjrWCK
         8h0kebmOIxdqY/Yy4sRfyeOKOciuGUVHUrhK1mEc18lNy00RwPuRQsiNPUnVQqHBNA7f
         0nC3l7qwahJokcOXG9ntgDhOA0xeZRAlJjm4yBfo375aWcZYk1/Sbo0Age82axUkihiw
         3JJMgokya+aPW7J5jjMsoUEJ9wKsOU1EfqaOe7W7Q+eTmm12xFiUJVxy39fz3ZpBVI3U
         GFpg==
X-Forwarded-Encrypted: i=1; AJvYcCXd9378CCVGUwUOWKWBjpxVlbZ4HX92uOJRO9lk3pZpAGNJAE1/8EqXKgsF2VsIq9fbsma/6DL6CI87jp1pG+VDiJQYWV+cQtQ21Vg=
X-Gm-Message-State: AOJu0YxkH2oMCrcqIUGOZBANtRs/k5K2MjYUC3oKsdzmxLqLaW7nuL8C
	xgQN7U2QWnu7YQ2GPIVsemQvXUNw63W6ChxMZYFAx8bdnSBt1YoJL0AZQ3aJoso4q2g9b8/QGar
	boZ3ZFeqs0cx9+zr+1gX4OiQnr5M=
X-Google-Smtp-Source: AGHT+IHVFsi35ti7D/pom4ySg0TZ+LZ12hU9x8aaFZXI+hOQ0FMyxkeWtQJUu2lQAdknDoIO3TxmJPVYu77GfQ23jMw=
X-Received: by 2002:a50:d510:0:b0:578:4fbe:786b with SMTP id
 4fb4d7f45d1cf-5784fbe79dcmr221175a12.8.1716483115512; Thu, 23 May 2024
 09:51:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240510234332.139038-1-Joshua@Joshua-Dickens.com>
 <CAF8JNhKKCCwRzUxookmv9VUecT37fR8psoz7uSVBQqDhnYEBgQ@mail.gmail.com>
 <Zkvcs0yg1ltamZPY@google.com> <CAF8JNhKqAOvxo3C1SaecaVP0uj4QeYpttybBgq_Jw7n18MLpcA@mail.gmail.com>
 <Zk4qE1ij-0lnxjCT@google.com>
In-Reply-To: <Zk4qE1ij-0lnxjCT@google.com>
From: Jason Gerecke <killertofu@gmail.com>
Date: Thu, 23 May 2024 09:51:42 -0700
Message-ID: <CANRwn3SuTjdCCK4YH1ObvsC_gZuythAQ7kSHJP-CiAFw9h5Qcw@mail.gmail.com>
Subject: Re: [PATCH] Input: wacom_w8001: Check for string overflow from
 strscpy calls
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Ping Cheng <pinglinux@gmail.com>, linux-input@vger.kernel.org, 
	Aaron Armstrong Skomra <skomra@gmail.com>, Joshua Dickens <joshua.dickens@wacom.com>, 
	Joshua Dickens <Joshua@joshua-dickens.com>
Content-Type: multipart/mixed; boundary="0000000000005d32d3061921def5"

--0000000000005d32d3061921def5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2024 at 10:23=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Mon, May 20, 2024 at 08:55:30PM -0700, Ping Cheng wrote:
> > On Mon, May 20, 2024 at 4:28=E2=80=AFPM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> >
> > Hi Dmitry,
> >
> > > > This fix is the same as [1]. Without checking the return value,
> > > > Wolfram's patch [2] fails our downstream build script. I'm adding m=
y
> > > > r-b, if it makes any difference ;).
> > >
> > > Could you please tell me how exactly it makes your build script to fa=
il?
> >
> > We got an "unused-result warning". Jason made a temporary workaround
> > at https://github.com/linuxwacom/input-wacom/commit/e83a9bb3e48d2d1b52e=
c709e60f73b9960d568e5.
>
> I do not think strscpy is declared as __must_check. Do you have a repro
> for the vanilla kernel build?
>

There is no build error with the upstream code. The build error occurs
when compiling an updated version of wacom_w8001.c on older (pre-4.16)
kernels. These older kernels did declare strscpy as __must_check.

We maintain backports of the upstream sources for users who are stuck
running old kernels. To ease the maintenance burden, we desire to keep
the upstream/downstream diff as small as possible. We understand that
not every upstream change is compatible with older kernels and will
introduce changes where necessary. In this particular situation we
believed that addressing the warning upstream made more sense than
maintaining a diff. It isn't wrong for upstream to verify return
values are sane, even if we admittedly do expect it to be a bit
unnecessary here.

> >
> > > My concern is that the warnings are not actionable and therefore pret=
ty
> > > much worthless.
> >

IMO, the vast majority of the worth of this patch is a minimized
upstream / downstream diff -- not the warning itself. I know that this
means that such a patch is "not your problem", but it doesn't mean
that it is "nobody's" problem. If you don't like the idea of
introducing non-actionable warnings, would you be open to a small
cleanup patch instead (see attached as an example)? There's no
particularly good reason to split string generation across calls to
strscpy and strlcat when a single call to snprintf would do, and
snprintf is not __must_check on any of the kernels we backport to.

Jason
---
Now instead of four in the eights place /
you=E2=80=99ve got three, =E2=80=98Cause you added one  /
(That is to say, eight) to the two,     /
But you can=E2=80=99t take seven from three,    /
So you look at the sixty-fours....

> > The return value tells us which strscpy call(s) didn't have enough spac=
e.
>
> Right, and what can be done about it? The driver does not control what
> tty is being used for the serial port (and so can't control the prefix
> of the 'phys'), we do not extend 'phys' (because it is used very
> rarely). The only option is to truncate (which we already do).
>
> So the warnings are not actionable.
>
> Thanks.
>
> --
> Dmitry

--0000000000005d32d3061921def5
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-input-wacom_w8001-Simplify-device-name-generation.patch"
Content-Disposition: attachment; 
	filename="0001-input-wacom_w8001-Simplify-device-name-generation.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lwjhd2wi0>
X-Attachment-Id: f_lwjhd2wi0

RnJvbSAzYjEzNjU2ODE5YTJjNWRiZjJhMWMxZjhmYjQwNzU5NWViM2U1ZDk0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKYXNvbiBHZXJlY2tlIDxqYXNvbi5nZXJlY2tlQHdhY29tLmNv
bT4KRGF0ZTogVGh1LCAyMyBNYXkgMjAyNCAwODo1ODo1NiAtMDcwMApTdWJqZWN0OiBbUEFUQ0hd
IGlucHV0OiB3YWNvbV93ODAwMTogU2ltcGxpZnkgZGV2aWNlIG5hbWUgZ2VuZXJhdGlvbgoKUmVw
bGFjZSBwYWlycyBvZiBzdHJzY3B5L3N0cmxjYXQgY2FsbHMgd2l0aCBzbnByaW50Zi4KClNpZ25l
ZC1vZmYtYnk6IEphc29uIEdlcmVja2UgPGphc29uLmdlcmVja2VAd2Fjb20uY29tPgotLS0KIGRy
aXZlcnMvaW5wdXQvdG91Y2hzY3JlZW4vd2Fjb21fdzgwMDEuYyB8IDExICsrKy0tLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvaW5wdXQvdG91Y2hzY3JlZW4vd2Fjb21fdzgwMDEuYyBiL2RyaXZlcnMvaW5w
dXQvdG91Y2hzY3JlZW4vd2Fjb21fdzgwMDEuYwppbmRleCA5MjhjNWVlM2FjMzZjLi5lMzc2N2Ri
OGE2NjRiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2lucHV0L3RvdWNoc2NyZWVuL3dhY29tX3c4MDAx
LmMKKysrIGIvZHJpdmVycy9pbnB1dC90b3VjaHNjcmVlbi93YWNvbV93ODAwMS5jCkBAIC01OTUs
NyArNTk1LDcgQEAgc3RhdGljIGludCB3ODAwMV9jb25uZWN0KHN0cnVjdCBzZXJpbyAqc2VyaW8s
IHN0cnVjdCBzZXJpb19kcml2ZXIgKmRydikKIAlzdHJ1Y3QgdzgwMDEgKnc4MDAxOwogCXN0cnVj
dCBpbnB1dF9kZXYgKmlucHV0X2Rldl9wZW47CiAJc3RydWN0IGlucHV0X2RldiAqaW5wdXRfZGV2
X3RvdWNoOwotCWNoYXIgYmFzZW5hbWVbNjRdOworCWNoYXIgYmFzZW5hbWVbNjRdID0gIldhY29t
IFNlcmlhbCI7CiAJaW50IGVyciwgZXJyX3BlbiwgZXJyX3RvdWNoOwogCiAJdzgwMDEgPSBremFs
bG9jKHNpemVvZihzdHJ1Y3QgdzgwMDEpLCBHRlBfS0VSTkVMKTsKQEAgLTYyNSw4ICs2MjUsNiBA
QCBzdGF0aWMgaW50IHc4MDAxX2Nvbm5lY3Qoc3RydWN0IHNlcmlvICpzZXJpbywgc3RydWN0IHNl
cmlvX2RyaXZlciAqZHJ2KQogCS8qIEZvciBiYWNrd2FyZHMtY29tcGF0aWJpbGl0eSB3ZSBjb21w
b3NlIHRoZSBiYXNlbmFtZSBiYXNlZCBvbgogCSAqIGNhcGFiaWxpdGllcyBhbmQgdGhlbiBqdXN0
IGFwcGVuZCB0aGUgdG9vbCB0eXBlCiAJICovCi0Jc3Ryc2NweShiYXNlbmFtZSwgIldhY29tIFNl
cmlhbCIsIHNpemVvZihiYXNlbmFtZSkpOwotCiAJZXJyX3BlbiA9IHc4MDAxX3NldHVwX3Blbih3
ODAwMSwgYmFzZW5hbWUsIHNpemVvZihiYXNlbmFtZSkpOwogCWVycl90b3VjaCA9IHc4MDAxX3Nl
dHVwX3RvdWNoKHc4MDAxLCBiYXNlbmFtZSwgc2l6ZW9mKGJhc2VuYW1lKSk7CiAJaWYgKGVycl9w
ZW4gJiYgZXJyX3RvdWNoKSB7CkBAIC02MzUsOCArNjMzLDcgQEAgc3RhdGljIGludCB3ODAwMV9j
b25uZWN0KHN0cnVjdCBzZXJpbyAqc2VyaW8sIHN0cnVjdCBzZXJpb19kcml2ZXIgKmRydikKIAl9
CiAKIAlpZiAoIWVycl9wZW4pIHsKLQkJc3Ryc2NweSh3ODAwMS0+cGVuX25hbWUsIGJhc2VuYW1l
LCBzaXplb2YodzgwMDEtPnBlbl9uYW1lKSk7Ci0JCXN0cmxjYXQodzgwMDEtPnBlbl9uYW1lLCAi
IFBlbiIsIHNpemVvZih3ODAwMS0+cGVuX25hbWUpKTsKKwkJc25wcmludGYodzgwMDEtPnBlbl9u
YW1lLCBzaXplb2YodzgwMDEtPnBlbl9uYW1lKSwgIiVzIFBlbiIsIGJhc2VuYW1lKTsKIAkJaW5w
dXRfZGV2X3Blbi0+bmFtZSA9IHc4MDAxLT5wZW5fbmFtZTsKIAogCQl3ODAwMV9zZXRfZGV2ZGF0
YShpbnB1dF9kZXZfcGVuLCB3ODAwMSwgc2VyaW8pOwpAQCAtNjUxLDkgKzY0OCw3IEBAIHN0YXRp
YyBpbnQgdzgwMDFfY29ubmVjdChzdHJ1Y3Qgc2VyaW8gKnNlcmlvLCBzdHJ1Y3Qgc2VyaW9fZHJp
dmVyICpkcnYpCiAJfQogCiAJaWYgKCFlcnJfdG91Y2gpIHsKLQkJc3Ryc2NweSh3ODAwMS0+dG91
Y2hfbmFtZSwgYmFzZW5hbWUsIHNpemVvZih3ODAwMS0+dG91Y2hfbmFtZSkpOwotCQlzdHJsY2F0
KHc4MDAxLT50b3VjaF9uYW1lLCAiIEZpbmdlciIsCi0JCQlzaXplb2YodzgwMDEtPnRvdWNoX25h
bWUpKTsKKwkJc25wcmludGYodzgwMDEtPnBlbl9uYW1lLCBzaXplb2YodzgwMDEtPnBlbl9uYW1l
KSwgIiVzIEZpbmdlciIsIGJhc2VuYW1lKTsKIAkJaW5wdXRfZGV2X3RvdWNoLT5uYW1lID0gdzgw
MDEtPnRvdWNoX25hbWU7CiAKIAkJdzgwMDFfc2V0X2RldmRhdGEoaW5wdXRfZGV2X3RvdWNoLCB3
ODAwMSwgc2VyaW8pOwotLSAKMi40NS4xCgo=
--0000000000005d32d3061921def5--

