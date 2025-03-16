Return-Path: <linux-input+bounces-10865-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E18FA634EF
	for <lists+linux-input@lfdr.de>; Sun, 16 Mar 2025 11:02:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1ED31700D3
	for <lists+linux-input@lfdr.de>; Sun, 16 Mar 2025 10:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A154A15C140;
	Sun, 16 Mar 2025 10:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=db48x.net header.i=@db48x.net header.b="HiroQLJo";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="sHu/xwsR"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3193E17578;
	Sun, 16 Mar 2025 10:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742119342; cv=none; b=jMl7yngzPSPLEIcEy+r2zGSoNWoFtEGETWvDyKqoGzeh48b8h2fhEpQ29IWUun7Q3cG0lw8GQOevDp0hVWAzHLSvKQK4cEXJhUhmhVBu00WDBBf58nq23GcOgl+TyieKTdWcbw6t6yswWiKYDFToMCF0Hd1uxEALQqg0igzHeMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742119342; c=relaxed/simple;
	bh=0nVntgMYYgnfFq1H1W5A2lBg3Xd3mShAaIlDIhgs7oU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Jgj6ShhHPXR/nTeRBVpQi4Dgs7/Z6oMi80z/1RD4Dbd4vo59v1sMo7X85Ehru3ljyKFqCPFUIdNy3Dm9ILJl1l9+nY05bwKnwNQ6r+KOz3OPWZlbAdc6Pa6aNRA5UIV4WtgNEvy6JEEZAUTqiuoYclhSDDn80Chk8ANlwZp+mMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=db48x.net; spf=pass smtp.mailfrom=db48x.net; dkim=pass (2048-bit key) header.d=db48x.net header.i=@db48x.net header.b=HiroQLJo; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=sHu/xwsR; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=db48x.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=db48x.net
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2AEFE11400BC;
	Sun, 16 Mar 2025 06:02:19 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Sun, 16 Mar 2025 06:02:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=db48x.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1742119339;
	 x=1742205739; bh=4u8B4VbnmHOXMu2oemXXWGAitTq/n4/i/sQ4FLTm0eE=; b=
	HiroQLJo568O5VNs3cbhsy4+Om607JRVoIzhijqj8elWLv0cuCNQnYD8ROt7rAvZ
	pvDkj5J8JaBpOYYnnJJEqwavSx1BNnFvMJNY4j6kDmOeq7GjpjAzLLYt6XCbzFe8
	h5d0AnTChzJ40JF1TLBU7nka3DTpSrVxDmwpLdV9/M/XMHAIPruhroXOpBVuefWt
	I7RVMdrss1MXRk8tWWoBEcWWh7oWgqtIov7LY880McVyea8y8wSqvZhTCTsdnL8Z
	jdDC7CcscGzkXwX8M0EccSzuWq6gqBWuzqNTqop0PtvOrLEBwV+BbdtW7aL3oNgM
	HcnpylL8PjoHDTCmVrscXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742119339; x=
	1742205739; bh=4u8B4VbnmHOXMu2oemXXWGAitTq/n4/i/sQ4FLTm0eE=; b=s
	Hu/xwsRi1illBgXTWt/3gtqgydSMtUZKFLoGMTqQpJvjWeO22LF0zVGbFkv3xXL0
	7MxWaIED5FhFbcdn0O78ehwfMR3DX/utF10LMD21XvzqljEGTZq5DEgveQmMz8Yj
	tAih2qQPah5WI5QjEVgmxyQM/db4s8dXhVQgotGuImBUYeDn1iigTVUaIRwt9SI2
	0brJNSA5uTFuXczGFahogOij+ChIgcxme1EZtthueBApqrMc95+u2FSwvYchgw8e
	JJNK8ELY7CXpg2SQFTm3bHaE2NSrZHhX4pM3+fSznYhMa32+RxWxi4PD2lkEZ0/B
	yhgEV/Dn5kBd6Yw4unYQw==
X-ME-Sender: <xms:qqHWZ9b9BlB4gCY7ZC6CvLYawEP5DAeDT9NcYbmoGkKKeyFCOM1HEA>
    <xme:qqHWZ0Z0RjjJeCdPTg8iDps6Q9_fUsskT5sWuHb_8oYKaYPmxEOQEUXpMgD6W9OOx
    CJfI5LGerJEykXLdPY>
X-ME-Received: <xmr:qqHWZ_-9Xh5hvIH9dX__2hOmLiWrm4WnlZRaaL_E-bJWazU369KpUBy1TDRR2pI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeeifeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefujghffffkfgggtgfgsehtqhertddt
    reejnecuhfhrohhmpeffrghnihgvlhcuuehrohhokhhsuceouggsgeekgiesuggsgeekgi
    drnhgvtheqnecuggftrfgrthhtvghrnhepleeftdffhfdtjeeiheetffevieejgffhhedv
    gfelgfejueeiudffgedvhfeijedvnecuffhomhgrihhnpehruhhsthdqlhgrnhhgrdhorh
    hgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggs
    geekgiesuggsgeekgidrnhgvthdpnhgspghrtghpthhtohepudejpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    thhmghhrohhsshesuhhmihgthhdrvgguuhdprhgtphhtthhopegrlhhitggvrhihhhhlse
    hgohhoghhlvgdrtghomhdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepsggvnhhnohdrlhhoshhsihhnsehprhhothhonhdrmhgvpd
    hrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghp
    thhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsghoqhhunhdrfh
    gvnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhm
    rghilhdrtghomh
X-ME-Proxy: <xmx:qqHWZ7prAZtap_UpcW5HGrx9_kVaxDufEYpQVkRzgJMGAzKjYbxzmA>
    <xmx:qqHWZ4q-Hx71ypenotwf3r_vv8MKI5uJkpQVjdxbnaBltNWwjOflJg>
    <xmx:qqHWZxS50ixXmpMDVjf4mkJCUT-Ej464my3WyI81LyGOx0dW2vn0GQ>
    <xmx:qqHWZwpXDtGn21gMk8PQwDSFCMKQKQakAgJpEUjS_NvcuGt9gPtaug>
    <xmx:q6HWZz9NwUvA5oD3ovyxGyy58CJGAl6RCvNuzOR9joptLx_cx9EOGGC1>
Feedback-ID: ie0194691:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Mar 2025 06:02:16 -0400 (EDT)
From: Daniel Brooks <db48x@db48x.net>
To: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: Benjamin Tissoires <bentiss@kernel.org>,  linux-kernel@vger.kernel.org,
  rust-for-linux@vger.kernel.org,  linux-input@vger.kernel.org,
  dri-devel@lists.freedesktop.org,  Jiri Kosina <jikos@kernel.org>,  Miguel
 Ojeda <ojeda@kernel.org>,  Alex Gaynor <alex.gaynor@gmail.com>,  Boqun
 Feng <boqun.feng@gmail.com>,  Gary Guo <gary@garyguo.net>,  =?utf-8?Q?Bj?=
 =?utf-8?Q?=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>,  Benno Lossin <benno.lossin@proton.me>,
  Andreas Hindborg <a.hindborg@kernel.org>,  Alice Ryhl
 <aliceryhl@google.com>,  Trevor Gross <tmgross@umich.edu>,  Danilo
 Krummrich <dakr@kernel.org>
Subject: Re: [PATCH RFC 3/3] rust: hid: demo the core abstractions for probe
 and remove
In-Reply-To: <87frjdhaii.fsf@protonmail.com> (Rahul Rameshbabu's message of
	"Sun, 16 Mar 2025 04:20:35 +0000")
References: <20250313160220.6410-2-sergeantsagara@protonmail.com>
	<20250313160220.6410-6-sergeantsagara@protonmail.com>
	<m2cm4c4m7teaca3tog774tl25ynngicg4eav4i7xiqyrxsqwju@leh5og5d6uba>
	<87frjdhaii.fsf@protonmail.com>
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwBAMAAAClLOS0AAAABGdBTUEAALGOfPtRkwAAABJQ
 TFRFpKfbdou67PD6JjJgAwUWXGSeIcyLHgAAAkZJREFUOI1VU8Fy6yAMxLi+Q13fCZ3cnQL3dqTc
 7RD+/1feStDXVnXHDuvVSivZTMba2GPdw3gyCGcMAFxTyrTd9dwGoxHiZX9PmRFUHYAQlGGtXY+F
 Uk0SJOxgJiUEnH1qkitT9D+pQub7qGAmUbR6bu3CvI96Yv6QqkBBMrsyfZccr1/RDXGDTLf4P7ZY
 glVxe2V+/ACXWO1gvDO9/gDRpFFVmPluvLcmBjd5H6d8DEte+Pbk4rcY/Fa5tLKLOtCZsuQKYhpa
 LOkYDT7hESya7/WIET3lfQBqX0pwFtbI832Is0ayMUR9B+12xjgPCQ089cfwkCkX6L5TPmRelJTh
 zMS0Sz1PyjLAMCUWjcmgQLWQMds+e3aaauZDf9dU9A2/8kPVF2odCUoMKHkfjJR+mbgC+DRiycw5
 3XSqGe6HmhN/AWjHypkAXOAFW5EiuA1ge2GiZuMb0s1fSEXcATeLUfbyEY2L8yPOmdSsdghQXx3K
 pz2eoeXuYvMCINVFDrCdNfVUp4eJ6cSEbjbgFjBEvonGGTrgv9cHjAc8aVgSAPoxaONbzfwhDIhR
 at7IIS7fAGiDSwIA9alhhTBzfA7YM2FY6eMwayrIGK8FDFmshmUA43WqhFtpvoqG9HHaJ7fqtgTz
 8EWVkgZgtsylFliHDgk0MB7KAEC45C/rgnGvanNLXyzOeTzcT2nw/N44gfrtYXRQLoz9Q3TgmJRx
 2Mx/Q51qzpm+l3m8z2SWBqC5+PZXAtNYlGFf/gKfHfjFkDT4x7od7R+w3Ls+ZdQBuQAAAABJRU5E
 rkJggg==
Date: Sun, 16 Mar 2025 03:02:15 -0700
Message-ID: <87zfhlz42g.fsf@db48x.net>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Rahul Rameshbabu <sergeantsagara@protonmail.com> writes:

> Rust has the Drop trait[2]. If my understanding is correct, contained
> data that also implement the Drop trait cannot be enforced in terms of
> the order they are dropped/provide any kind of dependency management
> here. It's worth exploring. My concern is some very tricky ordering
> requirements on removal.

A valid concern; I recommend a careful reading of chapter 10.8
Destructors from the Rust reference
<https://doc.rust-lang.org/reference/destructors.html>. Here are the
most important bits:

> The destructor of a type T consists of:
>=20
>    1. If T: Drop, calling <T as std::ops::Drop>::drop
>    2. Recursively running the destructor of all of its fields.
>       =E2=80=A2 The fields of a struct are dropped in declaration order.
>       =E2=80=A2 The fields of the active enum variant are dropped in
>         declaration order.
>       =E2=80=A2 The fields of a tuple are dropped in order.
>       =E2=80=A2 The elements of an array or owned slice are dropped from =
the
>         first element to the last.
>       =E2=80=A2 The variables that a closure captures by move are dropped=
 in
>         an unspecified order.
>       =E2=80=A2 Trait objects run the destructor of the underlying type.
>       =E2=80=A2 Other types don=E2=80=99t result in any further drops.

=C2=B61 is a bit terse, but it just says that if the type has an
implementation of the Drop trait then the destructor is just a call to
the trait=E2=80=99s drop method. If there are tricky ordering requirements =
then
this is where they could be implemented.

=C2=B62 tells you how the compiler builds a destructor for types that don=
=E2=80=99t
implement Drop. You can rely on it to drop all of the fields of a struct
in declaration order, so the tricky requirements from the code you
quoted could be satisfied merely by keeping the fields of the struct in
the right order if you wanted. I wouldn=E2=80=99t really recommend it
though. It is much better to write an explicit Drop impl that does it
correctly rather than reling on a comment next to the struct declaration
telling the reader that the field order is important somehow. In fact
the implementation guidelines for drivers should emphasize that if the
destruction order matters then the type must have a custom impl for the
Drop trait that does the destruction in the correct order.
=20=20=20=20
> I extracted the below from
> drivers/hid/hid-nvidia-shield.c.
>
>   static void shield_remove(struct hid_device *hdev)
>   {
>   	struct shield_device *dev =3D hid_get_drvdata(hdev);
>   	struct thunderstrike *ts;
>
>   	ts =3D container_of(dev, struct thunderstrike, base);
>
>   	hid_hw_close(hdev);
>   	thunderstrike_destroy(ts);
>   	del_timer_sync(&ts->psy_stats_timer);
>   	cancel_work_sync(&ts->hostcmd_req_work);
>   	hid_hw_stop(hdev);
>   }
>
> Here, we need to explicitly stop the timer before cancelling any work.
>
> The problem here is Rust's Drop trait does not gaurantee ordering for
> the teardown of members.
>
> Lets pretend I have the following and its functional in Rust.
>
>   // In hid_nvidia_shield.rs
>
>   struct Thunderstrike {
>       // Rest of my thunderstrike members from the C equivalent
>       psyStatsTimer: TimerList, // TimerList implements Drop
>       hostcmdReqWork: Work, // Work implements Drop
>   }
>
>   // hid.rs
>
>   struct Device<T> {
>       // Details omitted
>       privateData: T,
>   }
>
>   impl<T> Drop for Device<T> {
>       fn drop(&mut self) {
>           // Implementation here
>       }
>   }
>
> The problem here is when the Device instance is dropped, we cannot
> guarantee the order of the Drop::drop calls for the psyStatsTimer or
> hostcmdReqWork members as-is. There might be some clever trick to solve
> this problem that I am not aware of.

Nah, it=E2=80=99s easy. Just drop the members in the right order:

impl Drop for Thunderstrike {
    fn drop(&mut self) {
        drop(self.psyStatsTimer);
        drop(self.hostedcmdReqWork);
    }
}

The compiler generates a destructor for the Device<T> struct and we know
from the reference that it will destroy the struct=E2=80=99s fields. Thus w=
e can
write Thunderstrike=E2=80=99s drop method so that it destroys the fields in=
 the
correct order. No clever tricks required.

On Thu, 13 Mar, 2025 18:05:36 +0100 "Benjamin Tissoires" <bentiss@kernel.or=
g> wrote

> I wonder however how and if we could enforce the remove() to be
> automated by the binding or rust, to not have to deal with resource
> leaking. Because the removal part, especially on failure, is the hardest
> part.

Many conditions can be handled automatically but probably not all.

A good example might be conditionally destructing data that might not be
initilized yet. If that data is stored in an Optional field, then
dropping it will automatically do the right thing. If the field is None
then the destructor won=E2=80=99t do anything. Otherwise the field is Some(=
T)
and it will automatically call the destructor for the type T. No manual
work need be done to handle that condition at all.

db48x

